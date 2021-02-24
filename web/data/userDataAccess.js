const dataAccess = require('./dataAccess');
const bcrypt = require('bcrypt');
const configuration = require('../configuration');

// Takes a clear text password and promises it's hash
function hash(password) {
    return new Promise((resolve, reject) => {
        bcrypt.hash(password, configuration.password_hash_salt_rounds, (error, hash) => {
            if (error) reject(error);
            else resolve(hash);
        });
    });
}

// Creates a user and promises the new user's ID.
async function create(firstName, lastName, email, password, phone, addressId) {
    const connection = await dataAccess.getConnection();
    try {
        const hash = await hash(password);
        const result = await connection.query('CALL CreateUser(?, ?, ?, ?, ?, NOW(), ?, @ID); SELECT @ID;', [firstName, lastName, email, hash, phone, addressId]);
        return result[1][0]["@ID"];
    } finally {
        connection.release();
    }

    // Also works, but callback hell.
    // 
    // return new Promise((resolve, reject) => {
    //     hash(password).then((hash) => {
    //         dataAccess.getConnection().then(connection => {
    //             connection.query(
    //                 'CALL CreateUser(?, ?, ?, ?, ?, NOW(), ?, @ID); SELECT @ID;',
    //                 [firstName, lastName, email, hash, phone, addressId]
    //             ).then((result) => {
    //                 // result: [{"affectedRows":1,"insertId":0,"warningStatus":0},[{"@ID":7}]]
    //                 resolve(result[1][0]["@ID"]);
    //             }).catch(reject).finally(() => {
    //                 connection.release();
    //             });
    //         }).catch(reject);
    //     }).catch(reject);
    // });
}

// Retrieves a user based on any one of the parameters (only one is required)
async function read(id, email) {
    const connection = await dataAccess.getConnection();
    try {
        let result;
        if (id) {
            result = await connection.query('SELECT * FROM User WHERE Id = ?;', [id]);
        } else if (email) {
            result = await connection.query('SELECT * FROM User WHERE Email = ?;', [email]);
        } else {
            throw 'no valid read parameters specified';
        }
        return result[0];
    } finally {
        connection.release();
    }
}

module.exports = {
    create, read
}
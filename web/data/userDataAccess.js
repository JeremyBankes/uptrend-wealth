const dataAccess = require('./dataAccess');
const bcrypt = require('bcrypt');
const configuration = require('../configuration');

// Takes a clear text password and returns a promsie that resolves to it's hash
function hash(password) {
    return new Promise((resolve, reject) => {
        bcrypt.hash(password, configuration.password_hash_salt_rounds, (error, hash) => {
            if (error) reject(error);
            else resolve(hash);
        });
    });
}

// Creates an address and returns a promise resolving to the new address's ID.
function createAddress(streetAddress, subdivision, city, zipCode, countryId) {
    return new Promise((resolve, reject) => {
        dataAccess.getConnection().then(connection => {
            connection.query(
                'CALL CreateAddress(?, ?, ?, ?, ?, @ID); SELECT @ID;',
                [streetAddress, subdivision, city, zipCode, countryId]
            ).then((result) => {
                // result: [{"affectedRows":1,"insertId":0,"warningStatus":0},[{"@ID":7}]]
                resolve(result[1][0]["@ID"]);
            }).catch(reject).finally(() => {
                connection.release();
            });
        }).catch(reject);
    });
}

// Creates a user and returns a promise resolving to the new user's ID.
function createUser(firstName, lastName, email, password, phone, addressId) {
    return new Promise((resolve, reject) => {
        hash(password).then((hash) => {
            dataAccess.getConnection().then(connection => {
                connection.query(
                    'CALL CreateUser(?, ?, ?, ?, ?, NOW(), ?, @ID); SELECT @ID;',
                    [firstName, lastName, email, hash, phone, addressId]
                ).then((result) => {
                    // result: [{"affectedRows":1,"insertId":0,"warningStatus":0},[{"@ID":7}]]
                    resolve(result[1][0]["@ID"]);
                }).catch(reject).finally(() => {
                    connection.release();
                });
            }).catch(reject);
        });
    });
}

createAddress('100 Water St.', 'Nova Scotia', 'Pugwash', 'B0K 1L0', 33).then(addressId => {
    createUser('Jeremy', 'Bankes', 'jeremy.bankes@gmail.com', 'secret', '(902) 809 7323', addressId).then(userId => {
        console.log(userId);
        dataAccess.end();
    });
});


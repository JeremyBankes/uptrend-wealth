const dataAccess = require('./dataAccess');

// Creates an address and promises the new address's ID.
async function create(streetAddress, subdivision, city, zipCode, countryId) {
    const connection = await dataAccess.getConnection();
    try {
        const result = await connection.query('CALL CreateAddress(?, ?, ?, ?, ?, @ID); SELECT @ID;', [streetAddress, subdivision, city, zipCode, countryId]);
        // result: [{"affectedRows":1,"insertId":0,"warningStatus":0},[{"@ID":7}]]
        return result[1][0]["@ID"];
    } finally {
        connection.release();
    }

    // Also works, but callback hell.
    //
    // dataAccess.getConnection().then(connection => {
    //     connection.query(
    //         'CALL CreateAddress(?, ?, ?, ?, ?, @ID); SELECT @ID;',
    //         [streetAddress, subdivision, city, zipCode, countryId]
    //     ).then((result) => {
    //         // result: [{"affectedRows":1,"insertId":0,"warningStatus":0},[{"@ID":7}]]
    //         resolve(result[1][0]["@ID"]);
    //     }).catch(reject).finally(() => {
    //         connection.release();
    //     });
    // }).catch(reject);
}

module.exports = {
    create
}
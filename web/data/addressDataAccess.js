const dataAccess = require('./dataAccess');

// Creates an address and returns a promise resolving to the new address's ID.
function create(streetAddress, subdivision, city, zipCode, countryId) {
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
const bcrypt = require('bcrypt');
const DataAccess = require('./DataAccess');

//
// USAGE EXAMPLES
//

// Create an address
//
// userDataAccess.createAddress('400 Waterbridge', 'Ontario', 'Toronto', 'B3D 5L2', 33).then(id => {
//     console.log('Created address of id: ' + id);
// });

// Create a user
// 
// userDataAccess.create('Allie', 'Brekker', 'allie.brekker@coldmail.com', 'SuperSecretPassword123', '902 809 7523', 10).then(id => {
//     console.log('Created user of id: ' + id);
// })

class UserDataAccess extends DataAccess {

    constructor(configuration, database) {
        super(database);
        this.configuration = configuration;
    }

    async create(firstName, lastName, email, password, phone, addressId) {
        const connection = await this.getConnection();
        try {
            const hash = await this.hash(password);
            const result = await connection.query('CALL CreateUser(?, ?, ?, ?, ?, NOW(), ?, @ID); SELECT @ID AS Id;', [firstName, lastName, email, hash, phone, addressId]);
            return result[1][0]['Id'];
        } finally {
            connection.release();
        }
    }

    async createAddress(streetAddress, state, city, zipCode, countryId) {
        const connection = await this.getConnection();
        try {
            const result = await connection.query('CALL CreateAddress(?, ?, ?, ?, ?, @ID); SELECT @ID AS Id;', [streetAddress, state, city, zipCode, countryId]);
            return result[1][0]['Id'];
        } finally {
            connection.release();
        }
    }

    /**
     * Hashes a cleartext password
     * @param {string} password The cleartext password
     * @returns {Promise} The hashed password
     */
    hash(password) {
        return new Promise((resolve, reject) => {
            bcrypt.hash(password, this.configuration.password_hash_salt_rounds, (error, hash) => {
                if (error) reject(error);
                else resolve(hash);
            });
        });
    }

}

module.exports = UserDataAccess
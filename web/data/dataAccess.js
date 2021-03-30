const Database = require('./Database');

class DataAccess {

    /**
     * Creates access to user information in 'database'
     * @param {Database} database The database to access
     */
    constructor(database) {
        this.database = database;
    }

    getConnection() {
        return this.database.getConnection();
    }

}

module.exports = DataAccess
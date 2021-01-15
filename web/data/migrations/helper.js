const sqlite3 = require('sqlite3').verbose();
const database = new sqlite3.Database(`${__dirname}/uptrend.db`);

module.exports = {
    start: () => {
        return database;
    },
    stop: () => {
        database.close();
    }
};
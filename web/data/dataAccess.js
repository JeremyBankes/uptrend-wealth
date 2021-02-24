const mariadb = require('mariadb');
const configuration = require('../configuration');
const pool = mariadb.createPool({
    host: configuration.database_host,
    port: configuration.database_port,
    user: configuration.database_user,
    password: configuration.database_password,
    database: configuration.database_name,
    multipleStatements: true,
    connectionLimit: 10
});

pool.getConnection().then(conn => {
    console.log(`Successful connection to "${configuration.database_name}" database at ${configuration.database_host}:${configuration.database_port} as ${configuration.database_user}.`);
    conn.release();
}).catch(error => {
    console.log(`Failed to connect "${configuration.database_name}" database at ${configuration.database_host}:${configuration.database_port} as ${configuration.database_user}.`);
    console.log(error.message);
});

module.exports = pool;
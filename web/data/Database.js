const mariadb = require('mariadb');

class Database {

    constructor(name, host, port, user, password) {
        this.name = name;
        this.host = host;
        this.port = port;
        this.user = user;
        this.password = password;
        this.pool = mariadb.createPool({
            host: host,
            port: port,
            user: user,
            password: password,
            database: name,
            multipleStatements: true,
            connectionLimit: 10
        });
    }

    connect() {
        this.getConnection().then(conn => {
            console.log(`Successful connection to "${this.name}" database at ${this.host}:${this.port} as ${this.user}.`);
            conn.release();
        }).catch(error => {
            console.log(`Failed to connect "${this.name}" database at ${this.host}:${this.port} as ${this.user}.`);
            console.log(error.message);
        });
    }

    disconnect() {
        this.pool.disconnect();
    }

    getConnection() {
        return this.pool.getConnection();
    }

}

module.exports = Database;
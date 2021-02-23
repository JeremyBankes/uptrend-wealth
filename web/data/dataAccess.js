const mariadb = require('mariadb');

const pool = mariadb.createPool({ host: "2.tcp.ngrok.io", port: 17343, user: "admin", password: "secret", database: "Uptrend_Wealth", connectionLimit: 1 });

pool.getConnection().then(connection => {
    connection.query("SHOW DATABASES;").then(rows => {
        console.log(rows);
    });
}).catch(error => {
    console.log(error);
})
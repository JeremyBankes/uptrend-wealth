const mariadb = require('mariadb');

const pool = mariadb.createPool({ host: "192.168.219.8", user: "root", password: "secret", connectionLimit: 1 });

pool.getConnection().then(connection => {
    connection.query("SHOW DATABASES;").then(rows => {
        console.log(rows);
    });
}).catch(error => {
    console.log(error);
})
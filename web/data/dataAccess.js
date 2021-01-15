const sqlite3 = require('sqlite3').verbose();
const database = new sqlite3.Database(`${__dirname}/uptrend.db`);

database.serialize(function() {
    database.run("CREATE TABLE lorem (info TEXT)");
  
    const statement = database.prepare("INSERT INTO lorem VALUES (?)");
    for (let i = 0; i < 10; i++) {
        statement.run("Ipsum " + i);
    }
    statement.finalize();
  
    database.each("SELECT rowid AS id, info FROM lorem", function(err, row) {
        console.log(row.id + ": " + row.info);
    });
  });
  
  database.close();
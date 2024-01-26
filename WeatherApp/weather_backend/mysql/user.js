var mysql = require("mysql");
require("dotenv").config();

var con = mysql.createConnection({
    host : process.env.host,
    user : process.env.user,
    password : process.env.password,
    database : process.env.database,
    port: process.env.port,
});

con.connect(function(err) {
    if (err) throw err;
    console.log('connected');
    var sql = "CREATE TABLE weatherAppDB.users (id INT AUTO_INCREMENT PRIMARY KEY, email VARCHAR(50), password VARCHAR(50))";
    con.query(sql, function (err, result) {
        if (err) throw err;
        console.log('table created');
    });
});
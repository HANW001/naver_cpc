const express = require("express");
const app = express();
const port = process.env.PORT || 3000;
const fs = require('fs');

const mysql = require("mysql");
const dbconfig = require("./config/db.js");
const connection = mysql.createConnection(dbconfig);


var bodyParser = require('body-parser');
app.use(bodyParser.urlencoded({extended:true}));
app.use(bodyParser.json());

app.get("/", (req, res) => {
  res.json({
    success: true,
  });
});

app.get("/cpc", (req, res) => {
  connection.query("SELECT * from cpc_table", (error, rows) => {
    if (error) throw error;
    console.log("User info is: ", rows);
    res.send(rows);
  });
});

app.post("/cpcupdate", (req, res) => {
  // read the contents of the CSV file
  var mall_id = req.body.mall_id;
  var dates = req.body.dates;
  var types = req.body.type;
  const csvData = fs.readFileSync('./files/'+mall_id+'_'+dates+".csv", "utf8");

  // split the CSV data into rows
  const rows = csvData.split("\n");

  // iterate over the rows and insert them into the database
  for (let i = 1; i < rows.length-1; i++) {
    const row = rows[i].split(",");
    const values = [mall_id,row[0], row[1], row[2], row[3], row[4], row[5] ,dates,types]// replace with your own column names
    connection.query(
      "INSERT IGNORE INTO cpc_table (mall_id, prd_id, prd_name, exposure, click_count, click_per, click_per_cash, dates, type) VALUES (?, ?, ?,?, ?, ?,?, ?, ?)",
      values,
      (err, results) => {
        if (err) {
          console.error(err);
        } else {
          console.log(`Inserted row ${i + 1} with ID ${results.insertId}`);
        }
      }
    );
  }
  res.send('row')
});

app.listen(port, () => {
  console.log(`server is listening at localhost:${process.env.PORT}`);
});

var config = require("./config");
var db = require("knex")(config);
var express = require("express");

express()
 .get("*", function(req, res) {
     res.send("Continuous integration and deployment lab finished");
    // db("users").then(function(data) {
    //   res.send(data);
    // });
 })
 .listen(80, function(err) {
    if (err) {
      console.error(err);
      return;
    }

    console.log("Express Server listening on port 80");
  })
;

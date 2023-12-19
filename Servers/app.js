//For NAME_NOT_FOUND

const express = require ('express');
const cors = require ('cors');          
const app = express();
const path = require ("path");
const bodyParser = require ('body-parser');
//is like import

app.use(cors());

app.use ((req, res, next) => {
    res.header('Access-Control-Allow-Orgin', '*');    //Access-Control-Allow-Origin
    next();
});     //for all

app.use(bodyParser.json());
app.use(bodyParser.urlencoded({extended:false}));
app.use("/client", express.static(path.resolve(__dirname + "/../client/")));

//make server

var server;
var port = process.env.PORT || process.env.NODE_PORT ||  5000;       //falure safe

//Page Listeners
var router = require("./router.js")
router(app);

//Service Listeners - mySQL
var services = require("./services.js");
services(app);

//Start Server              ERROR 
server = app.listen(port, function(err){
if (err){
    throw err;
}

console.log("Listening on port" + port);

});

// node Servers/app.js
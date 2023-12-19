//For NAME_NOT_FOUND

const path = require("path");

//page Lisener 
var router = function(app){
    app.get("/", function(req, res ){
        res.status(200).sendFile(path.join(__dirname + "/../client/html/home.html"));
    });          //after the .com




app.get("/home", function(req, res ){
    res.status(200).sendFile(path.join(__dirname + "/../client/html/home.html"));
});



app.get("/login", function(req, res ){
    res.status(200).sendFile(path.join(__dirname + "/../client/html/login.html"));
});


app.get("/Register", function(req, res ){
    res.status(200).sendFile(path.join(__dirname + "/../client/html/Register.html"));
});



app.get("/template", function(req, res ){
    res.status(200).sendFile(path.join(__dirname + "/../client/html/template.html"));
});

/**/
app.get("/sheetList", function(req, res ){
    res.status(200).sendFile(path.join(__dirname + "/../client/html/sheetList.html"));
});
/**/


}

module.exports = router;
const mysql = require ("mysql"); //for mysql            //PROBLEM

const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'root123',
    database: 'namenotfounddb'
});

connection.connect((err) => {
    if(err) {
        return console.error('error: ' + err.message);
    }      //will crash

        console.log("Connected to MySql");
});

/*--------------------------------------------------------------------------------------*/

//Create services function
var services = function(app) {
    app.post('/template', function(req, res) {
        var data = {
            //chara_type:req.body.chara_type,
            cName:req.body.chara_type,
            alias:req.body.alias,
            allegance:req.body.allegance,
            voiceActors:req.body.voiceActors,
            background:req.body.background,
            significance:req.body.significance,
            lore:req.body.lore
        };

        console.log("data: " + JSON.stringify(data));

        connection.query("INSERT INTO sheet SET ?", data, function (err, results) {
            if(err) {
                return res.status(201).send(JSON.stringify({msg: "Error: " + err}));
            } else {
                return res.status(201).send(JSON.stringify({msg: "SUCCESS"}));
            }
        });

        app.get('/sheetList', function(req, res) {
            connection.query("SELECT * FROM sheet", function(err, records) {
                if(err) {
                    return res.status(201).send(JSON.stringify({msg: "Error: " + err}));
                } else {
                    return res.status(201).send(JSON.stringify({msg: "SUCCESS", libraryData: records}));
                }
    
            });
        });
    });
}

module.exports = services;
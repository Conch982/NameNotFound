/*
    chara_type:req.body.chara_type,
            cName:req.body.chara_type,
            alias:req.body.alias,
            allegance:req.body.allegance,
            voiceActors:req.body.voiceActors,
            background:req.body.background,
            significance:req.body.significance,
            lore:req.body.lore
    */

retrieveData();  //Get inital load

var tableSorterActive = false;

function retrieveData() {
    //Retrieve the library data and populate on page load
    //var libraryURL = 'http://localhost:5000'; 
    $.ajax({
        url: libraryURL + "/sheetList",
        type:"get",
        success: function(response){
        console.log(response);
        var data = JSON.parse(response);        //problem
        createLibraryTable(data.libraryData);
        },
        error: function(err){
        alert(err);
        }
    });
}

function createLibraryTable(libraryData) {
    console.log(libraryData);

    var tableHTML = "";
    for(var i=0; i<libraryData.length; i++) {
        tableHTML += "<tr>";
           //tableHTML += "<td>" + libraryData[i].chara_type + "</td>";
            tableHTML += "<td>" + libraryData[i].cName + "</td>";
            tableHTML += "<td>" + libraryData[i].alias + "</td>";
            tableHTML += "<td>" + libraryData[i].allegance + "</td>";
            tableHTML += "<td>" + libraryData[i].voiceActors + "</td>";
            tableHTML += "<td>" + libraryData[i].background + "</td>";
            tableHTML += "<td>" + libraryData[i].significance + "</td>";
            tableHTML += "<td>" + libraryData[i].lore + "</td>";
            tableHTML += "</tr>";
    }

    $("#libraryTable").html(tableHTML);
    
    // activateDelete();
}
/*
function activateDelete() {
    $('.delete-button').click(function() {
        // var deleteID = this.getAttribute("data-id");
        
        // $.ajax({
        // url: ",
        // type: ,
        // data: ,
        // success: function(response){
        //     if(response = "SUCCESS") {
        //         retrieveData();  //Repaint table
        //     } else {
        //         alert(response);
        //     }
        // },
        // error: function(err){
        //     alert(err);
        // }
        // });

    });
}
*/

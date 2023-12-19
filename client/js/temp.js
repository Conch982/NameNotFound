//Create a listener that waits for user to enter submit button
    //Submit Library books

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

    $('#data-submit').click(function() {                //somthing wrong
        //var chara_type = $('#chara_type').val();
        var cName = $('#cName').val();
        var alias = $('#alias').val();
        var allegance = $('#allegance').val();
        var voiceActors = $('#voiceActors').val();
        var background = $('#background').val();
        var significance = $('#significance').val();
        var lore = $('#lore').val();
    
        var jsonString = {
            //chara_type:chara_type, 
            cName: cName, 
            alias:alias, 
            allegance: allegance, 
            voiceActors:voiceActors,
            background:background,
            significance:significance,
            lore:lore
        };
        
        $.ajax({
            url: libraryURL + "/sheetList",
            type: "post",
            data: jsonString,
            success: function(response){
                var data = JSON.parse(response);
                if(data.msg == "SUCCESS") {
                    alert(data.msg);
                } else {
                    console.log(data.msg);
                }
                
            },
            error: function(err){
                alert(err);
            }
        });
    
        return false;
    });
    
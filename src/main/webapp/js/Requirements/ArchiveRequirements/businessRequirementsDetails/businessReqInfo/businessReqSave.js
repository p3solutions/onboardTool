$(document).ready(function() {
    enableSaveButtonFunction()
        });
var typingTimer;                //timer identifier
    var doneTypingInterval = 1000;  //time in ms, 5 second for example
    var classnameattr="";
    //on keyup, start the countdown
    $(document).on('keyup','.changeText1', function () {
          clearTimeout(typingTimer);
          var Obj_this = this;
          //typingTimer = setTimeout(doneTyping(this), doneTypingInterval);
          typingTimer=setTimeout(function (){
              doneTyping(Obj_this);
              },  doneTypingInterval);
    });
    //on keydown, clear the countdown 
    $(document).on('keydown','.changeText1',function () {
        clearTimeout(typingTimer);
    });
    //user is "finished typing," do something
    function doneTyping (event) {
        //alert ("Testing");
        var classname=$(event).attr('class');
        var fieldname=getfieldname(classname);
        var value="";
        var checkValue = false;
        var length=$("."+classnameattr).find("li").length;
            for(var i=0; i<length; i++){
                        value+=$("."+classnameattr).find("li").eq(i).html()+"::";
                        }
            value=(value.substring(0,value.length-2)).replaceAll("'","\\'");
        if(value.length >= 100)
            checkValue = true;
        else
            checkValue = false;
            if (!checkValue)
                notification("warning","Please fill the value more than 100 chars.","Warning:");
            else 
                businessReqSaveAjaxcall(fieldname,value.replace("<br>",""));
        //ArchiveIntroSaveAjaxcall(fieldname,value.replace("<br>",""));
    }
    function getfieldname(classname) {
        var fieldname="";
        if(classname.includes("business")){
        fieldname="businessreq";
        classnameattr="business";
        }
        return fieldname;
    }
    function businessReqSaveAjaxcall(columnName,value){
        var JsonObject=[];
        var checkAjax =false;
        $.ajax({
            url: "businessReqSaveServlet",
            type: 'POST',
            data : {columnName:columnName, value : value},
            async: false,
            dataType: "json",
            success: function (data) {
                console.log("SAVE DATA:",data);
                JsonObject = data;
                if(data.checkUpdate)
                    notification("success","Saved successfully.","Note:");
                else
                    notification("error","Error occurred while saving.","Error:");
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
    $("#SaveReqInScope").click( function(e){        
    var validation = true;
            var JsonArray = [];
                var inputs = {};
                var yes_value = $('.description').eq(0).val();
                var no_value = $('.description').eq(1).val();
                if(!checkBusinessReqValues(yes_value, no_value))
                    validation = false;
                inputs["Yes/Y"] = yes_value;
                inputs["No/N"] = no_value;
                JsonArray.push(inputs);
            if(validation)
                businessReqinScopeSaveAjaxcall(JsonArray);
            else
                notification("warning","Please fill the all fields.","Warning");
            e.preventDefault(); 
    });
    function checkBusinessReqValues(req_in_scope, description){
        var validationFlag = false;
        if((req_in_scope != '' && req_in_scope != undefined && req_in_scope != null) && (description != '' && description != undefined && description != null))
                validationFlag = true;
        return validationFlag;
    }
    function businessReqinScopeSaveAjaxcall(JsonArray){
        var checkAjax =false;
            $.ajax({
                url: "businessReqInScopeSaveServlet",
                type: 'POST',
                data : {JsonArray:JSON.stringify(JsonArray)},
                async: false,
                dataType: "json",
                success: function (data) {
                    console.log("SAVE DATA:",data);
                    JsonObject = data;
                    if(data.SaveStatus){
                        notification("success","Saved successfully.","Note:");
                        document.getElementById("dataSaveReq").disabled = false;
                   }
                    else
                        notification("error","Error occurred while saving.","Error:");
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }
            $(document).on('click', '#complete', function(e) {
                $.ajax({
        url: "ArchiveLegacyCompleteServlet",
        type: 'POST',
        async: false,
        data : {completeType : "BusinessRequirement"},
        dataType: "json",
        success: function(data) {
            console.log("Completed DATA:", data);
            JsonObject = data;
            if (data.iscompleted==true) {
                notification("success", "Completed successfully.", "Note:");
            }else if (data.iscompleted==false) {
                notification("error","Retention and Legal Requirements requires atleast one Row ","Error:");
            }
        }
    });
    e.preventDefault();
            });
            $(document).on('click', '#edit', function(e) {
                        document.getElementById("SaveReqInScope").disabled = false;
                        notification("success", "Current Page is editable", "Note:");
            e.preventDefault();
            });
        function enableSaveButtonFunction(){
            $.ajax({
        url: "ArchiveReqCompleteStatusServlet",
        type: 'POST',
        async: false,
        data : {completeType : "BusinessRequirement"},
        dataType: "json",
        success: function(data) {
            console.log("Completed DATA:", data);
            JsonObject = data;
            if (data.iscompleted==true) {
            document.getElementById("SaveReqInScope").disabled = true;
            }else{
            document.getElementById("SaveReqInScope").disabled = false;
                            }
        }
    });
        }
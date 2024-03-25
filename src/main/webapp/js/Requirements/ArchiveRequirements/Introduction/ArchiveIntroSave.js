var typingTimer;                //timer identifier
    var doneTypingInterval = 1000;  //time in ms, 5 second for example
    var classnameattr="";
    //on keyup, start the countdown
    $(document).on('keyup','.changeText', function () {
          clearTimeout(typingTimer);
          var Obj_this = this;
          //typingTimer = setTimeout(doneTyping(this), doneTypingInterval);
          typingTimer=setTimeout(function (){
              doneTyping(Obj_this);
              },  doneTypingInterval);
    });
    //on keydown, clear the countdown 
    $(document).on('keydown','.changeText',function () {
        clearTimeout(typingTimer);
    });
    //user is "finished typing," do something
    function doneTyping (event) {
        var classname=$(event).attr('class');
        var fieldname=getfieldname(classname);
        var value="";
        var checkValue = false;
        if(fieldname!="assumption"){
        value=$("."+classnameattr).val();
        if(value.length >= 100)
            checkValue = true;
            if(checkValue && fieldname == 'scope')
                checkScope = true;
            else
                checkScope = false;
            }
        else{
            checkValue = true;
            var length=$("."+classnameattr).find("li").length;
            for(var i=0; i<length; i++){
                        value+=$("."+classnameattr).find("li").eq(i).html()+"::";
                        }
            value=value.substring(0,value.length-2);
        }
            if (!checkValue)
                notification("warning","Please fill the value more than 100 chars.","Warning:");
            else 
                ArchiveIntroSaveAjaxcall(fieldname,value.replace("<br>",""));
            if(fieldname == 'scope')
                checkNextButton();
        //ArchiveIntroSaveAjaxcall(fieldname,value.replace("<br>",""));
    }
    function getfieldname(classname) {
        var fieldname="";
        if(classname.includes("Purpose")){
        fieldname="purpose";
        classnameattr="Purpose";
        }
        else if(classname.includes("Scope")){
        fieldname="scope";
        classnameattr="Scope";
        }
        else if(classname.includes("Assumption")){
        fieldname="assumption";
        classnameattr="Assumption";
        }
        return fieldname;
    }
    function ArchiveIntroSaveAjaxcall(columnName,value){
        var JsonObject=[];
        var checkAjax =false;
        $.ajax({
            url: "ArchiveIntroSave",
            type: 'POST',
            data : {columnName:columnName, value : value},
            async: false,
            dataType: "json",
            success: function (data) {
                console.log("SAVE DATA:",data);
                JsonObject = data;
                if(data.checkUpdate)
                    {
                    if(columnName === 'scope')
                        checkScope = true;
                    notification("success","Saved successfully.","Note:");
                    }
                else
                    {
                    if(columnName === 'scope')
                        checkScope = true;
                    notification("error","Error occurred while saving.","Error:");
                    }
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
        //$(document).on('click','#saveRoleResponse', function(){
    $("#saveRoleResponse").click( function(e){      
            var validation = false;
            var JsonArray = [];
            var roleNameArray = [];
            var checkDuplicateRole = true;
            for(var i = 0; i<$('.rowClass').length; i++){
                var inputs = {};
                var role = $('.role .selectpicker').eq(i).val();
                var name = $('.name').eq(i).val();
                var emailId = $('.emailId').eq(i).val();
                var username = $('.username').eq(i).val();
                var priority_order_num = $('.priority_order_num').eq(i).val();
                if(!roleNameArray.includes(role))
                     roleNameArray.push(role);
                else
                    checkDuplicateRole=false;
                if(checkFieldValues(role, name, emailId,username,priority_order_num))
                    validation = true;
                inputs['seq_no'] = i+1;
                inputs['role'] = role;
                inputs['name'] = name;
                inputs['emailId'] = emailId;
                inputs['username'] = username;
                inputs['priority_order_num'] = priority_order_num;
                JsonArray.push(inputs);
            }
            if(validation&&checkDuplicateRole)
                archiveRolesResponseSaveAjaxcall(JsonArray);
            else
                {
                if(!validation)
                notification("warning","Please fill atleast one row fields.","Warning");
                if(!checkDuplicateRole)
                    notification("warning","Please provide unique roles.","Warning");
                e.preventDefault();
                checkRoles = false; 
                }
            checkNextButton();
            e.preventDefault();
    });
    function checkFieldValues(role, name, emailId, username,priority_order_num){
        var validationFlag = false;
        if((role != '' && role != undefined && role != null) && (name != '' && name != undefined && name != null) && 
                (emailId != '' && emailId != undefined && emailId != null) && (username != '' && username != undefined && username != null)
                 && (priority_order_num != '' && priority_order_num != undefined && priority_order_num != null))
                validationFlag = true;
        return validationFlag;
    }
    function archiveRolesResponseSaveAjaxcall(JsonArray){
        var checkAjax =false;
            $.ajax({
                url: "archiveRolesResponseSaveServlet",
                type: 'POST',
                data : {JsonArray:JSON.stringify(JsonArray)},
                async: false,
                dataType: "json",
                success: function (data) {
                    console.log("SAVE DATA:",data);
                    JsonObject = data;
                    if(data.CheckSave) {
                        notification("success","Saved successfully.","Note:");
                        checkRoles = true;
                        } else if(!data.checkUser) {
							notification("warning","Username already exist for this opportunity.","Warning!!");
						} else if(!data.checkName) {
							notification("warning","Name already exist for this opportunity.","Warning!!");
						} else if(!data.checkEmail) {
							notification("warning","EmailId already exist for this opportunity.","Warning!!");
						} else if(!data.checkRole) {
							notification("warning","Role already exist for this opportunity.","Warning!!");
						}
                    else
                        {
                        notification("error","Error occurred while saving.","Error:");
                        checkRoles = false;
                        }
              },
                error: function (e) {
                    console.log(e);
                }
            });
        }
    function checkNextButton()
    {
        if(checkScope || checkRoles){
            $("#rolesNext").attr('disabled',false); 
            $("#complete").attr('disabled',false);  
         }
        else{
            $("#rolesNext").attr('disabled',true);
            $("#complete").attr('disabled',true);   
}
    }
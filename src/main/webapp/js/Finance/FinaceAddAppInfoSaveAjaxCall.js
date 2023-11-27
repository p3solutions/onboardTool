$(document).ready(function() {
    document.getElementById("legacyAppInfoSave").disabled = false;
});
$("#legacyAppInfoSave").click(function(e)
{
    //e.stopPropagation();
    var checkMandatory = true;
    var nameAttr = [];
    var jsonObj = [];
    //e.preventDefault();
    $(".InputField").each(function(i) {
        var inputs = {};
        var req=$(this).find(".required_fie").length;
        console.log("requied field check: ",req);
        if(req)
        {
            console.log("input console",$(this).find("input").length);
            if($(this).find("input").length)
            {
                var val1 =$(this).find("input").val();
                var type = $(this).find("input").attr("type");
                if(type == 'radio')
                {
                    var nameRadio = $(this).find("input").attr("name");
                    var radioValue = $("input[name='"+nameRadio+"']:checked").val();
                    if(radioValue==""||radioValue==undefined)
                    {
                        checkMandatory = false;
                    }
                }
                else if(type == 'checkbox'){
                    var nameCheckbox = $(this).find("input").attr("name");
                    var CheckboxValue = "";
                    $.each($("input[name='"+nameCheckbox+"']:checked"), function(){
                        CheckboxValue += $(this).val()+",";
                    });
                    CheckboxValue = CheckboxValue.substring(0,CheckboxValue.length-1);
                    if(CheckboxValue=="")
                    {
                        checkMandatory = false;
                    }
                }
                else if (val1 == ""){
                    checkMandatory = false;
                }
                console.log("value in input : ",val1);
                console.log("value in input : ",val1);
            }
            else if($(this).find("select").length)
            {
                var val2 =$(this).find("select").val();
                if (val2 == ""){
                    checkMandatory = false;
                }
                console.log("value in select : ",val2);
            }
        }
        if($(this).find("input").length)
        {
            var type = $(this).find("input").attr("type");
            if(type == 'radio')
            {
                var nameRadio = $(this).find("input").attr("name");
                var radioValue = $("input[name='"+nameRadio+"']:checked").val();
                inputs["Name"]=nameRadio;
                inputs["Value"]=(radioValue==undefined||radioValue==null)?"":radioValue;
            }
            else if(type == 'checkbox'){
                var nameCheckbox = $(this).find("input").attr("name");
                var CheckboxValue = "";
                $.each($("input[name='"+nameCheckbox+"']:checked"), function(){
                    CheckboxValue += $(this).val()+",";
                });
                CheckboxValue = CheckboxValue.substring(0,CheckboxValue.length-1);
                inputs["Name"]=nameCheckbox;
                inputs["Value"]=(CheckboxValue==undefined||CheckboxValue==null)?"":CheckboxValue;
            }
            else
            {
                var name1 =$(this).find("input").attr("name");
                var val1 =$(this).find("input").val();
                inputs["Name"]=name1;
                inputs["Value"]=(val1==undefined||val1==null)?"":val1;
                nameAttr.push(name1);
                console.log("name in input : ",name1);
            }
        }
        else if($(this).find("select").length)
        {
            var name2 =$(this).find("select").attr("name");
            var val2 =$(this).find("select").val();
            inputs["Name"]=name2;
            inputs["Value"]=(val2==undefined||val2==null)?"":val2;
            nameAttr.push(name2);
            console.log("name in select : ",name2);
        }
        jsonObj.push(inputs);
    });
    console.log("checkMandatory : ",checkMandatory);
    console.log("Json Object : ",jsonObj);
    var JsonString = JSON.stringify(jsonObj);
    console.log("JsonObject : ", JsonString);
    $('#Json_sample_id').val(JSON.stringify(jsonObj));
    if(checkMandatory){
        archiveLegacyAppInfoAjaxCallUpdate(JsonString,checkMandatory,e);
    }
    else{
        notification("warning","Please fill the mandatory fields in Archive Application Info.","Warning : ");
        e.preventDefault();
    }
    document.getElementById("next").disabled = false;
});
function archiveLegacyAppInfoAjaxCallUpdate(JsonString,checkMandatory,e)
{
    e.preventDefault();
    var JsonObject=[];
    var checkAjax =false;
    $.ajax({
        url: "FinanceAppInfoSaveServlet",
        type: 'POST',
        data : {JsonString : JsonString, checkMandatory : checkMandatory},
        async: false,
        dataType: "json",
        success: function (data) {
            console.log("CREATE VALIDATION",data);
            if(data.checkSaveStatus){
                notification("success","Saved Successfully in Archive Application Info.","Note : ");
                document.getElementById("saveEnvmntName").disabled = false;
            }
            else
                notification("error","Problem occured while saving in Archive Application Info.","Error : ");
            JsonObject = data;
        },
        error: function (e) {
            console.log(e);
        }
    });
    return JsonObject;
}
$(document).on('click', '#edit', function(e) {
    document.getElementById("legacyAppInfoSave").disabled = false;
    notification("success", "Current Page is editable", "Note:");
    e.preventDefault();
});

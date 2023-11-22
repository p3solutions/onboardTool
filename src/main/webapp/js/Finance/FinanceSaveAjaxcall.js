$("#create").click(function(e)
{
    //e.stopPropagation();
    var AppName = $("#appName").val();
    var APM_ID = $("#apmid").val();
    var CheckAPPID;
    var CheckAppname;
    var checkMandatory = true;
    var nameAttr = [];
    var jsonObj = [];
    if(AppName!=""&&APM_ID!="")
    {
        //e.preventDefault();
        $(".InputField").each(function(i) {
            var inputs = {};
            var req=$(this).find(".required_fie").length;
            console.log("required field check: ",req);
            if(req)
            {
                console.log("input console",$(this).find("input").length);
                if($(this).find("input").length)
                {

                    var val1 =$(this).find("input").val();
                    if (val1 == ""){
                        checkMandatory = false;
                    }
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
                    inputs["Value"]=radioValue;

                }
                else if(type == 'checkbox'){
                    var nameCheckbox = $(this).find("input").attr("name");
                    var CheckboxValue = "";
                    $.each($("input[name='"+nameCheckbox+"']:checked"), function(){
                        CheckboxValue += $(this).val()+",";
                    });
                    CheckboxValue = CheckboxValue.substring(0,CheckboxValue.length-1);
                    inputs["Name"]=nameCheckbox;
                    inputs["Value"]=CheckboxValue;
                }
                else
                {
                    var name1 =$(this).find("input").attr("name");
                    var val1 =$(this).find("input").val();
                    inputs["Name"]=name1;
                    inputs["Value"]=val1;
                    nameAttr.push(name1);
                    console.log("name in input : ",name1);
                }
            }
            else if($(this).find("select").length)
            {
                var name2 =$(this).find("select").attr("name");
                var val2 =$(this).find("select").val();
                inputs["Name"]=name2;
                inputs["Value"]=val2;
                nameAttr.push(name2);
                console.log("name in select : ",name2);
            }
            jsonObj.push(inputs);

        });


        console.log("name attr : ",nameAttr);
        console.log("Json Object : ",jsonObj);
        var JsonString = JSON.stringify(jsonObj);
        $('#Json_sample_id').val(JSON.stringify(jsonObj));

        var checkAjax;
        var validationCheck_json = AjaxCallUpdate(AppName,JsonString,checkMandatory,CheckAPPID,CheckAppname,e);
        var checkAPMID =validationCheck_json.APMID_VALIDATION;
        var checkAppName = validationCheck_json.AppName_VALIDATION;
        if(checkAPMID==true)
        {
            checkAjax=false;
            notification("warning","Application Id already exist. Please provide the unique Application Id.","Warning");
            //alert("APM ID already exist. Please provide the unique APM ID.");
        }
        else
        {
            checkAjax =true;
        }
        if(checkAppName==true)
        {
            checkAjax = false;
            notification("warning","Application Name already exist.","Warning");
            //alert("Application Name already exist.");
        }
        else
        {
            checkAjax =true;
        }
        if(checkMandatory==false)
        {
            checkAjax = false;
            notification("warning","Please fill all the mandatory fields.","Warning");
            //alert("Please fill all the mandatory fields.");
        }

        if(checkMandatory==true && checkAjax == true && checkAjax !=undefined)
        {
            notification("success","New Finance is created successfully.","Note");
            $("#OpportunityListbtn").click();

    }
    else
    {
        e.preventDefault();
        notification("warning","Please fill the application name field.","Warning");
        //alert("Please fill the application name field.");
        return false;
    }
    }
});

function AjaxCallUpdate(AppName,JsonString,checkMandatory,CheckAPPID,checkAppname,e)
{
    var selectedId = $("#selectedId").val();
    var selectedName = $("#selectedName").val();
    console.log("The name and Id to backend "+selectedName+" and the Id is "+selectedId);
    e.preventDefault();
    var JsonObject=[];
    var checkAjax = false;
    $.ajax({
        url: "FinanceSaveServlet",
        type: 'POST',
        data : {AppName:AppName, JsonString : JsonString, checkMandatory : checkMandatory, ID:selectedId,Opportunity:selectedName },
        async: false,
        dataType: "json",
        success: function (data) {
            console.log("CREATE VALIDATION",data);
            if(data.checkSaveStatus){
                notification("success","Saved Successfully in Finance Application Info.","Note : ");
            }
            else{
                notification("error","Problem occurred while saving in Finance Application Info.","Error : ");
            }
            JsonObject = data;
        },
        error: function (e) {
            console.log(e);
        }

    });
    return JsonObject;
}
function AlertBox()
{
    notification("warning","Please fill all Mandatory fields.","Warning");
    //alert("Please fill all the mandatory fields.");
    return false;
}
$("#saveEnvmntName").click( function(e){        
    var tableName = 'archive_environment_name_info';
    getJsonArray(tableName,e);
    });
$("#saveEnvmntServer").click( function(e){      
    var tableName = 'archive_environment_serverip_info';
    getJsonArray(tableName,e);
});
function getJsonArray(tableName,e){
    var columnSuffix1 = ((tableName == ("archive_environment_name_info"))?"Name":(tableName == ("archive_environment_serverip_info")?"ServerIp":""));
    var columnSuffix2 = ((tableName == ("archive_environment_name_info"))?"Name":(tableName == ("archive_environment_serverip_info")?"Server":""));
    var validation = true;
    var JsonArray = [];
    for(var i = 0; i<$('.rowClass'+columnSuffix2).length; i++){
        var inputs = {};
        var dev = $('.dev'+columnSuffix1).eq(i).val();
        var test = $('.test'+columnSuffix1).eq(i).val();
        var stage = $('.stage'+columnSuffix1).eq(i).val();
        var prod = $('.prod'+columnSuffix1).eq(i).val();
        if(!checkFieldValues(dev, test, stage, prod))
            validation = false;
        inputs['seq_no'] = i+1;
        inputs['dev'] = dev;
        inputs['test'] = test;
        inputs['stage'] = stage;
        inputs['prod'] = prod;
        JsonArray.push(inputs);
    }
    
    if(validation)
    {
	if(JsonArray.length === 0 && tableName=="archive_environment_serverip_info")
	{
		notification("error","Archive Environment Information Server Details requires atleast One Row","Error");
	}
	else
	{
	 archiveEnvironmentSaveAjaxcall(JsonArray, tableName);
	 }
	}
       
    else
        notification("warning","Please fill the all fields.","Warning");
    e.preventDefault(); 
}
    function checkFieldValues(dev, test, stage, prod){
        var validationFlag = false;
        if((dev != '' && dev != undefined && dev != null) && (test != '' && test != undefined && test != null) && 
                (stage != '' && stage != undefined && stage != null) && (prod != '' && prod != undefined && prod != null))
                validationFlag = true;
        return validationFlag;
    }
function archiveEnvironmentSaveAjaxcall(JsonArray, tableName){
        var checkAjax =false;
            $.ajax({
                url: "archiveEnvironmentSaveServlet",
                type: 'POST',
                data : {JsonArray:JSON.stringify(JsonArray), tableName:tableName},
                async: false,
                dataType: "json",
                success: function (data) {
                    console.log("SAVE DATA:",data);
                    JsonObject = data;
                    if(data.SaveStatus){
                        notification("success","Saved successfully.","Note:");
                        if(tableName=='archive_environment_name_info'){
                        document.getElementById("saveEnvmntServer").disabled = false;
                        }else if(tableName=='archive_environment_serverip_info'){
                     document.getElementById("complete").disabled = false;
                        }
                   }
                    else
                        notification("error","Error occurred while saving.","Error:");
                },
                error: function (e) {
                    console.log(e);
                }
            });
        }
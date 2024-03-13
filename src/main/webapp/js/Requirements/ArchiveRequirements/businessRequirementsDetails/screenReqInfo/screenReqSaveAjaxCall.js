$(document).on('click','#saveScreenReqId',function(e)
{
	getScreenReqJsonArray(e);
	
});

function getScreenReqJsonArray(e){
	var screenFormNamesArray = [];
	var checkDuplicate = true;
	var validation = true;
	var JsonArray = [];
	var rowCount = $('#screenReqInfo').children('tr.screenReqRowClass').length;
	for(var i = 0; i<rowCount; i++){
		var inputs = {};
		var ReqId = $('.ScreenReqId').eq(i).html();
		var screenDisplay = $('.screenDisplay').eq(i).val();
		var purpose = $('.purpose').eq(i).val();
		var equivalentLegacy = $('.equivalentLegacy').eq(i).val();
		 
		if(!checkScreenReqValues(screenDisplay, purpose, equivalentLegacy))
			validation = false;
		if(screenFormNamesArray.includes(screenDisplay))
		checkDuplicate=false;
		else
			screenFormNamesArray.push(screenDisplay);
		inputs['seq_no'] = i+1;
		inputs['ReqId'] = ReqId;
		inputs['screenDisplay'] = screenDisplay;
		inputs['purpose'] = purpose;
		inputs['equivalent'] = equivalentLegacy;
		JsonArray.push(inputs);
		
	}
	if(validation&&checkDuplicate)
		archiveScrenReqSaveAjaxcall(JsonArray);
	else
		{
		if(!validation)
		notification("warning","Please fill the all fields.","Warning");
		if(!checkDuplicate)
			notification("warning","Display Names should be unique.","Warning");
		}
		e.preventDefault();	
	
}


function checkScreenReqValues(screenDisplay, purpose, equivalentLegacy){
	
	var validationFlag = false;
	if((screenDisplay != '' && screenDisplay != undefined && screenDisplay != null) && (purpose != '' && purpose != undefined && purpose != null) && 
			(equivalentLegacy != '' && equivalentLegacy != undefined && equivalentLegacy != null))
			validationFlag = true;
	
	return validationFlag;
}
function archiveScrenReqSaveAjaxcall(JsonArray){
	
	var checkAjax =false;
	
		$.ajax({
	        url: "archiveScreenReqSaveServlet",
	        type: 'POST',
	        data : {JsonArray:JSON.stringify(JsonArray), tableName:tableSaveName},
	        async: false,
	        dataType: "json",
	        success: function (data) {
	        	console.log("SAVE DATA:",data);
	        	JsonObject = data;
	        	if(data.SaveStatus)
	            {
	        		notification("success","Saved successfully.","Note:");
	        		updateSearchFormName(JsonArray);
	        	}
	        	else
	        		notification("error","Error occurred while saving details.","Error:");
	        },
	        error: function (e) {
	            console.log(e);
	        }
		});
		
	}
function updateSearchFormName(JsonArray)
{
	for(var i=0;i<JsonArray.length;i++)
	{
		var ReqId = JsonArray[i].ReqId;
		var screenDisplay = JsonArray[i].screenDisplay;
		var className = ReqId.replace("-","");
		$("."+className).eq(0).find(".searchFormName").html(screenDisplay);
	}
	
}
$("#addendumSave").click( function(e){		
	
	getJsonArray(e);
	});


		
function getJsonArray(e){
	
	var validation = true;
	var JsonArray = [];
	for(var i = 0; i<$('.addendumInfo').length; i++){
		var inputs = {};
		var label = $('.editable').eq(i).html();
		var addendumInfo = $('.addendumInfo').eq(i).val();
		 
		if(!checkFieldValues(label, addendumInfo))
			validation = false;
		
		inputs['seq_no'] = i+1;
		inputs['label'] = label;
		inputs['addendumInfo'] = addendumInfo;
		
		JsonArray.push(inputs);
		
	}
	if(validation)
		archiveReqAddendumSaveAjaxcall(JsonArray);
	else
		notification("warning","Please fill the all fields.","Warning");
    e.preventDefault();	
	
}

	function checkFieldValues(label,addendumInfo){
		
		var validationFlag = false;
		if((label != '' && label != undefined && label != null) && (addendumInfo != '' && addendumInfo != undefined && addendumInfo != null))
				validationFlag = true;
		
		return validationFlag;
	}


function archiveReqAddendumSaveAjaxcall(JsonArray){
		
		var checkAjax =false;
		
			$.ajax({
		        url: "archiveReqAddendumSaveServlet",
		        type: 'POST',
		        data : {JsonArray:JSON.stringify(JsonArray)},
		        async: false,
		        dataType: "json",
		        success: function (data) {
		        	console.log("SAVE DATA:",data);
		        	JsonObject = data;
		        	if(data.SaveStatus){
		        		notification("success","Saved successfully.","Note:");
		        		$("#addendumNext").removeAttr("disabled");
		        		$("#addendumNextAttr").removeAttr("disabled");

		        	}
		        	else
		        		notification("error","Error occurred while saving.","Error:");
		        },
		        error: function (e) {
		            console.log(e);
		        }
			});
		}
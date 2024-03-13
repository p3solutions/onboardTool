$("#docRevSave").click( function(e){		
	
	getJsonArray(e);
	});


		
function getJsonArray(e){
	
	var validation = true;
	var JsonArray = [];
	for(var i = 0; i<$('.rowClassDoc').length; i++){
		var inputs = {};
		var date = $('.date').eq(i).val();
		var version = $('.version').eq(i).val();
		var documentChanges = $('.documentChanges').eq(i).val();
		var changeAuthor = $('.changeAuthor').eq(i).val();
		 
		if(!checkFieldValues(date, version, documentChanges, changeAuthor))
			validation = false;
		inputs['seq_no'] = i+1;
		inputs['date'] = date;
		inputs['version'] = version;
		inputs['documentChanges'] = documentChanges;
		inputs['changeAuthor'] = changeAuthor;
		JsonArray.push(inputs);
		
	}
	if(validation)
		archiveReqDocRevSaveAjaxcall(JsonArray);
	else
		notification("warning","Please fill the all fields.","Warning");
    e.preventDefault();	
	
}

	function checkFieldValues(date, version, documentChanges, changeAuthor){
		
		var validationFlag = false;
		if((date != '' && date != undefined && date != null) && (version != '' && version != undefined && version != null) && 
				(documentChanges != '' && documentChanges != undefined && documentChanges != null) && (changeAuthor != '' && changeAuthor != undefined && changeAuthor != null))
				validationFlag = true;
		
		return validationFlag;
	}


function archiveReqDocRevSaveAjaxcall(JsonArray){
		
		var checkAjax =false;
		
			$.ajax({
		        url: "archiveReqDocRevSaveServlet",
		        type: 'POST',
		        data : {JsonArray:JSON.stringify(JsonArray)},
		        async: false,
		        dataType: "json",
		        success: function (data) {
		        	console.log("SAVE DATA:",data);
		        	JsonObject = data;
		        	if(data.SaveStatus){
		        		notification("success","Saved successfully.","Note:");
		        		$("#docRevNext").removeAttr("disabled");
		        	}
		        	else
		        		notification("error","Error occurred while saving.","Error:");
		        },
		        error: function (e) {
		            console.log(e);
		        }
			});
		}
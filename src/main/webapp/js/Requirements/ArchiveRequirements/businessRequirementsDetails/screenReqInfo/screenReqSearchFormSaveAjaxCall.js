$(document).on('click','#saveSearchFormId',function(e)
{
	getSearchFormJsonArray(e);
	
});

function getSearchFormJsonArray(e){
	var validation = true;
	var JsonArray = [];
	for(var i = 0; i<$('.searchFormRowClass').length; i++){
		var inputs = {};
		var ReqId = $('.searchFormReqId').eq(i).html();
		var searchForm = $(".searchFormName").eq(i).html();
		searchForm = (searchForm==null||searchForm==undefined||searchForm=='')?'':searchForm;
		var searchField = $('.searchFormFieldName').eq(i).val();
		var searchFormFieldFormat = $('.searchFormFieldFormat').eq(i).val();
		var searchFormDataType = $('.searchFormDataType .selectpicker').eq(i).val();
		var searchFormDataRetrieval = $('.searchFormDataRetrieval .selectpicker').eq(i).val();
		var searchFormRequiredField = $('.searchFormRequiredField .selectpicker').eq(i).val();
		var searchFormAdditionalInfo = $('.searchFormAdditionalInfo').eq(i).val();
		if(!checkSearchFormValues(searchField, searchFormFieldFormat, searchFormDataType, searchFormDataRetrieval,searchFormRequiredField))
			validation = false;
		inputs['seq_no'] = i+1;
		inputs['ReqId'] = ReqId;
		inputs['searchForm'] = searchForm;
		inputs['searchField'] = searchField;
		inputs['fieldFormat'] = searchFormFieldFormat;
		inputs['dataType'] = searchFormDataType;
		inputs['dataRetrieval'] = searchFormDataRetrieval;
		inputs['requiredField'] = searchFormRequiredField;
		inputs['additionalInfo'] = searchFormAdditionalInfo;
		JsonArray.push(inputs);
		
	}
	if(validation)
		archiveSearchFormSaveAjaxcall(JsonArray);
	else
		notification("warning","Please fill the all fields.","Warning");
    e.preventDefault();	
	
}


function checkSearchFormValues(searchField, searchFormFieldFormat, searchFormDataType, searchFormDataRetrieval,searchFormRequiredField){
	
	var validationFlag = false;
	if((searchField != '' && searchField != undefined && searchField != null) && (searchFormFieldFormat != '' && searchFormFieldFormat != undefined && searchFormFieldFormat != null) && 
			(searchFormDataType != '' && searchFormDataType != undefined && searchFormDataType != null) && (searchFormDataRetrieval != '' && searchFormDataRetrieval != undefined && searchFormDataRetrieval != null) && (searchFormRequiredField != '' && searchFormRequiredField != undefined && searchFormRequiredField != null))
			validationFlag = true;
	
	return validationFlag;
}
function archiveSearchFormSaveAjaxcall(JsonArray){
	
	var checkAjax =false;
	
		$.ajax({
	        url: "archiveScreenReqSearchFormSaveServlet",
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
	        		$("#" +
						"busreqNext").removeAttr("disabled");
	        	   }
	        		else
	        		notification("error","Error occurred while saving details.","Error:");
	        },
	        error: function (e) {
	            console.log(e);
	        }
		});
		
	}
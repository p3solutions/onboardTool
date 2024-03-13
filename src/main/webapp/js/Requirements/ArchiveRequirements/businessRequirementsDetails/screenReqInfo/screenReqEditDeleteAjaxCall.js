$(document).ready(function(){

	
	//Screen Info
$(document).on('click','.screenInfoEditRow', function(){
	
	var className = $(this).attr('class');
	/*getTableSections(className);*/
	var seqNum = $(this).index('.screenInfoEditRow');
	
		var nameReadOnly = $(".screenDisplay").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			
			$(".screenDisplay").eq(seqNum).removeAttr("readonly");
			$(".purpose").eq(seqNum).removeAttr("readonly");
			$(".equivalentLegacy").eq(seqNum).removeAttr("readonly");
			
			notification("info","Selected row is editable in Screen Info","Info:");
		}
		else
		{
			
			$(".screenDisplay").eq(seqNum).prop("readonly", true);
			$(".purpose").eq(seqNum).prop("readonly", true);
			$(".equivalentLegacy").eq(seqNum).prop("readonly", true);
			
			notification("info","Selected row is non-editable in Screen Info","Info:");
		}	
	});

//Search form
$(document).on('click','.searchFormEditRow', function(){
	
	var className = $(this).attr('class');
	/*getTableSections(className);*/
	var seqNum = $(this).index('.searchFormEditRow');
	
		var nameReadOnly = $(".searchFormFieldName").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			
			$(".searchFormFieldName").eq(seqNum).removeAttr("readonly");
			$(".searchFormFieldFormat").eq(seqNum).removeAttr("readonly");
			// $(".searchFormDataType").eq(seqNum).removeAttr("disabled");
			// $(".searchFormDataRetrieval").eq(seqNum).removeAttr("disabled");
			// $(".searchFormRequiredField").eq(seqNum).removeAttr("disabled");
			// $(".searchFormDataType").eq(seqNum).removeClass("disabled").selectpicker('refresh');
			// $(".searchFormDataRetrieval").eq(seqNum).removeClass("disabled").selectpicker('refresh');
			// $(".searchFormRequiredField").eq(seqNum).removeClass("disabled").selectpicker('refresh');
			$(".searchFormAdditionalInfo").eq(seqNum).removeAttr("readonly");
			$(".searchFormDataType .selectpicker").eq(seqNum).prop("disabled", false).selectpicker('refresh');
			$(".searchFormDataRetrieval .selectpicker").eq(seqNum).prop("disabled", false).selectpicker('refresh');
			$(".searchFormRequiredField .selectpicker").eq(seqNum).prop("disabled", false).selectpicker('refresh');

			notification("info","Selected row is editable in Screen Info","Info:");

		}
		else
		{
			
			$(".searchFormFieldName").eq(seqNum).prop("readonly", true);
			$(".searchFormFieldFormat").eq(seqNum).prop("readonly", true);
			// $(".searchFormDataType").eq(seqNum).prop("disabled", true);
			// $(".searchFormDataRetrieval").eq(seqNum).prop("disabled", true);
			// $(".searchFormRequiredField").eq(seqNum).prop("disabled", true);
			$(".searchFormDataType .selectpicker").eq(seqNum).prop("disabled", true).selectpicker('refresh');
			$(".searchFormDataRetrieval .selectpicker").eq(seqNum).prop("disabled", true).selectpicker('refresh');
			$(".searchFormRequiredField .selectpicker").eq(seqNum).prop("disabled", true).selectpicker('refresh');
			$(".searchFormAdditionalInfo .selectpicker").eq(seqNum).prop("readonly", true);

			
			notification("info","Selected row is non-editable in Screen Info","Info:");
		}	
	});
var deleteSearchForm = false;
	$(document).on('click','.screenInfoDeleteRow', function(){
		
		var seqNum = $(this).index('.screenInfoDeleteRow')+1;
		$('#screenInfoDeleteSeq').val(seqNum);
		$('#screenInfoDeleteId').click();
		deleteSearchForm = false;
	});
$(document).on('click','.searchFormDeleteRow', function(){
		
		var seqNum = $(this).index('.searchFormDeleteRow')+1;
		$('#screenInfoDeleteSeq').val(seqNum);
		$('#screenInfoDeleteId').click();
		deleteSearchForm = true;
	});
	$(document).on('click','#screenInfoDeleteSubmit', function(){
	
	
	$('.submitDisableScreenInfo').attr('disabled', true);
	var seqNum = $('#screenInfoDeleteSeq').val();
	if(!deleteSearchForm)
	archiveScreenInfoDeleteAjaxCall(seqNum);
	else
	archiveSearchFormDeleteAjaxCall(seqNum);
	$('.submitDisableScreenInfo').attr('disabled', false);
	$('#screenInfoDeleteClose').click();
	});


});

function archiveScreenInfoDeleteAjaxCall(seqNum){
	
	$.ajax({
        url: "archiveScreenReqDeleteServlet",
        type: 'POST',
        data: {seqNum:seqNum},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Delete Row for Screen req--->",data);
        	if(data.DeleteStatus){        		
        		notification("success","Selected row deleted Successfully.","Note:");
        		$("#screenReqInfo").empty();
        		$("#searchFormInfo").empty();
        		archiveScreenReqDeleteDataRetrieve();
        	}
        	else
        		notification("error","Error occurred while deleting the row.","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
}
	function archiveSearchFormDeleteAjaxCall(seqNum){
		
		$.ajax({
	        url: "archiveSearchFormDeleteServlet",
	        type: 'POST',
	        data: {seqNum:seqNum},
	        async: false,
	        dataType: "json",
	        success: function (data) {
	        	console.log("Delete Row for Screen req--->",data);
	        	if(data.DeleteStatus){
	        		$('.searchFormRowClass').eq(seqNum-1).remove();
	        		notification("success","Selected row deleted Successfully.","Note:");
	        	}
	        	else
	        		notification("error","Error occurred while deleting the row.","Error:");
	        	
	        },
	        error: function (e) {
	            console.log(e);
	        }
	    });
	
}

function archiveScreenReqDeleteDataRetrieve(){
	$.ajax({
        url: "archiveScreenReqDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("ScreenInfo Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	var checkDataReq = data[0][0].checkData;
        	if(checkDataReq){
        	 var rowCount=0;
             $.each(data[0], function(key, value){
            	 rowCount++;
            	     var Row="<tr class = 'screenReqRowClass'>"+
            	 "<td class = 'ScreenReqId'>"+value.reqId+
            	 "</td>" +
            	 "<td>"+
            	 "<input type='text' class = 'screenDisplay form-control' value='"+value.screenDisplay+"' readonly/>"+
            	 "</td>"+
            	 "<td><input type='text' class='purpose form-control' value='"+value.purpose+"' readonly/></td>" +
            	 "<td>"+
            	 "<input type='text' class='equivalentLegacy form-control' value='"+value.equivalentLegacy+"' readonly/>"+
            	 "</td>"+
            	 "<td>"+
						 "<div class=\"dropdown dropend\">" +
						 "<button class=\"btn btn-outline-light\" id=\"Drop-option3\"" +
						 " data-bs-toggle=\"dropdown\" aria-expanded=\"false\">" +
						 " <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
						 "</button>" +
            	 "<ul class='dropdown-menu p-0' aria-labelledby=\"Drop-option3\">"+
                 "<li><a class='dropdown-item dropdown-styles screenInfoEditRow Edit'><i" +
						 " class=\"fa-solid fa-pencil iconColor \"></i>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
						 " <li>" +
						 "<hr class=\"dropdown-divider m-0\">" +
						 "</li>" +
                 "<li><a class='dropdown-item dropdown-styles screenInfoDeleteRow Delete'><i class='fa-solid fa-trash-can text-danger'></i>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#screenReqInfo").append(Row);
            	 var option = "<option value = '"+value.reqId+" - "+value.screenDisplay+"'>"+value.reqId+" - "+value.screenDisplay+"</option>"; 
            	 $('#searchFormTypesId').append(option);
             });
        	}
        	else
        	{
			var Row="<tr class = 'screenReqRowClass' id='NoDataScrRecordsRow'>"+
            	 "<td colspan='5'>"+"<b>No Records Found </b>"+
            	 "</td>" +
            	 "</tr>";
            	 $("#screenReqInfo").append(Row);
            	 $("#saveScreenReqId").attr("disabled","disabled");
			}
            
        	var searchFormDataReq = data[1][0].checkData;
        	var searchFormArray = [];
        	if(searchFormDataReq){
        	 var rowCount=0;
             $.each(data[1], function(key, value){
            	 rowCount++;
            	 var dataTypeOptions = getOptions(dataTypeArr, value.dataType);
            	 var dataRetrievalOptions = getOptions(dataRetrievalArr, value.dataRetrieval);
            	 var requiredFieldOptions = getOptions(requiredFieldArr, value.requiredField);
            	 var parentDelete ="<div class='searchFormDeleteRow Delete'></div>";
            	 if(searchFormArray.includes(value.reqId))
            	 {
            		 parentDelete ="<li><a class='dropdown-item dropdown-styles searchFormDeleteRow Delete' ><i class='fa-solid fa-trash-can text-danger'></i>&nbsp;&nbsp;&nbsp;Delete</a></li>";
            	 }
            	 else{
					 parentDelete ="<li><a class='dropdown-item dropdown-styles searchFormDeleteRow Delete disabled' ><i class='fa-solid fa-trash-can text-danger'></i>&nbsp;&nbsp;&nbsp;Delete</a></li>";
					 searchFormArray.push(value.reqId);
				 }

            	var searchFormRow="<tr class = 'searchFormRowClass "+value.reqId.replace("-","")+"'>"+
            	 "<td class = 'searchFormReqId'>"+value.reqId+
            	 "</td>" +
            	 "<td class='searchFormName'>"+value.searchForm+
            	 "</td>"+
            	 "<td><input type='text' class='searchFormFieldName form-control' value='"+value.searchField+"' readonly/></td>" +
            	 "<td>"+
            	 "<input type='text' class='searchFormFieldFormat form-control' value='"+value.fieldFormat+"' readonly/>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormDataType selectpicker form-control' value='"+value.dataType+"' disabled>"+
            	 "<option></option>"+dataTypeOptions+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormDataRetrieval selectpicker form-control' value='"+value.dataRetrieval+"' disabled>"+
            	 "<option></option>"+dataRetrievalOptions+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormRequiredField selectpicker form-control' value='"+value.requiredField+"' disabled>"+
            	 "<option></option>"+requiredFieldOptions+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<textarea class='searchFormAdditionalInfo form-control' value='"+value.additionalInfo+"' readonly>"+value.additionalInfo+"</textarea>"+
            	 "</td>" +
            	 "<td>"+
					"<div class=\"dropdown dropend\">" +
					"<button class=\"btn btn-outline-light\" id=\"Drop-option2\"" +
					" data-bs-toggle=\"dropdown\" aria-expanded=\"false\"> " +
					" <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
					"</button>" +
					"<ul class='dropdown-menu p-0' aria-labelledby=\"Drop-option2\">"+
                   "<li><a class='dropdown-item dropdown-styles searchFormEditRow Edit' ><i" +
					" class=\"fa-solid fa-pencil iconColor \"></i>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
					" <li>" +
					"<hr class=\"dropdown-divider m-0\">" +
					"</li>" +
                 parentDelete+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#searchFormInfo").append(searchFormRow);
             });
        	}
        	
        	else
        	{
			var searchFormRow="<tr class = 'screenReqRowClass' id='NoDataSearchFormRow'>"+
            	 "<td colspan='9'>"+"<b>No Records Found </b>"+
            	 "</td>" +
            	 "</tr>";
            	 $("#searchFormInfo").append(searchFormRow);
            	 $("#saveSearchFormId").attr("disabled","disabled");
			}
        	
	          var script="<script>$('.datepicker1').datepicker({\n" +
             "format: \"mm/dd/yyyy\",\n"+
             "clearBtn:true,"+
             "autoclose: true,\n"+
             "orientation: 'bottom',"+
             "});";
         
         $('#scripttag').append(script);
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}

function getOptions(optionArr, value){
	
	var options = "";
	for(var i = 0; i<optionArr.length; i++){
		if(optionArr[i] == value)
			options += "<option selected>"+optionArr[i]+"</option>";
		else
			options += "<option>"+optionArr[i]+"</option>";
	}
	
	return options;
}


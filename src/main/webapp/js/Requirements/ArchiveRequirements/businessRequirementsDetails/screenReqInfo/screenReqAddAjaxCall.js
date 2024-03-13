$(document).on('click', '#screenReqAddSubmit', function(){
	var displayName = $('#screenReqAddId').val();
	
	if(displayName != '' && displayName != undefined && displayName != null){
		archiveScreenReqAddAjaxCall(displayName);
	}
	else
		notification("warning","Please fill the display name field.","Warning:");
	
});

function archiveScreenReqAddAjaxCall(displayName){
	
	$.ajax({
        url: "archiveScreenReqAddServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        data:{displayName:displayName},
        success: function (data) {
        	console.log("Add Screen Info--->",data);
        	
        	var checkDataReq = data.AddStatus;
        	var checkDisplayName = data.checkDisplay;
        	if(!checkDisplayName){
        		

        	if(checkDataReq){
        	 var rowCount=0;
            $('#NoDataSearchFormRow').hide();
            $('#NoDataScrRecordsRow').hide();            
            	 rowCount++;
            	     var Row="<tr class = 'screenReqRowClass'>"+
            	 "<td class = 'ScreenReqId'>"+data.ReqId+
            	 "</td>" +
            	 "<td>"+
            	 "<input type='text' class = 'screenDisplay form-control' value='"+displayName+"' readonly/>"+
            	 "</td>"+
            	 "<td><input type='text' class='purpose form-control' value='' readonly/></td>" +
            	 "<td>"+
            	 "<input type='text' class='equivalentLegacy form-control' value='' readonly/>"+
            	 "</td>"+
            	 "<td>"+
						 "<div class=\"dropdown dropend\">" +
						 "<button class=\"btn btn-outline-light\" id=\"Drop-option\"" +
						 " data-bs-toggle=\"dropdown\" aria-expanded=\"false\"> <img" +
						 " src='images/icons8-expand-arrow-25.png'" +
						 " alt=\"dropdown\">" +
						 "</button>" +"<ul class='dropdown-menu p-0' aria-labelledby=\"Drop-option\">"+
                 "<li><a class='dropdown-item dropdown-styles screenInfoEditRow Edit'><i" +
						 " class=\"fa-solid fa-pencil iconColor \"></i>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
						 "<li><hr class='dropdown-divider m-0'></li>"+
                 "<li><a class='dropdown-item dropdown-styles screenInfoDeleteRow Delete'><i class='fa-solid fa-trash-can text-danger'></i>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $('#NoDataScrRecordsRow').remove();  
            	 $("#screenReqInfo").append(Row);
            	 $('#saveScreenReqId').prop('disabled', false);
            	 notification("success","Row added successfully.","Success:");            	 
            	 $('#closeIdScreenInfo').click();
            	 $('#screenReqAddId').val('');
            	 var ReqID = (data.ReqId).replace("-","");
            	 
            	 var searchFormRow="<tr class = 'searchFormRowClass "+ReqID+"'>"+
            	 "<td class = 'searchFormReqId'>"+data.ReqId+
            	 "</td>" +
            	 "<td class='searchFormName' >"+displayName+
            	 "</td>"+
            	 "<td><input type='text' class='searchFormFieldName form-control' value='' readonly/></td>" +
            	 "<td>"+
            	 "<input type='text' class='searchFormFieldFormat form-control' value='' readonly/>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormDataType selectpicker form-control' value='' disabled>"+
            	 "<option></option>"+
            	 "<option>Integer</option>"+
            	 "<option>String</option>"+
            	 "<option>CHAR</option>"+
            	 "<option>VARCHAR</option>"+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormDataRetrieval selectpicker form-control' value='' disabled>"+
            	 "<option></option>"+
            	 "<option>Equal to</option>"+
            	 "<option>Contains</option>"+
            	 "<option>Wildcard</option>"+
            	 "<option>Partial Search</option>"+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormRequiredField selectpicker form-control' value='' disabled>"+
            	 "<option></option>"+
            	 "<option>Yes</option>"+
            	 "<option>No</option>"+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<textarea class='searchFormAdditionalInfo form-control' value='' readonly></textarea>"+
            	 "</td>" +
					 "<td>"+
					 "<div class=\"dropdown dropend\">" +
					 "<button class=\"btn btn-outline-light\" id=\"Drop-option1\"" +
					 " data-bs-toggle=\"dropdown\" aria-expanded=\"false\"> <img" +
					 " src=\"images/icons8-expand-arrow-25.png\"" +
					 " alt=\"dropdown\">" +
					 "</button>" +"<ul class='dropdown-menu p-0' aria-labelledby=\"Drop-option1\">"+
                 "<li><a class='dropdown-item dropdown-styles searchFormEditRow Edit'><i" +
					 " class=\"fa-solid fa-pencil iconColor \"></i>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                 "<div class='searchFormDeleteRow Delete'></div>"+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#searchFormInfo").append(searchFormRow);
            	 $('#saveSearchFormId').prop('disabled', false);
            	 $("#NoDataSearchFormRow").remove();
            	 
            	 var option = "<option value = '"+data.ReqId+" - "+displayName+"'>"+data.ReqId+" - "+displayName+"</option>"; 
            	 $('#searchFormTypesId').append(option);
        	}
        	else
        		notification("error","Error occurred while adding row.","Error:");
        	
        	}
        	else
        		notification("warning","Screen Display Name in Infoarchive already exist","Warning:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}
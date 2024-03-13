var dataTypeArr = ['Integer','String','CHAR','VARCHAR'];
var dataRetrievalArr = ['Equal to','Contains','Wildcard','Partial Search'];
var requiredFieldArr = ['Yes','No'];

$(document).ready(function(){
	archiveScreenReqDataRetrieve();	
});

function archiveScreenReqDataRetrieve(){
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
					 "<ul class=\"dropdown-menu p-0\" aria-labelledby=\"Drop-option3\">" +
					 "<li><a class=\"dropdown-item dropdown-styles screenInfoEditRow Edit\"><i" +
					 " class=\"fa-solid fa-pencil iconColor \"></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
					 "</li>" +
					 "<li>" +
					 "<hr class=\"dropdown-divider m-0\">" +
					 "</li>" +
					 "<li><a class=\"dropdown-item dropdown-styles screenInfoDeleteRow Delete\" data-bs-toggle=\"modal\"" +
					 "   data-bs-target=\"#ArchiveDeletePopUp\"><i" +
					 " class=\"fa-solid fa-trash-can text-danger\"></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
					 "</li>" +
					 "</ul>" +
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
            	 "<td colspan='5'>"+"<b>No records found</b>"+
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
            		 parentDelete ="<li><hr class='dropdown-divider m-0'></li><li><a class='dropdown-item dropdown-styles searchFormDeleteRow Delete'> <i class='fa-solid fa-trash-can text-danger'></i>&nbsp;&nbsp;&nbsp;Delete</a></li>";
            	 }
            	 else {
					 parentDelete ="<li><hr class='dropdown-divider m-0'></li><li><a class='dropdown-item dropdown-styles disabled searchFormDeleteRow Delete'> <i class='fa-solid fa-trash-can text-danger'></i>&nbsp;&nbsp;&nbsp;Delete</a></li>";

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
            	 "<select class='searchFormDataType selectpicker form-control ' value='"+value.dataType+"' disabled>"+
            	 "<option></option>"+dataTypeOptions+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormDataRetrieval selectpicker form-control ' value='"+value.dataRetrieval+"' disabled>"+
            	 "<option></option>"+dataRetrievalOptions+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormRequiredField selectpicker form-control ' value='"+value.requiredField+"' disabled>"+
            	 "<option></option>"+requiredFieldOptions+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<textarea class='searchFormAdditionalInfo form-control ' value='"+value.additionalInfo+"' readonly>"+value.additionalInfo+"</textarea>"+
            	 "</td>" +
            	 "<td>"+
					"<div class=\"dropdown dropend\">" +
					"<button class=\"btn btn-outline-light\" id=\"Drop-option4\"" +
					" data-bs-toggle=\"dropdown\" aria-expanded=\"false\">" +
					" <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
					"</button>" +
					"<ul class=\"dropdown-menu p-0\" aria-labelledby=\"Drop-option4\">" +
					"<li><a class=\"dropdown-item dropdown-styles searchFormEditRow Edit\" ><i" +
					" class=\"fa-solid fa-pencil iconColor \"></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
					"</li>" +
					parentDelete+
					"</ul>" +
					"</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("#searchFormInfo").append(searchFormRow);
             });
        	}
        	else
        	{
			var searchFormRow="<tr class = 'NoDatascreenReqRowClass' id='NoDataSearchFormRow'>"+
            	 "<td colspan='9'>"+"<b>No records found</b>"+
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
$(document).on('click', '#searchFormAddSubmit', function(){
	var Value = $('#searchFormTypesId').val();
	if(Value!=""&&Value!=undefined&&Value!=null){
	var splitValue = Value.split('-');
	var reqId = splitValue[0]+splitValue[1].replace(' ','');
	var reqID = splitValue[0]+"-"+splitValue[1].replace(' ','')
	var searchIndex = ($('.'+reqId).length)-1;
	var seqNum = $('.'+reqId).eq(searchIndex).index('.searchFormRowClass')+1;
	var searchFormName = "";
	for(var i=2;i<splitValue.length;i++)
		searchFormName += splitValue[i].replace(' ','');
	archiveSearchFormAddAjaxCall(searchFormName,seqNum,reqID);
	}
	else
		notification("warning","Please fill Search Form Name.","warning");
	
});

function archiveSearchFormAddAjaxCall(searchFormName,seqNum,reqId){
	
	$.ajax({
        url: "archiveScreenSearchFormAddServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        data:{searchFormName:searchFormName, seqNum:seqNum,reqId:reqId},
        success: function (data) {
        	console.log("Add Search Form Info--->",data);
        	
        	var checkDataReq = data.AddStatus;

        	if(checkDataReq){
        	 var rowCount=0;
            
            	 rowCount++;
            	  var reqIdClass = (data.reqId).replace("-","");
            	 var searchFormRow="<tr class = 'searchFormRowClass "+reqIdClass+"'>"+
            	 "<td class = 'searchFormReqId'>"+data.reqId+
            	 "</td>" +
            	 "<td class='searchFormName'>"+
            	 "</td>"+
            	 "<td><input type='text' class='searchFormFieldName form-control' value='' readonly/></td>" +
            	 "<td>"+
            	 "<input type='text' class='searchFormFieldFormat form-control' value='' readonly/>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormDataType form-select' value='' disabled>"+
            	 "<option></option>"+
            	 "<option>Integer</option>"+
            	 "<option>String</option>"+
            	 "<option>CHAR</option>"+
            	 "<option>VARCHAR</option>"+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormDataRetrieval form-select' value='' disabled>"+
            	 "<option></option>"+
            	 "<option>Equal to</option>"+
            	 "<option>Contains</option>"+
            	 "<option>Wildcard</option>"+
            	 "<option>Partial Search</option>"+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<select class='searchFormRequiredField form-select' value='' disabled>"+
            	 "<option></option>"+
            	 "<option>Yes</option>"+
            	 "<option>No</option>"+
            	 "</select>"+
            	 "</td>"+
            	 "<td>"+
            	 "<textarea class='searchFormAdditionalInfo form-control' readonly></textarea>"+
            	 "</td>" +
            	 "<td>"+
					 "<div class=\"dropdown dropend\">" +
					 "<button class=\"btn btn-outline-light\" id=\"Drop-option\"" +
					 " data-bs-toggle=\"dropdown\" aria-expanded=\"false\"> " +
					 " <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
					 "</button>" +
            	  "<ul class='dropdown-menu p-0'  aria-labelledby='Drop-option'>"+
                 "<li><a class='dropdown-item dropdown-styles searchFormEditRow Edit' ><i" +
					 " class=\"fa-solid fa-pencil iconColor \"></i>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
					 " <li>" +
					 "<hr class=\"dropdown-divider m-0\">" +
					 "</li>" +
                 "<li><a class='dropdown-item dropdown-styles searchFormDeleteRow Delete'><i" +
					 " class=\"fa-solid fa-trash-can text-danger\"></i>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                 "</ul>"+
                 "</div>"+
            	 "</td>"+
            	 "</tr>";
            	 $("."+(data.reqId).replace("-","")).last().after(searchFormRow);
      
            	 notification("success","Row added successfully.","Success:");
            	 $('#closeIdsearchForm').click();
            	 $('#searchFormTypesId').val('');
        	}
        	else
        		notification("error","Error occurred while adding row.","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}
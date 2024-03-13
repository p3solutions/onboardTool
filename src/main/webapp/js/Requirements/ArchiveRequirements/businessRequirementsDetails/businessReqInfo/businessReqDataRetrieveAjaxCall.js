$(document).ready(function(){
	
	businessReqDataRetrieve();
	businessReqInScopeDataRetrieve();
	
$(document).on('click','.EditRowBusiness', function(){
		
		var seqNum = $(this).index(".EditRowBusiness");
		var nameReadOnly = $(".description").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			
			$(".description").eq(seqNum).removeAttr("readonly");
			notification("info","Selected row is editable.","Info:");
		}
		else
		{
			
			$(".description").eq(seqNum).prop("readonly", true);
			notification("info","Selected row is non-editable.","Info:");
		}	
			
	});
	

});

function businessReqDataRetrieve(){
	
	$.ajax({
        url: "businessReqDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Data Retrieve--->",data);
        	if(data.checkData){
        		$('.business').html(data.business);
				if(data.business != '')
        			$('#busreqNext').attr('disabled', false);
				var businessrequirements = data.businessreq; 
        		var busreqList = businessrequirements.split("::");
        		var busreqValue = "";
        		for(var i = 0; i<busreqList.length; i++)
        			busreqValue += "<li>"+busreqList[i]+"</li>";
        		$('.business').find('ul').html('');
        		$('.business').find('ul').html(busreqValue);
        	}
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}

function businessReqInScopeDataRetrieve(){
	
	$.ajax({
        url: "businessreqInScopeDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 $.each(data, function(key, value){
            	 var Row="<tr class = 'rowClass'>"+
            	 "<td>"+value.req_in_scope+"</td>" +
            	 "<td><textarea class='description form-control' cols=\"30\" rows=\"3\"readonly>"+value.description+"</textarea></td>" +
            	 "<td>"+
            	 "<div class=\"dropdown dropend\">" +
					 "<button class=\"btn btn-outline-light\" id=\"Drop-option\"" +
					 " data-bs-toggle=\"dropdown\" aria-expanded=\"false\"> " +
					 " <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
					 "</button>" +
					 "<ul class=\"dropdown-menu p-0\" aria-labelledby=\"Drop-option\">" +
					 "<li><a class=\"dropdown-item dropdown-styles EditRowBusiness\" ><i" +
					 " class=\"fa-solid fa-pencil iconColor\"></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
					 " <li>" +
					 "<hr class=\"dropdown-divider m-0\">" +
					 "</li>" +
					 "<li><a class=\"dropdown-item dropdown-styles disabled\"><i" +
					 "  class=\"fa-solid fa-trash-can text-danger \"></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
					 "</li>"+
					 "</li>" +
					 "</ul>" +
					 "</div>"+
            	 "</td>" +
            	 "</tr>";
            	 $("#reqinscope").append(Row);
             });
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}
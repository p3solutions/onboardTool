$(document).on('click','.deleteClass',function(){
	
	var index =$(this).index(".deleteClass");

	$(".myDropdown").eq(index).hide();

	var oppId = $(".oppId").eq(index).val();
	
	var oppName = $(".oppName").eq(index).val();
	
	$("#deleteBtn").click();
	$("#deleteYesBtn").click(function(){
		deleteOpportunityAjaxCall(oppId,oppName,index);
		$("#deleteClose").click();
	});
	
	

});

function deleteOpportunityAjaxCall(OppId,OppName,index)
{
	$.ajax({
        url: "deleteOpportunityServlet",
        type: 'POST',
        async:false,
        data : {OppId:OppId, OppName:OppName},
        dataType: "json",
        success: function (data) {
        	console.log("data: ",data);
          if(data.deleteStatus)
          {
        	notification("success",OppName+" deleted successfully","Note:");
        	$(".col").eq(index).remove();
              $('#overlay').hide();
          }
          else if(!data.deleteStatus)
          {
        	  notification("error","Problem occurred while deleting.","Error:");
          }
        
        },
        error: function (e) {
            console.log(e);
       }
	});
}
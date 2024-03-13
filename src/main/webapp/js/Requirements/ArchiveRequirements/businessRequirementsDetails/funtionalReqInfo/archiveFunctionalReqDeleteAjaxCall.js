var deleteClass = "";
var deleteTableName = "";
var tableNameDelEdit = "";
var tableNoData="";
$(document).ready(function(){
$(document).on('click','.DeleteRow', function(){
		var className = $(this).attr('class');
		deleteClass = "";
		deleteTableName = "";
		tableNoData="";
		getTableSections(className);
		var seqNum = $(this).index('.'+deleteClass+"Delete")+1;
		$('#DataDeleteSeq').val(seqNum);
		$('#DataDeleteId').click();
	});

$(document).on('click','#DataDeleteSubmit', function(){
	
	$('.submitDisableData').attr('disabled', true);
	var seqNum = $('#DataDeleteSeq').val();
	
	archiveFunctionalReqDeleteAjaxCall(seqNum);
	$('.submitDisableData').attr('disabled', false);
	$('#DataDeleteClose').click();
});
	
$(document).on('click','.EditRow', function(){
	
	var className = $(this).attr('class');
	getTableSections(className);
	var seqNum = $(this).index('.'+deleteClass+"Edit");
	
		var nameReadOnly = $("."+deleteClass+"ReqType").eq(seqNum).attr("readonly");
		if(nameReadOnly)
		{
			$("."+deleteClass+"ReqType").eq(seqNum).removeAttr("readonly");
			$("."+deleteClass+"Yes").eq(seqNum).removeAttr("disabled");
			$("."+deleteClass+"No").eq(seqNum).removeAttr("disabled");
			$("."+deleteClass+"Requirements").eq(seqNum).removeAttr("readonly");
			$("."+deleteClass+"Additional").eq(seqNum).removeAttr("readonly");
			notification("info","Seleted row is editable in "+tableNameDelEdit+".","Info:");
		}
		else
		{
			$("."+deleteClass+"ReqType").eq(seqNum).prop("readonly", true);
			$("."+deleteClass+"Yes").eq(seqNum).prop("disabled", true);
			$("."+deleteClass+"No").eq(seqNum).prop("disabled", true);
			$("."+deleteClass+"Requirements").eq(seqNum).prop("readonly", true);
			$("."+deleteClass+"Additional").eq(seqNum).prop("readonly", true);
			notification("info","Seleted row is non-editable in "+tableNameDelEdit+".","Info:");
		}	
	});

});




function getTableSections(className){
	if(className.includes("dataReq")){
		 deleteClass = "dataReq";
		 deleteTableName = "archive_datareq_info";
		 tableNameDelEdit = "Data Requirements";
		 tableNoData="DataReqId";
	}
	else if(className.includes("legalReq"))
	{
		deleteClass = "legalReq";
		 deleteTableName = "Archive_RetentionLegalReq_Info";
		 tableNameDelEdit = "Retention and Legal Requirements";
		 tableNoData="LegalReqId";
	}
	else if(className.includes("securityReq"))
	{
		deleteClass = "securityReq";
		 deleteTableName = "Archive_SecurityReq_Info";
		 tableNameDelEdit = "Security Requirements";
		 tableNoData="SecurityReqId";
	}
	else if(className.includes("usabilityReq"))
	{
		deleteClass = "usabilityReq";
		 deleteTableName = "Archive_UsabilityReq_Info";
		 tableNameDelEdit = "Usability Requirements";
		 tableNoData="UsabilityReqId";
	}
	else if(className.includes("auditReq"))
	{
		deleteClass = "auditReq";
		 deleteTableName = "Archive_AuditReq_Info";
		 tableNameDelEdit = "Audit Requirements";
		 tableNoData="AuditReqId";
	}
}

function archiveFunctionalReqDeleteAjaxCall(seqNum){
	
	$.ajax({
        url: "archiveFunctionalReqDeleteServlet",
        type: 'POST',
        data: {seqNum:seqNum, tableName:deleteTableName},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Delete Row Retrieve--->",data);
        	if(data.DeleteStatus){
	var nodatamsgflag=$('.'+deleteClass+'ReqId').length;
        		console.log("delete length",$('.'+deleteClass+'ReqId').length);
        		for(var i=seqNum;i<$('.'+deleteClass+'ReqId').length;i++)
        			{
        			 var count = 0;
        			 var seq_num=i+"";
        			  if(seq_num.length<3)
        			  {
        			  count = 3-seq_num.length;
        			  for(var j=0;j<count;j++)
        			  seq_num = "0"+seq_num;
        			  }
        			var reqId = $('.'+deleteClass+'ReqId').eq(i).html();
        			var ReqId = reqId.split("-");
        			$('.'+deleteClass+'ReqId').eq(i).html(ReqId[0]+"-"+ReqId[1]+"-"+seq_num);
        			}
        		$('.'+deleteClass+'RowClass').eq(seqNum-1).remove();
        		if(nodatamsgflag==1)
        		{
				   var Row="<tr class = 'screenReqRowClass'id='"+tableNoData+"NoDataScrRow'>"+
            	 "<td align='center' colspan='6'style='width:100%; text-decoration:bold;'>"+"<label style='color: black;'>No Records Found </label>"+
            	 "</td>" +
            	 "</tr>";
			  $("#"+tableNoData).append(Row);
	
				 //$("#"+tableNoData+"NoDataScrRow").show();
				}
        		notification("success","Selected row deleted Successfully in "+tableNameDelEdit+".","Note:");
        	}
        	else
        		notification("error","Error occurred while deleting the row in "+tableNameDelEdit+".","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}
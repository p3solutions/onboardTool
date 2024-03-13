$(document).ready(function(){

$(document).on('click','.EditRow', function(){
	
	var editRowIndex = $(this).index('.EditRow');
	var seqNum = parseInt(editRowIndex)+1;
	$('#seqNumEditId').val(seqNum);
	
	var taskGroup = $('.taskGroup').eq(editRowIndex).html();
	var taskName = $('.taskName').eq(editRowIndex).html();
	$('#ArchiveEditGrpLabel').val(taskGroup);
	$('#ArchiveEditLabelId').val(taskName);
	
	$('#ArchExecEditId').click();
	console.log("Edit");
	
	
});

$(document).on('click','#ArchiveEditSubmit',function(){
	
	$('.submitEditDisable').attr('disabled',true);
	
	var seqNum = $('#seqNumEditId').val();
	var taskGrpValue = $('#ArchiveEditGrpLabel').val();
	var taskNameValue = $('#ArchiveEditLabelId').val();
	
	if(taskGrpValue != ''&&taskGrpValue!=undefined&&taskGrpValue!=null || taskNameValue != ''&&taskNameValue!=undefined&&taskNameValue!=null)
		archiveExecutionEditFunction(seqNum, taskGrpValue, taskNameValue);
	else 
		notification("warning","Please fill either TaskGroup or TaskName.","Warning");
		$('.submitEditDisable').attr('disabled',false);
		$('#closeIdEdit').click();
});

});


function archiveExecutionEditFunction(seqNum, taskGroup, taskName){
	
	$.ajax({
        url: "ArchiveExecutionEditServlet",
        type: 'POST',
        async:false,
        data: {seqNum:seqNum, TaskName:taskName, TaskGroup:taskGroup},
        dataType: "json",
        success: function (data) {
        	console.log("Edit Details : ",data);
        	if(data.CheckEdit){
        		 $('.taskGroup').eq(seqNum-1).html(taskGroup);
        		 $('.taskName').eq(seqNum-1).html(taskName);
        		 notification("success","Selected Node is updated.","Note");
        		}
        	else{
        		notification("error","Error occured while editing.","Error");
        	}
        },
        error: function (e) {
            console.log(e);
        }
        
	});
}
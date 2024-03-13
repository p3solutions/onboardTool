$(document).ready(function (){
	
	
$(document).on('click','#addendumAdd', function(){
		
		
	$('#addendumAddId').click();
		
	});
	
$(document).on('click','#addendumAddSubmit', function(){
	
	var seqNum = $('.addendumInfo').length;
	var labelName = $('#addendumLabelId').val();
	if(labelName != '' && labelName != undefined && labelName != null)
		archiveReqAddendumAddAjaxCall(seqNum,labelName);
	else
		notification("warning","Please fill the fields","Warning:");
});
});

function archiveReqAddendumAddAjaxCall(seqNum,labelName){
	
	$.ajax({
        url: "archiveReqAddendumAddServlet",
        type: 'POST',
        data: {seqNum:seqNum, labelName:labelName},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Add Row Retrieve--->",data);        	
        	var count=(data.length)+1;
        	if(data.AddStatus){
        		var delete_icon = "<span class='fas fa-trash-can text-danger deletepopup hidedelete' style='float:right;display:none;' deletesectioniconcount='"+data.seq_no+"' ></span>";
        		var Row ="<div class='addendumField row row-cols-2 g-2 mt-3'><div class=' col-9'>"+
					"<label class='editable form-label text-muted' contenteditable='true'>"+value.labelName+"</label>"+delete_icon+
					"<textarea rows='6' cols='30' class='req addendumInfo form-control'>"+value.addendumInfo+"</textarea>"+
					"</div>"+
					"<div class='col-3 px-0 d-flex justify-content-center mt-4 pt-5'>"+
					"<i class='fas fa-cloud-upload-alt upload-icon' id='"+value.seq_no+"' uploadsectioniconcount='"+value.seq_no+"'></i>"+
					"<i class='fa icon fa-eye mx-3' id='eyeicon" + value.seq_no + "' eyesectioncount='"+value.seq_no+"'></i>"+
					"</div>"+
					"</div>";
        		$("#inputFieldsAddendum").append(Row);
        		$("#addendumAddClose").click();        		
           	 	notification("success","Row added Successfully.","Note:");
           	 	$("#addendumLabelId").val('');
        	}
        	else if(data.checkDuplicate)
        		notification("warning","Label Name already exist.","Warning:");
        	else
        		notification("error","Error occurred while adding the row.","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}
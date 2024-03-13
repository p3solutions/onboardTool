$(document).ready(function(){
	
$(document).on('click','#addendumDelete', function(){
		
	$(".hidedelete").toggle();		
		
		
	});
$(document).on('click','.deletepopup ',function()
{
	$('#addendumDeleteId').click();
	var seqNum = $(this).attr("deletesectioniconcount"); 
	$("#addendumDeleteSeq").val(seqNum)
	
});
$(document).on('click','#addendumDeleteSubmit', function(){
	
	$('.submitDisableAddendum').attr('disabled', true);
	var seqNum = $('#addendumDeleteSeq').val();
	
	archiveReqAddendumDeleteAjaxCall(seqNum);
	$('.submitDisableAddendum').attr('disabled', false);
	$('#addendumDeleteClose').click();
	$('.hidedelete').hide();
});
	
});

function archiveReqAddendumDeleteAjaxCall(seqNum){
	
	$.ajax({
        url: "archiveReqAddendumDeleteServlet",
        type: 'POST',
        data: {seqNum:seqNum},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Delete Row Retrieve--->",data);
        	if(data.DeleteStatus){
        		$('.addendumField').eq(seqNum-1).remove();
        		notification("success","Selected row deleted Successfully.","Note:");
        		archiveReqAddendumDataRetrieveAjaxCall();
        	}
        	else
        		notification("error","Error occurred while deleting the row.","Error:");
        	
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}

function archiveReqAddendumDataRetrieveAjaxCall(){
	
	$.ajax({
        url: "archiveReqAddendumDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Table Retrieve--->",data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 $("#inputFieldsAddendum").html("");
        	 var checkTable = data[0].checkExistance;    	 
        	 var count=1;
        	 if(checkTable){
             $.each(data, function(key, value){  
				 var delete_icon = "<span class='fas fa-trash-can text-danger deletepopup hidedelete'  style='float:right;display:none;' deletesectioniconcount='"+value.seq_no+"' ></span>";
            	 var Row="<div class='addendumField row row-cols-2 g-2 mt-3'><div class=' col-9'>"+
            	 		 "<label class='editable form-label text-muted' contenteditable='true'>"+value.labelName+"</label>"+delete_icon+
            	 		 "<textarea rows='6' cols='30' class='req addendumInfo form-control'>"+value.addendumInfo+"</textarea>"+
					     "</div>"+
                         "<div class='col-3 px-0 d-flex justify-content-center mt-4 pt-5'>"+
					     "<i class='upload-icon fas fa-cloud-upload-alt' id='UploadFile" + value.seq_no + "' uploadsectioniconcount= '"+value.seq_no+"'></i>"+
					     "<i class='fa icon fa-eye mx-3' id='eyeicon" + value.seq_no + "' eyesectioncount='"+value.seq_no+"'></i>"+
					     "</div>"+
            	 		 "</div>";
            	 		 
            	 $("#inputFieldsAddendum").append(Row);            	 
            	 count++;
            	 });            	
            	 }
/*            	 <div class="upload-icon">  
  <input type="file" id="upload">
  <label for="upload">
    <i class="fas fa-cloud-upload-alt"></i> Upload file
  </label>
</div> */
        	 
        	 else{
				 var delete_icon = "<span class='fas fa-trash-can text-danger deletepopup hidedelete'  style='float:right;display:none;' deletesectioniconcount='1'></span>";
        		 var Row="<div class='addendumField row row-cols-2 g-2 mt-3'><div class=' col-9'>"+
        	 		 "<label class='editable form-label text-muted' contenteditable='true'>Section 1</label>"+delete_icon+
        			 "<textarea rows='6' cols='30' style='height:100px;' class='req addendumInfo'></textarea>"+
					 "</div>"+
        			 "<div class='col-3 px-0 d-flex justify-content-center mt-4 pt-5'>"+
  					 "<i class='fas fa-cloud-upload-alt upload-icon' id='UploadFile1' uploadsectioniconcount='1'></i>"+
					 "<i class='fa icon fa-eye' id='eyeicon1' eyesectioncount=1 ></i>"+
					 "</div>"+
        		 "</div>";
        		 
        		 $("#inputFieldsAddendum").append(Row);
             	}
        	
        	     },
        error: function (e) {
            console.log(e);
        }
    });
}
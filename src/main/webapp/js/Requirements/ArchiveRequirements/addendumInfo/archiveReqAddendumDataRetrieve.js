$(document).ready(function(){
	archiveReqAddendumDataRetrieveAjaxCall();
});

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
        	 if(checkTable){
             $.each(data, function(key, value){  
				 var delete_icon = "<span class='fas fa-trash-can text-danger deletepopup hidedelete'  style='float:right;display:none;' deletesectioniconcount='"+value.seq_no+"' ></span>";
            	 var Row="<div class='addendumField row row-cols-2 g-2 mt-3'><div class=' col-9'>"+
            	 		 "<label class='editable form-label text-muted' contenteditable='true'>"+value.labelName+"</label>"+delete_icon+
            	 		 "<textarea rows='6' cols='30' class='req addendumInfo form-control'>"+value.addendumInfo+"</textarea>"+
                     "</div>"+
                     "<div class='col-3 px-0 d-flex justify-content-center mt-4 pt-5'>"+
                     "<i class='upload-icon fas fa-cloud-upload-alt' id='"+value.seq_no+"' uploadsectioniconcount='"+value.seq_no+"'></i>"+
					     "<i class='fa icon fa-eye mx-3' id='eyeicon" + value.seq_no + "' eyesectioncount='"+value.seq_no+"'></i>"+
					     "</div>"+
            	 		 "</div>";
            	 		 
            	 $("#inputFieldsAddendum").append(Row);
            	 });            	
            	 }

        	 
        	 else{
        		 var delete_icon = "<span class='fas fa-trash-can text-danger deletepopup hidedelete'  style='float:right;display:none;' deletesectioniconcount='1'></span>";
        		 var Row="<div class='addendumField row row-cols-2 g-2 mt-3'><div class=' col-9'>"+
        	 		 "<label class='editable form-label text-muted' contenteditable='true'>Section 1</label>"+delete_icon+
        			 "<textarea rows='6' cols='30'  class='req addendumInfo form-control'></textarea>"+
                     "</div>"+
        			 "<div class='col-3 px-0 d-flex justify-content-center mt-4 pt-5'>"+
                     "<i class='upload-icon fas fa-cloud-upload-alt' id='UploadFile1' uploadsectioniconcount='1'></i>"+
					 "<i class='fa icon fa-eye mx-3' id='eyeicon1' eyesectioncount=1 ></i>"+
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

    
     $(document).on('click', '.upload-icon', function () {
	var section_no=$(this).attr("uploadsectioniconcount"); 
    $('#addendumUploadId').click();     
    $('#seq_no_section_insert').val(section_no); 
        $('#addendumUploadPopup').on('shown.bs.modal', function () {
    });
    });
       $(document).on('click', '.fa-eye', function () {
    $('#addendumViewUploadId').click(); 
    var section_no=$(this).attr("eyesectioncount"); 
    $('#seq_no_section_insert').val(section_no); 
    $(".Uploaded_Files_List").empty();
    	$.ajax({
        url: "ArchiveReqAddendumFileRetrieveServlet",
        type: 'POST',
        data:{section_no:section_no},
        dataType: "json",
        success: function(data) {
            console.log("Addendum Files Retrieve", data);
            if (!$.isArray(data)) {
                data = [data];
            }
            appendRowFunction(data);
        },
    });    
   
    });
    
    var count=1;
function appendRowFunction(data) {
    $.each(data, function(key, value) {
		var seq_num = value.seq_num;
		var section_no = value.section_no;
        var oppId = value.oppId;
        var File_Name = value.File_Name;
        var row = "<tr>" +
            "<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>" + seq_num + "</label>" +
            "</td>"+
            "<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>" + section_no + "</label>" +
            "</td>"+
            "<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>" + oppId + "</label>" +
            "</td>"+
            "<td style='text-align:center;vertical-align: middle;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:10ch;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + File_Name + "'><label class='control-label ' for=''>" + File_Name + "</label>" +
            "</td>" +
            "<td style='text-align:center;vertical-align: middle;'><span class='fa-solid fa-download add_download_btn'></span><span class='fas fa-trash-can text-danger addendum_scr_deletepopup'id='addendum_file_delete_icon" +count+ "'style='float:right;'></span>" +
            "</td>" +
        "</tr>";
    	$(".Uploaded_Files_List").append(row);		
		count++;
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function(tooltipTrigger) {
            return new bootstrap.Tooltip(tooltipTrigger)
        })
    });
}
    
    
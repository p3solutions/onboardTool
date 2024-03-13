$(document).on('click', '.addendum_scr_deletepopup', function () {
	 var currentRow=$(this).closest("tr");
    var seq_num=currentRow.find("td:eq(0)").text();   
    var section_no=currentRow.find("td:eq(1)").text();
    var File_Name=currentRow.find("td:eq(3)").text();
     $('#Delete_Seq_Number').val(seq_num);
     $('#Delete_Section_Number').val(section_no);
     $('#Delete_File_Name').val(File_Name);
    $('#uploaded_files_delete_btn').click();  
   
    });

$('#addendum_scr_delete_submit').click(function(){
     var Delete_Seq_Number=$('#Delete_Seq_Number').val();
     var Delete_Section_Number=$('#Delete_Section_Number').val();
     var Delete_File_Name=$('#Delete_File_Name').val();
        $.ajax({
            url: "ArchiveReqAddendumFileDeleteServlet",
            type: 'POST',
            data : {Delete_Seq_Number:Delete_Seq_Number,Delete_Section_Number:Delete_Section_Number,Delete_File_Name:Delete_File_Name},
            dataType: "json",
            success: function (data) {
                File_Name=data.File_Name;
                deletegrid(Delete_Section_Number);
//        $('#deletegrid_update').click();      
            }
        });
        notification("warning","File is Deleted Successfully","Delete Files");
       });
function deletegrid(section_no){
	      var count=1;
 //$('#addendum_deletegrid_update').click(function() {      
       $.ajax({
        url: "ArchiveReqAddendumFileRetrieveServlet",
        type: 'POST',
        data:{section_no:section_no},
        dataType: "json",
        success: function(data) {
            console.log("Addendum Files :",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            $(".Uploaded_Files_List").empty();
        $.each(data, function(key, value) {
		var seq_num = value.seq_num;
		var section_no = value.section_no;
        var oppId = value.oppId;
        var File_Name = value.File_Name;
        var row = "<tr>" +
            "<td style='display:none;'>" + seq_num +
            "</td>"+
            "<td style='display:none;'>" + section_no +
            "</td>"+
            "<td style='display:none;'>" + oppId +
            "</td>"+
            "<td style='text-align:center;vertical-align: middle;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:10ch;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + File_Name + "'>" + File_Name +
            "</td>" +
            "<td><span class='fa-solid fa-download add_download_btn mx-2'></span><span class='fas fa-trash-can text-danger addendum_scr_deletepopup'id='addendum_file_delete_icon" +count+ "'></span>" +
            "</td>" +
            "</tr>";	
    	$(".Uploaded_Files_List").append(row);		
		count++;
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function(tooltipTrigger) {
            return new bootstrap.Tooltip(tooltipTrigger)
        })
    });
            /*var parentRow = ""*/	
           
            },
    });
    //});
    }   
  
       
     
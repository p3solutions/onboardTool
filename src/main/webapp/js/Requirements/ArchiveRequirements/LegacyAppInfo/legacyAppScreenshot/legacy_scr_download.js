$(document).on('click', '.download_btn', function () {
	   
	var File_Name=$("#File_Name").val();
    var seqnum=$(this).index('.download_btn');
    var currentRow=$(this).closest("tr");
    var File_Name=currentRow.find("td:eq(1)").text();
   
     $('#File_Name').val(File_Name);
     $('#scr_submit').click();
     });
    
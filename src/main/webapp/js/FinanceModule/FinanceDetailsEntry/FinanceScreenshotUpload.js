$(document).ready(function() {
	$("#FinanceUploadFiles").attr('disabled', true);
});
$("#financefileUpload").change(function() {
	$('#FinanceFileList').show();
 
	$("#FinanceUploadFiles").attr('disabled', false);
 
});
 
//$("#Submit").click(function() {
function uploadScreenshots(Id){
    console.log("*****************Say Hi Screen Shot JS Page Called **************");
    // Get 'Id' from sessionStorage
    //var Id = sessionStorage.getItem('filteredId');
    console.log("The value of Function Session in the Screen shot", Id);
 
    // Create FormData object and append 'Id'
    var fd = new FormData();
    fd.append('Id', Id);
 
    // Append each selected file to FormData
    $.each($('#financefileUpload')[0].files, function(index, file) {
        fd.append('images', file);
    });
 
    $.ajax({
        url: 'FinanceScreenShotUploadServlet',
        data: fd,
        processData: false,
        contentType: false,
        type: 'POST',
        success: function(data) {
            if (data.checkFilesUpload) {
                $('#deletegrid_update').click();
                $('#FinanceFileList').hide();
                console.log("File Upload Successfully");
                //notification("success", "Finance File uploaded successfully.", "Note:");
                $("#financefileUpload").val('');
                $("#FinanceUploadFiles").attr('disabled', true);
            }
            else {
                //console.log("File Upload Failed ");
                //notification("error", "Finance Problem occurred while file uploading.", "Error:");
            }
        },
        error: function(error) {
            console.log("Error:", error);
            notification("error", "An error occurred during file upload.", "Error:");
        }
    });
//});
}
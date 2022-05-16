$("#UploadFiles").click(function(){
var fd = new FormData();    
$.each($('#fileUpload')[0].files, function(k, value)
            {
                fd.append(k, value);
            });

    $.ajax({
      url: 'legacyApplicationScreenshotsUpload',
      data: fd,
      processData: false,
      contentType: false,
      async:false,
      type: 'POST',
      success: function(data){
    	  if(data.checkFilesUpload){
    		  $('#deletegrid_update').click();    
    		  $('#FileList').hide();
    		  notification("success","File uploaded successfully.","Note:");
    		    }
    	  else
    		  notification("error","Problem occured while file uploading.","Error:");
      }
    });
});
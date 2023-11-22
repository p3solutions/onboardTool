$(document).ready(function()
{ 
    $.ajax({
        url: "Legacy_App_Scr_Retrieve_Servlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Legacy Screenshots Retrieve",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            /*var parentRow = ""*/
            appendRowFunction(data);
            },
    });
   
});
function appendRowFunction(data){
	if(!data[0]){
		 var row = "<tr>" +
    				  "<td colspan='2' style='text-align: center;'>No Attachments found.</td>" +
     			   "</tr>";
    $("#Legacy_Scr_List").append(row);
	}else{
    $.each(data, function(key, value){
        var Id = value.AppId;
        var File_Name = value.File_Name;
               
        var row = "<tr>"+
                "<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>"+Id+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:10ch;' data-bs-toggle='tooltip' data-bs-placement='top' title='"+File_Name+"'><label class='control-label ' for=''>"+File_Name+"</label>" +
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-download-alt download_btn'style='display:block; margin-left:-15px;'></span>"+
                  "</td>"+
                  "</tr>";
                  $("#Legacy_Scr_List").append(row);
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
                    return new bootstrap.Tooltip(tooltipTrigger)
                     
    });
    })
    }
}
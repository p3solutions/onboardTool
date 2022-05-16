$(document).ready(function()
{ 
    $.ajax({
        url: "IntakeAssessmentScrRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Intake Screenshot Retrieve",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            /*var parentRow = ""*/
            appendRowFunction(data);
            },
    });
   
});
function appendRowFunction(data){
    $.each(data, function(key, value){
        var Id = value.AppId;
        var File_Name = value.File_Name;
               
        var row = "<tr>"+
                "<td style='text-align:center;vertical-align: middle; display:none;'><label class='control-label' for=''>"+Id+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+File_Name+"</label>" +
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-download-alt download_btn'style='display:block;'></span><span class='glyphicon glyphicon-trash intake_scr_deletepopup' id='intake_scr_delete_icon' style='float:right;display:block;margin-top:-13px; margin-right:18px;'></span>"+
                  "</td>"+
                  "</tr>";
                  $("#Legacy_Scr_List").append(row);
    });
    
    
}
 
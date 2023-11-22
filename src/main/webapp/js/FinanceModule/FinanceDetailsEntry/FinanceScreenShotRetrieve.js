$(document).ready(function()
{ 
    $.ajax({
        url: "ScreenShotRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log(" Screenshot Retrieve",data);
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
                 "<td style='text-align:center;vertical-align: middle;white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:10ch;' data-bs-toggle='tooltip' data-bs-placement='top' title='"+File_Name+"'><label class='control-label ' for=''>"+File_Name+"</label>" +
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-download-alt download_btn'style='display:block;'></span><span class='glyphicon glyphicon-trash intake_scr_deletepopup' id='intake_scr_delete_icon' style='float:right;display:block;margin-top:-13px; margin-right:18px; margin-left:10px;'></span>"+
                  "</td>"+
                  "</tr>";
                  $("#Legacy_Scr_List").append(row);
                  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
                    return new bootstrap.Tooltip(tooltipTrigger) 
    });
    })
}
$(document).on('click', '.intake_scr_deletepopup', function () {
    $('#intake_scr_delete_popup').click();
     var File_Name=$("#File_Name").val();
    var seqnum=$(this).index('.download_btn');
    var currentRow=$(this).closest("tr");
    var File_Name=currentRow.find("td:eq(1)").text();
    $('#File_Name').val(File_Name);
   
    });
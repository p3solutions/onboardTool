$('#legacy_scr_delete_submit').click(function(){
     var File_Name=$('#File_Name').val();
        $.ajax({
            url: "Legacy_App_Scr_DeleteServlet",
            type: 'POST',
            data : {File_Name:File_Name},
            dataType: "json",
            success: function (data) {
                File_Name=data.File_Name;
        $('#deletegrid_update').click();      
            }
        });
        notification("warning","Screenshot is Deleted Successfully","Delete Screenshot");
       });
 $('#deletegrid_update').click(function() {      
        $.ajax({
        url: "Legacy_App_Scr_Retrieve_Servlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Legacy Application Screenshots",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            $('#Legacy_Scr_List').html(data);
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
                 "<td style='text-align:center;vertical-align: middle; white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:10ch;' data-bs-toggle='tooltip' data-bs-placement='top' title='"+File_Name+"'><label class='control-label ' for=''>"+File_Name+"</label>" +
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-download-alt download_btn'style='display:block; margin-left:-15px;'></span><span class='glyphicon glyphicon-trash legacy_scr_deletepopup' style='float:right;display:block;margin-top:-13px; margin-right:18px;'></span>"+
                  "</td>"+
                  "</tr>";
                  $("#Legacy_Scr_List").append(row);
                   var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
                    return new bootstrap.Tooltip(tooltipTrigger) 
    });
    })
}
$(document).ready(function()
{
    financeScreenshotRetrive();
});
function financeScreenshotRetrive(){
    $.ajax({
        url: "Finance_Scr_Retrieve_Servlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Finance Screenshots Retrieve",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            FinanceScreenShotAppendRowFunction(data);
        },
    });
}
function ajaxscrcall(Id){
    $.ajax({
        url: "Finance_Scr_Retrieve_Servlet",
        type: 'POST',
        data: {ID: Id },
        dataType: "json",
        success: function (data) {
            console.log("Finance Screenshots Retrieve",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            FinanceScreenShotAppendRowFunction(data);
        },
    });
}
function FinanceScreenShotAppendRowFunction(data){
    $.each(data, function(key, value){
        var Id = value.AppId;
        var File_Name = value.File_Name;
        var row = "<tr>"+
            "<td style='display:none;'><label class='control-label' for=''>"+Id+"</label>" +
            "</td>"+
            "<td style='white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:10ch;' data-bs-toggle='tooltip' data-bs-placement='top' title='"+File_Name+"'><label class='control-label ' for=''>"+File_Name+"</label>" +
            "</td>"+
            "<td class='text-center'><span class='fa fa-download iconColor download_btn'></span><span class='mx-4'</span><span class='fa-solid fa-trash-can text-danger legacy_scr_deletepopup' id='legacy_scr_delete_icon' " +
            "></span>"+
            "</td>"+
            "</tr>";
        $("#Legacy_Scr_List").append(row);
        var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
        var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
            return new bootstrap.Tooltip(tooltipTrigger)
        });
    })
}
$(document).on('click', '.legacy_scr_deletepopup', function () {
    $('#finance_scr_delete_popup').click();
    // var File_Name=$("#File_Name").val();
    // var seqnum=$(this).index('.download_btn');
    // var currentRow=$(this).closest("tr");
    // var File_Name=currentRow.find("td:eq(1)").text();
    // $('#File_Name').val(File_Name);

});
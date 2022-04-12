$(document).ready(function()
{
    $.ajax({
        url: "Retrieve_users_servlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Users List Retrieve",data);
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
        var uname = value.uname;
        var ufname = value.ufname;
        var ulname = value.ulname;
        var u_email = value.u_email;
        var u_role = value.u_role;
        var row = "<tr>"+
                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+uname+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+ufname+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+ulname+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+u_email+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+u_role+"</label>" +
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;'><span class='glyphicon glyphicon-pencil editpopup'style='display:block;'></span><span class='glyphicon glyphicon-trash deletepopup' style='float:right;display:block;'></span>"+
                  "</td>"+
                  "</tr>";
                  $("#Userslist").append(row);
    });
}
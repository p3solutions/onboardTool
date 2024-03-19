$(document).ready(function()
{	
    $.ajax({
        url: "Retrieve_users_servlet",
        type: 'POST',
        dataType: "json",
        beforeSend : function(){
         $('#overlay').show();
  },
        success: function(data) {
		$('#overlay').hide();
        
            console.log("Users List Retrieve",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            /*var parentRow = ""*/
            appendRowFunction(data);
            },
    });
    
});
function appendRowFunction(data) {
    $.each(data, function(key, value) {
        var uname = value.uname || '';
        var ufname = value.ufname || '';
        var ulname = value.ulname || '';
        var u_email = value.u_email || '';
        var u_role = value.u_role || '';
        var random_id = value.random_id || '';

        var row = "<tr>" +
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>" + uname + "</label>" +
            "</td>" +
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>" + ufname + "</label>" +
            "</td>" +
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>" + ulname + "</label>" +
            "</td>" +
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>" + u_email + "</label>" +
            "</td>" +
            "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>" + u_role + "</label>" +
            "</td>" +
            "<td style='text-align:center;vertical-align: middle;display:none;'><label class='control-label ' for=''>" + random_id + "</label>" +
            "</td>" +
            "<td class='useraction' style='text-align:center;vertical-align: middle;display:none;'><span class='glyphicon glyphicon-pencil editpopup'id='editpopup" + random_id + "'style='display:block;margin-left:-22px;'></span><span class='glyphicon glyphicon-trash deletepopup' style='float:right;display:block;margin-top:-13px;'></span>" +
            "</td>" +
            "</tr>";

        $("#AdminUserslist").append(row);
    });

    usertablehide();
    getPagination('#admin_userslist');
}

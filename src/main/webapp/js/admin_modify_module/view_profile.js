$(document).ready(function()
{	
		var user_Name=$("#user_Name").val();

    $.ajax({
        url: "View_Profile_servlet",
        type: 'POST',
        dataType: "json",
        data : {user_Name:user_Name},
        beforeSend : function(){
         $('#overlay').show();
  },
        success: function(data) {
		$('#overlay').hide();
        
            console.log("View Profile",data);
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
        var random_id = value.random_id;
        var uname_label ="<label class='control-label' for=''style='font-weight:400;'>"+uname+"</label>";
        var ufname_label ="<label class='control-label' for=''style='font-weight:400;'>"+ufname+"</label>";
        var ulname_label ="<label class='control-label' for=''style='font-weight:400;'>"+ulname+"</label>";
        var u_email_label ="<label class='control-label' for=''style='font-weight:400;'>"+u_email+"</label>";
        var u_role_label ="<label class='control-label' for=''style='font-weight:400;'>"+u_role+"</label>";
        $("#user_Name").val(uname);
        $("#uname").append(uname_label);
                    $("#ufname").append(ufname_label);
                    $("#ulname").append(ulname_label);
                    $("#u_email").append(u_email_label);
                  $("#u_role").append(u_role_label);
                 usertablehide();
                 getPagination('#admin_userslist');
    });
}
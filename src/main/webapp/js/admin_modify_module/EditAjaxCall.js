$('#update_submit').click(function(){
        var seq_num=$('#random_id_modify').val();
        var uname=$("#uname_modify").val();
        var ufname=$("#ufname_modify").val();
        var ulname=$("#ulname_modify").val();
        var u_email=$("#u_email_modify").val();
        var u_role=$("#u_role_modify").val();
        $.ajax({
            url: "Update_users_servlet",
            type: 'POST',
            data : {random_id_modify:seq_num,uname_modify:uname,ufname_modify:ufname,ulname_modify:ulname,u_email_modify:u_email,u_role_modify:u_role},
            dataType: "json",
            success: function (data) {
                var seq_num=data.random_id;
                var uname=data.uname;
                var ufname=data.ufname;
                var ulname=data.ulname;
                var u_email=data.u_email;
                var u_role=data.u_role;
                
            }
        });
        notification("success","User Details Updated Successfully.","User Update");
  window.setTimeout(function(){location.reload()},1500)
 });	
      
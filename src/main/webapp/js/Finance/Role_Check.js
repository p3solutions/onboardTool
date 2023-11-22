function userHide()
{
    var user_Name=$("#user_Name").val();
    var auth_Type=$("#auth_type").val();
    console.log("Auth Type",$("#auth_type").val());
    $.ajax({
        url: "Retrieve_pwd_servlet",
        type: 'POST',
        dataType: "json",
        data : {user_Name:user_Name},
        success: function (data) {
            console.log("Users List Retrieve",data);
            if(data.User_Role=="D3SIXTY_SUPER_ADMIN")
            {
                $(".useraction").show();
                $("#add_user_btn").show();
                $("#update_license_btn").show();
                $(".useractionheader").show();
                $(".main-page").show();


            }
            else{
                $(".main-page").hide();
                $("#userBlocked").show();
            }
        },

    });
}




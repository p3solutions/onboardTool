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
            if(data.User_Role=="D3SIXTY_FINANCE_CONTRIBUTOR"|| data.User_Role=="D3SIXTY_SUPER_ADMIN" || data.User_Role =="D3SIXTY_FINANCE")
            {
                $("#Allowed").show();
                $("#userBlocked").hide();

            }
            else{
                $("#Allowed").hide();
                $("#userBlocked").show();
            }
        },

    });
}




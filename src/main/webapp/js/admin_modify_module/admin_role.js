function usertablehide()
{
	var user_Name=$("#user_Name").val();
	var auth_Type=$("#auth_type").val();
	console.log("Auth Type",$("#auth_type").val());
	if(auth_type=="SSO")
	{
		alert("Well");
	}
    $.ajax({
        url: "Retrieve_pwd_servlet",
        type: 'POST',
        dataType: "json",
        data : {user_Name:user_Name},
        success: function (data) {
            console.log("Users List Retrieve",data);
    		if(data.User_Role=="DECOM_SUPER_ADMIN")
    		{
			 $(".useraction").show();
			 $("#add_btn").show();
			 $("#update_license_btn").show();
			 $(".useractionheader").show();
			 
			}       
            },
   
    });
    
  
    }



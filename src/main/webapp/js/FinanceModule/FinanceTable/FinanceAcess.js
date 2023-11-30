function AddAndEdit()
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
            console.log("Role Retrieve",data);
    		if(data.User_Role=="D3SIXTY_FINANCE_CONTRIBUTOR")
    		{
			 $(".useraction").show();
			 $("#add_user_btn").show();
			
			 $(".useractionheader").show();
			 
			}       
            },
   
    });
    
  
    }

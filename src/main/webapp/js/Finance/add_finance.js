$('#add_financesubmit').click(function(){
        
       var Project_Number=value.$("#ProjectNumber_modify").val
	   var Application_Name=value.$("ApplicationName_modify").val;
	   var Software_and_Licensing=value.$("Software_and_Licensing_modify").val;
	   var Contract_possibly_terms_of_contract =$("Contract_Date_Modify").val;
	   var scope_of_infrastructure =value.$("Scope_modify").val;
	   var Cost_Avoidance=value.$("AvoidanceCost_modify").val;
	   var Cost_of_Archive=value.$("ArchiveCost_modify").val;
	   var CBA=value.$("CBA_modify").val;
	   var  add attachments=value.$("")
	   var Funding_approved=value.$("Approval_modify").val;
       var Funding_type=value.$("Type_modify").val;


        if(Project_Number=="")
        {
		notification("error","Please Enter Project_Number","Note");
		}
		 if(Application_Name=="")
        {
		notification("error","Please Enter Application_Name","Note");
		}
		 if(Software_and_Licensing=="")
        {
		notification("error","Please Enter details of Software_and_Licensing","Note");
		}
		if(Contract_possibly_terms_of_contract=="")
		{
		notification("error","Please Enter contract details","Note");
		
		}
		if(scope_of_infrastructure=="")
		{
		notification("error","Please Enter the infrastructure details","Note");
		
		}
		if(Cost_Avoidance=="")
		{
		notification("error","Please Enter the avoidance cost details","Note");
		
		}				
        if(Cost_of_Archive=="")
		{
		notification("error","Please Enter the archive cost details","Note");
		
		}		
        
		if(CBA=="")
        {
		notification("error","Please Enter CBA","Note");
		} 
		 if(u_role=="")
         {
		 notification("error","Please Select a User Role","Note");
		 }
        if(u_pwd!=conf_u_pwd)
        {
		notification("error","Password and Confirm Password Does not Match","Note");
		}
        if(u_pwd==conf_u_pwd&&IsEmail(u_email)==true&&u_role!="")
        {
        $.ajax({
            url: "Add_users_servlet",
            type: 'POST',
            data : {uname:uname,ufname:ufname,ulname:ulname,u_email:u_email,u_pwd:u_pwd,u_role:u_role},
            dataType: "json",
            success: function (data) {
			if($("#u_pwd").val().length<8 && $('#conf_u_pwd').val().length<8)
			{
				notification("error","Password and Confirm Password Contains atleast 8 Characters","Note");
			}
			 if(data.uemailduplicate=="Yes" && data.unameduplicate=="Yes")
            {
			 uflag=false;	
			 notification("error","Username & E-Mail Already Exists","Note");
			}
          	if(data.uemailduplicate=="Yes" && uflag)
            {
			notification("error","E-Mail Already Exists","Note");
	 		}
	 		if(data.unameduplicate=="Yes" && uflag)
            {
	 		notification("error","Username Already Exists","Note");
	 		}
	 		if(data.flag=="Success")
            {
	 		notification("success","User is Added Successfully.","Note");
	 		window.setTimeout(function(){location.reload()},1500)
	 		}
                console.log("Data",data);
                
        } 
           
        });
        }
        function IsEmail(u_email) {
  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
  if(!regex.test(u_email)) {
    return false;
  }else{
    return true;
  }
}
       });
        

       
       
        $(document).on('click', '.editpopup', function () {
    $('#editpopup_btn').click();
    var seqnum=$(this).index('.editpopup');
    var currentRow=$(this).closest("tr");
    var uname_modify=currentRow.find("td:eq(0)").text();
    var ufname_modify=currentRow.find("td:eq(1)").text();
    var ulname_modify=currentRow.find("td:eq(2)").text();
    var u_email_modify=currentRow.find("td:eq(3)").text();
    var u_role_modify=currentRow.find("td:eq(4)").text();
    var random_id_modify=currentRow.find("td:eq(5)").text();
    
    
     $('#uname_modify').val(uname_modify);
     $('#ufname_modify').val(ufname_modify);
     $('#ulname_modify').val(ulname_modify);
     $('#u_email_modify').val(u_email_modify);
     $('#u_role_modify').val(u_role_modify);
     $('#random_id_modify').val(random_id_modify);
     
    $('#EditPopUp').on('shown.bs.modal', function () {
    });
    });
    $(document).on('click', '.deletepopup', function () {
    $('#deletepopup_btn').click();
    var seq_num=$(this).index('.deletepopup');
    var currentRow=$(this).closest("tr");
    var random_id=currentRow.find("td:eq(5)").text();
    $('#random_id').val(random_id);
    $('#DeletePopUp').on('shown.bs.modal', function () {
    });
    });
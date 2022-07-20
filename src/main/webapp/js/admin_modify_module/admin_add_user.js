$('#add_usersubmit').click(function(){
        var uname=$("#uname").val();
        var ufname=$("#ufname").val();
        var ulname=$('#ulname').val();
        var u_email=$('#u_email').val();
        var u_pwd=$('#u_pwd').val();
        var u_role=$('#u_role').val();
        $.ajax({
            url: "Add_users_servlet",
            type: 'POST',
            data : {uname:uname,ufname:ufname,ulname:ulname,u_email:u_email,u_pwd:u_pwd,u_role:u_role},
            dataType: "json",
            success: function (data) {
                var uname=data.uname;
                var ufname=data.ufname;
                var ulname=data.ulname;
                var u_email=data.u_email;
                var u_pwd=data.u_pwd;
                var u_role=data.u_role;
                
                
        } 
           
        });
       notification("success","User is Added Successfully.","Note");
       window.setTimeout(function(){location.reload()},1500) });
       
       
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
$('#delete_submit').click(function(){
        var random_id=$('#random_id').val();
        $.ajax({
            url: "Delete_users_servlet",
            type: 'POST',
            data : {random_id:random_id},
            dataType: "json",
            success: function (data) {
                var random_id=data.random_id;
                
            }
        });
        notification("error","User is Deleted Successfully","Delete User");
        window.setTimeout(function(){location.reload()},1500)});
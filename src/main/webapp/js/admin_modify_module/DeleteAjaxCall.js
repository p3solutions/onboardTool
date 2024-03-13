$('#delete_submit').click(function(){
        var random_id=$('#random_id').val();
        $.ajax({
            url: "Delete_users_servlet",
            type: 'POST',
            data : {random_id:random_id},
            dataType: "json",
            success: function (data) {
                var random_id=data.random_id;
                console.log(data);
                if (data[0] === "deleted"){
                    notification("warning","User is Deleted Successfully","Delete User");
                    window.setTimeout(function(){location.reload()},220)
                }
                else{
                    notification("warning","User not Deleted","Delete User");
                }
            }
        });
    });
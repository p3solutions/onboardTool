$('#delete_submit').click(function(){
        var Id=$('#Id').val();
        $.ajax({
            url: "TableDetailDeleteServlet",
            type: 'POST',
            data : {Id:Id},
            dataType: "json",
            success: function (data) {
                var Id=data.Id;
                
            }
        });
        notification("warning","Details is Deleted Successfully","Delete User");
        window.setTimeout(function(){location.reload()},220)});
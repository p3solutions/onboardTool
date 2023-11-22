$('#delete_submit').click(function(){
    var random_id=$('#random_id').val();
    console.log("Ajax");
    console.log(random_id);
    $.ajax({
        url: "Finance_List_Delete_Servlet",
        type: 'POST',
        data : {random_id:random_id},
        dataType: "json",
        success: function (data) {

        }
    });
    notification("warning","Finance row is Deleted Successfully","Delete Finance");
    window.setTimeout(function(){location.reload()},220)
});
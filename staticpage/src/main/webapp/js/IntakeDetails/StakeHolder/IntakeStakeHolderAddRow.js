$("#AddStakeUserBtn").click(function()
{
	AddRowAjaxCall();
});
function AddRowAjaxCall()
{
	$.ajax({
        url: "IntakeStakeHolderAddRowServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
        console.log("data add row---->",data);
        if(data.checkAdd)
        {
        	 var Row =  "<tr class='UserRow'>"+
	                    "<td><input type='text' class ='name' value='' ></td>"+
			            "<td><input type='text' class ='emailid' value='' ></td>"+
                        "<td><input type='text' class='username' value='' ></td>"+
			            "<td><input type='text'class='role' value='' ></td>"+
                        "<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                        "<ul class='dropdown-menu'>"+
                        "<li><a   class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                        "<li><a   class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                        "</ul>"+
                        "</div>"+
                        "</td>"+
			            "</tr>";
             $("#UserList").append(Row);
             notification("success","Row added Successfully.","Note");
        }
        else if(!data.checkAdd)
        {
        	notification("error","Row is not added.","Error");
        	
        }
        
        },
        error: function (e) {
            console.log(e);
        }

    });
}
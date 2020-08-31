$(document).ready(function(){
	StakeHolderDataRetrieveAjaxCall();
	$(document).on('click', '.DeleteRow', function () {
	    var seqnum=$(this).index('.DeleteRow');
	    $("#Sequence").val(seqnum);
       $("#deletepopup_btn").click();	    
	});
	$(document).on('click', '.EditRow', function () {
	    var seqnum=$(this).index('.EditRow');
	    var ReadOnly = $('.name').eq(seqnum).is('[readonly]');
	    if(ReadOnly){
	    	ReadOnlyPropertyConfig(seqnum,false);
	    	notification("info","Selected row is editable.","Info");
	    }
	    else{
	    	ReadOnlyPropertyConfig(seqnum,true);
	    	notification("info","Selected row is non editable","Info");
	    }
	    });
	$(document).on('click', '#DeleteSubmit', function () {
		var DeleteSeqNum =  $("#Sequence").val();
		DeleteRowAjaxCall(DeleteSeqNum);
	});
      });
function StakeHolderDataRetrieveAjaxCall()
{
	$.ajax({
        url: "IntakeStakeHolderDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve Stake Holder json array----->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            var index=0;
            var checkData = false;
            $.each(data, function(key, value){
               if(index==0)
            	{
            	   checkData = value.checkExistence;
            	}
               else if(checkData&&index!=0)
            	{
            	   var name =(value.name == undefined)?"":value.name;
            	   var emailid =(value.emailId==undefined)?"":value.emailId;
            	   var username =(value.username==undefined)?"":value.username;
            	   var role = (value.role==undefined)?"":value.role;
            	   var readonly ="readonly";
            	   
            	   if(role==undefined||role == "" && emailid==undefined || emailid=="" && username == undefined || username =="" && name =="" ||name == undefined)
            		   readonly ="";
            	   
            	  var Row = "<tr class='UserRow'>"+
        		            "<td><input type='text' class ='name' value='"+name+"' "+readonly+"></td>"+
        				    "<td><input type='text' class ='emailid' value='"+emailid+"' "+readonly+"></td>"+
        	                "<td><input type='text' class='username' value='"+username+"' "+readonly+"></td>"+
        				    "<td><input type='text'class='role' value='"+role+"' "+readonly+"></td>"+
                            "<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>"+
                            "<ul class='dropdown-menu'>"+
                            "<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black'>&nbsp;&nbsp;&nbsp;Edit</a></li>"+
                            "<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black'>&nbsp;&nbsp;&nbsp;Delete</a></li>"+
                            "</ul>"+
                            "</div>"+
                            "</td>"+
      					    "</tr>";
            	  $("#UserList").append(Row);
            	}
            	index++;
            });
            if(!checkData)
            {
            	notification("info","No user data found, please click add button to add row.","Info");
            
            }
        },
        error: function (e) {
            console.log(e);
        }

    });
	
}
function ReadOnlyPropertyConfig(index,prop)
{
	var fieldClass =['name','emailid','username','role'];
	for(var i=0;i<fieldClass.length;i++)
	{
		$("."+fieldClass[i]).eq(index).attr('Readonly','');
		$("."+fieldClass[i]).eq(index).attr('Readonly',prop);
	}
	
	if(prop==false)
	$(".name").eq(index).focus();
}
function DeleteRowAjaxCall(DeleteSeqNum)
{
	$.ajax({
        url: "IntakeStakeHolderDeleteRowServlet",
        type: 'POST',
        async: false,
        data : {DeleteSeqNum:DeleteSeqNum},
        dataType: "json",
        success: function (data) {
            console.log("delete row --> ",data);
            if(data.checkExistence)
           {
            $(".UserRow").eq(DeleteSeqNum).remove();
            notification("success","Row deleted successfully.","Note");
              
           }
            else
            notification("error","Delete failed.","Error");
            $("#DeleteClose").click();
            $("#Sequence").val("");
        },
        error: function (e) {
            console.log(e);
        }

    });
	return false;
}
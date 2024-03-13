var currentUrl = window.location.href;
var url = new URL(currentUrl);
var a_Id = url.searchParams.get("a_id");
var directuser="";
var directUsername="";
var seq_num = "";
var currentArchiveReqApproval = "";
var username="";
$('#ApprovalSave').click(function(){
    seq_num = "";
    currentArchiveReqApproval = "";
    username="";
     seq_num = parseInt($(".CurrentRole").eq(0).val());
     //seq_num = parseInt($('.CurrentRole').length);
     currentArchiveReqApproval = $(".archiveRequirementApproval").eq(seq_num-1).val();
    username =$(".UserName").eq(seq_num-1).html();
    var checkOverAllAapproval = true;
    for(var i =0;i<$(".archiveRequirementApproval").length;i++)
    {
       var val = $(".archiveRequirementApproval").eq(i).val();
       if(val!="Approved")
           checkOverAllAapproval = false;
    }
    if(checkOverAllAapproval==true)
    {
        $("#archiveReqConfirmationPopUp_Btn").click();  
    }
    else
    {
        var checkStatus = ApprovalSaveAjaxCall(seq_num,currentArchiveReqApproval);
        if(checkStatus.statusFlag==true)
        {
            archiveReqApprovalMessage(currentArchiveReqApproval,username);
                   isDirectApprove();
                    emailAjaxCall("ARCHIVE_REQUIREMENTS");
        }       
        else if(checkStatus.statusFlag==false)
        {
            notification("error","Problem has occuured while saving.","Error");
        }
    }
});
function archiveReqApprovalMessage(archiveReqApproval,username)
{
    switch(archiveReqApproval)
    {
    case "Approved":
        notification("info",username+" has approved.","Status");
        break;
    case "Rejected":
        notification("error",username+" has Rejected.","Status");
            break;
    case "Decision pending":
          notification("warning",username+" is yet to decide.","Status");
          break;
    }
    notification("success","Saved successfully.","Status");
}
function ApprovalSaveAjaxCall(seq_num,approvalStatus)
{
    var json =[];
    $.ajax({
        url: "archiveReqApprovalSaveServlet",
        type: 'POST',
        async: false,
        data : {a_Id:a_Id,SeqNum:seq_num,approvalStatus:approvalStatus},
        dataType: "json",
        success: function (data) {
        console.log("data save  -->",data);
        json = data;
        },
        error: function (e) {
            console.log(e);
        }
    });
  return json;
}
$("#archiveReqConfirmationYes").click(function()
        {
           /* getUserDetailAjaxCall();*/
                   isDirectApprove();
            /*if(directuser!=directUsername){
                seq_num=seq_num+1;
                directuser="";
                directUsername="";
                }*/
             var checkStatus =ApprovalSaveAjaxCall(seq_num,currentArchiveReqApproval);
            if(checkStatus.statusFlag==true)
            {
                archiveReqApprovalMessage(currentArchiveReqApproval,username);
                notification("info","All the users approved.","");
                setTimeout(function(){ 
                    location.href="ArchiveDecommPage.jsp"; 
                    }, 1000);
            }
            else if(checkStatus.statusFlag==false)
            {
                notification("error","Problem has occurred while saving.","Error");
            }
             $("#archiveReqConfirmationClose").click(); 
        });
$("#archiveReqConfirmationNo").click(function()
                {
                     $("#archiveReqConfirmationClose").click(); 
                     notification("error","Approval canceled.","");
                }); 

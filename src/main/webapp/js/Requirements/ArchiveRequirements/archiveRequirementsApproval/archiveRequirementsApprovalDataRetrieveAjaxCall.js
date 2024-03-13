var currentUrl = window.location.href;
var url = new URL(currentUrl);
var a_Id = url.searchParams.get("a_id");
var currentUserDecision = "";
var directApprove=false;
var directApprovId="";
var directApprovName="";
var directApprovPriority="";
$(document).ready(function(){
    archiveRequirementApprovalDataRetrieveAjaxCall();
    $(document).on('change', '.approval', function () {
        var name =  $(this).attr('name');
        var value = $("input[name='"+name+"']:checked").val();
        if(value == "yes")
            {
            var index=$(this).index('.yes');
            $('.archiveRequirementApproval').eq(index).val('Approved'); 
            }else if(value=="no")
            {
            var index=$(this).index('.no');
            $('.archiveRequirementApproval').eq(index).val('Rejected');
            }
            else if(value =="neutral")
            {
            var index=$(this).index('.neutral');
            $('.archiveRequirementApproval').eq(index).val('Decision pending');
            }
    });
    $(document).on('change', '.archiveRequirementApproval', function () {
        var value = $(this).val();
        var index=$(this).index('.archiveRequirementApproval');
        if(value == "Approved")
            {
            var name =  $('.yes').eq(index).prop('checked',true);
            }else if(value=="Rejected")
            {
            $('.no').eq(index).prop('checked',true);
            }
            else if(value =="Decision pending")
            {
            $('.neutral').eq(index).prop('checked',true);
            }
    });
      });
function archiveRequirementApprovalDataRetrieveAjaxCall()
{
    $.ajax({
        url: "archiveReqApprovalDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        data: {aproverId: a_Id,isApprover:"true"},
        success: function (data) {
            console.log("Data Retrieve Stake Holder json array----->",data);
            console.log("Data Retrieve for User----->",data[0].user);
            if (!$.isArray(data)) {
                data = [data];
            }
            var index=0;
            var checkData = false;
            var CurrentRole;
            $.each(data, function(key, value){
               if(index==0)
                {
                   $("#ApprovalDetails").html("");
                   CurrentRole = value.role;
                }
               else if(index!=0)
                {
                   var name =(value.name == undefined)?"":value.name;
                   var username =(value.username == undefined)?"":value.username;
                   var user =(data[0].user == undefined)?"":data[0].user;
                   //var emailid =(value.emailId==undefined)?"":value.emailId;
                   //var username =(value.username==undefined)?"":value.name;
                   var role = (value.role==undefined)?"":value.role;
                   var archiveRequirementApproval = value.approvalStatus;
                   var approvalId = value.approvalId;
                   var priorityNo = value.priority_order_num;
                  // var oppId = value.oppId;
                   //var app_name = value.app_name;
                   
                   var checkToggleApprove = "";
                   var checkToggleNotApprove = "";
                   var checkToggleNotYet = "";
                   var ApprovedStatus = "";
                   var RejectedStatus = "";
                   var YettoDecideStatus = "";
                   console.log(typeof(value.priority_order_num));
                   switch(archiveRequirementApproval)
                   {
                      case "Approved":
                            checkToggleApprove="checked";
                            ApprovedStatus = "selected";
                            break;
                      case "Rejected":
                            checkToggleNotApprove = "checked";
                            RejectedStatus = "selected";
                            break;
                      case "Decision pending":
                           checkToggleNotYet = "checked";
                           YettoDecideStatus ="selected";
                           break;
                   }
                   var CurrentRoleClass="";
                   var checkDisable = "disabled";
                   var toolTip ="";
                   if(a_Id == approvalId ||user==username)
                   {
                       if(a_Id!=approvalId){
                         directApprove=true;
                         directApprovId=approvalId;
                         directApprovName=username;
                         directApprovPriority=priorityNo;
                         }
                     checkDisable = "";
                     CurrentRoleClass="CurrentRole";
                     currentUserDecision = archiveRequirementApproval;
                     toolTip ="data-toggle='tooltip' data-placement='right' title='Suggested Role'";
                   }
                   var approvalStatus = (value.approvalStatus==undefined)?"":value.approvalStatus;
                   var readonly ="readonly";
                   if(role==undefined||role == "" && name =="" ||name == undefined)
                       readonly ="";
                  var Row = "<tr class='"+CurrentRoleClass+"Class' "+toolTip+">"+
                            "<td class='UserName' >"+name+"</td>"+
                            "<td>"+role+"</td>"+
                            "<td>"+
                            "<select class='archiveRequirementApproval form-select'"+checkDisable+">"+
                            "<option value='Approved'"+ApprovedStatus+">Approved</option>"+
                            "<option value='Rejected'"+RejectedStatus+">Rejected</option>"+
                            "<option value='Decision pending'"+YettoDecideStatus+">Decision pending.</option>"+
                            "</select>" +
                            "<input type='hidden' class='"+CurrentRoleClass+"' value='"+index+"'/>"+
                            "</td>"+
                            "<td>"+
                            "<div class='wrapper'>"+
                            "<label class='btn_container'>"+
                            "<input type='radio' class='yes approval' name='radio"+index+"' ng-model='$scope.teste' value='yes' "+checkDisable+" "+checkToggleApprove+">"+
                            "<div class='checkmark'><i class='ion-checkmark-round'></i></div>"+
                            "</label>"+
                            "<label class='btn_container' >"+
                            "<input type='radio' class='neutral approval' name='radio"+index+"' model='$scope.teste' value='neutral' "+checkDisable+" "+checkToggleNotYet+">"+
                            "<div class='checkmark'><i class='ion-record'></i></div>"+
                            "</label>"+
                            "<label class='btn_container'>"+
                            "<input type='radio' class='no approval' name='radio"+index+"' ng-model='$scope.teste' value='no' "+checkDisable+" "+checkToggleNotApprove+">"+
                            "<div class='checkmark'><i class='ion-close-round'></i></div>"+
                            "</label>"+
                            "</div>"+
                            "</td>"+
                            "</tr>";
                             var priority = value.priority_order_num;
if(value.priority_order_num!=undefined && value.priority_order_num!="") 
{   
              $("#ApprovalDetails").append(Row);
}
                }
                index++;
            });
            if(!checkData)
            {
                //notification("info","No user data found, please click add button to add row.","Info");
            }
            var checkHighLight  = true;
          $('.CurrentRoleClass').effect("highlight", {color:"#ADD8E6"},2000);
              $('.CurrentRoleClass').tooltip();
            $(".CurrentRoleClass").mouseenter();
          //$(".CurrentRoleClass").css("background-color", "grey");
        },
        error: function (e) {
            console.log(e);
        }
    });
}
function isDirectApprove(){
if( directApprove==true){
    approvefrombackend(directApprovId,directApprovName,directApprovPriority)
    directApprove=false;
    directApprovId="";
    directApprovName="";
    directApprovPriority="";
}
}
function approvefrombackend(approvalId,username,priorityNo)
{
    $.ajax({
        url: "archiveReqDirectApprovalDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        data: {aproverId: approvalId,username:username,priorityNo:priorityNo,type:"ArchiveReq"},
        success: function (data) {
            console.log("Data Dirsct----->",data);
       }
       });
       }
       
      
    
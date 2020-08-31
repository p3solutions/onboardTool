function editRecord(){
    var f=document.form;
    f.method="post";
    f.action='Intake_NewApplication.jsp';
    f.submit();
}
function edit(id){
    var f=document.form;
    f.method="post";
    f.action='Intake_Business.jsp?appname='+id;
    f.submit();
}
function decomm_intake_edit(id){
    var projectnamesplit=$("#sitetitle1").text();
    var projectname=projectnamesplit.split("-");
    var f=document.form;
    f.method="post";
    f.action='AppDecommInfo.jsp?appname='+id+'&projectname='+projectname[1];
    f.submit();
}
function decomm_manage_edit(id){
    var projectnamesplit=$("#sitetitle1").text();
    var projectname=projectnamesplit.split("-");
    var f=document.form;
    f.method="post";
    f.action='DecommManageExecutionInfoServlet?appname='+id+'&projectname='+projectname[1];
    f.submit();
}

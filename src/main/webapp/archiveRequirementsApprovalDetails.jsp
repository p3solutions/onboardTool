<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>D3Sixty - Intake</title>

<!-- ========== MODERNIZR ========== -->
<script src="js/common/email/emailAjaxCall.js"></script>

<script src="js/jquery/jquery-2.2.4.min.js"></script>

<!--  ========== Three Toggle ========= -->
<%--<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/1.5.2/css/ionicons.min.css" />--%>
<%--<link href='https://fonts.googleapis.com/css?family=Indie+Flower' rel='stylesheet' type='text/css'>--%>
<link rel="stylesheet" href="css/toggleSwitch/toggleSwitch.css">

</head>
<body>

        
         <%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Grid JSP PAGE-----[INFO]"); %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="onboard.DBconnection"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.owasp.encoder.Encode" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
DBconnection dBconnection = new DBconnection();



if (session.getAttribute("username")==null)
{
	HttpSession details=request.getSession();
	session.setAttribute("pageUrl",request.getRequestURL().toString()+"?"+ request.getQueryString());
    response.sendRedirect("Login.jsp");
}
else{
String name=(String)session.getAttribute("ID");
HttpSession details=request.getSession();
Connection con = null;
session.setAttribute("theName", name);
String roles=(String)details.getAttribute("role");
String OpportunityName = (String)details.getAttribute("SelectedOpportunity");
String s=OpportunityName;
System.out.println("Welcome"+OpportunityName);

int sumcount=0;
Statement st,st2;
try{

con=dBconnection.getConnection();
Statement st1;

%>

    <%@include file="Nav-Bar.jspf"%>

            <div class="row m-0">
                <div class="col p-0">
                    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
                        <ol class="breadcrumb px-4 m-0 ">
                            <li class="breadcrumb-item inactive my-3 text-light "><a href="DashBoard.jsp"
                                                                                     class="text-decoration-none breadcrumbtextinactive">Home</a></li>
<%--                            <li class="breadcrumb-item inactive my-3 text-light "><a href="OpportunityGrid.jsp"--%>
<%--                                                                                     class="text-decoration-none breadcrumbtextinactive"><%=Encode.forHtml(OpportunityName)%></a></li>--%>
                            <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveDecommPage.jsp"
                                                                                     class="text-decoration-none breadcrumbtextinactive">Requirements</a></li>
<%--                            <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveRequirementsIntroDetails.jsp"--%>
<%--                                                                                     class="text-decoration-none breadcrumbtextinactive">Introduction</a></li>--%>
<%--                            <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsLegacyDetails.jsp"--%>
<%--                                                                                     class="text-decoration-none breadcrumbtextinactive">Legacy Application Info</a></li>--%>
<%--                            <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsRetentionDetails.jsp"--%>
<%--                                                                                     class="text-decoration-none breadcrumbtextinactive">Retention Details</a></li>--%>
<%--                            <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveBusinessRequirements.jsp"--%>
<%--                                                                                     class="text-decoration-none breadcrumbtextinactive">Business Requirements</a></li>--%>
<%--                            <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveReqAbbrevation.jsp"--%>
<%--                                                                                     class="text-decoration-none breadcrumbtextinactive">Abbreviations</a></li>--%>
<%--                            <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsDocumentRevisions.jsp"--%>
<%--                                                                                     class="text-decoration-none breadcrumbtextinactive">Revisions</a></li>--%>
<%--                            <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsAddendum.jsp"--%>
<%--                                                                                     class="text-decoration-none breadcrumbtextinactive">Addendum</a></li>--%>
                            <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsReviewDetails.jsp"
                                                                                     class="text-decoration-none breadcrumbtextinactive">Review</a></li>
                            <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Approval</li>
                        </ol>
                    </nav>
                </div></div></div>



    <%
}
catch(Exception e){
e.printStackTrace();
}



} %>

    <div class="container-fluid m-0 my-5 px-4">
        <div class="card">
            <div class="card-header Card-Header" id="cd-header">
                Archive Requirement Approval
            </div>
            <div class="card-body mx-4" >
            </div>
            <div class="table-responsive mx-2">
                <table class="table table-bordered caption-top">
                    <caption class="text-dark">Approver List</caption>
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Approver Name</th>
                        <th scope="col">Approver Role</th>
                        <th scope="col">Approval</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody id="ApprovalDetails" class="text-center align-middle">

                    </tbody>
                </table>
                <!-- button section -->
                <div class="row my-3 mx-1">
                    <div class="col-12  d-flex justify-content-center ">
                        <button type="button" class="btn buttonFrame tertiaryButton text-center mx-2" onclick="location.href='archiveRequirementsReviewDetails.jsp';">Prev</button>
                        <button type="button" class="btn primaryButton text-center" id="ApprovalSave">Finish</button>
<%--                        hidden button--%>
                        <button type="button" class="btn btn-primary pull-right" id="archiveReqConfirmationPopUp_Btn" data-bs-toggle="modal" data-bs-target="#ConfirmationPopUp" style="display: none;">Confirmation PopUp</button>
                       <!-- comment popup button -->
                        <button type="button" id="ApprovalComments" data-bs-toggle="modal" data-bs-target="#ApprovalCommentsPopUp" style="display: none;">Comments PopUp</button>
                    </div>
                </div>
            </div>
        </div>






    <!-- Confirmation Pop Up  -->
  <div class="modal fade" id="ConfirmationPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header modal-font-label">
        <h5 class="modal-title" id="exampleModalLabel">Confirmation for Approval</h5>
        <button type="button" id ="archiveReqConfirmationClose"  class="btn-close" data-bs-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">By Approving this opportunity overall approval for Archive Requirement module will be confirmed as approved.</p><br/><p style="font-size:20px;"> Do you want to allow this?</p>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn buttonFrame tertiaryButton text-center" id="archiveReqConfirmationNo" data-bs-dismiss="modal">No</button>
          <button type="button" id="archiveReqConfirmationYes" class="btn primaryButton text-center" data-bs-dismiss="modal">Yes</button>
      </div>
    </div>
  </div>
</div>


<!-- Comment Pop Up -->
	<div class="modal fade" id="ApprovalCommentsPopUp"  tabindex="-1" role="dialog">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      
      <div class="modal-header modal-font-label">
			<h5 class="modal-title" id="exampleModalLabel">Remarks</h5>
			<button type="button" class="btn-close" id ="ApprovalCommentClose" data-bs-dismiss="modal"
				aria-label="Close"></button>
		</div>
      <div class="modal-body">
                <div class="modal-body">
                <label>comments</label>
             <textarea id="ApprovalCommentId" name="ApprovalCommentSection" rows="4" cols="70"></textarea>
			 </div>
             <input type="hidden" id="ApprovalCommentSeq"/>
        </div>
        <div class="modal-footer">
        <button type="button" class="btn buttonFrame tertiaryButton text-center" id = "ApprovalCommentCancelBtn" >Cancel</button>
            <button type="button" class="btn primaryButton text-center" id = "ApprovalCommentOKBtn" >Ok</button>
      </div>
      </div>
    </div>
  </div>  
    <!-- Date picker --> 
    
       <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"  
         rel = "stylesheet"><!-- newly added code by parthiban -->
         
         <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.js"></script>
         <script src = "https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.3/angular.js"></script>
          <script src = "https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.3/angular-animate.js"></script>
         
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
      <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
       <script src="js/toastr/toastr.min.js"></script>
        <script src="js/notification/notification.js"></script>
         
      
      <script>
      var app = angular.module("btn", []);

      app.controller("MainCtrl", function($scope) {
          

        
      });

      </script>
    <!-- Active Icon Color changes  -->
<script>
$(document).on('mouseenter','.active1', function(){
		
		 $('.activeIcon').css('color','#1565c0');
		 
	 });
	 
	 $(document).on('mouseleave','.active1', function(){
			
		 $('.activeIcon').css('color','#fff');
		 
	 });
</script>
    </body>
    <%@include file="Footer.jspf"%>
    <!-- ========== COMMON JS FILES ========== -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/jquery-ui/jquery-ui.min.js"></script>
    <script src="js/bootstrap/bootstrap.min.js"></script>
    <script src="js/pace/pace.min.js"></script>
    <script src="js/lobipanel/lobipanel.min.js"></script>
    <script src="js/iscroll/iscroll.js"></script>
    <!-- ========== PAGE JS FILES ========== -->
    <script src="js/prism/prism.js"></script>
    <script src="js/waypoint/waypoints.min.js"></script>
    <script src="js/counterUp/jquery.counterup.min.js"></script>
    <script src="js/amcharts/amcharts.js"></script>
    <script src="js/amcharts/serial.js"></script>
    <script src="js/amcharts/plugins/export/export.min.js"></script>
    <link rel="stylesheet" href="js/amcharts/plugins/export/export.css"
        type="text/css" media="all" />
         <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
      <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
       <script src="js/toastr/toastr.min.js"></script>
        <script src="js/notification/notification.js"></script>
        <script src="js/Requirements/ArchiveRequirements/archiveRequirementsApproval/archiveRequirementsApprovalDataRetrieveAjaxCall.js"></script>
        <script src="js/Requirements/ArchiveRequirements/archiveRequirementsApproval/archiveReqApprovalSave.js"></script>

    <script src="js/amcharts/themes/light.js"></script>
   
    <script src="js/icheck/icheck.min.js"></script>
    <script src="js/bootstrap-tour/bootstrap-tour.js"></script>
    <!-- ========== THEME JS ========== -->
    <script src="js/production-chart.js"></script>
    <script src="js/traffic-chart.js"></script>
    <script src="js/task-list.js"></script>
    <!-- ========== THEME JS ========== -->
    <script src="js/main.js"></script>
    <script id ="scripttag"></script>
    <script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    
</html>
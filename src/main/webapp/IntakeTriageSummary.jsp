<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Decom3Sixty - Intake</title>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >
   <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
  
    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
 
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
<link rel="stylesheet" href="css/headerIcon/headerIcon.css" media="screen" >

<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>

<script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummary.js"></script>
<script src="js/Opportunity/OpportunityGrid/OpportunityGrid.js"></script>

 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>

<link rel="stylesheet" href="css/Intake/IntakeOpportunity.css" media="screen" > 

<!-- ========== BootstrapV5 ========== -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
	integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
	integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
	crossorigin="anonymous"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">

   
   <style type="text/css">
         body{
            background:#fff;
        }

        .active1{
        background:#1565c0;
         }
      .page-title-div {
	 background:#1565c0;
	  padding: 15px;
	  
	  
	}
</style>


</head>
<script type="text/javascript">
a=10;
if(a==10)
    {
window.onload = function() {
   setTimeout(loadAfterTime, 500)
}; 
function loadAfterTime(){
    validateTriageSummary1();
    if(window.location.href.substr(-2) !== "?#") {
          window.location = window.location.href + "?#";
        }
}   
    }
else
    {
    Error
    }
 </script>
<body class="top-navbar-fixed">

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
		<nav class="nav nav-height-70 nav-font" id="bg-color"
			style="font-size: 14px;">
			<div class="container-fluid" id="container-fluid-margin">
				<div class="row" id="d3s-mt-10">
					<div class="col-lg-12 col-md-12">
						<div class="sub-title" style="color: #fff">
							<%-- <a href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><span
								class="glyphicon glyphicon-home"></span> Home</a> >> <%=OpportunityName%> >><a
								href="IntakeOpportunity.jsp" id="sitetitle1" style="color: #fff">
								Opportunity </a> >> <a href="IntakeTriageSummary.jsp"
								id="sitetitle1" style="color: #fff"> Triage Summary</a> --%>
								
								
								<a href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><span
								class="glyphicon glyphicon-home"></span> Home</a> >> <a
								href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><%=Encode.forHtml(OpportunityName)%></a>>><a
								href="OpportunityGrid.jsp" id="sitetitle1" style="color: #fff">Intake</a> >> 
								<a href="IntakeOpportunity.jsp" id="sitetitle1" style="color: #fff">Opportunity</a> >> 
								<a href="IntakeTriage.jsp" id="sitetitle1" style="color: #fff">Triage</a> >> TriageSummary
						</div>
					</div>
				</div>
			</div>
		</nav>
	<%
}
catch(Exception e){
e.printStackTrace();
}



} %>
<div class="main-wrapper">
 <!-- ========== TOP NAVBAR ========== -->
   <!--  <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
				<div class="navbar-header no-padding" style = "height : 100px;">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/Decom3Sixty_logo.png" alt="Decom3Sxity" class="logo" style = "margin-top : 50px;">
                    </a>
                </div>
                /.navbar-header
                <div class="tabs-content">
                  <ul class="nav navbar-nav navAlign">
		              <li class="active1"><a href="OpportunityList.jsp" style="color:white;"><i class="fad fa-folders fa-2x iconAlign activeIcon"></i>Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp"><i class="fad fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a></li>
		              <li><a href="PhaseList.jsp"><i class="fad fa-desktop iconAlign iconColor fa-2x"></i>Governance</a></li>
		              <li><a href="#"><i class="fad fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
		              <li ><a href="DashBoard.jsp"><i class="fad fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a></li>
		              <li><a href="#"><i class="fad fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a></li>
		          </ul>
		         <ul class="nav navbar-nav navbar-right" style = "margin-top:45px;">
                      <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin </span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
      </div> -->
      <!-- <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                             <div class="col-sm-6">
                        
                            
                        <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff">
                          <span class="glyphicon glyphicon-home"></span> Home</a> >> 
                         
                          <a  href="IntakeOpportunity.jsp" id="sitetitle1" style="color:#fff">
                           Opportunity</a> >>
                          <a  href="IntakeTriage.jsp" id="sitetitle1" style="color:#fff">
                           Triage</a> >>
                            <a  href="IntakeTriageSummary.jsp" id="sitetitle1" style="color:#fff">
                           TriageSummary</a> 
                         </p>

                    </div>

                </div>
			</nav>
      
        </div>
        /.container-fluid
    </nav > -->
<div class="content-wrapper">
 <div class="content-container" >
  <div class="main-page">
       <section class="wizard-section">
		<div class="container">
			<div class=" col-md-12">
				<div class="form-wizard">
					<form action="" method="post" role="form">
					<br/>
					<br/>
						<div class="form-wizard-header nav-font">
							<!-- <p style="font-size: 14px;">Fill all the required fields to go next step</p> -->
								<ul class="list-unstyled form-wizard-steps clearfix">
												<li class="activated"
													onclick="location.href='IntakeOpportunity.jsp;'"><span>1</span><i>Opportunity</i></li>
												<li class="activated"
													onclick="location.href='IntakeTriage.jsp';"><span>2</span><i>Triage</i></li>
												<li class="active"
													onclick="location.href='IntakeTriageSummary.jsp';"><span>3</span><i>Triage
														Summary</i></li>
												<li onclick="location.href='IntakeAssessment.jsp';"><span>4</span><i>Assessment</i></li>
												<li onclick="location.href='IntakeStakeHolder.jsp';"><span>5</span>
													<i>Stake Holder</i></li>
												<li onclick="location.href='IntakeReviewDetails.jsp';"><span>6</span><i>Review</i></li>
												<li onclick="location.href='IntakeApproval.jsp';" id="ReviewNextBtn"><span>7</span><i>Approval</i></li>
									</ul>
										</div>
											
						
						<fieldset class="wizard-fieldset show" style="border-style: none">
							      <div class="tab-pane" role="tabpanel" id="step3">
                                                        <!-- Triage Summary -->
                                    <div class="card-container card">
                                        <div class="card-header" id="cd-header">Triage Summary</div>
                                        <div id="collapse3" class="panel-collapse ">
                                            <div class="card-body">
                                            <div id="inputFieldsSummary">
                                            
                                                    <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/> </div>
                                                                                              
                                                   <!--  <div class="col-md-12">
                                                       <div class="col-md-1">
                                                           <button type="button" class="form-wizard-previous-btn btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" onclick ="window.location.href='IntakeTriage.jsp';" >Prev</button></div>
                                                       <div class="col-md-6 dropup" style=" padding-right: 10px; float: right;width: 45%;">
                                                          <button type="button" class="btn btn-warning" id="template" data-toggle="modal" data-target=".triage-summary-example-modal-lg">Template</button>
                                                                <div class = "btn-group dropup dropright">
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu" style = "min-width: inherit;" >
                                                                    <li><a href="#" id="addSummary" data-toggle="modal" data-target="#TiageSummAddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="EditSummary" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="DeleteSummary" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul></div>
                                                                <button type="submitBtn" class="btn btn-success" id="createTriSummary">Save</button>
                                                               <a href="javascript:;" class="form-wizard-next-btn float-right btn btn-info" onclick ="window.location.href='IntakeAssessment.jsp';" >Next</a> 
                                                                <button class="form-wizard-next-btn float-right btn-info btn btn-info" onclick="location.href='IntakeAssessment.jsp';" id="next" disabled="true">
                                                                 
                                                                 <a href="javascript:;">Next</a>
                                                                 
                                                                 </button>
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopupSummary_btn" data-toggle="modal" data-target="#TriSummEditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopupSummary_btn" data-toggle="modal" data-target="#TriageSummaryDeletePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                                            </div>
                                                        </div> -->
                                                        
                                                      <div class="row">
																<div class="col-4">
																	<button type="button" class="btn btn-secondary"
																		onclick ="window.location.href='IntakeTriage.jsp';">Prev</button>
																</div>
																<div class="col-8" align="end">
																	<button type="button" class="btn btn-secondary"
																		id="template" data-bs-toggle="modal"
																		data-bs-target=".triage-summary-example-modal-lg">Template</button>
																	<div class="dropdown">
																		<button type="button"
																			class="btn btn-secondary dropdown-toggle"
																			id="dropdownMenuButton1" data-bs-toggle="dropdown"
																			aria-expanded="false">Actions</button>
																		<ul class="dropdown-menu"
																			aria-labelledby="dropdownMenuButton1">
																			<li><a class="dropdown-item dropDown-font"
																				id="addSummary" href="#" data-bs-toggle="modal"
																				data-bs-target="#TiageSummAddPopUp"> <i
																					class="fas fa-plus" aria-hidden="true">&nbsp;&nbsp;&nbsp;
																						</i>Add</a></li>
																			<li><a class="dropdown-item dropDown-font"
																				id="EditSummary" href="#"><i class="fas fa-edit"
																					aria-hidden="true">&nbsp;&nbsp; </i>Edit</a></li>
																			<li><a class="dropdown-item dropDown-font"
																				id="DeleteSummary" href="#"><i class="fas fa-trash"
																					aria-hidden="true">&nbsp;&nbsp;&nbsp; </i>Delete</a></li>

																		</ul>
																	</div>
													               <button type="submit" class="btn btn-primary" id="edit">Edit</button>
													               <button type="submit" class="btn btn-primary" id="complete" disabled="true">Complete</button>
																	
																	<button type="submit" class="btn btn-primary"
																		id="createTriSummary">Save</button>
																	<!-- <a href="javascript:;" class="form-wizard-next-btn float-right btn-info btn btn-info" onclick="location.href='IntakeTriage.jsp';">Next</a> -->
																	<!-- <button
																		class="form-wizard-next-btn float-right btn-info btn btn-info"
																		onclick="location.href='IntakeAssessment.jsp';" id="next"
																		disabled="true">

																		<a href="javascript:;"  style="color: #fff;">Next</a>

																	</button> -->
																	
																	<button type="button" class="btn btn-primary"
                                                                        onclick="location.href='IntakeAssessment.jsp';" id="next" disabled="true" >Next</button>

																	<button type="button"
																		class="btn btn-primary pull-right" id="editpopupSummary_btn"
																		data-bs-toggle="modal" data-bs-target="#TriSummEditPopUp"
																		style="display: none;">Edit PopUp</button>
																	<button type="button"
																		class="btn btn-primary pull-right"
																		id="deletepopupSummary_btn" data-bs-toggle="modal"
																		data-bs-target="#TriageSummaryDeletePopUp" style="display: none;">Delete
																		PopUp</button>
																	<!--  <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button> -->
																</div>
															</div>
						
				
                                    </div>
                                    
                                </div>
                            </div>
                                  </div>
						</fieldset>	
						
						
						
						
						

	<!-- Triage Ssummary Template modal-->                                        
	 <div class="modal triage-summary-example-modal-lg" id="myFormModal"
                   tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
                      aria-hidden="true">
                   <div class="modal-dialog modal-lg" role="document">
                     <div class="modal-content">
                      <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Triage Summary Template</h5>
                   <!--  <button type="button" class="close" id="TriageTempSummaryCloseId" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button> -->
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="TriSummTemplate" >
                                   <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="ideaNumber_temp" name="ideaNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Idea Number</label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="DemandNumber_temp" name="DemandNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Demand Number </label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35" name="DemandNmbr"> </div>
									</div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="PrjNumber_temp" name="PrjNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Project Number </label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="PrjctTaskNumber_temp" name="PrjctTaskNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Project Task Number </label></div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> 
									</div>    
                                     <br>
                                    <div class="row">
                                            <div class="col-md-1"> <input type="checkbox" id="BigrockSumm_temp" name="BigrockSumm_temp" class="Template_Summary_Values" value="" ></div>
                                            <div class="col-md-2"> <label class="control-label" for="Triage">Big Rock </label> </div>
                                            <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No</div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="DenialReason_temp" name="DenialReason_temp" class="Template_Summary_Values" value="" ></div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Denial Reason </label></div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>     <br> </div>
                                       </form>
                                       </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary SubmitDisableTriSumm" onclick="validateTriageSummary()"data-bs-dismiss="modal">Add Template</button>
                </div>
		</div>
		</div>
		</div>                                     
<!-------Oppurtunity Add popup---------->
    <div class="modal" id="AddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
       <!--  <button type="button" class="close" id = "add_close_id" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button> -->
         <button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="label"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="project_name" name="project_name" value="">
                <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="idname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="types" class="form-select" name="types" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row hidefield" id="check" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="number"  name="number1">
                        </div>
                    </div>
                   
                </div>
                <div class="row hidefield" id="rdo" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="radio_number"  name="radio_number">
                        </div>
                    </div>
                   
                </div>
                <div class="row hidefield" id="drop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="drop_number"  name="drop_number">
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo"></div>
                        </div>
                    </div>
                </div>
                <div id="options">
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo1"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo2"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="mandatory" class="form-select" name="mandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
              
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id ="submit" class="btn btn-primary"  data-bs-dismiss="modal">Add Fields</button>
        <button type="button" class="btn btn-secondary">Close</button>
      </div>
    </div>
  </div>
</div>    
<!-------Triage Add popup---------->
    <div class="modal" id="AddTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
      <button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="Triagelabel"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="Triage_project_name" name="project_name" value="">
                <input type="text" id="Triage_appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="Triage_servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="Triageidname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="Triagetypes" class="form-select" name="types" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row TriageHideField" id="TriageCheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="TriageNumber"  name="TriageNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row TriageHideField" id="TriageRadio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="TriageRadioNumber"  name="TriageRadioNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row TriageHideField" id="TriageDrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="TriageDropNumber"  name="TriageDropNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo"></div>
                        </div>
                    </div>
                </div>
                <div id="TriageOptions">
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo1"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo2"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="Triagemandatory" class="form-select" name="mandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id ="submitTriage" class="btn btn-primary" data-bs-dismiss="modal">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>        
    <!-------Triage Summary Add popup---------->
    <div class="modal" id="TiageSummAddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
         <button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group-popup">
                        <div class="col-lg-12">
                            <label class="control-label" for="TriageSummary">Label:</label>
                            <input type="text" class="form-control" id="TriSummLabel"  name="TriSummLabel" required>
                        </div>
                    </div>
                </div>
                <input type="hidden" id="project_name" name="project_name" value="">
                <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="idname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group-popup">
                        <div class="col-lg-12">
                            <label class="control-label" for="TriageSummary">Type:</label>
                            <select id="TriSummTypes" class="form-select" name="TriSummTypes" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row hidefield" id="TriSummCheck" style="display:none;">
                    <div class="form-group-popup">
                        <div class="col-lg-12">
                            <label class="control-label" for="TriageSummary">Number of check boxes:</label>
                            <input type="text" class="form-control" id="TriSummNumber"  name="TriSummNumber1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="TriSummRadio" style="display:none;">
                    <div class="form-group-popup">
                        <div class="col-lg-12">
                            <label class="control-label" for="TriageSummary">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="TriSummRadioNbr"  name="TriSummRadioNbr">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="TriSummDrop" style="display:none;">
                    <div class="form-group-popup">
                        <div class="col-lg-12">
                            <label class="control-label" for="TriageSummary">Number of Options:</label>
                            <input type="text" class="form-control" id="TriSummDropNbr"  name="TriSummDropNbr">
                        </div>
                    </div>
                    <br/>
                </div>
               
                <div class="col-lg-12" id="TriageSummaryOptions">
                </div>
               
                
                <div class="row">
                    <div class="form-group-popup">
                        <div class="col-lg-12">
                            <label class="control-label" for="TriageSummary">Mandatory:</label>
                            <select id="TriSummMandatory" class="form-select" name="TriSummMandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>   
      </div>
      <div class="modal-footer">
        <button type="button" id ="TriSummSubmit" class="btn btn-primary" data-bs-dismiss="modal">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>        
 
 <!-- Assessment Common Add Popup -->
 
     <div class="modal" id="AssessAddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "AssessAddCloseId" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
             <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Section:</label>
                            <select id="AssessSection" class="form-select" name="AssessSection" required >
                                <option value="ApplicationInformation" selected>Application Information</option>
                                <option value="DataCharacteristics">Data Characteristics</option>
                                <option value="ComplianceCharacteristics">Compliance Characteristics</option>
                                <option value="ArchivalConsumption">Archival Consumption</option>
                                <option value="ContractInformation">Contract Information</option>
                            </select>
                        </div>
                    </div>
                </div><br/>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="AssessLabel"  name="AssessLabel" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="project_name" name="project_name" value="">
                <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="idname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="AssessTypes" class="form-select" name="AssessTypes" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row AssessHideField" id="AssessCheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="AssessCheckNumber"  name="AssessCheckNumber1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row AssessHideField" id="AssessRadio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="AssessRadioNumber"  name="AssessRadioNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row AssessHideField" id="AssessDrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="AssessDropNumber"  name="AssessDropNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo"></div>
                        </div>
                    </div>
                </div>
                <div id="AssessOptions">
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo1"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo2"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="AssessMandatory" class="form-select" name="AssessMandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id ="AssessAddSubmit" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>    
 
  <!--Delete pop up-->
         <div class="modal" id="DeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="delete_close" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="sequence1"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="submit2" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>   
<!--Triage Delete pop up-->
         <div class="modal" id="DeleteTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="TriageDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="sequenceTriageDelete"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriageDeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>                                      
   <!-- Triage Summary Delete Pop up -->
        <div class="modal" id="TriageSummaryDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="TriSummSequence"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriSummDeleteSubmit" class="btn btn-primary" data-bs-dismiss="modal" >Yes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>    

<!-- AssessmentCommon Delete Pop Up -->

<div class="modal" id="AssessDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="AssessDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="AssessSequence"/>
                    <input type="hidden" id="DeleteSection"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="AssessDeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>  

<!-- Edit pop up -->
    <div class="modal" id="EditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="edit_close" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="Label_modify"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="text" id="seq_num" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="submit1" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  
 <!--Triage Edit pop up -->
    <div class="modal" id="EditTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="TriageEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="TriageLabelModify"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="TriageEditMandatory" class="form-select" name="TraigeEditMandatory" required >
                                <option value = "Yes" >Yes</option>
                            </select>
                        </div>
                    </div>
                </div>   <input type="text" id="TriageEditSeqNum" name="TriageEditSeqNum" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriageEditSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  

  <!-- Triage Summary Edit pop up -->
    <div class="modal" id="TriSummEditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"
			aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="TriageSummary">Label:</label>
                            <input type="text" class="form-control" id="TriSummLabelModify"  name="TriSummlabel" required>
                        </div>
                    </div>
                </div><br/><input type="text" id="TriSummSeqNum" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriSummEditSubmit" class="btn btn-primary" data-bs-dismiss="modal">Submit</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  

<!--  Assessment Common Edit Pop up -->

 <div class="modal" id="AssessEditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="AssessEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="Assessment">Label:</label>
                            <input type="text" class="form-control" id="AssessLabelModify"  name="Assesslabel" required>
                        </div>
                    </div>
                </div><br/><input type="text" id="AssessSeqNum" name="" value="" style="display:none;">
                <input type="text" id="EditSection" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="AssessEditSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div> 
        
	 <!-- <a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button" ><i class="fa fa-arrow-up"></i></a> --> 					
						
					</form>
					
					
					
					 
				</div>
			</div>
		</div>
	</section>
  <div class="modal" id="DeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="DeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this Row permanently?</p>
                    <input type="hidden" id="Sequence"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="DeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>  
  <!-- Modal -->
                    <div class="modal fade" id="myModal modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" style="width:1000px">
                            <div id="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel" style="text-align: center"><b>List of
                                        Users</b></h4>
                                    <input type="checkbox" name="signorder" id="signorder" style="margin-left: 245px;"> <b>Set signing order</b>
                                    <input class="searchbox" id="search_bar" type="text" placeholder="Search User"
                                           name="search" style="font-size: 15px"/>
                                </div>
                                <div class="modal-body" style="width: 500px" id="user_list_div_id_name">

                                </div>
                                <div class="modal-footer" style="height: 80px;padding: 20px">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" name="email_id" id="email_id"
                                            data-dismiss="modal">Send Email
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div> 
  
    <div class="modal" id="ConfirmationPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Confirmation for Approval</h5>
        <button type="button" id ="ConfirmationClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">By Approving this opportunity overall approval for intake module will be confirmed as approved.</p><br/><p style="font-size:20px;"> Do you want to allow this?</p>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="ConfirmationYes" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" id="ConfirmationNo">No</button>
      </div>
    </div>
  </div>
</div>  
  
  
  
  </div> <!-- main-page -->
 </div>  <!-- content-container -->
</div>   <!-- content-wrapper -->

</div> <!-- main-wrapper -->


<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"  
         rel = "stylesheet"><!-- newly added code by parthiban -->
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
      <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
      
<script src="js/toastr/toastr.min.js"></script>
<script src="js/notification/notification.js"></script>
     
     <!-- Intake triage Summary -->
     
     <script src="js/IntakeDetails/IntakeTriageSummary/EditDeletAjaxCallTriageSummary.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummarySave.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/AddFeatureFunctionality.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/TriageSummaryAddFeatureAjaxCall.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/EditDeleteToggle.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummaryTemplate.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummaryTemplate2.js"></script>
     
   
      
      
     
      <!-- Active Icon Color changes  -->
      
 
      
       
     
     

 <script>
    $(document).ready(function(){
    	$(window).scroll(function () {
    			if ($(this).scrollTop() > 50) {
    				$('#back-to-top').fadeIn();
    			} else {
    				$('#back-to-top').fadeOut();
    			}
    		});
    		// scroll body to 0px on click
    		$('#back-to-top').click(function () {
    			$('body,html').animate({
    				scrollTop: 0
    			}, 400);
    			return false;
    		});
    });
    </script>









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
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all" />
<script src="js/amcharts/themes/light.js"></script>
<script src="js/toastr/toastr.min.js"></script>
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>
 <script id ="scripttag"></script>
 <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"  
         rel = "stylesheet"><!-- newly added code by parthiban -->
    
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.js"></script>
    <script src = "https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.3/angular.js"></script>
     <script src = "https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.3/angular-animate.js"></script>
    
 <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
 <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
 <link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
 <script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
 <script src="js/navigation/navigation.js"></script>
 <!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src ="js/IntakeDetails/IntakePreviewDetails/IntakePreviewDataRetrieve.js"></script>
</body>
</html>

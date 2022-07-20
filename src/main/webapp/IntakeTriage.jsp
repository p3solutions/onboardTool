<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Decom3Sixty - IntakeTriage</title>
<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
	media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
	media="screen">

<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/icheck/skins/line/red.css">
<link rel="stylesheet" href="css/icheck/skins/line/green.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<link rel="stylesheet" href="css/UserInfo/userinfo.css">

<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>

<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">

<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<!-- <script src="js/IntakeDetails/IntakeOpportunity/IntakeOpportunity.js"></script> -->
<link rel="stylesheet" href="css/Intake/IntakeOpportunity.css"
	media="screen">
	
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
body {
	background: #fff;
}

.active1 {
	background: #1565c0;
}

.page-title-div {
	background: #1565c0;
	padding: 15px;
}
</style>

</head>
<body class="top-navbar-fixed">

	<div class="main-wrapper">
	
		<div class="main-wrapper">
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
	
		<!-- ========== TOP NAVBAR ========== -->
		<!--   <nav class="navbar top-navbar bg-white box-shadow">
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
      </div>
      <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                             <div class="col-sm-6">
                        
                            
                         <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff">
                          <span class="glyphicon glyphicon-home"></span> Home</a> >> 
                         
                          
                          <a  href="archiveRequirementsLegacyDetails.jsp" id="sitetitle1" style="color:#fff">
                           Opportunity </a> >> Triage Information
                           </a></p>
                     
                    

                    </div>

                </div>
			</nav>
      
        </div>
        /.container-fluid
    </nav > -->
		<%@include file="Nav-Bar.jspf"%>
		<nav class="nav nav-height-70 nav-font" id="bg-color"
			style="font-size: 14px;">
			<div class="container-fluid" id="container-fluid-margin">
				<div class="row" id="d3s-mt-10">
					<div class="col-lg-12 col-md-12">
						<div class="sub-title" style="color: #fff">
							<%-- <a href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><span
								class="glyphicon glyphicon-home"></span> Home</a> >> <%=OpportunityName%> >><a
								href="archiveRequirementsLegacyDetails.jsp" id="sitetitle1"
								style="color: #fff"> Opportunity </a> >> Triage Information </a> --%>
								
								<a href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><span
								class="glyphicon glyphicon-home"></span> Home</a> >> <a
								href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><%=Encode.forHtml(OpportunityName)%></a>>><a
								href="OpportunityGrid.jsp" id="sitetitle1" style="color: #fff">Intake</a> >> 
								<a href="IntakeOpportunity.jsp" id="sitetitle1" style="color: #fff">Opportunity</a> >> Triage
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
		<div class="content-wrapper">
			<div class="content-container">
				<div class="main-page">
					<section class="wizard-section">
						<div class="container">
							<div class=" col-md-12">
								<div class="form-wizard">
									<form action="" method="post" role="form">
										<br /> <br />
										<div class="form-wizard-header nav-font">
											<!-- <p style="font-size: 14px;">Fill all the required fields to go next step</p> -->
											
											<ul class="list-unstyled form-wizard-steps clearfix">
												<li class="activated" onclick="location.href='IntakeOpportunity.jsp;'"><span>1</span><i>Opportunity</i></li>
												<li class="active" onclick="location.href='IntakeTriage.jsp';"><span>2</span><i>Triage</i></li>
												<li onclick="location.href='IntakeTriageSummary.jsp';"><span>3</span><i>Triage Summary</i></li>
												<li onclick="location.href='IntakeAssessment.jsp';"><span>4</span><i>Assessment</i></li>
												<li onclick="location.href='IntakeStakeHolder.jsp';"><span>5</span> <i>Stake Holder</i></li>
												<li onclick="location.href='IntakeReviewDetails.jsp';"><span>6</span><i>Review</i></li>
												<li onclick="location.href='IntakeApproval.jsp';" id="ReviewNextBtn"><span>7</span><i>Approval</i></li>
											</ul>
										</div>
										<!-- Triage Info -->
										<fieldset class="wizard-fieldset show"
											style="border-style: none">
											<div class="tab-pane" role="tabpanel" id="step2">
												<div class="card-container card">
													<div class="card-header" id="cd-header">Triage Information</div>
													<div id="collapse2" class="panel-collapse ">
														<div class="card-body">
															<div id="inputValue">
																<input type='hidden' class='form-control' size='35'
																	id="Json_sample_id" placeholder='' name="Json_Sample"
																	value="" />
															</div>
															<div class="row">
																<div class="col-4">
																	<button type="button" class="btn btn-secondary"
																		onclick="window.location.href='IntakeOpportunity.jsp';">Prev</button>
																</div>
																<div class="col-8" align="end">
																	<button type="button" class="btn btn-secondary"
																		id="template" data-bs-toggle="modal"
																		data-bs-target=".triage-example-modal-lg">Template</button>
																	<div class="dropdown">
																		<button type="button"
																			class="btn btn-secondary dropdown-toggle"
																			id="dropdownMenuButton1" data-bs-toggle="dropdown"
																			aria-expanded="false">Actions</button>
																		
																		<ul class="dropdown-menu"
																			aria-labelledby="dropdownMenuButton1">
																			<li><a class="dropdown-item dropDown-font"
																				id="add" href="#" data-bs-toggle="modal"
																				data-bs-target="#AddTriagePopUp"> <i
																					class="fas fa-plus" aria-hidden="true">&nbsp;&nbsp;&nbsp;
																						</i>Add</a></li>
																			<li><a class="dropdown-item dropDown-font"
																				id="EditTriage" href="#"><i class="fas fa-edit"
																					aria-hidden="true">&nbsp;&nbsp; </i>Edit</a></li>
																			<li><a class="dropdown-item dropDown-font"
																				id="DeleteTriage" href="#"><i class="fas fa-trash"
																					aria-hidden="true">&nbsp;&nbsp;&nbsp; </i>Delete</a></li>

																		</ul>
																	</div>
																	<button type="submit" class="btn btn-primary"
																		id="createbtn">Save</button>
																	<!-- <button
																		class="form-wizard-next-btn float-right btn-info btn btn-info"
																		onclick="location.href='IntakeTriageSummary.jsp';"
																		id="next" disabled="true">

																		<a href="javascript:;" style="color: #fff;">Next</a>

																	</button> -->
																	<button type="button" class="btn btn-primary"
                                                                        onclick="location.href='IntakeTriageSummary.jsp';" id="next" disabled="true" >Next</button>
																	<!-- <a href="javascript:;" class="form-wizard-next-btn float-right btn btn-info" onclick ="window.location.href='IntakeTriageSummary.jsp';">Next</a> -->
																	<button type="button"
																		class="btn btn-primary pull-right" id="editpopup_btn1"
																		data-bs-toggle="modal" data-bs-target="#EditTriagePopUp"
																		style="display: none;">Edit PopUp</button>
																	<button type="button"
																		class="btn btn-primary pull-right"
																		id="deletepopup_btn1" data-bs-toggle="modal"
																		data-bs-target="#DeleteTriagePopUp"
																		style="display: none;">Delete PopUp</button>
																	<button type="button"
																		class="btn btn-primary pull-right"
																		id="TriageSummaryListbtn" style="display: none;"></button>
																</div>
															</div>
														</div>
													</div>
												</div>



											</div>
										</fieldset>






										<!-- Modal -->
										<div class="modal" id="exampleModal" tabindex="-1"
											role="dialog" aria-labelledby="exampleModalLabel"
											aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">
															Questions :</h5>
														<button type="button" class="close" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form>
															<div class="form-group">
																<div class="form-check form-check-inline">
																	<div class="col-md-1">
																		<input class="form-check-input" type="checkbox"
																			id="inlineCheckbox1" value="option1">
																	</div>
																	<div class="col-md-6">
																		<label class="form-check-label" for="inlineCheckbox1">Add
																			developer Name</label>
																	</div>
																</div>
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
														<button type="button" class="btn btn-primary">Add</button>
													</div>
												</div>
											</div>
										</div>

										<!-- Intake OpportunityTemplate modal-->
										<div class="modal fade bd-example-modal-lg" id="myFormModal"
											tabindex="-1" role="dialog"
											aria-labelledby="myLargeModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-lg" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Opportunity Template</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal"
															aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form name="myForm">
															<div class="form-group" id="TemplateFields">
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="apmid_temp"
																			name="apmid_temp" class="Template_Field" value=""
																			disabled="disabled" checked="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Application
																			Id</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="apmid_temp1" name="apmid">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="appName_temp"
																			name="appName_temp" class="Template_Field" value=""
																			disabled="disabled" checked="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Application
																			Name</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="appName_temp1" name="appName">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="creation_date_temp"
																			name="creation_date_temp" class="Template_Field"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Creation
																			Date</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text"
																			class="form-control datepicker1 hasDatepicker"
																			size="35" id="creation_date_temp1"
																			placeholder="mm/dd/yyyy" name="creation_date">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="source_temp"
																			name="source_temp" class="Template_Field" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Request
																			Source</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="source_temp1" name="source">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="status_temp"
																			name="status_temp" class="Template_Field" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Status</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="status_temp1" name="status">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="request_type_temp"
																			name="request_type_temp" class="Template_Field"
																			value="" disabled="disabled" checked="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Request
																			Type</label>
																	</div>
																	<div class="col-md-6">
																		<select style="width: 100%;" class="form-select"
																			id="request_type_temp1" name="request_type_temp">
																			<option label="Decommission" class="control-label"
																				for="opportunity">Decommission</option>
																			<option label="Archive" class="control-label"
																				for="opportunity">Archive</option>
																			<option label="To" be="" retrive=""
																				class="control-label" for="opportunity">To
																				be retrive</option>
																		</select>
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="requester_temp"
																			name="requester_temp" class="Template_Field" value=""
																			disabled="disabled" checked="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Requester</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="requester_temp1" name="requester">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="appdesc_temp"
																			name="appdesc_temp" class="Template_Field" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Application
																			Descrpition</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="appdesc_temp1" name="appdesc">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="appowner_temp"
																			name="appowner_temp" class="Template_Field" value=""
																			disabled="disabled" checked="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Application
																			Owner</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="appowner_temp1" name="appowner">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="businessowner_temp"
																			name="businessowner_temp" class="Template_Field"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Business
																			Owner</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="businessowner_temp1" name="businessowner">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="sme_temp" name="sme_temp"
																			class="Template_Field" value="" disabled="disabled"
																			checked="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Development
																			Owner/SME</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="sme_temp1" name="sme">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="billcode_temp"
																			name="billcode_temp" class="Template_Field" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Billing
																			Code</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="billcode_temp1" name="billcode">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="buisnesssegment_temp"
																			name="buisnesssegment_temp" class="Template_Field"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Buisness
																			Segment</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="buisnesssegment_temp1" name="buisnesssegment">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="buisnessunit_temp"
																			name="buisnessunit_temp" class="Template_Field"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Buisness
																			Unit</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="buisnessunit_temp1" name="buisnessunit">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="keyfunction_temp"
																			name="keyfunction_temp" class="Template_Field"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Key
																			Function</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="keyfunction_temp1" name="keyfunction">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="pscontact_temp"
																			name="pscontact_temp" class="Template_Field" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Program
																			or Segment Contact</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="pscontact_temp1" name="pscontact">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="date_type_temp"
																			name="date_type_temp" class="Template_Field" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Data
																			Type</label>
																	</div>
																	
																	<div class="col-md-6">
																		<select style="width: 100%;" class="form-select"
																			id="date_type_temp1" name="date_type_temp">
																			<option label="EMR" system="" class="control-label"
																				for="opportunity">EMR System</option>
																			<option label="ERP" data="" class="control-label"
																				for="opportunity">ERP Data</option>
																			<option label="Financial" data=""
																				class="control-label" for="opportunity">Financial
																				Data</option>
																			<option label="HealthCare" data=""
																				class="control-label" for="opportunity">HealthCare
																				Data</option>
																			<option label="HR" data="" class="control-label"
																				for="opportunity">HR Data</option>
																			<option label="MR/HR" data="" class="control-label"
																				for="opportunity">MR/HR Data</option>
																			<option label="Other" dat="" class="control-label"
																				for="opportunity">Other Data</option>
																		</select>
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="if_other_data_temp"
																			name="if_other_data_temp" class="Template_Field"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">If
																			Other Data</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="if_other_data_temp1" name="if_other_data">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="arcdecomm_temp"
																			name="arcdecomm_temp" class="Template_Field" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Please
																			describe your needs for Archival and Decommission
																			Service</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			id="arcdecomm_temp1" name="arcdecomm">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="completion_date_temp"
																			name="completion_date_temp" class="Template_Field"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="opportunity">Desired
																			Completion Date</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text"
																			class="form-control datepicker1 hasDatepicker"
																			size="35" id="completion_date_temp1"
																			placeholder="mm/dd/yyyy" name="completion_date">
																	</div>
																</div>
																<br>
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="button"
															class="btn btn-primary submitDisable"
															onclick="validateForm()" data-bs-dismiss="modal">Add Template</button>
													</div>
												</div>
											</div>
										</div>
										<!-- Triage Template modal-->
										<div class="modal triage-example-modal-lg"
											id="myFormModal" tabindex="-1" role="dialog"
											aria-labelledby="myLargeModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-lg" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Triage
															Template</h5>
														<button type="button" class="btn-close" data-bs-dismiss="modal"
															aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form name="myForm">
															<div class="form-group" id="Templatevalues">
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="appId_temp" name="appId"
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">APM
																			Id</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="applicationName_temp"
																			name="appName" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">APM
																			Name</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="applicationDesc_temp"
																			name="appDesc" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Application
																			Description</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="applicationOwner_temp"
																			name="appOwner" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Application
																			Owner</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="busOwner_temp"
																			name="busOwner" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Business
																			Owner</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="devOwner_temp"
																			name="devOwner" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Developement
																			Owner or SME</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="billing_Code_temp"
																			name="billing_Code" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Billing
																			Code</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="business_Segment_temp"
																			name="biling_Segment" class="Template_Values"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Billing
																			Segement</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			name="biling_Segment">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="busUnit_temp"
																			name="busUnit" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Business
																			Unit</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="segment_contact_temp"
																			name="segment_contact" class="Template_Values"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Program
																			or Segement Contact</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="logic_Grp_temp"
																			name="logic_Grp" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Logical
																			Grouping</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="Preliminary_CBA_temp"
																			name="Preliminary_CBA" class="Template_Values"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Preliminary
																			CBA</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="funding_Avl_temp"
																			name="funding_Avl" class="Template_Values">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Funding
																			available</label>
																	</div>
																	<div class="col-md-6">
																		<select style="width: 100%;" class="form-select">
																			<option label="Yes" class="control-label"
																				for="Triage">Yes</option>
																			<option label="No" class="control-label" for="Triage">No</option>
																		</select>
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="prgFunder_temp"
																			name="prgFunder" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Program
																			Funder</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="PrjInfo_temp"
																			name="PrjInfo" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Project
																			Portfolio Information</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="Decom_date_temp"
																			name="Decom_date" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Project
																			Decomission Date</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text"
																			class="form-control datepicker1 hasDatepicker"
																			size="35" placeholder="mm/dd/yyyy">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="infrastructure_impact_temp"
																			name="infrastructure_impact" class="Template_Values"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Infrastructure
																			Impact</label>
																	</div>
																	<div class="col-md-6">
																		<select style="width: 100%;" class="form-select">
																			<option label="Yes" class="control-label"
																				for="Triage">Yes</option>
																			<option label="No" class="control-label" for="Triage">No</option>
																		</select>
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox"
																			id="nmbr_of_infrastructure_components_temp"
																			name="nmbr_of_infrastructure_components"
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Number
																			of Infrastructure Components</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="archival_Sol_temp"
																			name="archival_Sol" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Archival
																			Solution</label>
																	</div>
																	<div class="col-md-6">
																		<select style="width: 100%;" class="form-select">
																			<option label="Yes" class="control-label"
																				for="Triage">Yes</option>
																			<option label="No" class="control-label" for="Triage">No</option>
																		</select>
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="Status_temp" name="Status"
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Status/Notes</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="decomAnalyst_temp"
																			name="decomAnalyst" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Decom
																			Analyst</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="rationalization_type_temp"
																			name="rationalization_type" class="Template_Values"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Rationalization
																			Type</label>
																	</div>
																	<div class="col-md-6">
																		<select style="width: 100%;" class="form-select">
																			<option label="Replace" class="control-label"
																				for="Triage">Replace</option>
																			<option label="Retire" class="control-label"
																				for="Triage">Retire</option>
																			<option label="Combine" class="control-label"
																				for="Triage">Combine</option>
																			<option label="Other" class="control-label"
																				for="Triage">Other</option>
																		</select>
																	</div>
																</div>
																<br>
																<div class="row" style="display: none;">
																	<div class="col-md-1">
																		<input type="hidden"
																			id="If_other_please_describe_temp"
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">If
																			other, please describe </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="appPlatfrm_temp"
																			name="appPlatfrm" class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Application
																			platform</label>
																	</div>
																	<div class="col-md-6">
																		<select style="width: 100%;" class="form-select">
																			<option label="Mainframe" class="control-label"
																				for="Triage">Mainframe</option>
																			<option label="Distibuted - Unix"
																				class="control-label" for="Triage">Distibuted
																				- Unix</option>
																			<option label="Windows" class="control-label"
																				for="Triage">Windows</option>
																			<option label="hybrid" class="control-label"
																				for="Triage">hybrid</option>
																			<option label="Others" class="control-label"
																				for="Triage">Others</option>
																		</select>
																	</div>
																</div>
																<br>
																<div class="row" style="display: none;">
																	<div class="col-md-1">
																		<input type="hidden" id="If_Other_describe_temp"
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">If
																			Other,please describe </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="app_and_data_hosted_temp"
																			name="app_and_data_hosted_temp"
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Is
																			application and Data hosted externally?</label>
																	</div>
																	<div class="col-md-6">
																		<input class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio1"
																			value="Yes">&nbsp;Yes &nbsp;<input
																			class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio2"
																			value="No">&nbsp;No
																	</div>
																</div>
																<br>
																<div class="row" style="display: none;">
																	<div class="col-md-1">
																		<input type="hidden" id="vendor_temp" name=""
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">If
																			yes,vendor?Location?</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="compliance_temp"
																			name="compliance_temp" class="Template_Values"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Are
																			there any compliance or legal drivers determining
																			retirement by a certain date </label>
																	</div>
																	<div class="col-md-6">
																		<input class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio1"
																			value="Yes">&nbsp;Yes &nbsp;<input
																			class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio2"
																			value="No">&nbsp;No
																	</div>
																</div>
																<br>
																<div class="row" style="display: none;">
																	<div class="col-md-1">
																		<input type="hidden" id="describe_temp" name=""
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">If
																			yes above,please describe</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="Financialdate_temp"
																			name="Financialdate_temp" class="Template_Values"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Are
																			there any business or financial drivers determining
																			retirement by a certain date?Eg.,contract expiring</label>
																	</div>
																	<div class="col-md-6">
																		<input class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio1"
																			value="Yes">&nbsp;Yes &nbsp;<input
																			class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio2"
																			value="No">&nbsp;No
																	</div>
																</div>
																<br>
																<div class="row" style="display: none;">
																	<div class="col-md-1">
																		<input type="hidden" id="plsdescribe_temp" name=""
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">If
																			Yes above,please describe</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox"
																			id="TechincalDeterminingdate_temp"
																			name="TechincalDeterminingdate_temp"
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Are
																			there any technical drivers determining retirement by
																			a certain date?.(Eg server end of life
																			,support,software,end of life,support)</label>
																	</div>
																	<div class="col-md-6">
																		<input class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio1"
																			value="Yes">&nbsp;Yes &nbsp;<input
																			class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio2"
																			value="No">&nbsp;No
																	</div>
																</div>
																<br>
																<div class="row" style="display: none;">
																	<div class="col-md-1">
																		<input type="hidden" id="pls_describe_temp" name=""
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">If
																			Yes above,please describe</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="useforArchival_temp"
																			name="useforArchival " class="Template_Values"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Please
																			describe business need/use for Archival</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox"
																			id="highlevelapplicationdata_temp"
																			name="highlevelapplicationdata "
																			class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Please
																			describe at high-level your applications data </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="ideaNmbr_temp"
																			name="ideaNmbr " class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Idea
																			Number</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="DemandNmbr"
																			name="DemandNmbr " class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Demand
																			Number </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			name="DemandNmbr">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="PrjNmbr_temp"
																			name="PrjNmbr " class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Project
																			Number </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="PrjctTaskNmbr_temp"
																			name="PrjctTaskNmbr " class="Template_Values"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Project
																			Task Number </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="Bigrock_temp"
																			name="Bigrock " class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Big
																			Rock </label>
																	</div>
																	<div class="col-md-6">
																		<input class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio1"
																			value="Yes">&nbsp;Yes &nbsp;<input
																			class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio2"
																			value="No">&nbsp;No
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="DenialRsn_temp"
																			name="DenialRsn " class="Template_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Denial
																			Reason </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
															</div>
															<div class="col-md-6">
                                                             	<label class="control-label" for="opportunity">Mandatory:</label>
                                                                   <select id="mandatory2" class="form-select"name="mandatory" required>
                                                             	      <option value="Yes">Yes</option>
                                                            		  <option value="No">No</option>
                                                             	   </select>
                                                             </div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="button"
															class="btn btn-primary submitDisable"
															onclick="validateTriage()" data-bs-dismiss="modal">Add Template</button>
													</div>
												</div>
											</div>
										</div>
										<!-- Triage Ssummary Template modal-->
										<div class="modal triage-summary-example-modal-lg"
											id="myFormModal" tabindex="-1" role="dialog"
											aria-labelledby="myLargeModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-lg" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Triage
															Summary Template</h5>
														<button type="button" class="close"
															id="TriageTempSummaryCloseId" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form name="myForm">
															<div class="form-group" id="TriSummTemplate">
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="ideaNumber_temp"
																			name="ideaNumber_temp"
																			class="Template_Summary_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Idea
																			Number</label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="DemandNumber_temp"
																			name="DemandNumber_temp"
																			class="Template_Summary_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Demand
																			Number </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35"
																			name="DemandNmbr">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="PrjNumber_temp"
																			name="PrjNumber_temp" class="Template_Summary_Values"
																			value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Project
																			Number </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="PrjctTaskNumber_temp"
																			name="PrjctTaskNumber_temp"
																			class="Template_Summary_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Project
																			Task Number </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="BigrockSumm_temp"
																			name="BigrockSumm_temp"
																			class="Template_Summary_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Big
																			Rock </label>
																	</div>
																	<div class="col-md-6">
																		<input class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio1"
																			value="Yes">&nbsp;Yes &nbsp;<input
																			class="form-check-input" type="radio"
																			name="inlineRadioOptions" id="inlineRadio2"
																			value="No">&nbsp;No
																	</div>
																</div>
																<br>
																<div class="row">
																	<div class="col-md-1">
																		<input type="checkbox" id="DenialReason_temp"
																			name="DenialReason_temp"
																			class="Template_Summary_Values" value="">
																	</div>
																	<div class="col-md-2">
																		<label class="control-label" for="Triage">Denial
																			Reason </label>
																	</div>
																	<div class="col-md-6">
																		<input type="text" class="form-control" size="35">
																	</div>
																</div>
																<br>
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														<button type="button"
															class="btn btn-primary SubmitDisableTriSumm"
															onclick="validateTriageSummary()" data-bs-dismiss="modal">Add Template</button>
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
														<button type="button" class="close" id="add_close_id"
															data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form name="PopUpform">
															<div id="scrollbar">
																<div class="row">
																	<div class="form-group">
																		<div class="col-lg-8">
																			<label class="control-label" for="formInput526">Label:</label>
																			<input type="text" class="form-control" id="label"
																				name="label" required>
																		</div>
																	</div>
																</div>
																<br /> <input type="hidden" id="project_name"
																	name="project_name" value=""> <input
																	type="text" id="appln_name" name="appln_name" value=""
																	style="display: none;"> <input type="text"
																	id="servlet_name" name="servlet_name" value=""
																	style="display: none;">

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
																			<select id="types" class="form-select" name="types"
																				required>
																				<option value="Text box">Text box</option>
																				<option value="Check box">Check box</option>
																				<option value="Radio box">Radio box</option>
																				<option value="Dropdown">Dropdown</option>
																				<option value="Datepicker">Datepicker</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="row hidefield" id="check"
																	style="display: none;">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<label class="control-label" for="formInput526">Number
																				of check boxes:</label> <input type="text"
																				class="form-control" id="number" name="number1">
																		</div>
																	</div>
																	<br />
																</div>
																<div class="row hidefield" id="rdo"
																	style="display: none;">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<label class="control-label" for="formInput526">Number
																				of Radio boxes:</label> <input type="text"
																				class="form-control" id="radio_number"
																				name="radio_number">
																		</div>
																	</div>
																	<br />
																</div>
																<div class="row hidefield" id="drop"
																	style="display: none;">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<label class="control-label" for="formInput526">Number
																				of Options:</label> <input type="text" class="form-control"
																				id="drop_number" name="drop_number">
																		</div>
																	</div>
																	<br />
																</div>
																<div class="row">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<div id="demo"></div>
																		</div>
																	</div>
																</div>
																<div id="options"></div>
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
																			<select id="mandatory" class="form-select"
																				name="mandatory" required>
																				<option>Yes</option>
																				<option>No</option>
																			</select>
																		</div>
																	</div>
																</div>
																<br />
																<br />
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="submit" class="btn btn-primary">Add
															Fields</button>
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
										<!-------Triage Add popup---------->
										<div class="modal" id="AddTriagePopUp" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true" role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Add Input Fields</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form name="PopUpform">
															<div id="scrollbar">
																<div class="row">
																	<div class="form-group-popup">
																		<div class="col-lg-12">
																			<label class="control-label" for="formInput526">Label:</label>
																			<input type="text" class="form-control"
																				id="Triagelabel" name="label" required>
																		</div>
																	</div>
																</div>
																<input type="hidden" id="Triage_project_name"
																	name="project_name" value=""> <input
																	type="text" id="Triage_appln_name" name="appln_name"
																	value="" style="display: none;"> <input
																	type="text" id="Triage_servlet_name"
																	name="servlet_name" value="" style="display: none;">

																<!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="Triageidname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
																<div class="row">
																	<div class="form-group-popup">
																		<div class="col-lg-12">
																			<label class="control-label" for="formInput526">Type:</label>
																			<select id="Triagetypes" class="form-select"
																				name="types" required>
																				<option value="Text box">Text box</option>
																				<option value="Check box">Check box</option>
																				<option value="Radio box">Radio box</option>
																				<option value="Dropdown">Dropdown</option>
																				<option value="Datepicker">Datepicker</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="row TriageHideField" id="TriageCheck"
																	style="display: none;">
																	<div class="form-group-popup">
																		<div class="col-lg-12">
																			<label class="control-label" for="formInput526">Number
																				of check boxes:</label> <input type="text"
																				class="form-control" id="TriageNumber"
																				name="TriageNumber">
																		</div>
																	</div>
																
																</div>
																<div class="row TriageHideField" id="TriageRadio"
																	style="display: none;">
																	<div class="form-group-popup">
																		<div class="col-lg-12">
																			<label class="control-label" for="formInput526">Number
																				of Radio boxes:</label> <input type="text"
																				class="form-control" id="TriageRadioNumber"
																				name="TriageRadioNumber">
																		</div>
																	</div>
																	
																</div>
																<div class="row TriageHideField" id="TriageDrop"
																	style="display: none;">
																	<div class="form-group-popup">
																		<div class="col-lg-12">
																			<label class="control-label" for="formInput526">Number
																				of Options:</label> <input type="text" class="form-control"
																				id="TriageDropNumber" name="TriageDropNumber">
																		</div>
																	</div>
																
																</div>
															
																<div class="col-lg-12" id="TriageOptions"></div>
																
																<div class="row">
																	<div class="form-group-popup">
																		<div class="col-lg-12">
																			<label class="control-label" for="formInput526">Mandatory:</label>
																			<select id="Triagemandatory" class="form-select"
																				name="mandatory" required>
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
														<button type="button" id="submitTriage"
															class="btn btn-primary" data-bs-dismiss="modal">Add Fields</button>
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>
										<!-------Triage Summary Add popup---------->
										<div class="modal" id="TiageSummAddPopUp" tabindex="-1"
											role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Add Input Fields</h5>
														<button type="button" class="close"
															id="TriageSummAddCloseId" data-dismiss="modal"
															aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form name="PopUpform">
															<div id="scrollbar">
																<div class="row">
																	<div class="form-group">
																		<div class="col-lg-8">
																			<label class="control-label" for="TriageSummary">Label:</label>
																			<input type="text" class="form-control"
																				id="TriSummLabel" name="TriSummLabel" required>
																		</div>
																	</div>
																</div>
																<br /> <input type="hidden" id="project_name"
																	name="project_name" value=""> <input
																	type="text" id="appln_name" name="appln_name" value=""
																	style="display: none;"> <input type="text"
																	id="servlet_name" name="servlet_name" value=""
																	style="display: none;">

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
																			<label class="control-label" for="TriageSummary">Type:</label>
																			<select id="TriSummTypes" class="form-select"
																				name="TriSummTypes" required>
																				<option value="Text box">Text box</option>
																				<option value="Check box">Check box</option>
																				<option value="Radio box">Radio box</option>
																				<option value="Dropdown">Dropdown</option>
																				<option value="Datepicker">Datepicker</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="row hidefield" id="TriSummCheck"
																	style="display: none;">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<label class="control-label" for="TriageSummary">Number
																				of check boxes:</label> <input type="text"
																				class="form-control" id="TriSummNumber"
																				name="TriSummNumber1">
																		</div>
																	</div>
																	<br />
																</div>
																<div class="row hidefield" id="TriSummRadio"
																	style="display: none;">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<label class="control-label" for="TriageSummary">Number
																				of Radio boxes:</label> <input type="text"
																				class="form-control" id="TriSummRadioNbr"
																				name="TriSummRadioNbr">
																		</div>
																	</div>
																	<br />
																</div>
																<div class="row hidefield" id="TriSummDrop"
																	style="display: none;">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<label class="control-label" for="TriageSummary">Number
																				of Options:</label> <input type="text" class="form-control"
																				id="TriSummDropNbr" name="TriSummDropNbr">
																		</div>
																	</div>
																	<br />
																</div>
																<div class="row">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<div id="demo"></div>
																		</div>
																	</div>
																</div>
																<div id="TriageSummaryOptions"></div>
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
																			<label class="control-label" for="TriageSummary">Mandatory:</label>
																			<select id="TriSummMandatory" class="form-select"
																				name="TriSummMandatory" required>
																				<option>Yes</option>
																				<option>No</option>
																			</select>
																		</div>
																	</div>
																</div>
																<br />
																<br />
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="TriSummSubmit"
															class="btn btn-primary">Add Fields</button>
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>

										<!-- Assessment Common Add Popup -->

										<div class="modal" id="AssessAddPopUp" tabindex="-1"
											role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Add Input Fields</h5>
														<button type="button" class="close" id="AssessAddCloseId"
															data-dismiss="modal" aria-label="Close">
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
																			<select id="AssessSection" class="form-select"
																				name="AssessSection" required>
																				<option value="ApplicationInformation" selected>Application
																					Information</option>
																				<option value="DataCharacteristics">Data
																					Characteristics</option>
																				<option value="ComplianceCharacteristics">Compliance
																					Characteristics</option>
																				<option value="ArchivalConsumption">Archival
																					Consumption</option>
																				<option value="ContractInformation">Contract
																					Information</option>
																			</select>
																		</div>
																	</div>
																</div>
																<br />
																<div class="row">
																	<div class="form-group">
																		<div class="col-lg-8">
																			<label class="control-label" for="formInput526">Label:</label>
																			<input type="text" class="form-control"
																				id="AssessLabel" name="AssessLabel" required>
																		</div>
																	</div>
																</div>
																<br /> <input type="hidden" id="project_name"
																	name="project_name" value=""> <input
																	type="text" id="appln_name" name="appln_name" value=""
																	style="display: none;"> <input type="text"
																	id="servlet_name" name="servlet_name" value=""
																	style="display: none;">

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
																			<select id="AssessTypes" class="form-select"
																				name="AssessTypes" required>
																				<option value="Text box">Text box</option>
																				<option value="Check box">Check box</option>
																				<option value="Radio box">Radio box</option>
																				<option value="Dropdown">Dropdown</option>
																				<option value="Datepicker">Datepicker</option>
																			</select>
																		</div>
																	</div>
																</div>
																<div class="row AssessHideField" id="AssessCheck"
																	style="display: none;">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<label class="control-label" for="formInput526">Number
																				of check boxes:</label> <input type="text"
																				class="form-control" id="AssessCheckNumber"
																				name="AssessCheckNumber1">
																		</div>
																	</div>
																	<br />
																</div>
																<div class="row AssessHideField" id="AssessRadio"
																	style="display: none;">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<label class="control-label" for="formInput526">Number
																				of Radio boxes:</label> <input type="text"
																				class="form-control" id="AssessRadioNumber"
																				name="AssessRadioNumber">
																		</div>
																	</div>
																	<br />
																</div>
																<div class="row AssessHideField" id="AssessDrop"
																	style="display: none;">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<label class="control-label" for="formInput526">Number
																				of Options:</label> <input type="text" class="form-control"
																				id="AssessDropNumber" name="AssessDropNumber">
																		</div>
																	</div>
																	<br />
																</div>
																<div class="row">
																	<div class="form-group">
																		<div class="col-sm-4">
																			<div id="demo"></div>
																		</div>
																	</div>
																</div>
																<div id="AssessOptions"></div>
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
																			<select id="AssessMandatory" class="form-select"
																				name="AssessMandatory" required>
																				<option>Yes</option>
																				<option>No</option>
																			</select>
																		</div>
																	</div>
																</div>
																<br />
																<br />
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="AssessAddSubmit"
															class="btn btn-primary">Add Fields</button>
														<button type="button" class="btn btn-secondary"
															data-dismiss="modal">Close</button>
													</div>
												</div>
											</div>
										</div>

										<!--Delete pop up-->
										<div class="modal" id="DeletePopUp" tabindex="-1"
											role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Delete Field</h5>
														<button type="button" id="delete_close" class="close"
															data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form name="DeleteForm">
															<div class="modal-body">
																<p style="font-size: 20px;">Do you want to delete
																	this input field permanently?</p>
																<input type="hidden" id="sequence1" />
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="submit2" class="btn btn-primary">Yes</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal" aria-label="Close">No</button>
													</div>
												</div>
											</div>
										</div>
										<!--Triage Delete pop up-->
										<div class="modal" id="DeleteTriagePopUp" tabindex="-1"
											role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Delete Field</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form name="DeleteForm">
															<div class="modal-body">
																<p style="font-size: 20px;">Do you want to delete
																	this input field permanently?</p>
																<input type="hidden" id="sequenceTriageDelete" />
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="TriageDeleteSubmit"
															class="btn btn-primary" data-bs-dismiss="modal">Yes</button>
														<button type="button" class="btn btn-default"
															data-bs-dismiss="modal" aria-label="Close">No</button>
													</div>
												</div>
											</div>
										</div>
										<!-- Triage Summary Delete Pop up -->
										<div class="modal" id="TriageSummaryDeletePopUp" tabindex="-1"
											role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Delete Field</h5>
														<button type="button" id="TriSummDeleteClose"
															class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form name="DeleteForm">
															<div class="modal-body">
																<p style="font-size: 20px;">Do you want to delete
																	this input field permanently?</p>
																<input type="hidden" id="TriSummSequence" />
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="TriSummDeleteSubmit"
															data-bs-dismiss="modal" class="btn btn-primary">Yes</button>
														<button type="button" class="btn btn-default"
															data-bs-dismiss="modal" aria-label="Close">No</button>
													</div>
												</div>
											</div>
										</div>

										<!-- AssessmentCommon Delete Pop Up -->

										<div class="modal" id="AssessDeletePopUp" tabindex="-1"
											role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Delete Field</h5>
														<button type="button" id="AssessDeleteClose" class="close"
															data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form name="DeleteForm">
															<div class="modal-body">
																<p style="font-size: 20px;">Do you want to delete
																	this input field permanently?</p>
																<input type="hidden" id="AssessSequence" /> <input
																	type="hidden" id="DeleteSection" />
															</div>
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="AssessDeleteSubmit"
															class="btn btn-primary">Yes</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal" aria-label="Close">No</button>
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
														<button type="button" id="edit_close" class="close"
															data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form name="PopUpform">
															<div class="row">
																<div class="form-group">
																	<div class="col-lg-8">
																		<label class="control-label" for="formInput526">Label:</label>
																		<input type="text" class="form-control"
																			id="Label_modify" name="label" required>
																	</div>
																</div>
															</div>
															<br /> <input type="text" id="seq_num" name="" value=""
																style="display: none;">
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="submit1" class="btn btn-primary">Submit</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal" aria-label="Close">Cancel</button>

													</div>
												</div>
											</div>
										</div>
										<!--Triage Edit pop up -->
										<div class="modal" id="EditTriagePopUp" tabindex="-1"
											role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Edit Input Field</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form name="PopUpform">
															<div class="row">
																<div class="form-group">
																	<div class="col-lg-8">
																		<label class="control-label" for="formInput526">Label:</label>
																		<input type="text" class="form-control"
																			id="TriageLabelModify" name="label" required>
																	</div>
																</div>
															</div>
															<br />
															<div class="row">
																<div class="form-group">
																	<div class="col-lg-8">
																		<label class="control-label" for="formInput526">Mandatory:</label>
																		<select id="TriageEditMandatory" class="form-select"
																			name="TraigeEditMandatory" required>
																			<option value="Yes">Yes</option>
																		</select>
																	</div>
																</div>
															</div>
															<input type="text" id="TriageEditSeqNum"
																name="TriageEditSeqNum" style="display: none;">
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="TriageEditSubmit"
															class="btn btn-primary" data-bs-dismiss="modal">Submit</button>
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal" aria-label="Close">Cancel</button>

													</div>
												</div>
											</div>
										</div>

										<!-- Triage Summary Edit pop up -->
										<div class="modal" id="TriSummEditPopUp" tabindex="-1"
											role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Edit Input Field</h5>
														<button type="button" id="TriSummEditClose" class="close"
															data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form name="PopUpform">
															<div class="row">
																<div class="form-group">
																	<div class="col-lg-8">
																		<label class="control-label" for="TriageSummary">Label:</label>
																		<input type="text" class="form-control"
																			id="TriSummLabelModify" name="TriSummlabel" required>
																	</div>
																</div>
															</div>
															<br />
															<input type="text" id="TriSummSeqNum" name="" value=""
																style="display: none;">
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="TriSummEditSubmit"
															class="btn btn-primary">Submit</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal" aria-label="Close">Cancel</button>

													</div>
												</div>
											</div>
										</div>

										<!--  Assessment Common Edit Pop up -->

										<div class="modal" id="AssessEditPopUp" tabindex="-1"
											role="dialog">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title">Edit Input Field</h5>
														<button type="button" id="AssessEditClose" class="close"
															data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">&times;</span>
														</button>
													</div>
													<div class="modal-body">
														<form name="PopUpform">
															<div class="row">
																<div class="form-group">
																	<div class="col-lg-8">
																		<label class="control-label" for="Assessment">Label:</label>
																		<input type="text" class="form-control"
																			id="AssessLabelModify" name="Assesslabel" required>
																	</div>
																</div>
															</div>
															<br />
															<input type="text" id="AssessSeqNum" name="" value=""
																style="display: none;"> <input type="text"
																id="EditSection" name="" value="" style="display: none;">
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" id="AssessEditSubmit"
															class="btn btn-primary">Submit</button>
														<button type="button" class="btn btn-default"
															data-dismiss="modal" aria-label="Close">Cancel</button>

													</div>
												</div>
											</div>
										</div>

										<!-- <a id="back-to-top" href="#"
											class="btn btn-light btn-lg back-to-top" role="button"><i
											class="fa fa-arrow-up"></i></a> -->

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
									<button type="button" id="DeleteClose" class="close"
										data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form name="DeleteForm">
										<div class="modal-body">
											<p style="font-size: 20px;">Do you want to delete this
												Row permanently?</p>
											<input type="hidden" id="Sequence" />
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" id="DeleteSubmit" class="btn btn-primary">Yes</button>
									<button type="button" class="btn btn-default"
										data-dismiss="modal" aria-label="Close">No</button>
								</div>
							</div>
						</div>
					</div>
					<!-- Modal -->
					<div class="modal fade" id="myModal modal" tabindex="-1"
						role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog" style="width: 1000px">
							<div id="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
									<h4 class="modal-title" id="myModalLabel"
										style="text-align: center">
										<b>List of Users</b>
									</h4>
									<input type="checkbox" name="signorder" id="signorder"
										style="margin-left: 245px;"> <b>Set signing order</b>
									<input class="searchbox" id="search_bar" type="text"
										placeholder="Search User" name="search"
										style="font-size: 15px" />
								</div>
								<div class="modal-body" style="width: 500px"
									id="user_list_div_id_name"></div>
								<div class="modal-footer" style="height: 80px; padding: 20px">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">Close</button>
									<button type="button" class="btn btn-primary" name="email_id"
										id="email_id" data-dismiss="modal">Send Email</button>
								</div>
							</div>
						</div>
					</div>

					<div class="modal" id="ConfirmationPopUp" tabindex="-1"
						role="dialog">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title">Confirmation for Approval</h5>
									<button type="button" id="ConfirmationClose" class="close"
										data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body">
									<form name="DeleteForm">
										<div class="modal-body">
											<p style="font-size: 20px;">By Approving this opportunity
												overall approval for intake module will be confirmed as
												approved.</p>
											<br />
											<p style="font-size: 20px;">Do you want to allow this?</p>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" id="ConfirmationYes"
										class="btn btn-primary">Yes</button>
									<button type="button" class="btn btn-default"
										id="ConfirmationNo">No</button>
								</div>
							</div>
						</div>
					</div>



				</div>
				<!-- main-page -->
			</div>
			<!-- content-container -->
		</div>
		<!-- content-wrapper -->

	</div>
	
	<!-- main-wrapper -->

	<!-- <script src ="js/IntakeDetails/StakeHolder/StakeHolderDataRetrieve.js"></script> -->
	<link
		href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
		rel="stylesheet">
	<!-- newly added code by parthiban -->
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<link
		href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
		rel="stylesheet">
	<script
		src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>


	<script src="js/toastr/toastr.min.js"></script>
	<script src="js/notification/notification.js"></script>
	<!-- Triage js file -->

	<script src="js/IntakeDetails/IntakeTriage/IntakeTriage.js"></script>
	<script src="js/IntakeDetails/IntakeTriage/AddTemplateTriage.js"></script>
	<script src="js/IntakeDetails/IntakeTriage/AddFeatureAjaxCallTriage.js"></script>
	<script src="js/IntakeDetails/IntakeTriage/EditDeleteToggleTriage.js"></script>
	<script src="js/IntakeDetails/IntakeTriage/EditDeleteAjaxCallTriage.js"></script>
	<script
		src="js/IntakeDetails/IntakeTriage/AddFeatureFunctionalityTriage.js"></script>
	<script src="js/IntakeDetails/IntakeTriage/IntakeTriageSave.js"></script>



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
	<link rel="stylesheet" href="js/amcharts/plugins/export/export.css"
		type="text/css" media="all" />
	<script src="js/amcharts/themes/light.js"></script>
	<script src="js/icheck/icheck.min.js"></script>
	<script src="js/bootstrap-tour/bootstrap-tour.js"></script>

	<!-- ========== THEME JS ========== -->
	<script src="js/production-chart.js"></script>
	<script src="js/traffic-chart.js"></script>
	<script src="js/task-list.js"></script>

	<!-- ========== THEME JS ========== -->
	<script src="js/main.js"></script>
	<script id="scripttag"></script>
	<link
		href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
		rel="stylesheet">
	<!-- newly added code by parthiban -->

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.0/jquery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.3/angular.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.4.3/angular-animate.js"></script>

	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<link
		href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
		rel="stylesheet">
	<script
		src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>

	<script>
      var app = angular.module("btn", []);

      app.controller("MainCtrl", function($scope) {
          

        
      });

      </script>

	<script src="js/navigation/navigation.js"></script>
	<!-- ========== Toastr ========== -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
	<script src ="js/IntakeDetails/IntakePreviewDetails/IntakePreviewDataRetrieve.js"></script>
	
</body>
</html>

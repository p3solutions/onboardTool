<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>D3Sixty - Intake</title>
<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/bootstrap.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
	media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
	media="screen">
<link rel="stylesheet" href="css/UserInfo/userinfo.css">
<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/Intake/Intake.css" type="text/css" />
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/IntakeDetails/StakeHolder/StakeHolderDataRetrieve.js"></script>
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
<style>
<
style type ="text /css ">body {
	background: #fff;
}

.page-title-div {
	background: #1565c0;
	padding: 15px;
}

.fixed-top {
	width: 100%;
	padding-left: 0px;
	padding-right: 0px;
}

<!--
Wizard-->body {
	background-color: #ffffff;
	color: #444444;
	font-family: 'Roboto', sans-serif;
	font-size: 16px;
	font-weight: 300;
	margin: 0;
	padding: 0;
}

.wizard-content-left {
	background-blend-mode: darken;
	background-color: rgba(0, 0, 0, 0.45);
	background-image: url("https://i.ibb.co/X292hJF/form-wizard-bg-2.jpg");
	background-position: center center;
	background-size: cover;
	height: 100vh;
	padding: 30px;
}

.wizard-content-left h1 {
	color: #ffffff;
	font-size: 38px;
	font-weight: 600;
	padding: 12px 20px;
	text-align: center;
}

.form-wizard {
	color: #888888;
}

.form-wizard .wizard-form-radio {
	display: inline-block;
	margin-left: 5px;
	position: relative;
}

.form-wizard .wizard-form-radio input[type="radio"] {
	-webkit-appearance: none;
	-moz-appearance: none;
	-ms-appearance: none;
	-o-appearance: none;
	appearance: none;
	background-color: #dddddd;
	height: 25px;
	width: 25px;
	display: inline-block;
	vertical-align: middle;
	border-radius: 50%;
	position: relative;
	cursor: pointer;
}

.form-wizard .wizard-form-radio input[type="radio"]:focus {
	outline: 0;
}

.form-wizard .wizard-form-radio input[type="radio"]:checked {
	background-color: #fb1647;
}

.form-wizard .wizard-form-radio input[type="radio"]:checked::before {
	content: "";
	position: absolute;
	width: 10px;
	height: 10px;
	display: inline-block;
	background-color: #ffffff;
	border-radius: 50%;
	left: 1px;
	right: 0;
	margin: 0 auto;
	top: 8px;
}

.form-wizard .wizard-form-radio input[type="radio"]:checked::after {
	content: "";
	display: inline-block;
	webkit-animation: click-radio-wave 0.65s;
	-moz-animation: click-radio-wave 0.65s;
	animation: click-radio-wave 0.65s;
	background: #000000;
	content: '';
	display: block;
	position: relative;
	z-index: 100;
	border-radius: 50%;
}

.form-wizard .wizard-form-radio input[type="radio"] ~ label {
	padding-left: 10px;
	cursor: pointer;
}

.form-wizard .form-wizard-header {
	text-align: center;
}

.form-wizard .wizard-fieldset {
	display: none;
}

.form-wizard .wizard-fieldset.show {
	display: block;
}

.form-wizard .wizard-form-error {
	display: none;
	background-color: #d70b0b;
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	height: 2px;
	width: 100%;
}

.form-wizard .form-control:focus {
	box-shadow: none;
}

.form-wizard .form-group {
	position: relative;
	margin: 25px 0;
}

.form-wizard .wizard-form-text-label {
	position: absolute;
	left: 10px;
	top: 16px;
	transition: 0.2s linear all;
}

.form-wizard .focus-input .wizard-form-text-label {
	color: #d65470;
	top: -18px;
	transition: 0.2s linear all;
	font-size: 12px;
}

.form-wizard .form-wizard-steps {
	margin: 30px 0;
}

.form-wizard .form-wizard-steps li {
	width: 14%;
	float: left;
	position: relative;
}

.form-wizard .form-wizard-steps li::after {
	background-color: #f3f3f3;
	content: "";
	height: 5px;
	left: 0;
	position: absolute;
	right: 0;
	top: 50%;
	transform: translateY(-50%);
	width: 100%;
	border-bottom: 1px solid #dddddd;
	border-top: 1px solid #dddddd;
}

.form-wizard .form-wizard-steps li span {
	background-color: #dddddd;
	border-radius: 50%;
	display: inline-block;
	height: 40px;
	line-height: 40px;
	position: relative;
	text-align: center;
	width: 40px;
	z-index: 1;
}

.form-wizard .form-wizard-steps li:last-child::after {
	width: 50%;
}

.form-wizard .form-wizard-steps li.active span, .form-wizard .form-wizard-steps li.activated span
	{
	background-color: #1565c0;
	color: #ffffff;
}

.form-wizard .form-wizard-steps li.active::after, .form-wizard .form-wizard-steps li.activated::after
	{
	background-color: #1565c0;
	left: 50%;
	width: 50%;
	border-color: #1565c0;
}

.form-wizard .form-wizard-steps li.activated::after {
	width: 100%;
	border-color: #1565c0;
}

.form-wizard .form-wizard-steps li:last-child::after {
	left: 0;
}

.form-wizard .wizard-password-eye {
	position: absolute;
	right: 32px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
}

@
keyframes click-radio-wave { 0% {
	width: 25px;
	height: 25px;
	opacity: 0.35;
	position: relative;
}

100
%
{
width
:
60px;
height
:
60px;
margin-left
:
-15px;
margin-top
:
-15px;
opacity
:
0.0;
}
}
@media screen and (max-width: 767px) {
	.wizard-content-left {
		height: auto;
	}
}

fieldset {
	padding: 0.875em 1.75em 1.75em;
	border-width: 1px #fff;
	border-style: solid;
	max-width: 141%;
	margin-bottom: 1.875em;
}

.form-wizard-steps li  i {
	position: absolute;
	top: -22px;
	font-style: normal;
	font-weight: 400;
	white-space: nowrap;
	left: 50%;
	transform: translate(-50%, -50%);
	font-size: 14px;
	/* font-weight: 700; */
	color: #000;
}

.form-wizard-steps li  i {
	color: rgba(0, 0, 0, .9);
}

.back-to-top {
	position: fixed;
	bottom: 20px;
	right: 35px;
	border-radius: 50%;
	background: Gray;
}

.fa {
	padding-left: 3px;
	padding-top: -3px;
	padding-bottom: 10px;
	margin: 0 auto;
	font-size: 14x;
	color: #fff;
}

#module_header {
	margin-top: 75px;
}

table {
	width: 92%;
	border-spacing: 0;
	margin-bottom: 2.375em;
	border-style: none;
}

.pdf {
	float: right;
	margin-top: -36px;
}

.pdf {
	background: #1565c0;
}

.switch {
	position: relative;
	display: inline-block;
	width: 60px;
	height: 34px;
}

.switch input {
	opacity: 0;
	width: 0;
	height: 0;
}

.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: #ccc;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input:checked+.slider {
	background-color: #2196F3;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(26px);
}
/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}

.userlist {
	width: 95%;
}

input[type="text"] {
	font-size: 12px;
}
</style>
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
	<%@page import="org.owasp.encoder.Encode"%>
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
						<a href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><span
							class="glyphicon glyphicon-home"></span> Home</a> >> <a
							href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><%=Encode.forHtml(OpportunityName)%></a>>><a
							href="OpportunityGrid.jsp" id="sitetitle1" style="color: #fff">Intake</a>
						>> <a href="IntakeOpportunity.jsp" id="sitetitle1"
							style="color: #fff">Opportunity</a> >> <a href="IntakeTriage.jsp"
							id="sitetitle1" style="color: #fff">Triage</a> >> <a
							href="IntakeTriageSummary.jsp" id="sitetitle1"
							style="color: #fff">Triage Summary</a> >> <a
							href="IntakeAssessment.jsp" id="sitetitle1" style="color: #fff">Assessment</a>
						>>Stake Holder
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
	<form class="form-signin" name="loginForm" method="post">
		<div class="main-wrapper">
			<!-- ========== TOP NAVBAR ========== -->
			<!-- ========== TOP NAVBAR ========== -->
			<!--  <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding" style = "height : 100px;">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/D3Sixty_logo.png" alt="D3Sixty" class="logo" style = "margin-top : 50px;">
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
                          <a  href="IntakeOpportunity.jsp" id="sitetitle1" style="color:#fff">
                           Opportunity</a> >>
                          <a  href="IntakeTriage.jsp" id="sitetitle1" style="color:#fff">
                           Triage</a> >>
                            <a  href="IntakeTriageSummary.jsp" id="sitetitle1" style="color:#fff">
                           TriageSummary</a> >>
                            <a  href="IntakeAssessment.jsp" id="sitetitle1" style="color:#fff">
                           Assessment</a> >>
                            <a  href="IntakeStakeHolder.jsp" id="sitetitle1" style="color:#fff">
                           StakeHolder</a>
                         </p>
                    </div>
                </div>
            </nav>
        </div>
        /.container-fluid
    </nav > -->
		</div>
			<div class="content-wrapper">
				<div class="content-container">
					<div class="main-page">
						<section>
							<div class="row">
								<div class="container">
									<div class=" col-md-12">
										<div class="form-wizard">
											<form action="" method="post" role="form">
												<br /> <br />
												<div class="form-wizard-header">
													<!-- <p style="font-size: 14px;">Fill all the required fields to go next step</p> -->
													<ul class="list-unstyled form-wizard-steps clearfix">
														<li class="activated"
															onclick="location.href='IntakeOpportunity.jsp;'"><span>1</span><i>Opportunity</i></li>
														<li class="activated"
															onclick="location.href='IntakeTriage.jsp';"><span>2</span><i>Triage</i></li>
														<li class="activated"
															onclick="location.href='IntakeTriageSummary.jsp';"><span>3</span><i>Triage
																Summary</i></li>
														<li class="activated"
															onclick="location.href='IntakeAssessment.jsp';"><span>4</span><i>Assessment</i></li>
														<li class="active"
															onclick="location.href='IntakeStakeHolder.jsp';"><span>5</span>
															<i>Stake Holder</i></li>
														<li onclick="location.href='IntakeReviewDetails.jsp';"><span>6</span><i>Review</i></li>
														<li onclick="location.href='IntakeApproval.jsp';"
															id="ReviewNextBtn"><span>7</span><i>Approval</i></li>
													</ul>
												</div>
												<div class="card-container card">
													<div class="card-header" id="cd-header">Stake Holder</div>
													<div class="panel-collapse" name="collapse">
														<div class="card-body">
															<div>
																<h4>User List</h4>
																<div class="">
																	<table class="table-bordered" style="width: 100%;">
																		<thead>
																			<tr>
																				<th>Name</th>
																				<th>Email</th>
																				<th>User Name</th>
																				<th>Role</th>
																				<th>Priority Order No.</th>
																				<th>Action</th>
																			</tr>
																		</thead>
																		<tbody id="UserList">
																		</tbody>
																	</table>
																</div>
															</div>
															<!--  <div class="col-md-12">
                                                            <div class="col-md-1">
                                                                <button type="button" class="btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='IntakeAssessment.jsp';">Prev</button>
                                                            </div>
                                                            <div class="col-md-2" style="padding-top: 10px; padding-right: 10px; float: right; width:25%;">
                                                                <button class="btn btn-primary" type="button" id="AddStakeUserBtn">Add</button>
                                                                <button type="submit" class="btn btn-success" id="save">Save</button>
                                                                <button type = "button"class="btn btn-info" id = "NextStakeHolder"  style="display:none;">Next</button>
                                                               <a href="javascript:;" class="form-wizard-next-btn float-right btn btn-info" onclick="location.href='IntakeReviewDetails.jsp';" >Next</a>         
                                                                <button class="form-wizard-next-btn float-right btn-info btn btn-info" onclick="location.href='IntakeReviewDetails.jsp';" id="next" disabled="true">
                                                                 <a href="javascript:;">Next</a>
                                                                 </button> 
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" data-toggle="modal" data-target="#EditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-toggle="modal" data-target="#DeletePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                                            </div>
                                                    </div> -->
															<div class="row">
																<div class="col-4">
																	<button type="button" class="btn btn-secondary"
																		onclick="location.href='IntakeAssessment.jsp';">Prev</button>
																</div>
																<div class="col-8" align="end">
																	<button class="btn btn-secondary" type="button"
																		id="AddStakeUserBtn">Add</button>
																	<button type="submit" class="btn btn-primary" id="edit">Edit</button>
																	<button type="submit" class="btn btn-primary"
																		id="complete" disabled="true">Complete</button>
																	<button type="submit" class="btn btn-primary" id="save">Save</button>
																	<!-- <button type = "button"class="btn btn-info" id = "NextStakeHolder"  style="display:none;">Next</button> -->
																	<!-- <button
                                                                        class="form-wizard-next-btn float-right btn-info btn btn-info"
                                                                        onclick="location.href='IntakeReviewDetails.jsp';"
                                                                        id="next" disabled="true">
                                                                        <a href="javascript:;" style="color: #fff;">Next</a>
                                                                    </button> -->
																	<button type="button" class="btn btn-primary"
																		onclick="location.href='IntakeReviewDetails.jsp';"
																		id="next" disabled="true">Next</button>
																	<button type="button"
																		class="btn btn-primary pull-right" id="editpopup_btn"
																		data-bs-toggle="modal" data-bs-target="#EditPopUp"
																		style="display: none;">Edit PopUp</button>
																	<button type="button"
																		class="btn btn-primary pull-right"
																		id="deletepopup_btn" data-bs-toggle="modal"
																		data-bs-target="#DeletePopUp" style="display: none;">Delete
																		PopUp</button>
																	<button type="button"
																		class="btn btn-primary pull-right"
																		id="TriageSummaryListbtn"
																		onclick="window.location.href='IntakeDetails.jsp';"
																		style="display: none;"></button>
																</div>
															</div>
														</div>
													</div>
												</div>
										</div>
									</div>
						</section>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- Delete Row Pop Up  -->
	<div class="modal" id="DeletePopUp" tabindex="-1" role="dialog">
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
							<p style="font-size: 20px;">Do you want to delete this Row
								permanently?</p>
							<input type="hidden" id="Sequence" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" id="DeleteSubmit" class="btn btn-primary"
						data-bs-dismiss="modal">Yes</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" aria-label="Close">No</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	</div>
	<%@include file="Footer.jspf"%>

	<!-- Date picker -->
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
	<script src="js/IntakeDetails/StakeHolder/IntakeStakeHolderAddRow.js"></script>
	<script src="js/IntakeDetails/StakeHolder/IntakeStakeHolderSave.js"></script>
	<!-- <script>
        function myFunction() {
            let today = new Date().toISOString().substr(0, 10);
            document.getElementById('creation_date').value = today;
        }
    </script> -->
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
<script>
jQuery(document).ready(function() {
    // click on next button
    jQuery('.form-wizard-next-btn').click(function() {
        var parentFieldset = jQuery(this).parents('.wizard-fieldset');
        var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
        var next = jQuery(this);
        var nextWizardStep = true;
        parentFieldset.find('.wizard-required').each(function(){
            var thisValue = jQuery(this).val();
            if( thisValue == "") {
                jQuery(this).siblings(".wizard-form-error").slideDown();
                nextWizardStep = false;
            }
            else {
                jQuery(this).siblings(".wizard-form-error").slideUp();
            }
        });
        if( nextWizardStep) {
            next.parents('.wizard-fieldset').removeClass("show","400");
            currentActiveStep.removeClass('active').addClass('activated').next().addClass('active',"400");
            next.parents('.wizard-fieldset').next('.wizard-fieldset').addClass("show","400");
            jQuery(document).find('.wizard-fieldset').each(function(){
                if(jQuery(this).hasClass('show')){
                    var formAtrr = jQuery(this).attr('data-tab-content');
                    jQuery(document).find('.form-wizard-steps .form-wizard-step-item').each(function(){
                        if(jQuery(this).attr('data-attr') == formAtrr){
                            jQuery(this).addClass('active');
                            var innerWidth = jQuery(this).innerWidth();
                            var position = jQuery(this).position();
                            jQuery(document).find('.form-wizard-step-move').css({"left": position.left, "width": innerWidth});
                        }else{
                            jQuery(this).removeClass('active');
                        }
                    });
                }
            });
        }
    });
    //click on previous button
    jQuery('.form-wizard-previous-btn').click(function() {
        var counter = parseInt(jQuery(".wizard-counter").text());;
        var prev =jQuery(this);
        var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
        prev.parents('.wizard-fieldset').removeClass("show","400");
        prev.parents('.wizard-fieldset').prev('.wizard-fieldset').addClass("show","400");
        currentActiveStep.removeClass('active').prev().removeClass('activated').addClass('active',"400");
        jQuery(document).find('.wizard-fieldset').each(function(){
            if(jQuery(this).hasClass('show')){
                var formAtrr = jQuery(this).attr('data-tab-content');
                jQuery(document).find('.form-wizard-steps .form-wizard-step-item').each(function(){
                    if(jQuery(this).attr('data-attr') == formAtrr){
                        jQuery(this).addClass('active');
                        var innerWidth = jQuery(this).innerWidth();
                        var position = jQuery(this).position();
                        jQuery(document).find('.form-wizard-step-move').css({"left": position.left, "width": innerWidth});
                    }else{
                        jQuery(this).removeClass('active');
                    }
                });
            }
        });
    });
    //click on form submit button
    jQuery(document).on("click",".form-wizard .form-wizard-submit" , function(){
        var parentFieldset = jQuery(this).parents('.wizard-fieldset');
        var currentActiveStep = jQuery(this).parents('.form-wizard').find('.form-wizard-steps .active');
        parentFieldset.find('.wizard-required').each(function() {
            var thisValue = jQuery(this).val();
            if( thisValue == "" ) {
                jQuery(this).siblings(".wizard-form-error").slideDown();
            }
            else {
                jQuery(this).siblings(".wizard-form-error").slideUp();
            }
        });
    });
    // focus on input field check empty or not
    jQuery(".form-control").on('focus', function(){
        var tmpThis = jQuery(this).val();
        if(tmpThis == '' ) {
            jQuery(this).parent().addClass("focus-input");
        }
        else if(tmpThis !='' ){
            jQuery(this).parent().addClass("focus-input");
        }
    }).on('blur', function(){
        var tmpThis = jQuery(this).val();
        if(tmpThis == '' ) {
            jQuery(this).parent().removeClass("focus-input");
            jQuery(this).siblings('.wizard-form-error').slideDown("3000");
        }
        else if(tmpThis !='' ){
            jQuery(this).parent().addClass("focus-input");
            jQuery(this).siblings('.wizard-form-error').slideUp("3000");
        }
    });
});
</script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
	href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
	rel="stylesheet">
<script
	src="js/IntakeDetails/IntakePreviewDetails/IntakePreviewDataRetrieve.js"></script>
</html>
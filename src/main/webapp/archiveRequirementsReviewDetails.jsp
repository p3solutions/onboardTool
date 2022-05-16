<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Decom3Sixty - Intake</title>

<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
    media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
    media="screen">
 <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/Intake/Intake.css" type="text/css" />

<!-- =========== Header Icon ========= -->
 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/> 
 <link rel="stylesheet" href="css/headerIcon/headerIcon.css" media="screen" >


<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/common/email/emailAjaxCall.js"></script>
<script src ="js/pdf/downloadPDF_AjaxCall.js"></script>
<script src ="js/pdf/deletePDF_AjaxCall.js"></script>
<script src ="js/IntakeDetails/IntakePreviewDetails/IntakePreviewDataRetrieve.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="js_in_pages/requirements.css" type="text/css"/>

<link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">


<style>

         
body{
background:#fff;
}


.page-title-div {
background:#1565c0;
padding: 15px; 
}
.fixed-top{
width:100%;
padding-left: 0px;
padding-right: 0px;
}
<!-- Wizard-->

body {
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

/* .form-wizard {
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
} */
/* .form-wizard .form-wizard-steps li.active span, .form-wizard .form-wizard-steps li.activated span {
  background-color: #0db02b;
  color: #ffffff;
} */
/* .form-wizard .form-wizard-steps li.active::after, .form-wizard .form-wizard-steps li.activated::after {
  background-color: #0db02b;
  left: 50%;
  width: 50%;
  border-color:#0db02b ;
}
.form-wizard .form-wizard-steps li.activated::after {
  width: 100%;
  border-color: #0db02b;
}
.form-wizard .form-wizard-steps li:last-child::after {
  left: 0;
}
.form-wizard .wizard-password-eye {
  position: absolute;
  right: 32px;
  top: 50%;
  transform: translateY(-50%);
  cursor: pointer; */
}
@keyframes click-radio-wave {
  0% {
    width: 25px;
    height: 25px;
    opacity: 0.35;
    position: relative;
  }
  100% {
    width: 60px;
    height: 60px;
    margin-left: -15px;
    margin-top: -15px;
    opacity: 0.0;
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

/* .form-wizard-steps li  i{
	position: absolute;
    top: -22px;
    font-style: normal;
    font-weight: 400;
    white-space: nowrap;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 14px;
    font-weight: 700;
    color: #000;
}

.form-wizard-steps li  i{
	color: #d65470;
} */
.back-to-top {
    position: fixed;
    bottom: 20px;
    right: 35px;
    
    border-radius:50%;
    background:Gray;
}

.fa{
padding-left:3px;
padding-top:-3px;
padding-bottom:10px;
margin:0 auto;
font-size:14x;
color:#fff;

}
	#module_header{
 
 margin-top:75px;
 }
 
 
table {
    width: 92%;
    border-spacing: 0;
    
    margin-bottom: 2.375em;
    border-style:none;
} 


.pdf{

float:right;
    margin-top: -36px;

}
.pdf{
background:#1565c0;
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

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
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

.userlist{

width:95%;

}

input[type="text"]{

font-size:12px;

}

.active1{
    background:#1565c0;
}
 .page-title-div {
    background:#1565c0;
	padding: 15px;  
}

.form-wizard .form-wizard-steps {
margin: -6px 0;
}

#overlay{
position: fixed;
top: 0;
z-index: 100;
width:1500px;
height:100%;
display: none;
background: rgb(0,0,0,0.6);
}
.cv-spinner {
height: 100%;
display: flex;
justify-content: center;
align-items: center;
}
.spinner {
width: 40px;
height: 40px;
border: 4px #ddd solid;
border-top: 4px #2e93e6 solid;
border-radius: 50%;
animation: sp-anime 0.8s infinite linear;
}
@keyframes sp-anime {
100% {
transform: rotate(360deg);
}
}
.is-hide{
display:none;
}
</style>

</head>
<body class="top-navbar-fixed">
    <form class="form-signin" name="loginForm" method="post">
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
<!-- <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
               <div class="navbar-header no-padding" style = "height : 100px;">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/Decom3Sixty_logo.png" alt="Decom3Sxity" class="logo" style = "margin-top : 50px;">
                    </a>
                </div>
                /.navbar-header
                <div class="tabs-content">
                  <ul class="nav navbar-nav headerTab navAlign">
		              <li class="active1"><a href="OpportunityList.jsp" style= "color:#fff;"><i class="fad fa-folders fa-2x iconAlign activeIcon"></i>Applications</a></li>
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
                          <p class="sub-title" style="color:#fff ; margin-right: -26px; "> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a>  >> <a  href="ArchiveRequirementsIntroDetails.jsp" id="sitetitle1" style="color:#fff">
                           Introduction</a> >>
                           <a  href="archiveRequirementsLegacyDetails.jsp" id="sitetitle1" style="color:#fff">
                           Legacy Application Info</a> >>
                           <a  href="archiveRequirementsRetentionDetails.jsp" id="sitetitle1" style="color:#fff">
                           Retention Details</a> >> 
                           <a  href="ArchiveBusinessRequirements.jsp" id="sitetitle1" style="color:#fff">
                           Business Requirements</a> >>
                            <a  href="archiveReqAbbrevation.jsp" id="sitetitle1" style="color:#fff">
                           Abbreviations</a> >>
                           <a  href="archiveRequirementsDocumentRevisions.jsp" id="sitetitle1" style="color:#fff">
                           Document Revision</a> >> 
                            <a  href="archiveRequirementsAddendum.jsp" id="sitetitle1" style="color:#fff">
                           Addendum</a> >> Review </p>

                    </div>

                </div></div>
			</nav>
      
        </div>
        /.container-fluid
    </nav >
      
        </div>
        /.container-fluid
   <br/>
   <br/>
   <br/> -->
   
   <%@include file="Nav-Bar.jspf"%>
		<nav class="nav nav-height-70 nav-font" id="bg-color"
			style="font-size: 14px;">
			<div class="container-fluid" id="container-fluid-margin">
				<div class="row" id="d3s-mt-10">
						<div class="col-lg-12 col-md-12">
							<div class="sub-title" style="color: #fff">
								<a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >> <%=OpportunityName%> >> <a  href="ArchiveRequirementsIntroDetails.jsp" id="sitetitle1" style="color:#fff">
                           			Introduction</a> >>
                           		<a  href="archiveRequirementsLegacyDetails.jsp" id="sitetitle1" style="color:#fff">
                           			Legacy Application Info</a> >>
                           		<a  href="archiveRequirementsRetentionDetails.jsp" id="sitetitle1" style="color:#fff">
                           			Retention Details</a> >> 
                           		<a  href="ArchiveBusinessRequirements.jsp" id="sitetitle1" style="color:#fff">
                           			Business Requirements</a> >>
                            	<a  href="archiveReqAbbrevation.jsp" id="sitetitle1" style="color:#fff">
                           			Abbreviations</a> >>
                           		<a  href="archiveRequirementsDocumentRevisions.jsp" id="sitetitle1" style="color:#fff">
                           			Document Revision</a> >> 
                            	<a  href="archiveRequirementsAddendum.jsp" id="sitetitle1" style="color:#fff">
                           			Addendum</a> >> Review 
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
            <div class="col-md-12">
								<div style="margin-bottom: -138px;" class="form-wizard">
						<div class="form-wizard-header">
							
							<ul class="list-unstyled form-wizard-steps clearfix nav-font" style="margin-left:23px;">
							<!-- <p class="nav-font" style="margin-bottom: -52px;">Fill all the required fields to go next step</p> -->
								<li class="activated" onclick="location.href='ArchiveRequirementsIntroDetails.jsp;'"><span>1</span><i>Introduction</i></li>
								<li class="activated" onclick="location.href='archiveRequirementsLegacyDetails.jsp;'"><span>2</span><i>Legacy Application Info</i></li>
								<li class="activated" onclick="location.href='archiveRequirementsRetentionDetails.jsp;'"><span>3</span><i>Retention Details</i></li>
								<li class="activated" onclick="location.href='ArchiveBusinessRequirements.jsp';"><span>4</span><i>Business requirements</i></li>
								<li class="activated" onclick="location.href='archiveReqAbbrevation.jsp;'"><span>5</span><i>Abbreviations</i></li>
								<li class="activated" onclick="location.href='archiveRequirementsDocumentRevisions.jsp;'"><span>6</span><i>Revisions</i></li>
								<li class="activated" onclick="location.href='archiveRequirementsAddendum.jsp;'"><span>7</span><i>Addendum</i></li>
								<li class="active" onclick="location.href='archiveRequirementsReviewDetails.jsp;'"><span>8</span><i>Review</i></li>
								<li onclick="location.href='archiveRequirementsApprovalDetails.jsp;'"><span>9</span><i>Approval</i></li>
						
							</ul>
						</div>
						</div></div>
				<div id="overlay">
					<div class="cv-spinner">
						<span class="spinner"></span>
					</div>
				</div>
				<div class="content-container" >
                   
                    <div class="main-page">
                        
                        <section>
                            <div class="row">
                                <div class="container" id="module_header">
                                  <div class=" col-md-12">
				<div class="form-wizard">
					<form action="" method="post" role="form">
                                    <div id="editor"></div>
                                         <div class="card-container-1 card" id="d3s-mt-80">
                                            <div class="card-header" id="cd-header">
                                               
                                                  Archive Requirements Summary
                                                <button id="exportPdf" class="btn btn-primary align-right"  style="margin-top: -4px;" ><span
                                                    class="glyphicon glyphicon-download-alt"></span> Export Pdf
                                                 </button>
                                            </div>
                                            <div class="panel-collapse "
                                                name="collapse">
                                                <div class="panel-body" >
                                                      
                                                      <div class="container"  >
  
                                            <div bgcolor='#e4e4e4' style='font-family:Arial,Helvetica,sans-serif;'
                                                 id="table-scroll">
                                          
                                                <table  >
                                                    <tbody>
                                                    <tr>
                                                        <td>
                                                            <table width='780' border='0' align='center' id="d1">

                                                                <tbody>


                                                
                                                        
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                 <h3 class="panel-title">1 Introduction</h3><br>
                                                        <h3 class="panel-title">1.1 Purpose & Scope</h3><br>
                                                         	<div id="purposeInfoPreview"></div>
                                                            <div id="scopeInfoPreview"></div>
                                                        <!--  <h3 class="panel-title">1.2 Roles & Responsibilites</h3><br>
                                                         <table class='table-bordered'>
                                                         <thead>
                                                         <th scope='col'>Role</th>
                                                         <th scope='col'>Name</th>
                                                         <th scope='col'>Email</th>
                                                         <th scope='col'>Username </th>
                                                         <th scope='col'>Priority </th>
                                                         </thead>
                                                        	<tbody id="roleResponseInfoPreview">  </tbody>
                                                        	</table> -->
                                                        	</td></tr>
                                                        	
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <h3 class="panel-title">1.2 Assumptions</h3> <br>
                                                        <div id="AssumptionInfoPreview"> </div>  </td> </tr>
                                                        
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                       <h3 class="panel-title">2 Legacy Application Information</h3> <br>
                                                        <h3 class="panel-title">2.1 Application Information</h3> <br>
                                                        <table class='table-bordered'><tbody id="AppInfoPreview"></tbody></table> 
                                                        <h3 class="panel-title">2.2 Archive Environment Information</h3> <br>
                                                        <h3 class="panel-title">2.2.1 Archive Environment</h3> <br>
                                                        <table class='table-bordered'>
                                                         <thead>
                                                         <th scope='col'>Dev Name</th>
                                                         <th scope='col'>Test Name</th>
                                                         <th scope='col'>Stage Name</th>
                                                         <th scope='col'>Production Name</th>
                                                         </thead>
                                                        	<tbody id="ArchiveEnvInfoPreview">  </tbody>
                                                        	</table> 
                                                        <table class='table-bordered'>
                                                         <thead>
                                                         <th scope='col'>Dev Server IP</th>
                                                         <th scope='col'>Test Server IP</th>
                                                         <th scope='col'>Stage Server IP</th>
                                                         <th scope='col'>Production Server IP</th>
                                                         </thead>
                                                        	<tbody id="ArchiveEnvServerInfoPreview">  </tbody>
                                                        	</table> 
                                                        <h3 class="panel-title">2.3 Legacy Application Screenshots</h3> <br>
                                                  <div class="content table-responsive" id="leg_scr">
															<table class='table-bordered'
																id="datatable">
																<thead>

																	
																	
																	<th style="text-align:center;">File Name</th>
																	<th style="text-align:center;">Action</th>
																
																</thead>
																<tbody id ="Legacy_Scr_List">
      												    											
      												</tbody></table></div>
      												
																					   
                                                        <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                       <h3 class="panel-title">3 Retention Details</h3> <br></form>
                                                        <div id="RetentionDetailsInfoPreview">  </div> 
                                                        </br>
                                                        <table class='table-bordered'>
                                                         <thead>
                                                         <th>Retention Level (Select all Used)</th>
                                                         <th>Retention Level</th>
                                                         <th>Condition (If applicable)</th>
                                                         <th>Date Used</th>
                                                         <th>Description</th>
                                                         </thead>
                                                        	<tbody id="RetentionInfoPreview">  </tbody>
                                                        	</table> 
                                                          <br>
                                                        </td> </tr>
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div> <h2 class="panel-title">4 Business Requirements</h2> <br>
                                                         <div id="BusinessReqHeaderInfo"></div>
                                                        <h3 class="panel-title">4.1 Requirement In Scope</h3><br>
                                                        <table class='table-bordered'>
                                                         <thead>
                                                         <th>Req In-Scope(Y/N)</th>
                                                         <th>Description</th>
                                                         </thead>
                                                         <tbody id="BusinessReqTableInfoPreview">  </tbody>
                                                         </table> 
                                                        <br>
                                                         <h3 class="panel-title">4.2 Functional Requirement</h3><br>
                                                         <h3 class="panel-title">4.2.1 Data Requirements</h3><br>
                                                          <table class='table-bordered'>
                                                          <thead>
                                                          <th>Req Id</th>
                                                          <th>Req In-Scope(Y/N)</th>
                                                          <th>Requirement Type</th>
                                                          <th>Requirement</th>
                                                          <th>Additional Info</th>
                                                          </thead>
                                                          <tbody id='FunctionReqDataReqInfoPreview'>
                                                          </tbody>
                                                          </table><br>
                                                          <h3 class="panel-title">4.2.2 Retention and Legal Requirements</h3><br>
                                                          <table class='table-bordered'>
                                                          <thead>
                                                          <th>Req Id</th>
                                                          <th>Req In-Scope(Y/N)</th>
                                                          <th>Requirement Type</th>
                                                          <th>Description</th>
                                                          <th>Additional Info</th>
                                                          </thead>
                                                          <tbody id='FunctionReqRetentionLegalReqInfoPreview'>
                                                          </tbody>
                                                          </table>
                                                           <br>
                                                           <h3 class="panel-title">4.2.3 Security Requirements</h3><br>
                                                            <table class='table-bordered'>
                                                          <thead>
                                                          <th>Req Id</th>
                                                          <th>Req In-Scope(Y/N)</th>
                                                          <th>Requirement Type</th>
                                                          <th>Description</th>
                                                          <th>Additional Info</th>
                                                          </thead>
                                                          <tbody id='FunctionReqSecurityReqInfoPreview'>
                                                          </tbody>
                                                          </table><br>
                                                          <h3 class="panel-title">4.2.4 Usability  Requirements</h3><br>
                                                            <table class='table-bordered'>
                                                          <thead>
                                                          <th>Req Id</th>
                                                          <th>Req In-Scope(Y/N)</th>
                                                          <th>Requirement Type</th>
                                                          <th>Description</th>
                                                          <th>Additional Info</th>
                                                          </thead>
                                                          <tbody id='FunctionReqUsabilityReqInfoPreview'>
                                                          </tbody>
                                                          </table><br>
                                                          <h3 class="panel-title">4.2.5 Audit  Requirements</h3><br>
                                                            <table class='table-bordered'>
                                                          <thead>
                                                          <th>Req Id</th>
                                                          <th>Req In-Scope(Y/N)</th>
                                                          <th>Requirement Type</th>
                                                          <th>Description</th>
                                                          <th>Additional Info</th>
                                                          </thead>
                                                          <tbody id='FunctionReqAuditReqInfoPreview'>
                                                          </tbody>
                                                          </table><br>
                                                          </br>
                                                          <h3 class="panel-title">4.3 Screen Requirements</h3><br>
                                                            <table class='table-bordered'>
                                                          <thead>
                                                          <th>Req Id</th>
                                                          <th>Screen Display Name in Infoarchive</th>
                                                          <th>Purpose</th>
                                                          <th>Equivalent in the Legacy Application</th>
                                                          </thead>
                                                          <tbody id='ScreenReqInfoPreview'>
                                                          </tbody>
                                                          </table><br>
                                                          <table class='table-bordered'>
                                                          <thead>
                                                          <th>Req Id</th>
                                                          <th>Search Form Name</th>
                                                          <th>Search Field Name</th>
                                                          <th>Field Format</th>
                                                          <th>Data Type</th>
                                                          <th>Data Retrieval Requirement</th>
                                                          <th>Required Field</th>
                                                          <th>Search Field Additional Information</th>
                                                          </thead>
                                                          <tbody id='SearchFormInfoPreview'>
                                                          </tbody>
                                                          </table>
                                                        </div> </td> </tr>
                                                        
                                                 <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                       <h3 class="panel-title">5 Abbrevations, Acronyms, Definitions</h3><br><br>
                                                        <table class='table-bordered'>
                                                          <thead>
                                                          <th>Abbrevation/Acronym</th>
                                                          <th>Description</th>
                                                          </thead>
                                                          <tbody id='AbbrevationDescriptionInfoPreview'>
                                                          </tbody>
                                                          </table > </td> </tr>
                                                 <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                       <h3 class="panel-title">6 Document Revisions</h3><br><br>
                                                        <table class='table-bordered'>
                                                          <thead>
                                                          <th>Date</th>
                                                          <th>Version No</th>
                                                          <th>Document Changes</th>
                                                          <th>Change Author</th>
                                                          </thead>
                                                          <tbody id='documentRevisionsInfoPreview'>
                                                          </tbody>
                                                          </table></div> </td> </tr>
                                                   <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                       <h3 class="panel-title">7 Addendum</h3><br><br>
                                                        <div id = "addendumInfoPreview">
                                                        </div>
                                                        </td> </tr>
                                                        <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                      <!--  <h3 class="panel-title">8 Approval Details</h3><br><br>
                                                        <table class='table-bordered'>
                                                          <thead>
                                                          <th>Role</th>
                                                          <th>Name</th>
                                                          <th>Email</th>
                                                          <th>Username</th>
                                                          <th>Priority</th>
                                                          <th>Approval Status</th>
                                                          
  </thead>
                                                          <tbody id='approvalInfoPreview'>
                                                          </tbody>
                                                          </table> -->
                                                           <h3 class="panel-title">8 Roles & Responsibilites</h3><br>
                                                         <table class='table-bordered'>
                                                         <thead>
                                                         <th scope='col'>Role</th>
                                                         <th scope='col'>Name</th>
                                                         <th scope='col'>Email</th>
                                                         <th scope='col'>Username </th>
                                                         <th scope='col'>Priority </th>
                                                         </thead>
                                                        	<tbody id="roleResponseInfoPreview">  </tbody>
                                                        	</table>
                                                          </div> </td> </tr>
                                                 
                                                        </tbody>
                                    </table>
 								</td>
 </tr>
 </tbody>
 </table>
 </div>
 </div>
                                                      
                                                                                                   
                                                    <div class="col-md-12">
                                                            <div class="col-md-1">
                                                                <button type="button" class="btn btn-secondary" id = "ReviewPrevBtn" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='archiveRequirementsAddendum.jsp';" >Prev</button>
                                                            </div>
                                                         <div class="col-md-3" style="padding-top: 10px; padding-right: 10px; float: right; width:26%;">
                                                               <button type="button" id="button_id" name="button_id" class="btn btn-primary" onClick="myFunction()">
                        Request Sign
                    </button>
                   
                                                               
                                                                
																
																<button type="button" class="btn btn-primary"
                                                                    onclick="location.href='archiveRequirementsApprovalDetails.jsp';" id="ReviewNextBtn" >Next</button>
                                                               
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

 
</div>
</div>
    <!-- Date picker --> 
    
       <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"  
         rel = "stylesheet"><!-- newly added code by parthiban -->

 <script src="js/toastr/toastr.min.js"></script>
     <script src="js/notification/notification.js"></script>

	
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
    <script id ="scripttag"></script>
    
    <!-- Active Icon Color changes  -->
<script>
$(document).on('mouseenter','.active1', function(){
		
		 $('.activeIcon').css('color','#1565c0');
		 
	 });
	 
	 $(document).on('mouseleave','.active1', function(){
			
		 $('.activeIcon').css('color','#fff');
		 
	 });
	
</script>
<form action="legacy_scr_download.jsp" method="post">
      												<input type="hidden" name="File_Name" id="File_Name">
      												<input type="submit" id="scr_submit" style="display:none;">
											    </form>
											   <input type="submit" id="delete_icon_none" style="display:none;">
<script>
var myVar;
function myFunction() {
document.getElementById("overlay").style.display = "block";
myVar = setTimeout(showPage,180);
}
function showPage() {
document.getElementById("overlay").style.display = "none";
}
</script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
     <script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacy_scr_retrieve_review.js"></script>
	<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacy_scr_download.js"></script>
     <script src="js/Requirements/ArchiveRequirements/archiveRequirementReview/archiveReqReviewDataRetrieveAjaxCall.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
</html>

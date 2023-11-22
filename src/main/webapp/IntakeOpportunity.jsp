<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>D3Sixty - IntakeOpportunity</title>
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

<!-- =========== Header Icon ========= -->

<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">


<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/IntakeOpportunity.js"></script>
<link rel="stylesheet" href="css/Intake/IntakeOpportunity.css"
	media="screen">

<link
	href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
	rel="stylesheet">

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

</head>
<body class="top-navbar-fixed">

	<div class="main-wrapper">
		<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = new Date();
		System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Grid JSP PAGE-----[INFO]");
		%>
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

		if (session.getAttribute("username") == null) {
			response.sendRedirect("Login.jsp");

		} else {
			String name = (String) session.getAttribute("ID");
			HttpSession details = request.getSession();
			Connection con = null;
			session.setAttribute("theName", name);
			String roles = (String) details.getAttribute("role");
			String OpportunityName = (String) details.getAttribute("SelectedOpportunity");
			String s = OpportunityName;
			System.out.println("Welcome" + OpportunityName);

			int sumcount = 0;
			Statement st, st2;
			try {

				con = dBconnection.getConnection();
				Statement st1;
		%>







		<!-- ========== TOP NAVBAR ========== -->
		<!-- <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
               <div class="navbar-header no-padding" style = "height : 100px;">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/D3Sixty_logo.png" alt="D3Sixty" class="logo" style = "margin-top : 50px;">
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
                        
                            
                         <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >>Opportunity</p>
                     
                    

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
								class="glyphicon glyphicon-home"></span> Home</a> >> <%=OpportunityName%> >>Opportunity --%>

							<a href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><span
								class="glyphicon glyphicon-home"></span> Home</a> >> <a
								href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><%=Encode.forHtml(OpportunityName)%></a>>><a
								href="OpportunityGrid.jsp" id="sitetitle1" style="color: #fff">Intake</a> >> Opportunity
								
						</div>
					</div>
				</div>
			</div>
		</nav>

		<%
		} catch (Exception e) {
		e.printStackTrace();
		}

		}
		%>

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
											<!-- <p style="font-size: 14px;">Fill all the required fields
												to go next step</p> -->
											<ul class="list-unstyled form-wizard-steps clearfix">
												<li class="active"
													onclick="location.href='IntakeOpportunity.jsp;'"><span>1</span><i>Opportunity</i></li>
												<li onclick="location.href='IntakeTriage.jsp';"><span>2</span><i>Triage</i></li>
												<li onclick="location.href='IntakeTriageSummary.jsp';"><span>3</span><i>Triage
														Summary</i></li>
												<li onclick="location.href='IntakeAssessment.jsp';"><span>4</span><i>Assessment</i></li>
												<li onclick="location.href='IntakeStakeHolder.jsp';"><span>5</span>
													<i>Stake Holder</i></li>
												<li onclick="location.href='IntakeReviewDetails.jsp';"><span>6</span><i>Review</i></li>
												<li onclick="location.href='IntakeApproval.jsp';"
													id="ReviewNextBtn"><span>7</span><i>Approval</i></li>
											</ul>
										</div>
										<fieldset class="wizard-fieldset show"
											style="border-style: none">
											<div class="tab-pane active" role="tabpanel" id="step1">
												<div class="card-container card">
													<div class="card-header" id="cd-header">Opportunity</div>
													<div id="collapse1" class="panel-collapse" name="collapse">
														<div class="card-body">
															<div id="inputFields">
																<input type='hidden' class='form-control' size='35'
																	id="Json_sample_id" placeholder='' name="Json_Sample"
																	value="" />
															</div>
															
																<div class="col-8" align="end">
																	<button type="button" class="btn btn-secondary"
																		id="template" data-bs-toggle="modal"
																		data-bs-target=".bd-example-modal-lg">Template</button>
																	<div class="dropdown">
																		<button type="button"
																			class="btn btn-secondary dropdown-toggle"
																			id="dropdownMenuButton1" data-bs-toggle="dropdown"
																			aria-expanded="false">Actions</button>
																		<ul class="dropdown-menu"
																			aria-labelledby="dropdownMenuButton1">
																			<li><a class="dropdown-item dropDown-font"
																				id="add" href="#" data-bs-toggle="modal"
																				data-bs-target="#AddPopUp"> <i
																					class="fas fa-plus" aria-hidden="true">&nbsp;&nbsp;&nbsp;
																				</i>Add
																			</a></li>
																			<li><a class="dropdown-item dropDown-font"
																				id="Edit" href="#"><i class="fas fa-edit"
																					aria-hidden="true">&nbsp;&nbsp; </i>Edit</a></li>
																			<li><a class="dropdown-item dropDown-font"
																				id="Delete" href="#"><i class="fas fa-trash"
																					aria-hidden="true">&nbsp;&nbsp;&nbsp; </i>Delete</a></li>

																		</ul>
																	</div>
																	<button type="submit" class="btn btn-primary"
																		id="create">Complete</button>
																	<!-- <a href="javascript:;" class="form-wizard-next-btn float-right btn-info btn btn-info" onclick="location.href='IntakeTriage.jsp';">Next</a> -->
																	<!-- <button
																		class="form-wizard-next-btn float-right btn-info btn btn-info"
																		onclick="location.href='IntakeTriage.jsp';" id="next"
																		disabled="true">

																		<a href="javascript:;"  style="color: #fff;">Next</a>

																	</button>
 -->
																	<button type="button" class="btn btn-primary"
																		onclick="location.href='IntakeTriage.jsp';" id="next"
																		disabled="true">Next</button>
																	<button type="button"
																		class="btn btn-primary pull-right" id="editpopup_btn"
																		data-bs-toggle="modal" data-bs-target="#EditPopUp"
																		style="display: none;">Edit PopUp</button>
																	<button type="button"
																		class="btn btn-primary pull-right"
																		id="deletepopup_btn" data-bs-toggle="modal"
																		data-bs-target="#DeletePopUp" style="display: none;">Delete
																		PopUp</button>
																	<!--  <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button> -->
																</div>
															</div>

														</div>
													</div>
												</div>
											</div>







										</fieldset>

										<!-- Modal -->
										<div class="modal fade" id="exampleModal" tabindex="-1"
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
										<div class="modal bd-example-modal-lg" id="myFormModal"
											tabindex="-1" role="dialog"
											aria-labelledby="myLargeModalLabel" aria-hidden="true">
											<div class="modal-dialog modal-lg" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Opportunity
															Template</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
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
																			<option label="Archive" class="control-label"
																				for="opportunity">Archive</option>
																				<option label="Decommission" class="control-label"
																				for="opportunity">Decommission</option>																			
																			<option label="To" be="" retrive=""
																				class="control-label" for="opportunity">Archive+Decommission</option>
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
																			Description</label>
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
																		<label class="control-label" for="opportunity">Business
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
																		<label class="control-label" for="opportunity">Business
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
																			<option label="" system="" class="control-label"
																				for="opportunity"></option>
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
															onclick="validateForm()" data-bs-dismiss="modal">Add
															Template</button>
													</div>
												</div>
											</div>
										</div>

										<!-------Oppurtunity Add popup---------->
										<div class="modal" id="AddPopUp" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">Add Input Fields</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form name="PopUpform">
									<div class="row">
										<div class="form-group-popup">
											<div class="col-lg-12">
												<label class="control-label" for="formInput526">Label:</label>
												<input type="text" class="form-control" id="label"
													name="label" required>
											</div>
										</div>
									</div>
									<input type="hidden" id="project_name" name="project_name"
										value=""> <input type="text" id="appln_name"
										name="appln_name" value="" style="display: none;"> <input
										type="text" id="servlet_name" name="servlet_name" value=""
										style="display: none;">
									<div class="row">
										<div class="form-group-popup">
											<div class="col-lg-12">
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

									<div class="row hidefield" id="check" style="display: none;">
										<div class="form-group-popup">
											<div class="col-lg-12">
												<label class="control-label" for="formInput526">Number
													of check boxes:</label> <input type="text" class="form-control"
													id="number" name="number1">
											</div>
										</div>
									
									</div>
									<div class="row hidefield" id="rdo" style="display: none;">
										<div class="form-group-popup">
											<div class="col-lg-12">
												<label class="control-label" for="formInput526">Number
													of Radio boxes:</label> <input type="text" class="form-control"
													id="radio_number" name="radio_number">
											</div>
										</div>
									
									</div>
									<div class="row hidefield" id="drop" style="display: none;">
										<div class="form-group-popup">
											<div class="col-lg-12">
												<label class="control-label" for="formInput526">Number
													of Options:</label> <input type="text" class="form-control"
													id="drop_number" name="drop_number">
											</div>
										</div>
								
								</div>

								
									
										<div class="form-group-popup">
											<div class="col-lg-12" id="options">
												
											</div>
										</div>
								

									<div class="row">
										<div class="form-group-popup">
											<div class="col-lg-12">
												<label class="control-label" for="formInput526">Mandatory:</label>
												<select id="mandatory" class="form-select" name="mandatory"
													required>
													<option>Yes</option>
													<option>No</option>
												</select>
											</div>
										</div>
									</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary" id="submit" data-bs-dismiss="modal">Add Fields</button>
							</div>
						</div>
					</div>
				</div>
										
										<!-- Edit pop up -->
										<div class="modal" id="EditPopUp" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Edit
															Input Field</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form name="PopUpform">
															<div class="row">
																<div class="form-group">
																	<div class="col-lg-12">
																		<label class="control-label" for="formInput526">Label:</label>
																		<input type="text" class="form-control"
																			id="Label_modify" name="label" required>
																	</div>
																</div>
															</div>
															<input type="text" id="seq_num" name="" value=""
																style="display: none;">
														</form>
													</div>
													<div class="modal-footer">
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Cancel</button>
														<button type="button" class="btn btn-primary" id="submit1"
															data-bs-dismiss="modal">Submit</button>
													</div>
												</div>
											</div>
										</div>
										<!--Delete pop up-->
										<div class="modal" id="DeletePopUp" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h5 class="modal-title" id="exampleModalLabel">Delete
															Field</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
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
														<button type="button" class="btn btn-primary"
															data-bs-dismiss="modal" id="submit2">Yes</button>
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">No</button>
													</div>
												</div>
											</div>
										</div>




										

									</form>




								</div>
							</div>
						</div>
					</section>

				</div>
				<!-- main-page -->
			</div>
			<!-- content-container -->
		</div>
		<!-- content-wrapper -->

	</div>
	<!-- main-wrapper -->
	<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
	<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<link
		href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
		rel="stylesheet">
	<script
		src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
	<script src="js/toastr/toastr.min.js"></script>


	<!-- IntakeOpportunity -->
	<script src="js/notification/notification.js"></script>
	<script src="js/Opportunity/AddFeatureFunctionality.js"></script>
	<script src="js/IntakeDetails/IntakeOpportunity/AddFeatureAjaxCall.js"></script>
	<script src="js/IntakeDetails/IntakeOpportunity/EditDeleteToggle.js"></script>
	<script src="js/IntakeDetails/IntakeOpportunity/EditDeleteAjaxCall.js"></script>
	<script src="js/IntakeDetails/IntakeOpportunity/TemplateFeature.js"></script>
	<script
		src="js/IntakeDetails/IntakeOpportunity/IntakeDetailsOpportunitySave.js"></script>



	<script>
		$(document).ready(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 50) {
					$('#back-to-top').fadeIn();
				} else {
					$('#back-to-top').fadeOut();
				}
			});
			// scroll body to 0px on click
			$('#back-to-top').click(function() {
				$('body,html').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>
	
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
	<script src="js/navigation/navigation.js"></script>
	<!-- ========== Toastr ========== -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link
		href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
		rel="stylesheet">

	<script
		src="js/IntakeDetails/IntakePreviewDetails/IntakePreviewDataRetrieve.js"></script>



</body>
</html>

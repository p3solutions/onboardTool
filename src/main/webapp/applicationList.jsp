<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Application List</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="js/jquery/jquery-2.2.4.min.js"></script>

<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
	media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
	media="screen">

<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/icheck/skins/line/red.css">
<link rel="stylesheet" href="css/icheck/skins/line/green.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<link rel="icon" type="image/png" href="assets/img/favicon.ico">

<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/UserInfo/userinfo.css">

<!-- ========== Header Icon ========== -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">

<link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>

<script src="js/multiplepages.js"></script>
<script src="js/Opportunity/OpportunityGrid/OpportunityGrid.js"></script>

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
<script src="js/toastr/toastr.min.js"></script>
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="js/IntakeDetails/IntakeAssessment/Common/Intake_Scr_Retrieve_Review.js"></script>
<script
	src="js/IntakeDetails/IntakeAssessment/Common/Intake_Scr_Download.js"></script>
</head>
<style>
#overlay {
	position: fixed;
	top: 0;
	z-index: 100;
	width: 1400px;
	height: 100%;
	display: none;
}

.cv-spinner {
	height: 62rem;
	display: flex;
	justify-content: center;
	align-items: center;
}
.pagination li:hover{
    cursor: pointer;
}
.pagination1 li:hover{
    cursor: pointer;
}
.spinner {
	width: 60px;
	height: 60px;
	margin-right: 15rem;
	margin-left: -3.5rem;
	border: 8px #ddd solid;
	border-top: 8px #2e93e6 solid;
	border-radius: 50%;
	animation: sp-anime 0.8s infinite linear;
}

@-webkit-keyframes sp-anime {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes sp-anime {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

}
.is-hide {
	display: none;
}

#overlay1 {
	position: fixed;
	top: 0;
	z-index: 100;
	width: 1400px;
	height: 100%;
	display: none;
}
#overlay3 {
	position: fixed;
	top: 0;
	z-index: 100;
	width: 1100px;
	margin-top:100px;
	height: 100%;
	display: none;
	background-color:white;
	opacity:1.0;
}

.cv-spinner1 {
	height: 62rem;
	display: flex;
	justify-content: center;
	align-items: center;
}

.spinner1 {
	width: 60px;
	height: 60px;
	margin-right: 15rem;
	margin-left: -3.5rem;
	border: 8px #ddd solid;
	border-top: 8px #2e93e6 solid;
	border-radius: 50%;
	animation: sp-anime1 0.8s infinite linear;
}

.cv-spinner2 {
	height: 62rem;
	display: flex;
	justify-content: center;
	align-items: center;
	opacity:1.0;
}

.spinner2 {
	width: 60px;
	height: 60px;
	margin-right: 10rem;	
	border: 8px #ddd solid;
	border-top: 8px #2e93e6 solid;
	border-radius: 50%;
	animation: sp-anime1 0.8s infinite linear;
}
@-webkit-keyframes sp-anime1 {
  0% { -webkit-transform: rotate(0deg); }
  100% { -webkit-transform: rotate(360deg); }
}

@keyframes sp-anime1 {
  0% { transform: rotate(0deg); }
  100% { transform: rotate(360deg); }
}

}
.is-hide1 {
	display: none;
}
</style>
<body>

	<%@include file="Nav-Bar.jspf"%>
	<nav class="nav" id="bg-color" style="height: 75px;">
		<div class="container-fluid" id="container-fluid-margin">
			<div class="row" id="d3s-mt-20">
				<div class="col-lg-12 col-md-12">
					<h5 class="title" style="color: #fff">Modules</h5>
				</div>
			</div>
			<!-- <p class="sub-title">Create and manage your Opportunities here</p>-->
			<%--  <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >><%=waveName%></p> --%>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="sub-title" style="color: #fff">
						<a href="DashBoard.jsp" id="sitetitle1" style="color: #fff"><span
							class="glyphicon glyphicon-home"></span> Home</a> >> <a
							href="Governance_Home.jsp" id="sitetitle1" style="color: #fff">
							Governance</a> >> Plan and Priority
						<%-- <%=waveName%> --%>
					</div>
				</div>
			</div>
		</div>
	</nav>
	</div>
	<div class="col-lg-6 right-side phase-btn" align="end">
		<div class="dropdown">
			<button type="button" class="btn btn-primary dropdown-toggle"
				id="dropdownMenuButton1" data-bs-toggle="dropdown"
				aria-expanded="false">Phase</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item dropDown-font" id="phaseadd"
					onclick="location.href='NewPhase.jsp';" data-bs-toggle="modal"


					data-bs-target=""> <i class="fas fa-plus" aria-hidden="true">&nbsp;&nbsp;&nbsp;
					</i>Create Phase
				</a></li>
				<li><a class="dropdown-item dropDown-font" id="viewphase"
					onclick="location.href='PhaseList.jsp';" data-bs-toggle="modal"
					data-bs-target=""> <i class="fa fa-eye" aria-hidden="true">&nbsp;&nbsp;
					</i>View Phases
				</a></li>

			</ul>
		</div>
		<div class="dropdown">
			<button type="button" class="btn btn-primary dropdown-toggle"
				id="dropdownMenuButton1" data-bs-toggle="dropdown"
				aria-expanded="false">Wave</button>
			<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
				<li><a class="dropdown-item dropDown-font" id="waveadd"
					onclick="location.href='NewGovernance.jsp';" data-bs-toggle="modal"
					data-bs-target=""> <i class="fas fa-plus" aria-hidden="true">&nbsp;&nbsp;&nbsp;
					</i>Create Wave
				</a></li>
				<li><a class="dropdown-item dropDown-font" id="viewwave"
					onclick="location.href='waveList.jsp?waves=all';"
					data-bs-toggle="modal" data-bs-target=""> <i class="fa fa-eye"
						aria-hidden="true">&nbsp;&nbsp; </i>View Waves
				</a></li>

			</ul>
		</div>

	</div>
	<br />
	<div class="card-container-5 card d3s-mt-50">
		<div class="card-header d3s-pl-15" id="cd-header">
			Applications List <select class="form-select align-right"
				aria-label="Default select example" id="appChange"
				style="padding: 0 0 0 0.35rem; width: 25%;">
				<option value="1">Applications without phase and wave</option>
				<option value="2">Applications with phase and wave</option>

			</select>
		</div>
		<div class="card-body">
			<div class="withPhase" id="withPhase">
				<table class="table table-bordered table-responsive"
					id="appwithphase" style="width: 100%; font-size: 12px;">
					<label>Show</label>
					<label style="margin-left: 110px;"> Entries</label>
					<select class="form-select align-left"
						aria-label="Default select example" id="maxRows_1"
						style="padding: 0.75 0 0 0.75rem; margin-bottom: 5px; margin-top: -28px; margin-left: 44px; width: auto;">
						<option value="5000">Show All</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="70">70</option>
						<option value="100">100</option>
					</select>

					<thead>
						<tr>
							<th
								style='text-align: center; vertical-align: middle; width: 25%;'
								scope="col">Application Name</th>
							<th
								style='text-align: center; vertical-align: middle; width: 25%;'
								scope="col">Phase</th>
							<th
								style='text-align: center; vertical-align: middle; width: 25%;'
								scope="col">Wave</th>
							<th
								style='text-align: center; vertical-align: middle; width: 20%;'
								scope="col">Preview</th>
							<th
								style='text-align: center; vertical-align: middle; width: 5%;'
								scope="col">Action</th>
						</tr>
					</thead>
					<div id="overlay1">
						<div class="cv-spinner1">
							<span class="spinner1"></span>
						</div>
					</div>
					<tbody id="applicationList">

					</tbody>
					<tbody id="notFound1" style="display: none;">
						<tr>
							<td colspan='4' style="text-align: center;"><label
								style="color: black;">No Apps Found </label></td>
						</tr>
					</tbody>

				</table>

				<div class="row">
					<div class="col-md-12" align="end">
						<div class='pagination-container' style="float: right;">
							<nav>
								<ul class="pagination1">

									<li data-page="prev"><span> << <span class="sr-only">(current)</span></span></li>
									<!-- Here the JS Function Will Add the Rows -->
									<li data-page="next" id="prev"><span> >> <span
											class="sr-only">(current)</span></span></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-md-12" align="end">
						<button class="btn btn-primary" id="cancelwithphase">Cancel</button>
						<button class="btn btn-primary" id="saveApplicationList">Submit</button>
					</div>
				</div>
			</div>
			<div class="withoutPhase display" id="withoutPhase">
				<table class="table table-bordered table-responsive"
					id="appwithoutphase" style="width: 100%; font-size: 12px;">
					<label>Show</label>
					<label style="margin-left: 110px;"> Entries</label>
					<select class="form-select align-left"
						aria-label="Default select example" id="maxRows"
						style="padding: 0.75 0 0 0.75rem; margin-bottom: 5px; margin-top: -28px; margin-left: 44px; width: auto;">
						<option value="5000">Show All</option>
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="70">70</option>
						<option value="100">100</option>
					</select>

					<thead>
						<tr>
							<th
								style='text-align: center; vertical-align: middle; width: 25%;'
								scope="col">Application Name</th>
							<th
								style='text-align: center; vertical-align: middle; width: 25%;'
								scope="col">Phase</th>
							<th
								style='text-align: center; vertical-align: middle; width: 25%;'
								scope="col">Wave</th>
							<th
								style='text-align: center; vertical-align: middle; width: 20%;'
								scope="col">Preview</th>
						</tr>
					</thead>
					<div id="overlay">
						<div class="cv-spinner">
							<span class="spinner"></span>
						</div>
					</div>
					<tbody id="applicationListWithoutPhase">

					</tbody>
					<tbody id="notFound" style="display: none;">
						<tr>
							<td colspan='4' style="text-align: center;"><label
								style="color: black;">No Apps Found </label></td>
						</tr>
					</tbody>
				</table>
				<div class="row">
					<div class="col-md-12" align="end">
						<div class='pagination-container' style="float: right;">
							<nav>
								<ul class="pagination">

									<li data-page="prev"><span> << <span class="sr-only">(current)</span></span></li>
									<!--	Here the JS Function Will Add the Rows -->
									<li data-page="next" id="prev"><span> >> <span
											class="sr-only">(current)</span></span></li>
								</ul>
							</nav>
						</div>
					</div>
					<div class="col-md-12" align="end">
						<button class="btn btn-primary" id="cancelwithoutphase">Cancel</button>
						<button class="btn btn-primary" id="saveApplicationList-1">Submit</button>
					</div>
				</div>
			</div>

		</div>

	</div>
	<div>
		<button type="button" class="btn btn-primary pull-right"
			id="editpopup_btn" data-bs-toggle="modal" data-bs-target="#EditPopUp"
			style="display: none;">Edit PopUp</button>
		<button type="button" class="btn btn-primary pull-right"
			id="deletepopup_btn" data-bs-toggle="modal"
			data-bs-target="#DeletePopUp" style="display: none;">Delete
			PopUp</button>
	</div>

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

	<!-- Edit Row Pop Up  -->
	<div class="modal" id="EditPopUp" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #1565c0;">
					<h5 class="modal-title" id="exampleModalLabel"
						style="color: white;">Intake Preview Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">

					<div class="container">
								<div id="overlay3">
						<div class="cv-spinner2">
							<span class="spinner2"></span>
						</div>
					</div>
						<div bgcolor='#e4e4e4'
							style='font-family: Arial, Helvetica, sans-serif;'
							id="table-scroll">

							<table>
								<tbody>
									<tr>
										<td>
											<table width='780' border='0' align='center'>

												<tbody>
													<tr align='left'>
														<td
															style='color: #404041; font-size: 12px; line-height: 16px; padding: 10px 16px 20px 18px'>
															<h3 class="panel-title">Opportunity Information</h3> <br>
															<div id="OpportunityInfoPreview"></div>

														</td>
													</tr>

													<tr align='left'>
														<td
															style='color: #404041; font-size: 12px; line-height: 16px; padding: 10px 16px 20px 18px'>
															<h3 class="panel-title">Triage Information</h3> <br>
															<div id="TriageInfoPreview"></div>

														</td>
													</tr>

													<tr align='left'>
														<td
															style='color: #404041; font-size: 12px; line-height: 16px; padding: 10px 16px 20px 18px'>
															<h3 class="panel-title">Triage Summary Information</h3> <br>
															<div id="TriageSummInfoPreview">
																<br>
															</div>

														</td>
													</tr>

													<tr align='left'>
														<td
															style='color: #404041; font-size: 12px; line-height: 16px; padding: 10px 16px 20px 18px'>
															<div id="AssessInfoPreview">
																<h2 class="panel-title">Assessment Information</h2>
																<br>
																<h3 class="panel-title">Application Information</h3>
																<br>
																<div id="ApplicationInformationPreview"></div>
																<h4 class="panel-title">Application Information
																	Screenshots</h4>
																<br>
																
															<table class="table table-bordered table-striped"
																	id="datatable" style="white-space:nowrap;text-overflow:ellipsis;overflow:hidden;max-width:159.5ch;">
																	<thead>
																		<th style="text-align: center;">File Name</th>
																		<th style="text-align: center;">Action</th>

																	</thead>
																	<tbody id="Legacy_Scr_List">

																	</tbody>
																</table>
															</div>


															<h3 class="panel-title">Data Characteristics</h3> <br>
															<div id="DataCharacteristicsPreview"></div>
															<h3 class="panel-title">Compliance Characteristics</h3> <br>
															<div id="ComplianceCharacteristicsPreview"></div>
															<h3 class="panel-title">Archival Consumption</h3> <br>
															<div id="ArchivalConsumptionPreview"></div>
															<h3 class="panel-title" style = "display:none;" id="contract_info_heading">Contract Information</h3><br>
															<div id="ContractInformationPreview"
																style="display: none;">
																
															</div>

														</td>
													</tr>

													<tr align='left'>
														<td
															style='color: #404041; font-size: 12px; line-height: 16px; padding: 10px 16px 20px 18px'>
															<h3 class="panel-title">Approval</h3> <br> <br>
															<div id="StakeHolderInfoPreview"></div>

														</td>
													</tr>
												</tbody>
											</table>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
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
					<form action="Intake_scr_Download" method="post">
						<input type="hidden" name="File_Name" id="File_Name"> <input
							type="submit" id="scr_submit" style="display: none;">
					</form>
				</div>
				<div class="modal-footer">
					<!-- <button type="button" class="btn btn-primary" id="update_submit"
						data-bs-dismiss="modal">Add</button> -->
					<button type="button" class="btn btn-primary"
						data-bs-dismiss="modal">Ok</button>

				</div>
			</div>
		</div>
	</div>
	<div>
		<input type="text" id="demo" style="display: none;">
	</div>


	<script>
		$(document).ready(function() {
			$("#appChange").on('change', function(e) {
				$('#withoutPhase, #withPhase').toggleClass('display');
			});
		});
	</script>




	<!-- ========== PAGE JS FILES ========== -->
	<script src="js/prism/prism.js"></script>
	<script type="text/javascript"
		src="js/date-picker/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="js/date-picker/jquery.timepicker.js"></script>
	<script type="text/javascript" src="js/date-picker/datepair.js"></script>
	<script type="text/javascript" src="js/date-picker/moment.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

	<script src="js/navigation/navigation.js"></script>
	<script src="js/application_list/applicationList.js"></script>
	<script src="js/application_list/applicationListIntakePreview.js"></script>
	<script src="js/application_list/withoutphasepagination.js"></script>
	<script src="js/application_list/withphasepagination.js"></script>
	<!-- ========== Pagination ========== -->
	<script src="js/paging/pagination.js"></script>

</br>
<%--<%@include file="Footer.jspf"%>--%>
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
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css" />
	<!-- ========== Toastr ========== -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link
		href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
		rel="stylesheet">
	<script src="js/notification/notification.js"></script>

</body>
</html>
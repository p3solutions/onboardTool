<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Decom3Sixty License Information</title>
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

.pagination li:hover {
	cursor: pointer;
}

.pagination1 li:hover {
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

@
-webkit-keyframes sp-anime { 0% {
	-webkit-transform: rotate(0deg);
}

100


%
{
-webkit-transform


:


rotate
(


360deg


)
;


}
}
@
keyframes sp-anime { 0% {
	transform: rotate(0deg);
}

100


%
{
transform


:


rotate
(


360deg


)
;


}
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

@
-webkit-keyframes sp-anime1 { 0% {
	-webkit-transform: rotate(0deg);
}

100


%
{
-webkit-transform


:


rotate
(


360deg


)
;


}
}
@
keyframes sp-anime1 { 0% {
	transform: rotate(0deg);
}

100


%
{
transform


:


rotate
(


360deg


)
;


}
}
}
.is-hide1 {
	display: none;
}
</style>
<body>

	<%@include file="Nav-Bar.jspf"%>

	<nav class="nav nav-height-70 nav-font" id="bg-color"
		style="margin-top: -10px; height: 85px;">
		<div class="container-fluid">
			<div class="col-sm-12" id="d3s-mt-20">
				<ul class="nav navbar-nav-1 mt-3">
					<li class="nav-link-2 active-2" id="nav-link"
						><a
						class="link" href="Admin_Userslist.jsp"
						style="color: #fff; padding: 7px 7px; margin-top: -10px; height: 35px;">UserList</a></li>
					<li id="nav-link" style="border-bottom: 4px solid rgba(255, 255, 255, .5) !important"><a class="link" href="License_info.jsp"
						style="color: #fff; padding: 7px 7px; margin-top: -10px; height: 35px;">License
							Information</a></li>
				</ul>

			</div>
		</div>
	</nav>
	<div class="col-lg-6 left-side phase-btn1" align="left">

		<button type="button" id="add_user_btn" class="btn btn-primary"
			href="#" data-bs-toggle="modal" data-bs-target="#addlicenseModal"
			style="margin: 29px 0 0 83px; font-size: 14px; display: none;">Update License</button>
		<button type="button" class="btn btn-primary pull-right"
			id="editpopup_btn" data-bs-toggle="modal" data-bs-target="#EditPopUp"
			style="display: none;">Edit PopUp</button>
		<button type="button" class="btn btn-primary pull-right"
			id="deletepopup_btn" data-bs-toggle="modal"
			data-bs-target="#DeletePopUp" style="display: none;">Delete
			PopUp</button>

	</div>
	<br />
	<div class="card-container-5 card d3s-mt-50">
		<div class="card-header d3s-pl-15" id="cd-header">License Information</div>

		<div class="withoutPhase display" id="withoutPhase">
			<table class="table table-bordered table-responsive"
				id="license_info_table" style="width: 100%; font-size: 12px;">
				</br>
				
				<thead>

					<th style='text-align: center; vertical-align: middle; width: 25%;'
						scope="col">Issue To</th>
					<th style='text-align: center; vertical-align: middle; width: 25%;'
						scope="col">Issue Date</th>
					<th style='text-align: center; vertical-align: middle; width: 25%;'
						scope="col">Valid Till</th>
					</thead>

				<div id="overlay">
					<div class="cv-spinner">
						<span class="spinner"></span>
					</div>
				</div>
				<tbody id="license_info_1">

				</tbody>
			
		</table>
			
		</div>

	</div>

	</div>

	<div class="modal" id="addlicenseModal" tabindex="-1"
					aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header" style="background-color:#1565c0;">
								<h5 class="modal-title" id="exampleModalLabel" style="color:white;">Update License Information</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<form name="PopUpform">
									<div class="row">
										<div class="form-group">
										<div class="col-lg-12">
												<label class="control-label" for="formInput526" style="color:red;">Please Update your License Information</label> 
												   <textarea class="form-control" id="license_info" name="license_info" rows="4"  required></textarea> 
												  
												  								
											
										</div>
									</div>
									
									
								</form>
							</div>
							<div class="modal-footer">
								
								<button type="button" class="btn btn-primary" id="license_update_submit" data-bs-dismiss="modal" style="font-size: 12px;">Update License</button>
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal" style="font-size: 12px;">Close</button>
							</div>
						</div>
					</div>
				</div>
											
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
	<script src="js/license/retrieve_license_info.js"></script>
	<script src="js/license/update_license.js"></script>
	<!-- ========== Pagination ========== -->
	<script src="js/paging/pagination.js"></script>


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
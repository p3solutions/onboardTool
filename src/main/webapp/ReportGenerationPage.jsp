<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report Details</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
	media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
	media="screen">
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/icheck/skins/line/red.css">
<link rel="stylesheet" href="css/icheck/skins/line/green.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/UserInfo/userinfo.css">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
	media="screen">
	<link rel="stylesheet" href="css/ReportGeneration.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">
<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"rel="stylesheet">
<script src="js/modernizr/modernizr.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="js/multiplepages.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>
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
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>
<script src="js/main.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<!-- Include jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Include Toastr JavaScript -->
<script src="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>
<style>
th {
	border: 10px solid #001;
	text-align: center;
	vertical-align: middle;
}

.table-container {
	width: 100%;
	overflow-x: auto;
}

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
#u_pwd_togglePassword {
	position: absolute;
	margin-top: 22px;
	margin-left: 348px;
}

#conf_u_pwd_togglePassword {
	position: absolute;
	margin-top: 22px;
	margin-left: 289px;
}
</style>
<body>
	<%@include file="Nav-Bar.jspf"%>
	<nav class="nav" id="bg-color">
		<div class="container-fluid" id="container-fluid-margin">
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="sub-title" style="color: #fff">
						<br> <a href="DashBoard.jsp" id="sitetitle1"
							style="color: #fff"><span class="glyphicon glyphicon-home"></span>
							Home</a> >> <a href="Governance_Home.jsp" id="sitetitle1"
							style="color: #fff"> Governance </a> >> Report Generation
					</div>
				</div>
			</div>
		</div>
		<br>
	</nav>
	<div class="card-container-6 card d3s-mt-52">
		<div class="withoutPhase display" id="admin_userslist_div">
			<div class="div-container">
				<div class="left-content">
    				<label>Show </label>
    					<select id="maxRows" class="SearchmaxRows" style="color: black;">
        					<option value="5">5</option>
       						<option value="10">10</option>
        					<option value="15">15</option>
        					<option value="20">20</option>
        					<option value="50">50</option>
        					<option value="70">70</option>
        					<option value="100">100</option>
    					</select>
				</div>
				<div class="centered-content">
					<label class="col-form-label" id="title" style="color: black;">Report
						Name </label> <select id="category" style="color: black;">
						<option class='options' value='Intake_Report_1'>Report 1</option>
						<option class='options' value='Intake_Report_2'>Report 2</option>
						<option class='options' value='Intake_Report_3'>Report 3</option>
					</select>
					</div>
				<div class="Search-content">
				<div id="overlaySearch" class="overlaySearch"></div>

    			<button onclick="showSearchPopup()" class="custom-button-search" >Search</button>
   
    				<div id="searchPopup" class="popup">
        				<div class="popupHeader">
            				<span class="popupTitle">Search</span>
        				</div>
        			<br>
        			<div class="form-container">
    					<form id="searchForm" onsubmit="return validateForm(event)">
       						 <div class="label-dropdown-container">
            					<label for="columnName" class="form-label">Column Name:</label> &nbsp;&nbsp;&nbsp;
            					<select id="columnName" onchange="toggleSearchValueField()" class="form-dropdown">
                					<!-- Add other options as needed -->
            					</select>
        					</div>

        			<div class="label-dropdown-container">
    					<label for="searchValue" id="searchValueLabel" class="form-label">Search Value:</label>
    						<input type="text" id="searchValue" class="form-input">
					</div>
	
        			<div class="button-container">
            			<input type="submit" value="Search" class="form-button">
            			<button type="button" onclick="closeSearchPopup()" class="form-button">Cancel</button>
        			</div>
    			</form>
				</div>
   				</div>
   				</div> 
					<div class="right-content">
					<div id="overlaySearch" class="overlaySearch"></div>
					<button id="exportbutton" onclick="showexportPopup()" class="custom-button">Export
						CSV</button>
						<div id="myModal" class="popup">
							<div class="popupHeader">
            					<span class="popupTitle">Export CSV</span>
        					</div>
   							 <div class="modal-content">
   							 <br>
   							 <br>
        						<button type="button" onclick="exportdatatocsv()"class="custom-button">View Data</button>
        						<br>
        						<button id="Exportwholedata" class="custom-button">All Data</button>
        						<br>
        						<button type="button" onclick="closeexportPopup()" class="form-button">Cancel</button>
    					</div>
						</div>
						
				</div>
			</div> 
		
		<div class="card-header d3s-pl-16" id="cd-header">Intake Report</div>
		<div class="table-container">
			<br />
			<div id="overlay">
				<div class="cv-spinner">
					<span class="spinner"></span>
				</div>
			</div>
			<table class="table table-bordered table-responsive"
				id="dynamicHeader" style="width: 200%; font-size: 12px;">

			</table>
			
		</div>
		<div class="row">
    	<div class="col-md-12" align="end">
        	<div class='pagination-container' style="float: right;">
            	<nav>
                	<ul class="pagination">
                    <!-- Your pagination items go here -->
                	</ul>
            	</nav>
            	
        	</div>
    	</div>
		</div>
		<div class="row">
    	<div class="col-md-12" align="end">
        	<div class='pagination-container' style="float: right;">
            	<nav>
                	<ul class="Searchpagination">
                    <!-- Your Searchpagination items go here -->
                	</ul>
            	</nav>
        	</div>
    	</div>
		</div>

		</div>
		</div>

<script>
    var select1 = document.getElementById("Report");
    var select2 = document.getElementById("maxRows");

    // Add an event listener to select1
    select1.addEventListener("change", function() {
        // Set the selected option in select2 to match select1
        select2.value = "5000";
    });
</script>
<%--to erase the search element when the report is changed--%>
<script>
    var selectElement = document.getElementById("Report");
    var inputElement = document.getElementById("appFilter");

    // Add an event listener to the select element to detect changes
    selectElement.addEventListener("change", function() {
        // Clear the value of the input element when the select option changes
        inputElement.value = "";
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
	<!-- ========== Pagination ========== -->
	<script src="js/toastr/toastr.min.js"></script>
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
	<script src="js/GovernanceReportGenerationModule/ReportGeneration.js"></script>
	<script src="js/GovernanceReportGenerationModule/ReportGenerationSearch.js"></script>
	<script src="js/GovernanceReportGenerationModule/Exportcsv.js"></script>
</body>
</html>
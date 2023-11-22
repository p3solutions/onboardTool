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
	<style>
.div-container {
	display: flex;
	justify-content: space-between;
}

.left-content {
	text-align: left;
	margin-left: 20px;
	margin-top: 5px;
	margin-buttom: 2px;
}

.centered-content {
	margin-top: 2px;
	text-align: center;
	margin-right: 200px;
	margin-buttom: 2px;
}
.Search-content{
	margin-top: 2px;
  	text-align: center;
  	margin-right: 100px;
  	margin-buttom: 2px;
  	display: flex;
}
.right-content {
	margin-top: 7px;
	text-align: right;
	margin-right: 20px;
	margin-buttom: 7px;
}

.custom-button {
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 10px;
	padding: 3px 9px;
	cursor: pointer;
	font-size: 14px;
	transition: background-color 0.3s, transform 0.2s;
	hight: 2px;
}

.custom-button:hover {
	background-color: #3498db;
	transform: scale(1.05);
}
.pagination {
    display: flex;
    list-style: none;
	padding: 0;
}

.pagination li {
	margin: 5px;
	padding: 8px;
    background-color: #e0e0e0;
    cursor: pointer;
    border-radius: 4px;
}
.pagination li.active {
	background-color: #007bff;
    color: white;
}
#prev, #next {
	margin: 5px;
    padding: 8px;
    background-color: #007bff;
    color: white;
    cursor: pointer;
    border-radius: 4px;
    }
/* styles.css */
body {
    margin: 0;
    padding: 0;
    background-image: url('your-background-image.jpg'); /* Replace with your background image URL */
    background-size: cover;
    background-position: center;
}

.overlaySearch {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* Semi-transparent black overlay */
    z-index: 1; /* Ensure the overlay is behind the popup */
}

.popup {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background-color: #f9f9f9;
    padding: 20px;
    border: 1px solid #ccc;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    z-index: 2; /* Ensure the popup is on top */
}

.popupHeader {
    background-color: blue;
    color: white;
    padding: 10px;
    text-align: center;
    position: relative;
}

.popupTitle {
    font-size: 18px;
    font-weight: bold;
}

.closeButton {
    position: absolute;
    top: 10px;
    right: 10px;
    font-size: 16px;
    color: red;
    cursor: pointer;
}

label {
    display: block;
    margin-top: 10px;
}

input[type="text"],
select {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    margin-bottom: 15px;
    box-sizing: border-box;
}

.buttonContainer {
    display: flex;
    justify-content: space-between;
}

.buttonContainer input,
.buttonContainer button {
    flex: 1;
    margin-right: 5px;
}

.popup.active,
.overlaySearch.active {
    display: block;
    z-index: 3; /* Ensure the active overlay is on top of everything */
}
/* Add more styles as needed */
.scrollable-dropdown {
    height: 150px; /* Set the desired height */
    overflow: auto;
}
.hidden {
    display: none;
}
#warningMessage {
    color: red;
    background-color: white;
    position: fixed;
    top: 10px;
    right: 10px;
    padding: 10px;
    border: 1px solid red;
    display: none;
  }

</style>
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
					<label>Show &nbsp;</label> <select id="maxRows"
						style="color: black;">
						<option value="5">5</option>
						<option value="10">10</option>
						<option value="15">15</option>
						<option value="20">20</option>
						<option value="50">50</option>
						<option value="70">70</option>
						<option value="100">100</option>
						<option value="5000">Show All</option>
					</select>
				</div>
				<div class="centered-content">
					<label class="col-form-label" id="title" style="color: black;">Report
						Name &nbsp;</label> <select id="category" style="color: black;">
						<option class='options' value='Intake_Report_1'>Report 1</option>
						<option class='options' value='Intake_Report_2'>Report 2</option>
						<option class='options' value='Intake_Report_3'>Report 3</option>
					</select>
					</div>
				<div class="Search-content">
				<!--  <button onclick="showSearchPopup()" class="custom-button">Search</button>
    				<div id="searchPopup" class="popup">
       				<div class="popupHeader">
            		<span class="popupTitle">Search Function</span>
            		<button onclick="closeSearchPopup()" class="closeButton">X</button>
        			</div>
        			<form id="searchForm" onsubmit="return validateForm()">
            		<label for="columns">Select Column:</label>
            		<select id="columns">
                		<option value="	Application_Name">Application Name</option>
                		<option value="	Requester">	Requester</option>
                		<option value="Application_Status">Application_Status</option>
                		<option value="Phase_Status">Phase_Status</option>
                		<option value="Application_Owner	">Application_Owner</option>
            		</select>

            		<label for="searchValue">Search Value:</label>
            		<input type="text" id="searchValue" required>
            		<input type="submit" value="Search">
        			</form>
    			</div>
    			
				</div> -->
				<div id="warningMessage" class="hidden"></div>
				<div id="overlaySearch" class="overlaySearch"></div>

    <button onclick="showSearchPopup()" class="custom-button" >Search</button>
   
    <div id="searchPopup" class="popup">
        <div class="popupHeader">
            <span class="popupTitle">Search</span>
            
        </div>
        <form id="searchForm" onsubmit="return validateForm(event)">
            <label for="columnName">Column Name:</label>
            <select id="columnName" onchange="toggleSearchValueField()">
            	<option value="null">--Select--</option>
            </select>

           <label for="searchValue" id="searchValueLabel" class="hidden">Search Value:</label>
            <input type="text" id="searchValue" class="hidden" >

            <div class="buttonContainer">
                <input type="submit" value="Search">
                <button type="button" onclick="closeSearchPopup()">Cancel</button>
            </div>
        </form>
    </div>
   				</div> 
					<div class="right-content">
					<button onclick="exportToCSV()" class="custom-button">Export
						CSV</button>
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

                            <li data-page="prev"><span> << <span class="sr-only">(current)</span></span></li>
                            <!--    Here the JS Function Will Add the Rows -->
                            <li data-page="next" id="prev"><span> >> <span
                                    class="sr-only">(current)</span></span></li>
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
	<script src="js/Export.js"></script>
	<script src="js/GovernanceReportGenerationModule/ReportGenerationSearch.js"></script>
	<script src="js/ExportCSV.js"></script>
</body>
</html>
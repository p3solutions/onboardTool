`<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/icheck/skins/line/red.css">
<link rel="stylesheet" href="css/icheck/skins/line/green.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<link rel="icon" type="image/png" href="assets/img/favicon.ico">
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/UserInfo/userinfo.css">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css" media="screen">
<link rel="stylesheet" href="css/Responsive/intake-opportunity.css" media="screen">
<link rel="stylesheet" href="css/Responsive/responsive.css" media="screen">
<script src="js/modernizr/modernizr.min.js"></script>
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
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all" />
<script src="js/amcharts/themes/light.js"></script>
<script src="js/toastr/toastr.min.js"></script>
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>
<script src="js/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>

nav {
  display: flex;
  justify-content: space-around;
  align-items: center;
  margin: 5px;
}

button#prevButton,
button#nextButton {
  background-color: #007BFF;
  color: #fff;
  padding: 5px 5px;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  display : ;
}




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
    0% {
        -webkit-transform: rotate(0deg);
    }
    100% {
        -webkit-transform: rotate(360deg);
    }
}
@keyframes sp-anime {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}
.is-hide {
    display: none;
}#overlay1 {
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
@-webkit-keyframes sp-anime1 {
    0% {
        -webkit-transform: rotate(0deg);
    }
    100% {
        -webkit-transform: rotate(360deg);
    }
}
@keyframes sp-anime1 {
    0% {
        transform: rotate(0deg);
    }
    100% {
        transform: rotate(360deg);
    }
}
  .card-header button {
    float: right;
    background-color: #0c7ef0; 
    color: white; 
    border-radius: 5px; 
    padding: 3px 8px; 
    border: none; 
    font-size: 12px;
     transition: background-color 0.3s, color 0.3s; /* Add transition for smooth animation */
  }

 
  .card-header button:hover {
    background-color: #0056b3; /* Change the background color on hover */
    color: #fff; /* Change the text color on hover */
  }
</style>
<body>

<%@include file="Nav-Bar.jspf"%>
<nav class="nav nav-down-height" id="bg-color">
<div class="container-fluid" id="container-fluid-margin">
<div class="row" id="d3s-mt-20">
<div class="col-lg-12 col-md-12">
<h5 id="title"  style="color: #fff">Report Generation</h5>
</div>
</div>
<div class="col-lg-3 col-md-6">
<div class="row align-items-center">
<div class="col-auto">
<i class="fa fa-search search-icon" aria-hidden="true"></i>
</div>
<div class="col-auto">
<input id="Search" type="text" placeholder="Search the application...">
</div>
</div>
</div>
<div id="results"></div>
<div class="row align-items-center">
<div class="col-auto">
<label class="col-form-label" id="title">Report Name</label>
</div>
<div class="col-auto">
<select class="selectInput filter" id="category">
<option class='options' value='Intake_Report_1'>Report 1</option>
<option class='options' value='Intake_Report_2'>Report 2</option>
<option class='options' value='Intake_Report_3'>Report 3</option>  
</select>
</div>
</div>
</div>

<div class="col-lg-12 col-md-12">
<div class="sub-title" style="color: #fff">
<a href="DashBoard.jsp" id="sitetitle1" style="color: #fff"><span
							class="glyphicon glyphicon-home"></span> Home</a> >> <a
							href="Governance_Home.jsp" id="sitetitle1" style="color: #fff">
							Governance</a> >> Report Generation
</div>
</div>
<br>
</nav>
<br />
<div class="card-container-5 card">
    <div class="card-header" id="card-header">
        <button onclick="exportToCSV()">Export CSV</button>
        <br>
        <label>Show </label>
        <label style="margin-left: 110px;"> Entries</label>
        <select class="form-select align-left" aria-label="Default select example" id="maxRows" style="padding: 0.75 0 0 0.75rem; margin-bottom: 5px; margin-top: -28px; margin-left: 45px; width: 100px;">
           
            <option value="5">5</option>
            <option value="10">10</option>
            <option value="15">15</option>
            <option value="20">20</option>
            <option value="50">50</option>
            <option value="70">70</option>
            <option value="100">100</option>
             <option value="5000">Show All</option>
        </select>
        <div class="card-header d3s-pl-16" id="cd-header"></div>
        
        <!-- Vertical Scroll Container -->
        <div class="vertical-scroll-container" style="max-height: 350px; overflow-y: auto; margin-top: 5px;">
            <div class="table-container">
                <br />
                <div id="overlay">
                    <div class="cv-spinner">
                        <span class="spinner"></span>
                    </div>
                </div>
                <div class="panel table-responsive">
                    <table class="table table-bordered" id="dynamicHeader" style="width: 100%; font-size: 12px;"></table>
                </div>
                <nav style="display: flex; justify-content: flex-end; align-items: center; margin: 5px;">
                    <button id="prevButton"> << </button>
                    <button id="nextButton"> >> </button>
                </nav>
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

 

 

 


<!-- ========== Pagination ========== -->

 

 

 

 

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
<script src="js/Compliance/IntakeReport.js"></script>
<script src="js/Export.js"></script>
<script src="js/Compliance/Search.js"></script>
<script src="js/Compliance/ExportCSV.js"></script>
 

 

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Compliance</title>
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
</head>
<body>
<script>
function redirectOnOptionSelect() {
    var selectElement = document.getElementById("category");
    var selectedOption = selectElement.options[selectElement.selectedIndex];
    var link = selectedOption.getAttribute("data-link");
    console.log("link",link);

 

    if (link) {
        window.location.href = link;
    }
}
</script>
<script>
function exportToCSV() {
    // Get the table element
    var table = document.querySelector('.table');

 

 

    // Create an empty array to store the data
    var data = [];

 

 

    // Iterate through the rows and cells of the table
    for (var i = 0; i < table.rows.length; i++) {
        var row = table.rows[i];
        var rowData = [];
        for (var j = 0; j < row.cells.length; j++) {
            rowData.push(row.cells[j].textContent.trim());
        }
        data.push(rowData);
    }

 

 

    // Create a CSV string
    var csvContent = "data:text/csv;charset=utf-8,";
    data.forEach(function (rowArray) {
        var row = rowArray.join(",");
        csvContent += row + "\r\n";
    });

 

 

    // Create a data URI for the CSV content
    var encodedUri = encodeURI(csvContent);

 

 

    // Create a link element and trigger the download
    var link = document.createElement("a");
    link.setAttribute("href", encodedUri);
    link.setAttribute("download", "table_data.csv");
    document.body.appendChild(link);

 

 

    // Simulate a click on the link to trigger the download
    link.click();
}
</script>
<%@include file="Nav-Bar.jspf"%>
<nav class="nav nav-down-height" id="bg-color">
<div class="container-fluid" id="container-fluid-margin">
<div class="row" id="d3s-mt-20">
<div class="col-lg-12 col-md-12">
<h5 id="title">Report Generation</h5>
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
<div class="row align-items-center">
<div class="col-auto">
<label class="col-form-label" id="title">Report Name</label>
</div>
<div class="col-auto">
<select class="selectInput filter" id="category" onchange="redirectOnOptionSelect()">

<option class='options' value='IntakeReport1' data-link="IntakeReport1.jsp" >IntakeReport 1</option>
<option class='options' value='IntakeReport2' data-link="IntakeReport2.jsp" >IntakeReport 2</option>
<option class='options' value='IntakeReport3' data-link="Intakereport3.jsp">IntakeReport 3</option>
<option class='options' value='IntakeReport4' data-link="">IntakeReport 4</option>
</select>
</div>
</div>
</div>&nbsp &nbsp
<div class="col-lg-6 right-side">
<button type="button" class="btn btn-primary pull-right" id="exportButton" onclick="exportToCSV();">Export CSV</button>
<button type="button" class="btn btn-primary pull-right" id="addWaveBtnId" style="color: DodgerBlue; display: none;" name="newpr" data-bs-toggle='modal' data-bs-target='#existWavePopUp'></button>
<button type="button" class="btn btn-primary pull-right" id="deleteBtn" style="color: DodgerBlue; display: none;" name="newpr" data-bs-toggle='modal' data-bs-target='#deletePopUp'></button>
</div>
</nav>
<br />
<div class="card-header d3s-pl-16" id="cd-header">IntakeReport 3</div>
<br />
<div class="table-container">
<table class="table table-bordered table-responsive" id="admin_userslist" style="width: 200%; font-size: 12px;">
<thead>
<tr>
<th style='text-align: center; vertical-align: middle; width: 10%;' scope="col">LegacyApplicationName</th>
<th style='text-align: center; vertical-align: middle; width: 10%;' scope="col">SourcePlatformDatabases</th>
<th style='text-align: center; vertical-align: middle; width: 10%;' scope="col">LegacyApplicationDescription</th>
<th style='text-align: center; vertical-align: middle; width: 10%;' scope="col">ReadOnlyDate</th>
<th style='text-align: center; vertical-align: middle; width: 10%;' scope="col">Isthisapplicationtheonlysourceoftruthforthedata</th>
<th style='text-align: center; vertical-align: middle; width: 10%;' scope="col">Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor</th>
<th style='text-align: center; vertical-align: middle; width: 10%;' scope="col">totaldatasize</th>
<th style='text-align: center; vertical-align: middle; width: 10%;' scope="col">RetentionPeriod</th>

</tr>
</thead>
<div id="overlay">
<div class="cv-spinner">
<span class="spinner"></span>
</div>
</div>
<tbody id="IntakeReport3"></tbody>
</table>
</div>
 <script>
        const togglePassword10 = document
            .querySelector('#conf_u_pwd_togglePassword');

        const password10 = document.querySelector('#conf_u_pwd');

        togglePassword10.addEventListener('click', () => {
            const type = password10
                .getAttribute('type') === 'password' ?
                'text' : 'password';

            password10.setAttribute('type', type);
            if(type=="password")
            	{
            	togglePassword10.classList.remove("fa-eye");
                togglePassword10.classList.add("fa-eye-slash");
   	            }
            if(type=="text")
        	{
            	togglePassword10.classList.remove("fa-eye-slash");
                togglePassword10.classList.add("fa-eye");

 

        	}

        });
</script>

 

	<script>
        const togglePassword11 = document
            .querySelector('#u_pwd_togglePassword');

        const password11 = document.querySelector('#u_pwd');

        togglePassword11.addEventListener('click', () => {
            const type = password11
                .getAttribute('type') === 'password' ?
                'text' : 'password';

            password11.setAttribute('type', type);
            if(type=="password")
            	{
            	togglePassword11.classList.remove("fa-eye");
                togglePassword11.classList.add("fa-eye-slash");
   	            }
            if(type=="text")
        	{
            	togglePassword11.classList.remove("fa-eye-slash");
                togglePassword11.classList.add("fa-eye");

 

        	}

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
<script src="js/admin_modify_module/admin_retrieve_users.js"></script>
<script src="js/admin_modify_module/admin_add_user.js"></script>
<script src="js/admin_modify_module/DeleteAjaxCall.js"></script>
<script src="js/admin_modify_module/EditAjaxCall.js"></script>
<script src="js/admin_modify_module/admin_users_pagination.js"></script>
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
<script src="js/ComplianceModule/IntakeReport3.js"></script>
<script src="js/Compliance/Search.js"></script>
</body>
</html>
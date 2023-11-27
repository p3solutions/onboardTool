<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Report</title>
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
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous" />
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
    <link rel="stylesheet" href="css/headerIcon/headerIcon.css"
          media="screen">

    <link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
          media="screen">
    <link rel="stylesheet" href="css/Responsive/responsive.css"
          media="screen">
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script src="js/multiplepages.js"></script>

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
          type="text/css" media="all"/>
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

</head>
<style>
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
    -webkit-keyframes sp-anime {
        0% {
            -webkit-transform: rotate(0deg);
        }

        100% {
            -webkit-transform: rotate(
                    360deg);
        }
    }

    @
    keyframes sp-anime {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(
                    360deg);
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
    @  -webkit-keyframes sp-anime1 {
        0% {
            -webkit-transform: rotate(0deg);
        }
        100% {
            -webkit-transform: rotate(360deg);
        }
    }
    @  keyframes sp-anime1 {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(360deg);
        }
    }

    }
    .is-hide1 {
        display: none;
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
    #bg-color{
        height: 200px;
    }
    #input-align-top {
        margin-left: 20px;
        margin-top: -60px !important;
    }
    .img-rounded {
        padding-top: 20px;
        transition: width 2s, height 2s, transform 2s;
    }
</style>
<body>


<%@include file="Nav-Bar.jspf" %>
<nav class="nav nav-down-height" id="bg-color">

    <div class="container-fluid" id="container-fluid">
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
                            class="glyphicon glyphicon-home"></span> Home</a> >> <a href="Governance_Home.jsp" id="sitetitle2" style="color: #fff"> Governance </a> >> <a href="Report.jsp" id="sitetitle3" style="color: #fff">Report </a>
                </div>
            </div>
        </div>

    </div>


    <div class="container-fluid" id="container-fluid-margin">
        <div class="row" id="d3s-mt-20">
            <div class="col-lg-12 col-md-12">
                <h5 id="title2"></h5>
            </div>
            <div class="col">
                <div class="col-lg-3 col-md-6">
                    <div class="row align-items-center">
                        <div class="col-auto">
                            <i class="fa fa-search search-icon" aria-hidden="true"></i>
                        </div>
                        <div class="col-auto">
                            <input id="appFilter" type="text" placeholder="Search the application...">
                        </div>
                    </div>

                </div>
                <br>

                <div class="row align-items-center" >
                    <div class="col-auto" id="input-align-top">
                        <label class="col-form-label" id="title">Report</label>
                        <select class="form-select align-right selectInput filter"
                                aria-label="Default select example" id="Report">
                            style="padding: 0.75 0 0 0.75rem; margin-bottom: 5px; margin-top: -28px; margin-left: 68px; width: auto;">
                            <option class='options' value="intakeReport1">Intake Report 1</option>
                            <option class='options' value="intakeReport2">Intake Report 2</option>
                            <option class='options' value="intakeReport3">Intake Report 3</option>
                        </select>
                    </div>

                </div>
                <div class="col-lg-6 right-side" style="padding-top: 100px; background-color: transparent">
                    <button type="button" class="btn btn-primary pull-right" id="exportButton"
                            name="exportView" >
                        <img src="images/Export.png" alt="ExportOption" class="" height="40" width="45" />
                    </button>

                </div>
            </div>

        </div>

    </div>


</nav>



<br/>

<div class="card-container-5 card d3s-mt-50">
    <div class="card-header d3s-pl-15" id="cd-header"></div>
    <label style="margin-top: 20px ;margin-left: 8px;">Show </label>
    <label style="margin-left: 140px;margin-top: -16px;"> Entries</label>
    <select class="form-select align-left"
            aria-label="Default select example" id="maxRows"
            style="padding: 0.75 0 0 0.75rem; margin-bottom: 5px;  margin-top: -28px;margin-left: 55px; width: 80px;">
        <option value="5000">Show All</option>
        <option value="5">5</option>
        <option value="1">10</option>
        <option value="15">15</option>
        <option value="20">20</option>
        <option value="50">50</option>
        <option value="70">70</option>
        <option value="100">100</option>
    </select><br>
    <div class="withoutPhase display" id="admin_userslist_div">
        <div class="table-container">
            <div id="overlay">
                <div class="cv-spinner">
                    <span class="spinner"></span>
                </div>
            </div>
            <table class="table table-bordered table-responsive"
                   id="admin_userslist" style="width: 200%; font-size: 12px;">


            </table>

        </div>
        <div class="row">
            <div class="col-md-12" align="end">
                <div class='pagination-container' style="float: right;">
                    <nav>
                        <ul class="pagination">

<%--                            <li data-page="prev"><span> << <span class="sr-only">(current)</span></span></li>--%>
<%--                            <!--	Here the JS Function Will Add the Rows -->--%>
<%--                            <li data-page="next" id="prev"><span> >> <span--%>
<%--                                    class="sr-only">(current)</span></span></li>--%>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="col-md-12" align="end" id="recordInfo"></div>
        </div>
    </div>
</div>

</div>


</div>


</div>
</div>
</div>


</div>
</div>
</div>
        <%--Show select tag dynamic --%>
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
<script src="js/notification/notification.js"></script>
<script type="text/javascript" src="js/reportJs/ReportDynamic.js"></script>
<script type="text/javascript" src="js/reportJs/Download.js"></script>

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

<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>--%>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css"/>
<!-- ========== Toastr ========== -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
        href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        rel="stylesheet">

</body>
</html>
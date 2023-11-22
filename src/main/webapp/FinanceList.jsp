<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Users List</title>
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
    /* Add some styling to the search buttons */
    .search-btn {
        background: none;
        border: none;
        color: blue;
        cursor: pointer;
        text-decoration: underline;
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
            -webkit-transform: rotate(
            360deg);
        }
    }

    @
    keyframes sp-anime1 {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(
            360deg);
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
    /*.search-Icon {*/
    /*    position: relative;*/
    /*    left: 8px;*/
    /*    bottom: -23px;*/
    /*    color: #fff;*/
    /*}*/

    #AppFilter {
        position: relative;
        top: 1px;
        border: none;
        border-style: none;
        border-bottom: 1px solid #959595;
        -o-border-image: initial;
        border-image: initial;
        border-radius: 0;
        color: #fff !important;
        text-indent: 12px;
        background-color: transparent !important;
        box-shadow: none;
        bottom: 80px;
        padding-bottom: 13px;
        width: 220px;
        margin-left: 15px;
    }
</style>
<body>

<%@include file="Nav-Bar.jspf" %>

<nav class="nav nav-down-height-17" id="bg-color">
    <div class="container-fluid" id="container-fluid">
        <div class="row" id="d3s-mt-20">
            <div class="col-lg-12 col-md-12">
                <h5 class="title" style="color: #fff">Finance Module</h5>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="sub-title" style="color: #fff">
                    <a href="DashBoard.jsp" id="sitetitle1" style="color: #fff"><span class="glyphicon glyphicon-home"></span> Home</a> >> <a href="FinanceList.jsp" id="sitetitle2" style="color: #fff">Finance Home </a>
                </div>
            </div>
        </div>
    </div>
</nav>
<br>

         <div class="container-fluid "  id="bg-color">
            <h5 id="title2">Finance Filter</h5>
             <i class="fa fa-search search-Icon"></i><input id="AppFilter" type="text" >
         </div>

<div class="col-lg-6 left-side phase-btn1" align="left">
    <a href="FinanceAdd.jsp"> <button type="button" id="add_user_btn" class="btn btn-primary" data-bs-toggle="modal"
            style="margin: 29px 0 0 83px; font-size: 14px; display: none;"> Add Finance</button></a>

    <button type="button" class="btn btn-primary pull-right"
            id="editpopup_btn" data-bs-toggle="modal" data-bs-target="#EditPopUp" style="display: none;">Edit PopUp
    </button>
    <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-bs-toggle="modal"
            data-bs-target="#DeletePopUp" style="display: none;">Delete PopUp
    </button>

</div>
<br/>
<div class="card-container-5 card d3s-mt-50">
    <div class="card-header d3s-pl-15" id="cd-header">Finance Module</div>
    <label style="margin-top: 20px ;margin-left: 8px;">Show </label>
    <label style="margin-left: 140px;margin-top: -16px;"> Entries</label>
    <select class="form-select align-left"
            aria-label="Default select example" id="maxRows"
            style="padding: 0.75 0 0 0.75rem; margin-bottom: 5px;  margin-top: -28px;margin-left: 55px; width: 80px;">
        <option value="5000">Show All</option>
        <option value="2">5</option>
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

<div class="modal" id="DeletePopUp" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #1565c0;">
                <h5 class="modal-title" id="exampleModalLabel"
                    style="color: white;">Delete User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p style="font-size: 14px;">Do you want to Delete this Finance Information Permanently?</p>
                        <input type="text" id="random_id" style="display: none;"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"
                        data-bs-dismiss="modal" id="delete_submit">Yes
                </button>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">No
                </button>
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
<script src="js/Finance/Finance_list_retrive.js"></script>
<script src="js/Finance/FinanceListDeleteAjax.js"></script>
<!-- ========== Pagination ========== -->

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous">

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
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css"/>
<!-- ========== Toastr ========== -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
        href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        rel="stylesheet">
<script src="js/notification/notification.js"></script>

</body>
</html>
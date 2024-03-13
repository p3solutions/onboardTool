<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css"
          media="screen">

    <title>D3Sixty - Issue/Risk Tracker</title>
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
    <!-- <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">  -->

    <!-- =========== Header Icon ========= -->
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="css/headerIcon/headerIcon.css"
          media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/common/email/emailAjaxCall.js"></script>
    <script src="js/modernizr/modernizr.min.js"></script>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <link
            href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
            rel="stylesheet">

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="js_in_pages/requirements.css"
          type="text/css" />
    <link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
          media="screen">
    <link rel="stylesheet" href="css/Responsive/responsive.css"
          media="screen">
    <script src="js/archiveExeRiskTracker/archiveExeIssueRiskTracker.js"></script>
    <!-- ========== Pagination ========== -->
    <script src="js/paging/pagination.js"></script>


</head>

<style>
    body {
        background-color: #fff;
        margin: 0;
        padding: 0;
        font-family: 'Poppins', sans-serif;
    }
    .page-title-div {
        background: #1565c0;
        padding: 15px;
    }
    h1 {
        text-align: center;
        font-family: Tahoma, Arial, sans-serif;
        color: #06D85F;
        margin: 80px 0;
    }
    .box {
        width: 40%;
        margin: 0 auto;
        background: rgba(255, 255, 255, 0.2);
        padding: 50px;
        border: 2px solid #fff;
        border-radius: 20px/50px;
        background-clip: padding-box;
        text-align: center;
    }
    .overlay {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0, 0, 0, 0.7);
        transition: opacity 500ms;
        visibility: hidden;
    }
    .overlay:target {
        visibility: visible;
        opacity: 1;
    }
    .popup {
        margin: 210px auto;
        padding: 20px;
        background: #fff;
        border-radius: 5px;
        width: 40%;
        position: relative;
    }
    .popup h2 {
        margin-top: 0;
        color: #333;
        font-family: Tahoma, Arial, sans-serif;
    }
    .popup .close {
        position: absolute;
        top: 20px;
        right: 30px;
        transition: all 200ms;
        font-size: 30px;
        font-weight: bold;
        text-decoration: none;
        color: black;
    }
    .popup .close:hover {
        color: black;
    }
    .popup .content {
        max-height: 30%;
        overflow: auto;
    }
    .button {
        color: white;
    }
    @media screen and (max-width: 700px) {
        .box {
            width: 70%;
        }
        .popup {
            width: 70%;
        }
    }
    #nav_userid {
        color: green;
    }
    #nav_role {
        color: blue;
    }
    .ScrollStyle {
        max-height: 350px;
        overflow-y: scroll;
    }
    .table-title .add-new {
        float: right;
        height: 30px;
        font-weight: bold;
        font-size: 12px;
        text-shadow: none;
        min-width: 100px;
        border-radius: 50px;
        line-height: 13px;
    }
    .table-title .add-new i {
        margin-right: 4px;
    }
    table.table td a {
        cursor: pointer;
        display: inline-block;
        margin: 0 5px;
        min-width: 24px;
    }
    table.table td a.add {
        color: #27C46B;
    }
    table.table td a.edit {
        color: #FFC107;
    }
    table.table td a.delete {
        color: #E34724;
    }
    table.table td i {
        font-size: 19px;
    }
    table.table td a.add i {
        font-size: 24px;
        margin-right: -1px;
        position: relative;
        top: 3px;
    }
    table.table .form-control {
        height: 32px;
        line-height: 32px;
        box-shadow: none;
        border-radius: 2px;
    }
    table.table .form-control.error {
        border-color: #f50000;
    }
    table.table td .add {
        display: none;
    }
    .active1 {
        background: #1565c0;
    }
    .page-title-div {
        background: #1565c0;
        padding: 15px;
    }
    .navbar-nav-1 #nav-link.active-1 {
        /* border-top: none; */
        border-left: none;
        border-right: none;
        border-bottom: 4px solid rgba(255, 255, 255, .5) !important;
    }
</style>

<body class="top-navbar-fixed">

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed IntakeArchiveRequirements JSP PAGE-----[INFO]"); %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection"%>


<%
    try {
        HttpSession details = request.getSession();
        String roles = (String) details.getAttribute("role");
        String det = (String) session.getAttribute("theName");
        String idd = (String) session.getAttribute("appidd");
        String Opportunityname=(String)session.getAttribute("SelectedOpportunity");
        DBconnection d = new DBconnection();
        Connection conn = (Connection) d.getConnection();

%>

<%@include file="Nav-Bar.jspf"%>
<nav class="nav nav-height-70 nav-font" id="bg-color">
    <div class="container-fluid">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav-1 mt-3">
                <li id="nav-link"><a class="link"
                                     href="ArchiveExecutionDetails.jsp"
                                     style="color: #fff; padding: 7px 10px; height: 35px;">Project
                    Plan</a></li>
                <li class="active-1" id="nav-link"><a class="link"
                                                      href="archiveExeIssueRiskTracker.jsp"
                                                      style="color: #fff; padding: 7px 10px; height: 35px;">Issue/Risk
                    Tracker</a></li>
            </ul>
        </div>
    </div>
</nav>
<form class="form-signin" name="loginForm" method="post">

    <div class="main-wrapper">
        <!--
       <nav class="navbar top-navbar bg-white box-shadow">
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


                     <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >> Introduction</p>


                </div>
            </div>
</nav>

    </div>
    /.container-fluid
</nav> -->

        <div class="content-wrapper">

            <div class="content-container"  style="background-color: #f2f2f2;">


                <!-- Projects List Start -->

                <div class="main-page">

                    <section class="wizard-section">
                        <div class="row">
                            <div class="container">



                                <%
                                    String initiate = (String) session.getAttribute("Ideation and Initiate");
                                    String plan = (String) session.getAttribute("Plan");
                                    String execute = (String) session.getAttribute("Execute");
                                    String hypercare = (String) session.getAttribute("Closure");
                                    if (initiate == null)
                                        initiate = "0";
                                    if (plan == null)
                                        plan = "0";
                                    if (execute == null)
                                        execute = "0";
                                    if (hypercare == null)
                                        hypercare = "0";
                                %>
                                <br />
                                <br />





                                <div class="tab-pane" role="tabpanel" id="step4">

                                    <!-- Archive Requirement Table -->
                                    <div class="card-container-2 card">
                                        <div class="card-header" id="cd-header">Issue/Risk
                                            Tracker</div>

                                        <div id="collapse4" class="panel-collapse ">

                                            <div id="collapse1" class="panel-collapse " name="collapse">
                                                <div class="card-body" style="background-color: #f2f2f2;">
                                                    <div id="inputFieldsAssessment">
                                                        <!-- <div class="panel panel-default"> -->


                                                        <!-- Roles & Responsibilites -->
                                                        <!-- <div class="panel panel-default">
                                                            <div id="collapse6" class="panel-collapse">
                                                                <div class="panel-body">
                                                                    <div id="collapse1"
                                                                        class="panel-collapse collapse show" name="collapse">
                                                                        <div class="panel-body"> -->
                                                        <div id="inputFieldsRoles">
                                                            <div style="overflow-x: auto;">
                                                                <h4 class="title1">App Issue</h4>
                                                                <table id="trackerTable" class="table-bordered"
                                                                       style="width: 100%;">
                                                                    <thead>
                                                                    <tr>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>ACTION</th>

                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>Id</th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>IMPACT</th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>TYPE
                                                                        </th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>DESCRIPTION</th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>START
                                                                            DATE</th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>RAISED
                                                                            BY</th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>ACTION/STATUS</th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>ASSIGNED
                                                                            TO</th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>RESOLVED</th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>EXPECTED
                                                                            DATE</th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>
                                                                            END DATE</th>
                                                                        <th
                                                                                style='text-align: center; vertical-align: middle;'>COMMENTS</th>

                                                                    </tr>

                                                                    </thead>
                                                                    <tbody id="AppIssue">

                                                                    </tbody>
                                                                </table>

                                                            </div>
                                                            <div class="col-md-12 text-center mt-3">
                                                                <ul class="pagination pagination-lg pager pagination-align"
                                                                    id="tracker_page"></ul>
                                                            </div>
                                                            <div class="row mt-5">

                                                                <div class="col-4">
                                                                    <button type="button" class="btn btn-secondary"
                                                                            onclick="location.href='ArchiveExecutionDetails.jsp';">Back</button>
                                                                </div>
                                                                <div class="col-8" align="end">
                                                                    <button class="btn btn-secondary" type="button"
                                                                            id="AddIssue">Add</button>
                                                                    <button type="submit" class="btn btn-primary"
                                                                            id="saveArchiveExeIssue">Save</button>


                                                                    <button type="button"
                                                                            class="btn btn-primary pull-right"
                                                                            id="ArchReqDeleteId" data-bs-toggle="modal"
                                                                            data-bs-target="#ArchiveDeletePopUp"
                                                                            style="display: none;">Delete PopUp</button>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div> -->

                            </div>
                        </div>

                    </section>
                    <!-- /.section -->

                </div>
                <!-- /.main-page -->

                <!-- Project List End -->

            </div>
            <!-- /.content-container -->

            <!-- /.main-wrapper -->
            <script>
                function validateform9() {
                    var f = document.loginForm;
                    f.method = "post";
                    f.action = 'ArchivalRequirements';
                    f.submit();
                }
            </script>


            <%
                //     }
                //    }
            %>
        </div>
    </div>
</form>

<!-- Archive Req Intro Roles & Response Delete PopUp -->
<div class="modal" id="ArchiveDeletePopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
                <button type="button" id="ArchiveDeleteClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p>Do you want to delete this Row permanently?</p>
                        <input type="hidden" id="ArchiveDeleteSeq" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="ArchiveDeleteSubmit"
                        class="btn btn-primary submitDisableDelete">Yes</button>
                <button type="button" class="btn btn-secondary" id="closeIdDelete"
                        data-bs-dismiss="modal" aria-label="Close">No</button>
            </div>
        </div>
    </div>
</div>


<jsp:include page="samp_forms.jsp">
    <jsp:param name="ProjectName" value="<%=Opportunityname %>" />
    <jsp:param name="AppName" value="<%=idd %>" />
    <jsp:param name="number" value="2" />
    <jsp:param name="servlet" value="Requirements" />
</jsp:include>
<%
        //       }
        //    }
    }
    catch (Exception e) {
    }
%>

<!-- Active Icon Color changes  -->
<script>
    $(document).on('mouseenter','.active1', function(){
        $('.activeIcon').css('color','#1565c0');

    });

    $(document).on('mouseleave','.active1', function(){
        $('.activeIcon').css('color','#fff');

    });
</script>
<%@include file="Footer.jspf"%>
<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>

<script src="js/iscroll/iscroll.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/Introduction/archiveReqIntroAssumptionToDoList.js"></script>

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

<script id="scripttag"></script>

<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script type="text/javascript"
        src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>

<script src="js/notification/notification.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/Introduction/ArchiveIntroSave.js"></script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
        href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        rel="stylesheet">

</body>
</html>
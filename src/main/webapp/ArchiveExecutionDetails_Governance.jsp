<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D3Sixty - ArchiveExecution-Governance</title>

    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">

    <link
            href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css"
            rel="stylesheet">

    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css"
          media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
          media="screen">
    <link rel="stylesheet" href="css/UserInfo/userinfo.css">
    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
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
    <!-- Page Spinner -->
    <link rel="stylesheet" href="css/pageSpinner/pageSpinner.css">

    <!-- Archive Execution Collapse -->
    <link
            href='https://fonts.googleapis.com/css?family=Roboto:300,400,500,700'
            rel='stylesheet' type='text/css'>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">



    <link rel="stylesheet"
          href="css/ArchiveExecutionCss/archiveCollapse/archiveExecutionCollapse.css" />
    <link rel="stylesheet"
          href="css/ArchiveExecutionCss/archiveCircleStatus/circle.css" />
    <link rel="stylesheet"
          href="css/ArchiveExecutionCss/archiveExecutionHeaderInfo/archiveExecHeaderInfo.css" />







    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css">

    <link rel="stylesheet"
          href="css/ArchiveExecutionCss/archiveExecutionStatus/archiveExecStatus.css" />
    <script
            src="js/ArchiveExecutionDetailsGovernance/ArchiveExecutionGovernanceInfo/ArchiveExecutionGovernanceDataRetrieve.js"></script>

    <link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
          media="screen">
    <link rel="stylesheet" href="css/Responsive/responsive.css"
          media="screen">


    <style>

        style type ="text /css ">body {
                                    background: #fff;
                                }

        .page-title-div {
            background: #1565c0;
            padding: 15px;
        }

        .fixed-top {
            width: 100%;
            padding-left: 0px;
            padding-right: 0px;
        }


        Wizard-->body {
            background-color: #ffffff;
            color: #444444;
            font-family: 'Roboto', sans-serif;
            font-size: 16px;
            font-weight: 300;
            margin: 0;
            padding: 0;
        }

        .wizard-content-left {
            background-blend-mode: darken;
            background-color: rgba(0, 0, 0, 0.45);
            background-image: url("https://i.ibb.co/X292hJF/form-wizard-bg-2.jpg");
            background-position: center center;
            background-size: cover;
            height: 100vh;
            padding: 30px;
        }

        .wizard-content-left h1 {
            color: #ffffff;
            font-size: 38px;
            font-weight: 600;
            padding: 12px 20px;
            text-align: center;
        }

        .form-wizard {
            color: #888888;
        }

        .form-wizard .wizard-form-radio {
            display: inline-block;
            margin-left: 5px;
            position: relative;
        }

        .form-wizard .wizard-form-radio input[type="radio"] {
            -webkit-appearance: none;
            -moz-appearance: none;
            -ms-appearance: none;
            -o-appearance: none;
            appearance: none;
            background-color: #dddddd;
            height: 25px;
            width: 25px;
            display: inline-block;
            vertical-align: middle;
            border-radius: 50%;
            position: relative;
            cursor: pointer;
        }

        .form-wizard .wizard-form-radio input[type="radio"]:focus {
            outline: 0;
        }

        .form-wizard .wizard-form-radio input[type="radio"]:checked {
            background-color: #fb1647;
        }

        .archeadbutton {
            background-color: #1565c0;
            border: 2px #80ffd3;
            color: white;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 13.5px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 60px;
            font-weight: 600;
        }

        .archeadbutton:hover {
            background-color: #20336e;
            color: #80ffd3;
        }

        .form-wizard .wizard-form-radio input[type="radio"]:checked::before {
            content: "";
            position: absolute;
            width: 10px;
            height: 10px;
            display: inline-block;
            background-color: #ffffff;
            border-radius: 50%;
            left: 1px;
            right: 0;
            margin: 0 auto;
            top: 8px;
        }

        .form-wizard .wizard-form-radio input[type="radio"]:checked::after {
            content: "";
            display: inline-block;
            webkit-animation: click-radio-wave 0.65s;
            -moz-animation: click-radio-wave 0.65s;
            animation: click-radio-wave 0.65s;
            background: #000000;
            content: '';
            display: block;
            position: relative;
            z-index: 100;
            border-radius: 50%;
        }

        .form-wizard .wizard-form-radio input[type="radio"] ~ label {
            padding-left: 10px;
            cursor: pointer;
        }

        .form-wizard .form-wizard-header {
            text-align: center;
        }

        .form-wizard .wizard-fieldset {
            display: none;
        }

        .form-wizard .wizard-fieldset.show {
            display: block;
        }

        .form-wizard .wizard-form-error {
            display: none;
            background-color: #d70b0b;
            position: absolute;
            left: 0;
            right: 0;
            bottom: 0;
            height: 2px;
            width: 100%;
        }

        .form-wizard .form-control:focus {
            box-shadow: none;
        }

        .form-wizard .form-group {
            position: relative;
            margin: 25px 0;
        }

        .form-wizard .wizard-form-text-label {
            position: absolute;
            left: 10px;
            top: 16px;
            transition: 0.2s linear all;
        }

        .form-wizard .focus-input .wizard-form-text-label {
            color: #d65470;
            top: -18px;
            transition: 0.2s linear all;
            font-size: 12px;
        }

        .form-wizard .form-wizard-steps {
            margin: 30px 0;
        }

        .form-wizard .form-wizard-steps li {
            width: 14%;
            float: left;
            position: relative;
        }

        .form-wizard .form-wizard-steps li::after {
            background-color: #f3f3f3;
            content: "";
            height: 5px;
            left: 0;
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 100%;
            border-bottom: 1px solid #dddddd;
            border-top: 1px solid #dddddd;
        }

        .form-wizard .form-wizard-steps li span {
            background-color: #dddddd;
            border-radius: 50%;
            display: inline-block;
            height: 40px;
            line-height: 40px;
            position: relative;
            text-align: center;
            width: 40px;
            z-index: 1;
        }

        .form-wizard .form-wizard-steps li:last-child::after {
            width: 50%;
        }

        .form-wizard .form-wizard-steps li.active span, .form-wizard .form-wizard-steps li.activated span
        {
            background-color: #0db02b;
            color: #ffffff;
        }

        .form-wizard .form-wizard-steps li.active::after, .form-wizard .form-wizard-steps li.activated::after
        {
            background-color: #0db02b;
            left: 50%;
            width: 50%;
            border-color: #0db02b;
        }

        .form-wizard .form-wizard-steps li.activated::after {
            width: 100%;
            border-color: #0db02b;
        }

        .form-wizard .form-wizard-steps li:last-child::after {
            left: 0;
        }

        .form-wizard .wizard-password-eye {
            position: absolute;
            right: 32px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        @
        keyframes click-radio-wave { 0% {
            width: 25px;
            height: 25px;
            opacity: 0.35;
            position: relative;
        }

            100



            %
            {
                width




                :














                        60px












            ;
                height














                :














                        60px












            ;
                margin-left














                :














                        -15px












            ;
                margin-top














                :














                        -15px












            ;
                opacity














                :














                        0












                        .0












            ;
            }
        }
        @media screen and (max-width: 767px) {
            .wizard-content-left {
                height: auto;
            }
        }

        fieldset {
            padding: 0.875em 1.75em 1.75em;
            border-width: 1px #fff;
            border-style: solid;
            max-width: 141%;
            margin-bottom: 1.875em;
        }

        .form-wizard-steps li  i {
            position: absolute;
            top: -22px;
            font-style: normal;
            font-weight: 400;
            white-space: nowrap;
            left: 50%;
            transform: translate(-50%, -50%);
            font-size: 14px;
            font-weight: 700;
            color: #000;
        }

        .form-wizard-steps li  i {
            color: #d65470;
        }

        .back-to-top {
            position: fixed;
            bottom: 20px;
            right: 35px;
            border-radius: 50%;
            background: Gray;
        }

        .fa {
            padding-left: 3px;
            padding-top: -3px;
            padding-bottom: 10px;
            margin: 0 auto;
            font-size: 14x;
            color: #fff;
        }

        #module_header {
            margin-top: 75px;
        }

        table {
            width: 92%;
            border-spacing: 0;
            margin-bottom: 2.375em;
            border-style: none;
        }

        .pdf {
            float: right;
            margin-top: -36px;
        }

        .pdf {
            background: #1565c0;
        }

        .switch {
            position: relative;
            display: inline-block;
            width: 60px;
            height: 34px;
        }

        .switch input {
            opacity: 0;
            width: 0;
            height: 0;
        }

        .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ccc;
            -webkit-transition: .4s;
            transition: .4s;
        }

        .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
        }

        input:checked+.slider {
            background-color: #2196F3;
        }

        input:focus+.slider {
            box-shadow: 0 0 1px #2196F3;
        }

        input:checked+.slider:before {
            -webkit-transform: translateX(26px);
            -ms-transform: translateX(26px);
            transform: translateX(26px);
        }

        /* Rounded sliders */
        .slider.round {
            border-radius: 34px;
        }

        .slider.round:before {
            border-radius: 50%;
        }

        .userlist {
            width: 95%;
        }

        input[type="text"] {
            font-size: 12px;
        }

        .panelSize {
            display: flex;
            justify-content: center;
        }

        .triangle {
            position: absolute;
        }

        .triangle.down {
            width: 0;
            height: 0;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-top: 10px solid #ccc;
            top: 20px;
        }

        .triangle.up {
            width: 0;
            height: 0;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-bottom: 10px solid #ccc;
            border-top: none;
        }

        .active-1 {
            background: #1565c0;
        }

        .page-title-div {
            background: #1565c0;
            padding: 15px;
        }

        .fixed-top {
            width: 100%;
            padding-left: 0px;
            padding-right: 0px;
        }

        .navbar-nav-1 #nav-link {
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom: 4px solid transparent;
        }

        .navbar-nav .nav-link-2.active-2 {
            /* border-top: none; */
            border-left: none;
            border-right: none;
            border-bottom: 4px solid rgba(255, 255, 255, .5) !important;
        }

        .navbar-nav-1 #nav-link {
            border-top: none;
            border-left: none;
            border-right: none;
            border-bottom: 4px solid transparent;
        }

        .link:hover {
            background: #1565c0 important;
        }

        .active2 {
            background: #1565c0;
        }

        .page-title-div {
            background: #1565c0;
            padding: 15px;
        }
    </style>


</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date newDate1 = new Date();
    System.out.println("[INFO]-----" + formatter1.format(newDate1) + "-----Accessed OpportunityList JSP PAGE-----[INFO]");
%>
<%@page language="java"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection"%>
<%@page import="org.owasp.encoder.Encode"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<%
    PreparedStatement visit_start = null;
    ResultSet visit_reset = null;
    HttpSession role_session = request.getSession();
    String frole1 = (String) role_session.getAttribute("role");
    //int sumcount1=0;
    Statement sDate, sTime;
    try {
        //String query;
        HttpSession sessionDetails = request.getSession();
        String Projects = (String) sessionDetails.getAttribute("projects");
        System.out.println("projects-------------" + Projects);
        String rolesList = (String) sessionDetails.getAttribute("role");
        DBconnection db = new DBconnection();
        Connection connectCon = (Connection) db.getConnection();
        String visit_query1 = "select * from visits";
        visit_start = connectCon.prepareStatement(visit_query1);
        visit_reset = visit_start.executeQuery();
        int flag1 = 1, knt1 = 0;
        Date newDate = new Date();
        SimpleDateFormat fDate, fTime;
        String userName = (String) sessionDetails.getAttribute("username");

        fDate = new SimpleDateFormat("yyyy-MM-dd");
        fTime = new SimpleDateFormat("hh:mm:ss");
        String startDate = fDate.format(newDate);
        String startTime = fTime.format(newDate);
        while (visit_reset.next()) {
            if (visit_reset.getString(6) != null) {
                if (visit_reset.getString(1).equals(userName) && visit_reset.getString(2).equals(startDate)
                        && visit_reset.getString(3).equals("Logged in")) {
                    String queryy = "update visits set count=count+1,time=? where uname=? and module='Logged in'  and date =?";
                    PreparedStatement stmtt = connectCon.prepareStatement(queryy);
                    stmtt.setString(1, startTime);
                    stmtt.setString(2, userName);
                    stmtt.setString(3, startDate);
                    int count = stmtt.executeUpdate();
                    flag1 = 0;
                    break;
                }
            }

        }
        //System.out.println("the flag value is "+flag);
        if (flag1 == 1) {
            String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
                    + " values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = connectCon.prepareStatement(ins_query);
            preparedStmt.setString(1, userName);
            preparedStmt.setString(2, startDate);
            preparedStmt.setString(3, "Logged in");
            preparedStmt.setString(4, "1");
            preparedStmt.setString(5, startTime);
            preparedStmt.setString(6, "None");
            preparedStmt.setString(7, "");

            // execute the preparedstatement
            preparedStmt.execute();
        }
%>
<%--	 <%@include file="Nav-Bar.jspf"%>--%>
<nav
        class="navbar navbar-expand-md navbar-light bg-white nav-height nav-font row">
    <div class="container-fluid col-sm-12 col-md-12 col-lg-12">
        <div class="col-sm-2 col-md-2 col-lg-2">
            <a class="navbar-brand" href="OpportunityList.jsp"> <img
                    src="images/D3Sixty-logo.png" class="d3s-logo-1" alt="D3Sixty">
            </a>
        </div>
        <div class="col-md-8 col-lg-8 col-sm-8">
            <div class="collapse navbar-collapse">
                <ul class="nav navbar-nav mr-auto d3s-ml-40">
                    <li class="nav-item moduleIcon"><a class="nav-link active"
                                                       aria-current="page" href="OpportunityList.jsp"><i
                            class="fas fa-folders fa-2x iconAlign iconColor"></i>Applications</a>
                    </li>

                    <li class="nav-item moduleIcon"><a class="nav-link active"
                                                       aria-current="page" href="Admin_Userslist.jsp"><i
                            class="fas fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a>
                    </li>
                    <li class="nav-item moduleIcon"><a class="nav-link active2"
                                                       aria-current="page" href="Governance_Home.jsp"><i
                            class="fas fa-desktop iconAlign iconColor fa-2x"></i>Governance</a></li>
                    <li class="nav-item moduleIcon"><a
                            class="nav-link active" aria-current="page" href="FinanceList.jsp"><i
                            class="fas fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
                    <li class="nav-item moduleIcon"><a class="nav-link active"
                                                       aria-current="page" href="DashBoard.jsp"><i
                            class="fas fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a>
                    </li>
                    <li class="nav-item moduleIcon" id="complianceHint"
                        data-toggle="tooltip" title="For Future Enhancement"><a
                            class="nav-link active" aria-current="page" href="#"><i
                            class="fas fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a>
                    </li>

                </ul>

            </div>
        </div>
        <div class="col-sm-2 col-md-2 col-lg-2">
            <div class="dropdown d3s-ml-80 mt-3" align="end">
                <a class="dropdown-toggle" href="#" role="button"
                   data-toggle="dropdown" aria-expanded="false"><i
                        class="fas fa-user-circle iconAlign iconColor fa-3x"
                        style="margin-top: 25px;"></i><span class="caret"
                                                            style="position: absolute; top: 2rem; left: 5rem;"></span> </a>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item" href="#" id="textAlign"><i
                            class="fas fa-user-circle iconAlign iconColor fa-3x"></i><br />Signed
                        in as <br /> <b><%=Encode.forHtml(userName)%></b></a></li>
                    <hr style="margin-left: 0px;" />
                    <li><a class="dropdown-item li-align" href="#" id="textAlign"
                           onclick="location.href='Login.jsp';"><i
                            class="fa fa-sign-out fa-1x" style="color: #1565c0;"></i>Logout</a></li>
                </ul>
            </div>
        </div>


    </div>

</nav>

<%
        connectCon.close();

    }

    catch (Exception e) {
        e.printStackTrace();
    } finally {

        visit_start.close();
        visit_reset.close();
    }
%>

<nav class="nav nav-height nav-font" id="bg-color">
    <div class="container-fluid" id="container-fluid-margin">
        <div class="row" id="d3s-mt-10">
            <div class="col-lg-12 col-md-12">
                <h5 style="margin-top: -10px; margin-bottom: 5px;" id="title">Project
                    Plan</h5>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12">
                <div class="sub-title" style="color: #fff">
                    <a href="DashBoard.jsp" id="sitetitle1" style="color: #fff"><span
                            class="glyphicon glyphicon-home"></span> Home</a> >> <a
                        href="Governance_Home.jsp" id="sitetitle1" style="color: #fff">
                    Governance</a> >> Archive Execution
                </div>
            </div>


            <div class="col-lg-3 col-md-6"
                 style="margin-top: -30px; margin-left: 30%;">
                <div class="row align-items-center">
                    <div class="col-auto">
                        <label class="col-form-label" id="title">Phase</label>
                    </div>
                    <div class="col-auto">
                        <select class="selectInput filter dropDown-width" id="phase">

                        </select>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6"
                 style="margin-top: -43.5px; margin-left: 50%;">
                <div class="row align-items-center">
                    <div class="col-auto">
                        <label class="col-form-label" id="title">Wave</label>
                    </div>
                    <div class="col-auto">
                        <select class="selectInput filter dropDown-width" id="wave">

                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>
</nav>
<center><label id="govmsg"style="color:#888888; margin-top:15px;">Please select Phase and Wave to view the details</label></center>
<div id="demo" style="display: none;">
    <form class="form-signin" name="loginForm" method="post">
        <div class="main-wrapper">

            <div class="content-wrapper">
                <div class="content-container">

                    <div class="main-page">

                        <section>
                            <div class="row">
                                <div class="container">
                                    <div class="panelSize col-md-12 col-sm-12">
                                        <div class="form-wizard">
                                            <form action="" method="post" role="form">
                                                <!-- <div class="form-wizard-header container">
                        							<p>Fill all the required fields to go next step</p>
                        							<ul class="list-unstyled form-wizard-steps clearfix">
                            							<li class="active"><span>1</span><i>Project Plan</i></li>
                            							<li><span>2</span><i>Project Summary</i></li>
                        							</ul>
                    							</div> -->
                                                <div class="card-container-5 card">
                                                    <center>
                                                        <a href="#" id="phaseName" class="archeadbutton"
                                                           style="color: white; border: 2px #80ffd3;"></a> <a
                                                            href="#" id="waveName" class="archeadbutton"
                                                            style="color: white;"></a></br> <a href="#"
                                                                                               id="creation_date" class="archeadbutton"
                                                                                               style="color: white;"></a> <a href="#"
                                                                                                                             id="completion_date" class="archeadbutton"
                                                                                                                             style="color: white;"></a>
                                                    </center>
                                                </div>
                                                <div class="card-header d3s-pl-15" id="cd-header">Archive
                                                    Execution</div>
                                                <div class="panel-collapse collapse in" name="collapse">
                                                    <div class="panel-body">

                                                        <div>
                                                            <!-- <h4>Task List</h4>   -->
                                                            <div class="panel-group wrap" id="accordion"
                                                                 role="tablist" aria-multiselectable="true">
                                                                <div class="panel table-responsive">
                                                                    <table class="table table-bordered"
                                                                           style="width: 100%; font-size: 12px;">

                                                                        <thead>
                                                                        <tr>
                                                                            <th
                                                                                    style='text-align: center; vertical-align: middle;'>Application
                                                                                Name</th>
                                                                            <th
                                                                                    style='text-align: center; vertical-align: middle;'>Task
                                                                                Id</th>
                                                                            <th
                                                                                    style='text-align: center; vertical-align: middle;'>Task
                                                                                Group</th>
                                                                            <th
                                                                                    style='text-align: center; vertical-align: middle;'>Planned
                                                                                Start</th>
                                                                            <th
                                                                                    style='text-align: center; vertical-align: middle;'>Planned
                                                                                End</th>
                                                                            <th
                                                                                    style='text-align: center; vertical-align: middle;'>Actual
                                                                                Start</th>
                                                                            <th
                                                                                    style='text-align: center; vertical-align: middle;'>Actual
                                                                                End</th>
                                                                            <th
                                                                                    style='text-align: center; vertical-align: middle;'>%
                                                                                Completion</th>
                                                                            <th
                                                                                    style='text-align: center; vertical-align: middle;'>Status</th>
                                                                            <th
                                                                                    style='text-align: center; vertical-align: middle;'>Remarks</th>

                                                                        </tr>
                                                                        </thead>
                                                                        <tbody id="ArchiveExecutionList">

                                                                        </tbody>
                                                                        <tbody id="notfound" style="display: none;">
                                                                        <tr>
                                                                            <td colspan='10' style="text-align: center;"><label
                                                                                    style="color: black;">No Apps Found in
                                                                                this Wave.</label></td>
                                                                        </tr>
                                                                        </tbody>
                                                                    </table>
                                                                </div>
                                                            </div>
                                                            <div class="container loader" id="spinner"></div>
                                                        </div>
                                                    </div>
                                                    <!-- Parent  -->
                                                    <button type="button" class="btn btn-primary pull-right"
                                                            id="ArchExecParentId" data-toggle="modal"
                                                            data-target="#ArchiveParentAddPopUp"
                                                            style="display: none;">Parent Add PopUp</button>

                                                    <!-- Child  -->

                                                    <button type="button" class="btn btn-primary pull-right"
                                                            id="ArchExecChildId" data-toggle="modal"
                                                            data-target="#ArchiveChildAddPopUp"
                                                            style="display: none;">Child Add PopUp</button>

                                                    <!-- Edit Button -->
                                                    <button type="button" class="btn btn-primary pull-right"
                                                            id="ArchExecEditId" data-toggle="modal"
                                                            data-target="#ArchiveEditPopUp" style="display: none;">Edit
                                                        PopUp</button>

                                                    <!-- Delete Button -->
                                                    <button type="button" class="btn btn-primary pull-right"
                                                            id="ArchExecDeleteId" data-toggle="modal"
                                                            data-target="#ArchiveDeletePopUp" style="display: none;">Delete
                                                        PopUp</button>
                                                    <!-- Remarks Button -->
                                                    <button type="button" class="btn btn-primary pull-right"
                                                            id="ArchExecRemarksId" data-toggle="modal"
                                                            data-target="#ArchiveRemarksPopUp" style="display: none;">Remarks
                                                        PopUp</button>

                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    </div>
                </div>
                </section>
            </div>
        </div>
</div>
</div>
</form>



<!-- Archive Execution Parent Add PopUp -->
<div class="modal" id="ArchiveParentAddPopUp" tabindex="-1"
     role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Input Fields</h5>
                <button type="button" class="close" id="ArchiveParentAddCloseId"
                        data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div id="scrollbar">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <label class="control-label" for="ArchiveExecution">Select
                                        Parent or Child</label> <input class="form-check-input" type="radio"
                                                                       class="radioOption" name="ArchExecRadio" id="inlineRadio1"
                                                                       value="Parent">&nbsp;Parent Row &nbsp; <input
                                        class="form-check-input" type="radio" class="radioOption"
                                        name="ArchExecRadio" id="inlineRadio2" value="Child">&nbsp;Child
                                    Row
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <label class="control-label" for="ArchiveExecution">Task
                                        Group Label</label> <input type="text" class="form-control"
                                                                   id="ArchiveParentGrpLabel" name="ArchiveParentGrpLabel"
                                                                   required>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <label class="control-label" for="ArchiveExecution">Task
                                        Name Label</label> <input type="text" class="form-control"
                                                                  id="ArchiveParentNameLabel" name="ArchiveParentNameLabel"
                                                                  required>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-8">
                                <label class="control-label hidePlanSrt" style="display: none;"
                                       for="ArchiveExecution">Plan Start Date</label> <input
                                    type="text" class="form-control datepicker2 hidePlanSrt"
                                    style="display: none;" size="35" id="planSrtDate"
                                    placeholder="mm/dd/yyyy" name="planSrtDateName" />
                            </div>
                        </div>
                        <input type="hidden" id="checkPlanStartDate" value="" /> <input
                            type="hidden" id="seqNumParId" name="seqNumParName" value="">


                        <input type="hidden" id="project_name" name="project_name"
                               value=""> <input type="text" id="appln_name"
                                                name="appln_name" value="" style="display: none;"> <input
                            type="text" id="servlet_name" name="servlet_name" value=""
                            style="display: none;">


                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="ArchiveParentSubmit"
                        class="btn btn-primary submitDisable">Add Fields</button>
                <button type="button" class="btn btn-secondary" id="closeIdParent"
                        data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Archive Execution Child Add PopUp -->
<div class="modal" id="ArchiveChildAddPopUp" tabindex="-1"
     role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Child Input Fields</h5>
                <button type="button" class="close" id="ArchiveChildAddCloseId"
                        data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div id="scrollbar">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <label class="control-label" for="ArchiveExecution">Task
                                        Group Label:</label> <input type="text" class="form-control"
                                                                    id="ArchiveChildGrpLabel" name="ArchiveChildGrpLabel"
                                                                    required>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <label class="control-label" for="ArchiveExecution">Task
                                        Name Label:</label> <input type="text" class="form-control"
                                                                   id="ArchiveChildNameLabel" name="ArchiveChildNameLabel"
                                                                   required>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-md-8">
                                <label class="control-label hidePlanSrt1"
                                       for="ArchiveExecution">Plan Start Date</label> <input
                                    type="text" class="form-control datepicker2 hidePlanSrt1"
                                    size="35" id="planSrtDate1" placeholder="mm/dd/yyyy"
                                    name="planSrtDateName1" />
                            </div>
                        </div>
                        <br /> <input type="hidden" id="checkChildPlanStartDate"
                                      value="" /> <input type="hidden" id="seqNumChlId"
                                                         name="seqNumChlName" value="" /> <input type="hidden"
                                                                                                 id="project_name" name="project_name" value=""> <input
                            type="text" id="appln_name" name="appln_name" value=""
                            style="display: none;"> <input type="text"
                                                           id="servlet_name" name="servlet_name" value=""
                                                           style="display: none;">


                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="ArchiveChildSubmit"
                        class="btn btn-primary submitDisable">Add Fields</button>
                <button type="button" class="btn btn-secondary" id="closeIdChild"
                        data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Archive Execution Edit -->

<div class="modal" id="ArchiveEditPopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Input Fields</h5>
                <button type="button" class="close" id="ArchiveEditCloseId"
                        data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div id="scrollbar">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <label class="control-label" for="ArchiveExecution">Task
                                        Group Label</label> <input type="text" class="form-control"
                                                                   id="ArchiveEditGrpLabel" name="ArchiveEditGrpLabel" required>
                                </div>
                            </div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <label class="control-label" for="ArchiveExecution">Task
                                        Name Label</label> <input type="text" class="form-control"
                                                                  id="ArchiveEditLabelId" name="ArchiveEditNameLabel" required>
                                </div>
                            </div>
                        </div>
                        <br /> <input type="hidden" id="seqNumEditId"
                                      name="seqNumEditName" value=""> <input type="hidden"
                                                                             id="project_name" name="project_name" value=""> <input
                            type="text" id="appln_name" name="appln_name" value=""
                            style="display: none;"> <input type="text"
                                                           id="servlet_name" name="servlet_name" value=""
                                                           style="display: none;">


                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="ArchiveEditSubmit"
                        class="btn btn-primary submitEditDisable">Submit</button>
                <button type="button" class="btn btn-secondary" id="closeIdEdit"
                        data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>


<!-- Archive Execution Delete Popup -->

<div class="modal" id="ArchiveDeletePopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete Field</h5>
                <button type="button" id="ArchiveDeleteClose" class="close"
                        data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
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
                <button type="button" class="btn btn-default" id="closeIdDelete"
                        data-dismiss="modal" aria-label="Close">No</button>
            </div>
        </div>
    </div>
</div>

<!-- Archive Execution Remarks Popup -->

<div class="modal" id="ArchiveRemarksPopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header"
                 style="background-color: #269af8; color: white">
                <h5 class="modal-title" style="color: white">Remarks</h5>
                <button type="button" id="ArchiveRemarksClose" style="color: white"
                        class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title" id="remarksTaskGroup" style="color: white">Task
                    Group:</h5>

            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <div id="remarkPts" class="row changeText RemarksPoints"
                             contenteditable="true" spellcheck="false"></div>
                        <textarea id="govremarks" name="w3review" rows="6" cols="100" disabled></textarea>
                        <input type="hidden" id="ArchiveRemarksSeq" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" id="closeIdRemarks"
                        data-dismiss="modal" aria-label="Close">Close</button>
            </div>
        </div>
    </div>
</div>
</div>
</div>


<!-- Active Icon Color changes  -->
<!-- <script>
$(document).on('mouseenter','.active1', function(){

     $('.activeIcon').css('color','#1565c0');

 });

 $(document).on('mouseleave','.active1', function(){

     $('.activeIcon').css('color','#fff');

 });
</script>
-->
<!-- Date picker -->
<!--  <link href = "https://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css"
     rel = "stylesheet"> -->
<!-- <script src = "https://code.jquery.com/jquery-1.10.2.js"></script> -->
<!-- <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script> -->
<link
        href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
        rel="stylesheet">
<script
        src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script src="js/toastr/toastr.min.js"></script>
<script src="js/notification/notification.js"></script>
<script
        src="js/ArchiveExecutionDetailsGovernance/ArchiveExecutionGovernanceInfo/ArchiveExecutionGovernanceSaveValidation.js"></script>
<script
        src="js/ArchiveExecutionDetailsGovernance/ArchiveExecutionGovernanceInfo/ArchiveExecutionGovernanceSave.js"></script>
<script
        src="js/ArchiveExecutionDetailsGovernance/ArchiveExecutionGovernanceInfo/ArchiveExecutionGovernanceAddAjaxCall.js"></script>
<script
        src="js/ArchiveExecutionDetailsGovernance/ArchiveExecutionGovernanceInfo/ArchiveExecutionGovernanceEdit.js"></script>
<script
        src="js/ArchiveExecutionDetailsGovernance/ArchiveExecutionGovernanceInfo/ArchiveExecutionGovernanceDeleteAjaxCall.js"></script>
<script
        src="js/ArchiveExecutionDetailsGovernance/ArchiveExecutionGovernanceInfo/ArchiveExecutionRemarks.js"></script>
<script
        src="js/ArchiveExecutionDetailsGovernance/ArchiveExecutionGovernanceInfo/waveFilter.js"></script>




<!-- <script>
    function myFunction() {
        let today = new Date().toISOString().substr(0, 10);
        document.getElementById('creation_date').value = today;
    }
</script> -->
</body>
<!-- ========== COMMON JS FILES ========== -->

<!-- <script src="js/jquery-ui/jquery-ui.min.js"></script> -->

<!-- <script src="js/bootstrap/bootstrap.min.js"></script> -->
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
<script
        src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/js/bootstrap-datepicker.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>
<!-- ========== Toastr ========== -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
        href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        rel="stylesheet">
<script src="js/navigation/navigation.js"></script>
<script>
    $('#financeHint[data-toggle="tooltip"]').tooltip({
        animated : 'fade',
        placement : 'bottom',
        trigger : 'onClick'
    });

    $('#complianceHint[data-toggle="tooltip"]').tooltip({
        animated : 'fade',
        placement : 'bottom',
        trigger : 'onClick'
    });
</script>
</html>
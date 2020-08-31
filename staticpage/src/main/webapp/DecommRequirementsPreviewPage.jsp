<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Onboarding Tool</title>
</head>


<link rel="stylesheet" href="styles/styles.css" type="text/css"/>
<script src="js/jquery/jquery-2.2.4.min.js"></script>

<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/icheck/skins/line/red.css">
<link rel="stylesheet" href="css/icheck/skins/line/green.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">

<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">

<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/0.9.0rc1/jspdf.min.js"></script>
<meta name="keywords" content="jQuery Tree, Tree Widget, TreeView"/>
<meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property."/>


<style>
    .newspaper {
        -webkit-column-count: 3; /* Chrome, Safari, Opera */
        -moz-column-count: 3; /* Firefox */
        column-count: 3;
        -webkit-column-gap: 40px; /* Chrome, Safari, Opera */
        -moz-column-gap: 40px; /* Firefox */
        column-gap: 40px;
        -webkit-column-rule: 1px solid lightblue; /* Chrome, Safari, Opera */
        -moz-column-rule: 1px solid lightblue; /* Firefox */
        column-rule: 1px solid lightblue;
    }

    #cmd {
        float: right;
    }

    #table {
        width: 90%;
        margin: 50px;

        background: #fff;
        padding-left: 10px;
        border: 2px solid #E6E9ED;
        -webkit-column-break-inside: avoid;
        -moz-column-break-inside: avoid;
        column-break-inside: avoid;
        opacity: 1;
        transition: all .2s ease;
    }

    #wizard {
        padding-left: 20px;
    }

    .text-white {
        color: #fff !important;
    }

    .btn {
        background: gray;
        color: #fff;
    }

    .bs-wizard {
        margin-top: 40px;
    }

    /*Form Wizard*/
    .bs-wizard {
        border-bottom: solid 1px #e0e0e0;
        padding: 0 0 10px 0;
    }

    .bs-wizard > .bs-wizard-step {
        padding: 0;
        position: relative;
    }

    .bs-wizard > .bs-wizard-step + .bs-wizard-step {
    }

    .bs-wizard > .bs-wizard-step .bs-wizard-stepnum {
        color: #428bca;
        font-size: 16px;
        margin-bottom: 5px;
    }

    .bs-wizard > .bs-wizard-step .bs-wizard-info {
        color: #999;
        font-size: 14px;
    }

    .bs-wizard > .bs-wizard-step > .bs-wizard-dot {
        position: absolute;
        width: 30px;
        height: 30px;
        display: block;
        background: #1a92f6;
        top: 45px;
        left: 50%;
        margin-top: -15px;
        margin-left: -15px;
        border-radius: 100%;
    }

    .bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {
        content: ' ';
        width: 14px;
        height: 14px;
        background: lightblue;
        border-radius: 50px;
        position: absolute;
        top: 8px;
        left: 8px;
    }

    .bs-wizard > .bs-wizard-step > .progress {
        position: relative;
        border-radius: 0px;
        height: 8px;
        box-shadow: none;
        margin: 20px 0;
    }

    .bs-wizard > .bs-wizard-step > .progress > .progress-bar {
        width: 0px;
        box-shadow: none;
        background: #1a92f5;
    }

    .bs-wizard > .bs-wizard-step.complete > .progress > .progress-bar {
        width: 100%;
    }

    .bs-wizard > .bs-wizard-step.active > .progress > .progress-bar {
        width: 50%;
    }

    .bs-wizard > .bs-wizard-step:first-child.active > .progress > .progress-bar {
        width: 0%;
    }

    .bs-wizard > .bs-wizard-step:last-child.active > .progress > .progress-bar {
        width: 100%;
    }

    .bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot {
        background-color: #f5f5f5;
    }

    .bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot:after {
        opacity: 0;
    }

    .bs-wizard > .bs-wizard-step:first-child > .progress {
        left: 50%;
        width: 50%;
    }

    .bs-wizard > .bs-wizard-step:last-child > .progress {
        width: 50%;
    }

    .bs-wizard > .bs-wizard-step.disabled a.bs-wizard-dot {
        pointer-events: none;
    }

    /*END Form Wizard*/
    .modal-body {
        margin: auto;
        width: 20%;
        border: 3px;
        padding: 10px;
        font-size: large;

    }

    .bootstrap-dialog-message {
        width: 250px;
        border: 3px;
        padding: 0px;
        margin: auto;
    }

    .searchbox {
        float: right;

    }
    .checkbox
    {
        height: 130px;
        width: 700px;
        overflow-y: scroll;
    }



</style>
<style>
    /* The Modal (background) */
    #modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding: 20px; /* Location of the box */
        left: 700px;
        top: 100px;
        right: 700px;
        width: 60%; /* Full width */
        height: 50%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80px;

    }

    /* The Close Button */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
</style>
<body class="top-navbar-fixed">

<form class="form-signin" name="loginForm" id="loginForm" onsubmit="ExportPdf()" method="post">
    <input type="hidden" name="data_submit" id="data_submit" value="false"/>
    <div class="main-wrapper">

        <nav class="navbar top-navbar bg-white box-shadow">
            <div class="container-fluid">
                <div class="row">
                    <div class="navbar-header no-padding">
                        <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
                            <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                        </a>
                        <span class="small-nav-handle hidden-sm hidden-xs"><i class="fa fa-outdent"></i></span>
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <i class="fa fa-ellipsis-v"></i>
                        </button>
                        <button type="button" class="navbar-toggle mobile-nav-toggle">
                            <i class="fa fa-bars"></i>
                        </button>
                    </div>
                    <!-- /.navbar-header -->

                    <div class="collapse navbar-collapse" id="navbar-collapse-1">

                        <!-- /.nav navbar-nav -->
                        <ul class="nav navbar-nav navbar-right">
                            <%--<%
                                 HttpSession details = request.getSession();
                                 String uname = (String) details.getAttribute("username");
                                String role = (String) details.getAttribute("role");%>
--%>
                            <li><a href="#"><span id="nav_userid"><%--<%=uname%>--%>&nbsp;</span>logged in as
                                &nbsp;<span
                                        id='nav_role'><%--<%=role%>--%></span></a></li>
                            <li><a href="Logout" class=" text-center"><i class="fa fa-sign-out"></i> Logout</a>
                            </li>
                        </ul>

                    </div>
                    <!-- /.navbar-collapse -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </nav>

        <div class="content-wrapper">

            <div class="content-container">

                <div class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
                    <div class="sidebar-content" id='jqxWidget'>


                        <div class="sidebar-nav">
                            <ul class="side-nav color-gray">
                                <li class="nav-header">
                                    <span class="">Main Category</span>
                                </li>
                                <li id='home' item-selected='true'>
                                    <a href="Project_List.jsp"><i class="fa fa-home"></i> <span>Home</span> </a>
                                </li>

                                <li class="nav-header">
                                    <a href="AppEmphasize_EditProject.jsp"><span
                                            class="">App Emphasize Module</span></a>
                                </li>
                                <li class="has-children">
                                    <a href="AppEmphasize_EditProject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span>
                                        <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a>
                                        </li>
                                        <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a>
                                        </li>
                                    </ul>
                                </li>

                                <li class="has-children">
                                    <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span>
                                        <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="AppEmphasize_CostCalculation.jsp">
                                            <span>Application Complexity</span></a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="AppEmphasize_PrioritizedApplications.jsp"><i class="fa fa-map-signs"></i>
                                        <span>Application Prioritized</span> </a>
                                </li>


                                <li class="nav-header">
                                    <a href='Applications.jsp'><span class="">Intake Module</span></a>
                                </li>

                                <li class="has-children">
                                    <a href="Applications.jsp"><i class="fa fa-magic"></i> <span>Business</span> <i
                                            class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Applications.jsp"> <span>Application Information</span></a></li>
                                        <li><a href="Applications.jsp"> <span>Legacy Retention Information</span></a>
                                        </li>
                                        <li><a href="Applications.jsp"> <span>Archive Data Management</span></a></li>
                                        <li><a href="Applications.jsp"> <span>System Requirements</span></a></li>
                                    </ul>
                                </li>

                                <li class="has-children">
                                    <a href="Applications.jsp"><i class="fa fa-bars"></i> <span>Technical</span> <i
                                            class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Applications.jsp"> <span>Application Data Information</span></a>
                                        </li>
                                        <li><a href="Applications.jsp">
                                            <span>Infrastructure & Environment Inforamation</span></a></li>
                                        <li><a href="Applications.jsp"> <span>Technical Information</span></a></li>
                                    </ul>
                                </li>
                                <li class="has-children">
                                    <a href="Applications.jsp"><i class="fa fa-archive"></i>
                                        <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Intake_ArchiveRequirements.jsp">
                                            <span>Screen/Report Requirements</span></a></li>
                                        <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a>
                                        </li>
                                    </ul>
                                </li>
                                <li><a href="Archive_Execution.jsp"><i class="fa fa-suitcase"></i> <span>Archive Execution Module</span></a>
                                </li>
                            </ul>

                        </div>
                        <!-- /.sidebar-nav -->
                    </div>
                    <!-- /.sidebar-content -->
                </div>
                <!-- /.left-sidebar -->


                <div class="main-page">
                    <section>
                        <div class="row">
                            <div class="container-fluid">
                                <div class="col-md-12">
                                    <div class="row" id="wizard">
                                        <div class="container">
                                            <div class="row bs-wizard" style="border-bottom:0;">

                                                <div class="col-xs-2 bs-wizard-step complete">
                                                    <div class="text-center bs-wizard-stepnum">Intake Information</div>
                                                    <div class="progress">
                                                        <div class="progress-bar"></div>
                                                    </div>
                                                    <a href="#" class="bs-wizard-dot"></a>

                                                </div>

                                                <div class="col-xs-2 bs-wizard-step complete"><!-- complete -->
                                                    <div class="text-center bs-wizard-stepnum">Summary</div>
                                                    <div class="progress">
                                                        <div class="progress-bar"></div>
                                                    </div>
                                                    <a href="#" class="bs-wizard-dot text-white">2</a>
                                                </div>

                                                <div class="col-xs-2 bs-wizard-step active"><!-- complete -->
                                                    <div class="text-center bs-wizard-stepnum">Review</div>
                                                    <div class="progress">
                                                        <div class="progress-bar"></div>
                                                    </div>
                                                    <a href="#" class="bs-wizard-dottext-white">3</a>
                                                </div>

                                                <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                                    <div class="text-center bs-wizard-stepnum">Approval</div>
                                                    <div class="progress">
                                                        <div class="progress-bar"></div>
                                                    </div>
                                                    <a href="#" class="bs-wizard-dot">4</a>
                                                </div>

                                                <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                                    <div class="text-center bs-wizard-stepnum">Final</div>
                                                    <div class="progress">
                                                        <div class="progress-bar"></div>
                                                    </div>
                                                    <a href="#" class="bs-wizard-dot">5</a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="container">
                                            <a href="Intake_Business.jsp"
                                               class="btn btn-default btn pull-left">Edit</a>

                                            <button id="intake_module" class="btn btn-primary pull-right"><span
                                                    class="glyphicon glyphicon-download-alt"></span> Export Pdf
                                            </button>
                                            <button class="btn btn-primary pull-left"
                                                    onclick="location.href='Applications.jsp'">HOME
                                            </button>

                                        </div>
                                        <div class="container">

                                            <div bgcolor='#e4e4e4' style='font-family:Arial,Helvetica,sans-serif;'
                                                 id="table-scroll">

                                                <table>
                                                    <tbody>
                                                    <tr>
                                                        <td>
                                                            <table width='780' border='0' align='center'>

                                                                <tbody>


                                                                <tr>
                                                                    <td valign='top'
                                                                        style='color:#404041;line-height:16px;padding:25px 20px 0px 20px'>
                                                                        <p>
                                                                            <section
                                                                                    style='position: relative;clear: both;margin: 5px 0;height: 1px;border-top: 1px solid #cbcbcb;margin-bottom: 25px;margin-top: 10px;text-align: center;'>
                                                                                <h3 align='center'
                                                                                    style='margin-top: -12px;background-color: #FFF;clear: both;width: 30%;margin-right: auto;margin-left: auto;padding-left: 15px;padding-right: 15px; font-family: arial,sans-serif;'>
                                                                                    <span>Summary & Review</span>
                                                                                </h3>
                                                                            </section>
                                                                        </p>
                                                                    </td>
                                                                </tr>
                                                                <tr align='left'>
                                                                    <td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                                        <span><h2 style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Bussiness Details</h2></span>
                                                                        <div id="AppDecommInfo">
                                                                            <h3>App Decomm Info</h3>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "app_name">Application name : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "legacy_app_name">Legacy application name : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "prj_no">Enterprise Team Decomm Project Number : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "app_id_no">Application Identification Number : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "infra_id_no">Infrastructure Project Number : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "read_only">Read Only Date : </pre>
                                                                            <br>
                                                                            <p> Business Unit and Geographic Location Code(For decommission Project to charge back)</p>
                                                                            <div class="form-group">
                                                                                <label class="control-label" for="formInput198"></label>
                                                                                <div class="table-responsive" id="table-scroll_preview">
                                                                                    <table class="table table-bordered">
                                                                                        <thead style="color:white;background-color:DodgerBlue;">
                                                                                        <tr >
                                                                                            <th scope="col" style="color:white;" id = "business_unit">Business Unit</th>
                                                                                            <th scope="col" style="color:white;" id = "operation_unit">Operation Unit</th>
                                                                                            <th scope="col" style="color:white;" id = "location_unit">Location Unit</th>
                                                                                            <th scope="col" style="color:white;" id = "dept">Department</th>
                                                                                        </tr>
                                                                                        </thead>
                                                                                        <tbody id ="business_unit_and_geographic_location">
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                            <p> Site Location of the Assets </p>
                                                                            <div class="form-group">
                                                                                <label class="control-label" for="formInput198"></label>
                                                                                <div class="table-responsive">
                                                                                    <table class="table table-bordered">
                                                                                        <thead style="color:white;background-color:DodgerBlue;">
                                                                                        <tr >
                                                                                            <th scope="col" style="color:white;">Country</th>
                                                                                            <th scope="col" style="color:white;">City</th>
                                                                                            <th scope="col" style="color:white;">State</th>
                                                                                            <th scope="col" style="color:white;">Office Designation</th>
                                                                                        </tr>
                                                                                        </thead>
                                                                                        <tbody id="SiteLocation">
                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div id = "sample_contact">
                                                                            <h2>Sample Contact</h2>

                                                                        </div>
                                                                        <div id="ContactInfo">

                                                                        </div></td>
                                            </tr>
                                            <tr align='left'>
                                                <td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="ContactInfoLegacy">
                                                                            <h3>Legacy Retention Information</h3>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "retention_code">Retention Code : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "trigger_date">Trigger Date Field  : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "period_of_retention">Period Of Retention : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "table_name">Table Name/Is Retention need to apply  : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "e_Discovery_SME">Name the Legancy Retention & e-Discovery SME : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "legal_hold_tax">Does any Records Have Legal Holds/Tax Holds or Any Indication  : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "legal_hold_identification">Who or What entity provided legal or tax hold identification : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "data_archived">should this application's data to be archived? : </pre>
                                                                            <pre style="font-family:verdana;font-size:100%;" id = "brief_explain">Brief Explanation : </pre>
                                                                        </div>
                                                    <%--<table width='0' border='0' align='left'--%>
                                        </div>
                                        </td>
                                        </tr>
                                    </div>
                                    </tr>
                                    </tbody>
                                    </table>
                                </div>
                            </div>
                            <%--</div>
                    </div>--%>
                        </div>
                        <%--</section>--%>
                </div>
                <!-- /.row -->
                <div class="container">
                    <!-- Button trigger modal -->
                    <button type="button" id="button_id" name="button_id" class="btn btn-primary btn-lg pull-right">
                        Request Sign
                    </button>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" style="width:1000px">
                            <div id="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel" style="text-align: center"><b>List of
                                        Users</b></h4>
                                    <input type="checkbox" name="signorder" id="signorder" style="margin-left: 245px;"> <b>Set signing order</b>
                                    <input class="searchbox" id="search_bar" type="text" placeholder="Search User"
                                           name="search" style="font-size: 15px"/>
                                </div>
                                <div class="modal-body" style="width: 500px" id="user_list_div_id_name">

                                </div>
                                <div class="modal-footer" style="height: 80px;padding: 20px">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" name="email_id" id="email_id"
                                            data-dismiss="modal">Send Email
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>


                </div>


                </section>


            </div>


            <!-- /.main-page -->

        </div>

        <!-- /.content-container -->

    </div>
    <!-- /.content-wrapper -->


    </div>
    <!-- /.main-wrapper -->

</form>
<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
<script src="validation.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        $(".lis").click(function () {
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
        });
        $(".gr").click(function () {
            $(".cbp-vm-switcher").addClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-list");
        });
    });
</script>
<script>
    var url_string=window.location.href;
    var url = new URL(url_string);
    var appname = url.searchParams.get("appname");
    var projname=url.searchParams.get("projname");
    console.log("Application:",appname,"Project:",projname);
    $(document).ready(function(){
        $.ajax({
            url: "DecommIntakePreviewServlet",
            type: 'POST',
            data: {ApplicationName:appname,ProjectName: projname},
            dataType: "json",
            success: function (data) {
                console.log("Data----->",data);
                console.log("Data_New",data[2].App_Name,data[2].Legacy_App_Name);
                if(data[2].CheckExistance==true) {
                    $('#app_name').append(data[2].App_Name);
                    $('#legacy_app_name').append(data[2].Legacy_App_Name);
                    $('#prj_no').append(data[2].Enterprise_Team_Decomm_Prj_No);
                    $('#app_id_no').append(data[2].App_Identification_No);
                    $('#infra_id_no').append(data[2].Infra_Prj_No);
                    $('#read_only').append(data[2].Read_Only);
                }
                else{
                    $('#app_name').append("");
                    $('#legacy_app_name').append("");
                    $('#prj_no').append("");
                    $('#app_id_no').append("");
                    $('#infra_id_no').append("");
                    $('#read_only').append("");
                }
                for(var i=1; i<data[0].length; i++){
                    var tr="<tr><td><pre style='font-family:verdana;font-size:100%;' id = 'BusinessUnit"+(i-1)+"'>"+data[0][i].BusinessUnit+"</pre></td>"
                        +"<td><pre style='font-family:verdana;font-size:100%;' id = 'OperationUnit"+(i-1)+"'>"+data[0][i].OperationUnit+"</pre></td>"
                        +"<td><pre style='font-family:verdana;font-size:100%;' id = 'LocationUnit"+(i-1)+"'>"+data[0][i].LocationUnit+"</pre></td>"
                        +"<td><pre style='font-family:verdana;font-size:100%;' id = 'Dept"+(i-1)+"'>"+data[0][i].Dept+"</pre></td>"
                        +"</tr>";
                $('#business_unit_and_geographic_location').append(tr);
                }
                for(var i=1; i<data[1].length; i++){
                    var tr="<tr><td><pre style='font-family:verdana;font-size:100%;' id = 'Country"+(i-1)+"'>"+data[1][i].Country+"</pre></td>"
                        +"<td><pre style='font-family:verdana;font-size:100%;' id = 'City"+(i-1)+"'>"+data[1][i].City+"</pre></td>"
                        +"<td><pre style='font-family:verdana;font-size:100%;' id = 'State"+(i-1)+"'>"+data[1][i].State+"</pre></td>"
                        +"<td><pre style='font-family:verdana;font-size:100%;' id = 'OfficeDesignation"+(i-1)+"'>"+data[1][i].OfficeDesignation+"</pre></td>"
                        +"</tr>";
                    $('#SiteLocation').append(tr);
                }
                if(data[4].CheckExistance==true) {
                    $('#retention_code').append(data[4].Retention_Code);
                    $('#trigger_date').append(data[4].Tigger_Date);
                    $('#period_of_retention').append(data[4].Period_Retention);
                  //  $('#table_name').append(data[4].App_Name);
                    $('#e_Discovery_SME').append(data[4].E_Discovery_SME);
                    $('#legal_hold_tax').append(data[4].Legal_Tax_Holds);
                    $('#legal_hold_identification').append(data[4].Legal_Tax_Identification);
                    $('#data_archived').append(data[4].App_Data_Archived);
                    $('#brief_explain').append(data[4].Brief_Explain);
                }
                else{
                    $('#retention_code').append("");
                    $('#trigger_date').append("");
                    $('#period_of_retention').append("");
                    //  $('#table_name').append(data[4].App_Name);
                    $('#e_Discovery_SME').append("");
                    $('#legal_hold_tax').append("");
                    $('#legal_hold_identification').append("");
                    $('#data_archived').append("");
                    $('#brief_explain').append("");
                }
                for (var i=0; i<data[3].length; i++){
                    console.log("Role name loose", data[3][i][0].CheckExistance);
                    if(data[3][i][0].CheckExistance==true)
                    {
                        console.log("Role name loose",data[3][i][0].RoleName);
                        var rolename=((data[3][i][0].RoleName).replace(/-|\s/g,"")).replace(/\//g,'');
                        console.log("role name----->",rolename);
                        var table= "<div class='form-group'>\n" +
                            "<label class='control-label hidetable "+rolename+"Class' for='formInput198'>"+data[3][i][0].RoleName+"</label>\n" +
                            "<div class='table-responsive'>\n" +
                            "<table class='table table-bordered hidetable "+rolename+"Class' id='mytable'>\n" +
                            "<thead style='color:white;background-color:DodgerBlue;'>\n" +
                            "<tr >\n" +
                            "<th scope='col' style='color:white;'>User Name</th>\n" +
                            "<th scope='col' style='color:white;'>Email</th>\n" +
                            "<th scope='col' style='color:white;'>User Id</th>\n" +
                            "<th scope='col' style='color:white;'>Contact Number</th>\n" +
                            "</tr>\n" +
                            "</thead >\n" +
                            "<tbody id='"+rolename+"'>\n"+
                            "</tbody>\n" +
                            "</table>\n" +
                            "</div>\n" +
                            "</div>";
                        $('#ContactInfo').append(table);
                    for(var j=1;j<data[3][i].length;j++) {
                        var tr="<tr><td><pre style='font-family:verdana;font-size:100%;' id = 'UserName"+(j-1)+"'>"+data[3][i][j].User_Name+"</pre></td>"
                            +"<td><pre style='font-family:verdana;font-size:100%;' id = 'Email"+(j-1)+"'>"+data[3][i][j].Email+"</pre></td>"
                            +"<td><pre style='font-family:verdana;font-size:100%;' id = 'UserId"+(j-1)+"'>"+data[3][i][j].User_Id+"</pre></td>"
                            +"<td><pre style='font-family:verdana;font-size:100%;' id = 'ContactNumber"+(j-1)+"'>"+data[3][i][j].Contact_No+"</pre></td>"
                            +"</tr>";
                        $('#'+rolename).append(tr);
                    }
                    }

                }
                },

        });
    });
    </script>

<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script src="js/waypoint/waypoints.min.js"></script>
<script src="js/counterUp/jquery.counterup.min.js"></script>
<script src="js/amcharts/amcharts.js"></script>
<script src="js/amcharts/serial.js"></script>
<script src="js/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all"/>
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


<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


<!-- ========== THEME JS ========== -->

<script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>


<!-- ========== THEME JS ========== -->
<script>
    $(function ($) {

        // 1st  datepicker
        $('#basicExample .time').timepicker({
            'showDuration': true,
            'timeFormat': 'g:ia'
        });

        $('#basicExample .date').datepicker({
            'format': 'm/d/yyyy',
            'autoclose': true
        });

        var basicExampleEl = document.getElementById('basicExample');
        var datepair = new Datepair(basicExampleEl);

        // 2nd  datepicker
        $('#datetimepicker1').datetimepicker({
            debug: true
        });

        // 3rd  datepicker
        $('#datetimepicker9').datetimepicker({
            viewMode: 'years'
        });

        // 4th  datepicker
        $('#datetimepicker10').datetimepicker({
            viewMode: 'years',
            format: 'MM/YYYY'
        });

        // 5th  datepicker
        $('#datetimepicker11').datetimepicker({
            daysOfWeekDisabled: [0, 6]
        });

        // 6th  datepicker
        $('#datetimepicker12').datetimepicker({
            inline: true,
            sideBySide: true
        });
    });
</script>

<script>
    var doc = new jsPDF();

    var options = {
        background: 'blue',
        pagesplit: true
    };
    var specialElementHandlers = {
        '#editor': function (element, renderer) {
            return true;
        }
    };

    $('#cmd').click(function () {

        doc.fromHTML($('#table1').html(), 15, 15, {
            'width': 170,
            'pagesplit': true,
            'elementHandlers': specialElementHandlers
        });

        doc.addPage();

        doc.fromHTML($('#table2').html(), 15, 15, {
            'width': 170,
            'pagesplit': true,
            'elementHandlers': specialElementHandlers
        });

        doc.addPage();
        doc.fromHTML($('#table3').html(), 15, 15, {
            'width': 170,
            'pagesplit': true,
            'elementHandlers': specialElementHandlers
        });
        doc.addPage();
        doc.fromHTML($('#table4').html(), 15, 15, {
            'width': 170,
            'pagesplit': true,
            'elementHandlers': specialElementHandlers
        });
        var d = new Date().toISOString().slice(0, 19);
        filename = 'Intake' + "_" + d + '.pdf';
        doc.save(filename);

    });
</script>

</body>
</html>
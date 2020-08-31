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
<script src ="js/IntakeDetails/IntakePreviewDetails/IntakePreviewDataRetrieve.js"></script>

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
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                    </a>

                   


                </div>
                <!-- /.navbar-header -->
                <div class="tabs-content">
          <ul class="nav navbar-nav">
		      <li class="active"><a href="OpportunityList.jsp" style="color:#fff; background:#1565c0; ">Applications</a></li>
		      <li><a href="Admin_Module_Send_Invites.jsp">Administration</a></li>
		     <li><a href="Archive_Execution.jsp">Governance</a></li>
		              <li><a href="#">Finance</a></li>
		              <li><a href="ProjectManager_dashboard.jsp">Dashboards</a></li>
		              <li><a href="#">Compliance</a></li>
		    </ul>
		         <ul class="nav navbar-nav navbar-right">
                       

                        <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin </span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
                
                
                
                
            </div>
            <!-- /.row -->
            
        </div>
        <!-- /.container-fluid -->
    </nav >

        <div class="content-wrapper">

            <div class="content-container">

                


                <div class="main-page">
                    <section>
                        <div class="row">
                            <div class="container-fluid">
                                <div class="col-md-12">
                                    <div class="row" id="wizard">
                                        <div class="container">
                                            

                                               
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
                                                                
                                                   <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="IntakePreview"> <h2>Intake Details</h2> </div> </div> </td> </tr>
                                                        
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="OpportunityInfoPreview"> <h3>Opportunity Information</h3> </div> </div> </td> </tr>
                                                        
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="TriageInfoPreview"> <h3>Triage Information</h3> </div> </div> </td> </tr>
                                                        
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="TriageSummInfoPreview"> <h3>Triage Summary Information</h3> </div> </div> </td> </tr>
                                                        
                                                <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="AssessInfoPreview"> <h2>Assessment Information</h2> 
                                                         <div id="ApplicationInformationPreview"> <h3>Application Information</h3> </div>
                                                          <div id="DataCharacteristicsPreview"> <h3>Data Characteristics</h3> </div>
                                                           <div id="ComplianceCharacteristicsPreview"> <h3>Compliance Characteristics</h3> </div>
                                                            <div id="ArchivalConsumptionPreview"> <h3>Archival Consumption</h3></div>
                                                            <div id="ContractInformationPreview" style = "display:none;"> <h3>Contract Consumption</h3> </div></div> 
                                                        </div> </td> </tr>
                                                        
                                                 <tr align='left'><td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>
                                                        <div id="StakeHolderInfoPreview"> <h3>Stake Holder</h3> </div> </div> </td> </tr>
                                                        </tbody>
                                    </table>
 								</td>
 </tr>
 </tbody>
 </table>
 </div>
 </div>
 </div>
 </div></div></div>
                                                                            
                                                                               <!-- /.row -->
                <div class="container">
                    <!-- Button trigger modal -->
                    <button type="button" id="button_id" name="button_id" class="btn btn-primary btn-lg pull-right">
                        Request Sign
                    </button>
                    <button type="button" id="NextId" name="NextReview" class="btn btn-primary btn-lg pull-right" onclick ="window.location.href='IntakeApproval.jsp';">
                        Next
                    </button>
                     <button id="intake_module" class="btn btn-primary pull-left"><span
                                                    class="glyphicon glyphicon-download-alt"></span> Export Pdf
                                            </button>
					</br>
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

</br>
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
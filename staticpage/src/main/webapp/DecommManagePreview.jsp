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
<table id="inputFields" width='780' border='0' align='center'>

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
                                                                        <span><h2
                                                                                style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'> Details</h2></span>

                                            </td>
                                            </tr>
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
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog" style="width:1000px">
                                    <div class="modal-content">
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
<script>
    var url_string=window.location.href;
    var url = new URL(url_string);
    var appname = url.searchParams.get("appname");
    var projname=url.searchParams.get("projectname");
    console.log("Application:",appname,"Project:",projname);
    $(document).ready(function(){
        $.ajax({
            url: "DecommManagePreviewServlet",
            type: 'POST',
            data: {ApplicationName:appname,ProjectName: projname},
            dataType: "json",
            success: function (data) {
                console.log("Data----->",data);

                //Execution info success!!!!!

                var execute_info = "<br><br><h3>Decommission Execution Requirements</h3><br>";
                var infra_comp = "<br><br><h3>Infrastructure Component CheckList</h3><br>";
                var service_cat = "<br><br><h3>Service Categories Checklist</h3><br>";
                var service_cat_data = "<br><br><h3>Service Categories Checklist Data Retrieve </h3><br>";
                var key_mile_stone= "<br><br><h3>Key Mile Stones</h3><br>";
                $('#inputFields').append(execute_info);

                if (!$.isArray(data[0])) {
                    data[0] = [data[0]];
                }

                $.each(data[0], function(key, value){
                    /*console.log("FULL NAME " + value.Type);*/
                    var manadatory="class='required_fie'";
                    var Type=value.Type;
                    var ColumnName=value.ColumnName;
                    var LabelName=value.LabelName;
                    var Value=value.Value;
                    //var options=data[i].options.split(',');
                    if(value.Mandatory=="No")
                    {
                        manadatory="";
                    }
                    if(Type=="Text box")
                    {
                        var inputtext="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            "<pre style='font-family:verdana;font-size:100%;' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"'> "+Value+"</pre>\n" +
                            "</div>";
                        $('#inputFields').append(inputtext);
                    }
                    else if(Type=="Datepicker")
                    {
                        var inputdate="<div class='form-group'>" +
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            "<pre style='font-family:verdana;font-size:100%;' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"'>"+Value+"</pre>" +
                            "</div>";
                        $('#inputFields').append(inputdate);

                    }
                    else if(Type=="Dropdown")
                    {
                        var inputdrop= "<div class='form-group'><label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                            /*"<select style = 'width:100%;' name='"+ColumnName+"'>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for(var i=0;i<option.length;i++) {
                            inputdrop += "<option label=" + option[i] + " class='control-label' for= 'formInput198' >" + option[i] + "</option>";
                        }
                        inputdrop +="</select>*/
                        "<pre style='font-family:verdana;font-size:100%;'>"+Value+"</pre></div>";
                        $('#inputFields').append(inputdrop);

                    }
                    else if(Type=="Check box")
                    {
                        var inputcheck= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=Options.split(",");
                        for (var i=0; i<option.length; i++) {
                            var check="";
                            if(Value.includes(option[i]))
                            {
                                check="checked";
                            }

                            inputcheck += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value='"+option[i]+"' name='"+ColumnName+"'"+check+" disabled/>" +
                                option[i]+"</label>";
                        }
                        inputcheck +="</div>";
                        $('#inputFields').append(inputcheck);

                    }
                    else if(Type=="Radio box")
                    {
                        var inputdrop= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;' '></span></div></label>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for (var i=0; i<option.length; i++){
                            var check="";
                            if(Value.includes(option[i]))
                            {
                                check="checked";
                            }
                            inputdrop+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' name='"+ColumnName+"'"+check+" disabled/>"+
                                option[i]+"</label>";
                        }
                        inputdrop +="</div>";
                        $('#inputFields').append(inputdrop);

                    }
                    else if(Type=="file")
                    {
                        inputfile="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div class='required_fie'>"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
                            "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                            "</div>";
                        $('#inputFields').append(inputfile);

                    }
                    else if(Type=="Text area")
                    {
                        var inputtext="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                            "<pre style='font-family:verdana;font-size:100%;' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</pre>"+
                            "</div>";
                        $('#inputFields').append(inputtext);
                    }

                });
                var script="<script>$('.datepicker1').datepicker({\n" +
                    "format: \"mm/dd/yyyy\",\n"+
                    "autoclose: true\n"+
                    "});<\/script>";
                script+="<script>\n" +
                    "$('.editpopup').click(function() {\n" +
                    "var seqnum=$(this).index('.editpopup');"+
                    "$('#seq_num').val(seqnum);"+
                    "modal1.style.display = \"block\";\n" +
                    "});"+
                    "<\/script>";
                script+="<script> $('.deletepopup').click(function() {\n" +
                    "var seqnum=$(this).index('.deletepopup');"+
                    //   "alert('sequence number '+seqnum);"+
                    "$('#sequence1').val(seqnum);"+
                    "modal2.style.display = \"block\";\n" +
                    "});<\/script>";
                $('#scripttag').append(script);

                //Infra comp success!!!!
                $('#inputFields').append(infra_comp);
                var tr = "  <table class='table table-bordered hidetable' id='mytable_infra'>\n" +
                    "<tr style='color:white;background-color:DodgerBlue;'>\n" +
                    "<th scope='col' style='color:white;'>Infrastructure Component Type </th>\n" +
                    "<th scope='col' style='color:white;'>Component Name </th>\n" +
                    "<th scope='col' style='color:white;'>Managed/Legacy </th>\n" +
                    "<th scope='col' style='color:white;'> Is the Server Shared with other applications </th>\n" +
                    "<td>\n" +
                    "<table class='table table-bordered hidetable'>\n" +
                    "<tr style='color:white;background-color:DodgerBlue;'>\n" +
                    "<td scope='col' style='width:5px; float:center;' colspan='5'>ENVIRONMENTS</td>\n" +
                    "</tr>\n" +
                    "<tr>\n" +
                    "<td scope='col' style='color:black;'>Dev</td>\n" +
                    "<td scope='col' style='color:black;'>Test</td>\n" +
                    "<td scope='col' style='color:black;'>Stage</td>\n" +
                    "<td scope='col' style='color:black;'>Prod</td>\n" +
                    "<td scope='col' style='color:black;'>Retired?</td>\n" +
                    "</tr></table>\n" +
                    "<th scope='col' style='color:white;background-color:DodgerBlue;'> Comments </th></tr>\n";
                if(data[1][0].CheckExistance==true){
                    for(var i=1; i<data[1].length; i++){
                        var yes_server_app="";
                        var no_server_app="";
                        var yes_retired="";
                        var no_retired="";
                        var manage_drop="";
                        var legacy_drop="";
                        var style = "";
                        if(data[1][i].Server_App=="Yes")
                        {
                            yes_server_app="checked";
                        }
                        else {
                            no_server_app="checked";
                        }
                        if(data[1][i].Retired=="retired_yes")
                        {
                            yes_retired="checked";
                        }
                        else{
                            no_retired="checked";
                        }
                        if(data[1][i].Managed_Legacy=="Managed"){
                            manage_drop ="selected";
                            style = "style = 'display:none;'";
                        }
                        else{
                            legacy_drop ="selected";
                            style = "style = 'display:block;'";
                        }

                       tr += "<tr>\n" +
                            "<td> <input type='text' value='"+data[1][i].Infra_Comp_Type+"' name = 'infra_comp"+data[1][i].Seq_Num+"' placeholder='Infrastructure Component' style='width:66%;' readonly> </td>\n" +
                            "<td> <input type='text' value='"+data[1][i].Comp_Name+"' name = 'comp_name"+data[1][i].Seq_Num+"' placeholder=' Component Name' style='width:66%;' readonly> </td>\n" +
                            "<td>\n" +
                            "<select style='width:66%;height:34px;' name = 'manage_legacy"+data[1][i].Seq_Num+"' onchange='manage_legacy(this.name,this.value);'  disabled>\n" +
                            "<option value='Managed' "+manage_drop+">Managed</option>\n" +
                            "<option value='Legacy' "+legacy_drop+">Legacy</option>\n" +
                            "</select>\n" +
                            "</td>\n" +
                            "<td>\n" +
                            "<input type='radio' class = 'serverapp"+data[1][i].Seq_Num+"' value='Yes' "+style+" name = 'server_app"+data[1][i].Seq_Num+"'"+yes_server_app+" disabled><div class = 'serverapp"+data[1][i].Seq_Num+"' "+style+" >Yes</div>\n" +
                            "<input type='radio' class = 'serverapp"+data[1][i].Seq_Num+"' value='No' "+style+" name = 'server_app"+data[1][i].Seq_Num+"'"+no_server_app+" disabled><div class = 'serverapp"+data[1][i].Seq_Num+"' "+style+">No</div>\n" +
                            "</td>\n" +
                            "<td>\n" +
                            "<table>\n" +
                            "<tr colspan='5'>\n" +
                            "<td> <input type='text' class = 'class_access' value='"+data[1][i].Dev+"' name='dev"+data[1][i].Seq_Num+"' style='width:66%;' readonly> </td>\n" +
                            "<td> <input type='text' class = 'class_access' value='"+data[1][i].Test+"' name='test"+data[1][i].Seq_Num+"' style='width:66%;' readonly> </td>\n" +
                            "<td> <input type='text' class = 'class_access' value='"+data[1][i].Stage+"' name='stage"+data[1][i].Seq_Num+"' style='width:66%;' readonly> </td>\n" +
                            "<td> <input type='text' class = 'class_access' value='"+data[1][i].Prod+"' name='prod"+data[1][i].Seq_Num+"' style='width:66%;'readonly> </td>\n" +
                            "<td>\n" +
                            "<input type='radio' class = 'class_access1' name='retired"+data[1][i].Seq_Num+"' value='retired_yes' "+yes_retired+" disabled>Yes\n" +
                            "<input type='radio' class = 'class_access1' name='retired"+data[1][i].Seq_Num+"' value='retired_no'"+no_retired+" disabled>No\n" +
                            "</td>\n" +
                            "\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "</td>\n" +
                            "<td><textarea maxlength='120' name ='textarea"+data[1][i].Seq_Num+"' style='width:66%;' readonly>"+data[1][i].Comments+"</textarea><span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'></span></td>\n" +
                            "</tr>";
                    }
                    tr+="</table>";
                    $('#inputFields').append(tr);
                }

                var script ="<script> $('.deletepopup').click(function() {\n" +
                    "var seqnum=$(this).index('.deletepopup');"+
                    //   "alert('sequence number '+seqnum);"+
                    "$('#sequence1').val(seqnum);"+
                    "modal2.style.display = \"block\";\n" +
                    "});<\/script>";
                $('#scripttag').append(script);

                //Service categories Cheaklist success

                $('#inputFields').append(service_cat);
                if (!$.isArray(data[2])) {
                    data[2] = [data[2]];
                }
                $.each(data[2], function(key, value){
                    /*console.log("FULL NAME " + value.Type);*/
                    var manadatory="class='required_fie'";
                    var Type=value.Type;
                    var ColumnName=value.ColumnName;
                    var LabelName=value.LabelName;
                    var Value=value.Value;
                    //var options=data[i].options.split(',');
                    if(value.Mandatory=="No")
                    {
                        manadatory="";
                    }
                    if(Type=="Text box")
                    {
                        var inputtext="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            "<pre style='font-family:verdana;font-size:100%;' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"'>"+Value+"</pre>\n" +
                            "</div>";
                        $('#inputFields').append(inputtext);
                    }
                    else if(Type=="Datepicker")
                    {
                        var inputdate="<div class='form-group'>" +
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            "<pre style='font-family:verdana;font-size:100%;' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"'>"+Value+"</pre>" +
                            "</div>";
                        $('#inputFields').append(inputdate);

                    }
                    else if(Type=="Dropdown")
                    {
                        var inputdrop= "<div class='form-group col-md-12'><label class='control-label col-sm-4' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                            "<pre style='font-family:verdana;font-size:100%;' name='"+ColumnName+"'> "+Value+" </pre>";
                       /* var Options=value.options;
                        //var sub_option = Options.substring(0, Options.length - 1);
                        var option=Options.split(",");
                        for(var i=0;i<option.length;i++) {
                            var checkdropdown="";
                            if(Value.includes(option[i]))
                            {
                                checkdropdown="selected";
                            }
                            inputdrop += "<option label=" + option[i] + " class='control-label' for= 'formInput198'"+checkdropdown+" >" + option[i] + "</option>";
                        }
                        inputdrop +="</select></div>";*/
                        $('#inputFields').append(inputdrop);

                    }
                    else if(Type=="Check box")
                    {
                        var inputcheck= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
                        var Options=value.options;
                        //var sub_option = Options.substring(0, Options.length - 1);
                        var option=Options.split(",");
                        for (var i=0; i<option.length; i++) {

                            var Checking = "";
                            if(Value.includes(option[i])){
                                Checking = "checked";
                            }
                            inputcheck += "<label class = 'control-label others' for = 'fromInput198'><input type='checkbox'  value = '"+option[i]+"' class = 'form-comtrol' id='"+((option[i]+(i + 1)).replace(/\s/g,""))+ "' placeholder ='"+option[i]+"' name= '"+ColumnName+"' "+Checking+" disabled/>" +
                                option[i]+"</label>&nbsp;&nbsp;";
                        }
                        inputcheck +="</div>";
                        $('#inputFields').append(inputcheck);
                    }
                    else if(Type=="Radio box")
                    {
                        var inputdrop= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;' '></span></div></label>";
                        var Options=value.options;
                        //ar sub_option = Options.substring(0, Options.length - 1);
                        var option=Options.split(",");
                        for (var i=0; i<option.length; i++){

                            var Checking = "";
                            if(Value.includes(option[i])){
                                Checking = "checked";
                            }
                            inputdrop+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id='"+option[i]+(i+1)+"' value='"+option[i]+"' placeholder ='"+option[i]+"' name='"+ColumnName+"' "+Checking+" disabled/>"+
                                option[i]+"</label>&nbsp;&nbsp;";
                        }
                        inputdrop +="</div>";
                        $('#inputFields').append(inputdrop);

                    }
                    else if(Type=="file")
                    {
                        inputfile="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div class='required_fie'>"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
                            "<pre style='font-family:verdana;font-size:100%;' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'></pre>\n" +
                            "</div>";
                        $('#inputFields').append(inputfile);

                    }
                    else if(Type=="Text area")
                    {
                        var inputtext="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                            "<pre style='font-family:verdana;font-size:100%;' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</pre>"+
                            "</div>";
                        $('#inputFields').append(inputtext);
                    }
                    else if(Type=="Others")
                    {
                        var inputcheck= "<div class='form-group'>"+
                            "<label class='control-label deletepopup editpopup' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-pencil' style='float:right;display:none;'></span></div></label><br>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        console.log("Testing:",value.Value);
                        //var value_arr = Value.split(",");
                        var Mainframe_check = "style = 'display:none;'";
                        var Support_Readiness_check = "style = 'display:none;'";
                        var Desktop_Software_check = "style = 'display:none;'";
                        var Disaster_Recovery_check = "style = 'display:none;'";
                        var Citrix_check = "style = 'display:none;'";
                        var Application_Security_check = "style = 'display:none;'";
                        var Final_Backups_check = "style = 'display:none;'";
                        var Mainframe_others="";
                        var Mainframe_Questions="";
                        var Mainframe_Type="";
                        var Mainframe_value="";
                        var Support_Readiness_others="";
                        var Support_Readiness_Questions="";
                        var Support_Readiness_Type="";
                        var Support_Readiness_value_yes="";
                        var Support_Readiness_value_No="";
                        var Desktop_Software_others="";
                        var Desktop_Software_Questions="";
                        var Desktop_Software_Type="";
                        var Desktop_Software_value_Yes="";
                        var Desktop_Software_value_No="";
                        var Disaster_Recovery_others="";
                        var Disaster_Recovery_Questions="";
                        var Disaster_Recovery_Type="";
                        var Disaster_Recovery_value="";
                        var Citrix_others="";
                        var Citrix_Questions="";
                        var Citrix_Type="";
                        var Citrix_value_Yes="";
                        var Citrix_value_No="";
                        var Application_Security_others="";
                        var Application_Security_Questions="";
                        var Application_Security_Type="";
                        var Application_Security_value_Yes1="";
                        var Application_Security_value_No1="";
                        var Application_Security_value_Yes2="";
                        var Application_Security_value_No2="";
                        var Application_Security_value_Yes3="";
                        var Application_Security_value_No3="";
                        var Application_Security_Display1="Style='display:none';";
                        var Application_Security_Display2="Style='display:none';";
                        var Application_Security_Display3="Style='display:none';";
                        var Final_Backups_others="";
                        var Final_Backups_Questions="";
                        var Final_Backups_Type="";
                        var Final_Backups_value_Yes="";
                        var Final_Backups_value_No="";
                        var mainframeoptions= "  <option value='CICS Regions'>CICS Regions</option>\n" +
                            "  <option value='DB2'>DB2</option>\n" +
                            "  <option value='Endevor Flows'>Endevor Flows</option>\n" +
                            '  <option >HLQ\'s (high level qualifiers) to be eliminated</option>\n' +
                            "  <option value='IMS Regions'>IMS Regions</optionvalue>\n" +
                            "  <option value='Mainframe  Storage'>Mainframe  Storage</optionvalue>\n" +
                            "  <option value='Mainframe Batch Processing'>Mainframe Batch Processing</optionvalue>\n" +
                            "  <option value='Mainframe Capacity'>Mainframe Capacity</option>\n" +
                            "  <option value='Tape Media'>Tape Media</option>\n" +
                            "  <option value='VSAM'>VSAM</option>\n";
                        var disasterrecoveryoptions="  <option value='Rapid Recovery'>Rapid Recovery</option>\n" +
                            "  <option value='SRM'>SRM</option>\n" +
                            "  <option value='Tier 0'>Tier 0</option>\n" +
                            "  <option value='Tier 1'>Tier 1</option>\n" +
                            "  <option value='Tier 2'>Tier 2</option>\n" +
                            "  <option value='Legacy Recovery'>Legacy Recovery</option>\n";
                        /*console.log("array array ----->",value.OthersJsonArray[0].Questions);
                        console.log("array array length----->",value.OthersJsonArray.length);*/
                        for(var n=0;n<value.OthersJsonArray.length;n++)
                        {
                            var element_others=value.OthersJsonArray[n].Others;
                            if(element_others!="Application Security") {
                                var element_Questions = value.OthersJsonArray[n].Questions;
                                var element_Type = value.OthersJsonArray[n].Type;
                                var element_value = value.OthersJsonArray[n].Value;
                                if (element_others == "Mainframe") {
                                    Mainframe_value = element_value;
                                    mainframe_val=element_value.split(",");
                                    mainframeoptions="";
                                    var arr_option_main = ['CICS Regions', 'DB2', 'Endevor Flows', "HLQ's (high level qualifiers) to be eliminated", 'IMS Regions', 'Mainframe  Storage', 'Mainframe Batch Processing', 'Mainframe Capacity', 'Tape Media', 'VSAM'];
                                    for (var i = 0; i < arr_option_main.length; i++) {
                                        var check = "";
                                        if(Mainframe_value.includes(arr_option_main[i]))
                                        {
                                            check="selected";
                                        }
                                        mainframeoptions+="<option value='"+arr_option_main[i]+"' "+check+">"+arr_option_main[i]+"</option>";
                                    }
                                }
                                if (element_others == "Support Readiness") {
                                    if (element_value == "Yes")
                                        Support_Readiness_value_yes = "checked";
                                    else if (element_value == "No")
                                        Support_Readiness_value_No = "checked";
                                }
                                if (element_others == "Desktop Software") {
                                    if (element_value == "Yes")
                                        Desktop_Software_value_Yes = "checked";
                                    else if (element_value == "No")
                                        Desktop_Software_value_No = "checked";
                                }
                                if (element_others == "Disaster Recovery") {
                                    Disaster_Recovery_value = element_value;
                                    disasterrecoveryoptions="";
                                    var DisasterRecoveryOptions=Disaster_Recovery_value.split(",");
                                    console.log("disaster recovery value ",Disaster_Recovery_value);
                                    var arr_option_dis = ['Rapid Recovery', 'SRM', 'Tier 0', 'Tier 1', 'Tier 2', 'Legacy Recovery'];
                                    console.log("array options disaster recovery ",arr_option_dis);
                                    for(var i=0;i<arr_option_dis.length;i++)
                                    {
                                        var check="";
                                        if(Disaster_Recovery_value.includes(arr_option_dis[i]))
                                        {
                                            check="selected";
                                        }
                                        console.log("check ",check);
                                        disasterrecoveryoptions+="<option value='"+arr_option_dis[i]+"'"+check+">"+arr_option_dis[i]+"</option>";
                                    }
                                    console.log("disaster options ",disasterrecoveryoptions);
                                }
                                if (element_others == "Citrix") {
                                    if (element_value == "Yes")
                                        Citrix_value_Yes = "checked";
                                    else if (element_value == "No")
                                        Citrix_value_No = "checked";
                                }

                                if (element_others == "Final Backups") {
                                    if (element_value == "Yes")
                                        Final_Backups_value_Yes = "checked";
                                    else if (element_value == "No")
                                        Final_Backups_value_No = "checked";
                                }
                            }
                            else {
                                if(element_others=="Application Security")
                                {
                                    var element_value1 = value.OthersJsonArray[n].values[0].Value;
                                    if(element_value1=="Yes") {
                                        Application_Security_Display2="";
                                        Application_Security_value_Yes1 = "checked";
                                        var element_value2 = value.OthersJsonArray[n].values[1].Value;
                                        if(element_value2=="Yes")
                                        {
                                            Application_Security_value_Yes2="checked";
                                            Application_Security_Display3="";
                                            var element_value3 = value.OthersJsonArray[n].values[2].Value;
                                            if(element_value3=="Yes")
                                            {
                                                Application_Security_value_Yes3="checked";
                                            }
                                            else {
                                                Application_Security_value_No3="checked";
                                            }
                                        }
                                        else {
                                            Application_Security_value_No2="checked";
                                        }
                                    }else if(element_value1=="No") {
                                        Application_Security_value_No1 = "checked";
                                    }
                                }
                            }
                        }
                        if (Value.includes("Mainframe")){
                            Mainframe_check = "";
                        }
                        if (Value.includes("Support Readiness")){
                            Support_Readiness_check = "";
                        }
                        if (Value.includes("Desktop Software")){
                            Desktop_Software_check = "";
                        }
                        if (Value.includes("Disaster Recovery")){
                            Disaster_Recovery_check = "";
                        }
                        if (Value.includes("Citrix")){
                            Citrix_check = "";
                        }
                        if (Value.includes("Application Security")){
                            Application_Security_check = "";
                        }
                        if (Value.includes("Final Backups")){
                            Final_Backups_check = "";
                        }

                        for (var i=0; i<option.length; i++) {
                            var Checking = "";
                            if(Value.includes(option[i])){
                                Checking = "checked";
                            }
                            inputcheck += "<label class = 'control-label others' for = 'fromInput198'><input type='checkbox'  value = '"+option[i]+"' class = 'form-comtrol "+ColumnName+"' id='"+((option[i]).replace(/\s/g,''))+ "' placeholder ='"+option[i]+"' name= '"+ColumnName+"' "+Checking+" disabled/>" +
                                option[i]+"</label><br>";

                        }

                        inputcheck +="</div>";

                        $('#inputFields').append(inputcheck);
                        var others= "<div class='form-group'>\n" +
                            "<table  class='Mainframe hidetable' "+Mainframe_check+">\n" +
                            "<tr>\n" +
                            "<td><b>MAINFRAME</b></td>\n" +
                            "<td>\n" +
                            /*"<input class='form-control mainframe' id='mainframe' value='"+Mainframe_value+"'name='Mainframe' placeholder='select...' autocomplete='off' style='width:100%;'>\n" +*/
                            "<pre style='font-family:verdana;font-size:100%;' name='Mainframe'>\n" +
                            Mainframe_value+
                            "</pre>"+
                            "\n"+
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table class='Support_Readiness hidetable' "+Support_Readiness_check+">\n" +
                            "<tr><td><b>SUPPORT READINESS</b></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td>\n" +
                            "<font color='blue'>  Is the application supported by the United Support Center (Help Desk) and/or\n" +
                            "IT Service Management (service/infrastructure performance monitoring)? </font></td>\n" +
                            "</td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='SupportReadiness1' value='Yes' "+Support_Readiness_value_yes+" disabled>yes\n" +
                            "<input type='radio' name='SupportReadiness1' value='No' "+Support_Readiness_value_No+" disabled>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table class='Desktop_Software hidetable' "+Desktop_Software_check+">\n" +
                            "<tr>\n" +
                            "<td> <b>DESKTOP SOFTWARE</b> </td>\n" +
                            "<td></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td><font color='blue';> Is there any desktop or supporting desktop software? </font> </td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='DesktopSoftware1' value='Yes'"+Desktop_Software_value_Yes+" disabled>yes\n" +
                            "<input type='radio' name='DesktopSoftware1' value='No'"+Desktop_Software_value_No+" disabled>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table class='Disaster_Recovery hidetable' "+Disaster_Recovery_check+">\n" +
                            "<tr>\n" +
                            "<td><b>DISASTER RECOVERY</b></td>\n" +
                            "<td>\n" +
                            /* "<input class='form-control disaster_rec' name='DisasterRecovery' id='disaster_rec' value='"+Disaster_Recovery_value+"' placeholder='select...' value='' autocomplete='off' style='width:100%;'>\n" +*/
                            "<pre style='font-family:verdana;font-size:100%;' name='DisasterRecovery'>\n" +
                            Disaster_Recovery_value+
                            "</pre>"+
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table class='Citrix hidetable' "+Citrix_check+">\n" +
                            "<tr>\n" +
                            "<td><b>CITRIX</b></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td> <font color='blue';> Does the application utilize any Citrix environments? </font> </td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='Citrix1' value='Yes'"+Citrix_value_Yes+" disabled>yes\n" +
                            "<input type='radio' name='Citrix1' value='No'"+Citrix_value_No+" disabled>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table class='Application_Security hidetable' "+Application_Security_check+">\n" +
                            "<tr>\n" +
                            "<td><b>APPLICATION SECURITY</b></td>\n" +
                            "</tr>\n" +
                            "<tr >\n" +
                            "<td> <font color='blue';> Does the application utilize Global Groups?</font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='ApplicationSecurity11' class='citrix' value='Yes'"+Application_Security_value_Yes1+" disabled>yes\n" +
                            "<input type='radio' name='ApplicationSecurity11'  class='citrix' value='No'"+Application_Security_value_No1+" disabled>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "<tr class='add_question' "+Application_Security_Display2+">\n" +
                            "<td><font color='blue';>Is the application in SECURE?</font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='ApplicationSecurity21' class='citrix_1' value='Yes'"+Application_Security_value_Yes2+" disabled>yes\n" +
                            "<input type='radio' name='ApplicationSecurity21' class='citrix_1' value='No' "+Application_Security_value_No2+" disabled>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "<tr class='add_question_2' "+Application_Security_Display3+">\n" +
                            "<td> <font color='blue';> Does the application have an Internally supported access mechanism or other not listed above\n" +
                            "( e.g., your own directory)?</font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='ApplicationSecurity31' class='citrix_2' value='Yes'"+Application_Security_value_Yes3+" disabled>Yes\n" +
                            "<input type='radio' name='ApplicationSecurity31' class='citrix_2' value='No'"+Application_Security_value_No3+" disabled>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table class='Final_Backups hidetable' "+Final_Backups_check+">\n" +
                            "<tr>\n" +
                            "<td><b>FINAL BACKUPS</b></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td><font color='blue';> Are Final Backups Required?     </font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='FinalBackups1' class='backup' value='Yes'"+Final_Backups_value_Yes+" disabled>yes\n" +
                            "<input type='radio' name='FinalBackups1' class='backup' value='No'"+Final_Backups_value_No+" disabled>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "</div>";
                        $('#inputFields').append(others);
                    }

                });
                var script="<script>$('.datepicker1').datepicker({\n" +
                    "format: \"mm/dd/yyyy\",\n"+
                    "autoclose: true\n"+
                    "});<\/script>";
                script+="<script>\n" +
                    "$('.editpopup').click(function() {\n" +
                    "var seqnum=$(this).index('.editpopup');"+
                    "$('#seq_num').val(seqnum);"+
                    "modal1.style.display = \"block\";\n" +
                    "});"+
                    "<\/script>";
                script+="<script> $('.deletepopup').click(function() {\n" +
                    "var seqnum=$(this).index('.deletepopup');"+
                    //   "alert('sequence number '+seqnum);"+
                    "$('#sequence1').val(seqnum);"+
                    "modal2.style.display = \"block\";\n" +
                    "});<\/script>";
                script+="<script> $('input[name=ServiceCategories6]').change(function(){" +
                    "var answer = [];\n" +
                    "$.each($('input[name=ServiceCategories6]:checked'), function(){\n" +
                    "answer.push($(this).val());\n" +
                    "});" +
                    "$('.hidetable').hide();"+
                    "for(var i=0;i<answer.length;i++)" +
                    "{"+
                    "$('.'+answer[i].replace(' ','_')).show();}});<\/script>";
                script+="<script>$('input[name=\"ApplicationSecurity1\"]').on('change', function(){"+
                    "if(this.value == 'Yes'){"+
                    "$('.add_question').show();"+
                    "}"+
                    "else{"+
                    "$('.add_question').hide();"+
                    "}"+
                    "});" +
                    "$('input[name=\"ApplicationSecurity2\"]').on('change', function(){" +
                    "if(this.value == 'Yes'){" +
                    "$('.add_question_2').show();" +
                    "}" +
                    "else{" +
                    "$('.add_question_2').hide();" +
                    "}" +
                    "});<\/script>";
                script+="<script>$('.selectpicker').multiselect();<\/script>";
                $('#scripttag').append(script);

                //Service Categories Cheaklist Data success!!!!!
                $('#inputFields').append(service_cat_data);
                var TableServiceCategoryChecklistDataRetrieve="<h4>Services - Environment Information</h4>\n" +
                    "<table class='table table-bordered hidetable CrossApplicationTeamProjectManagerClass' id='mytable'>\n" +
                    "<thead style='color:white;background-color:DodgerBlue;'>\n" +
                    "<tr >\n" +
                    "<th scope='col' style='color:white;'>Label</th>\n" +
                    "<th scope='col' style='color:white;'>Data</th>\n" +
                    "<th scope='col' style='color:white;'>Dev</th>\n" +
                    "<th scope='col' style='color:white;'>Test</th>\n" +
                    "<th scope='col' style='color:white;'>Stage</th>\n" +
                    "<th scope='col' style='color:white;'>Prod</th>\n" +
                    "<th scope='col' style='color:white;'>Additional Comments</th>\n" +
                    "</tr>\n" +
                    "</thead ></table>";
                //$("#inputFields").append("");
            TableServiceCategoryChecklistDataRetrieve +="<br><br><h4>Others</h4><br><table class='table table-bordered hidetable' id='mytable1'>\n" +
                "<thead style='color:white;background-color:DodgerBlue;'>\n" +
                "<tr >\n" +
                "<th scope='col' style='color:white;'>Label</th>\n" +
                "<th scope='col' style='color:white;'>Data</th>\n" +
                "<th scope='col' style='color:white;'>Values</th>\n" +
                "<th scope='col' style='color:white;'>Dev</th>\n" +
                "<th scope='col' style='color:white;'>Test</th>\n" +
                "<th scope='col' style='color:white;'>Stage</th>\n" +
                "<th scope='col' style='color:white;'>Prod</th>\n" +
                "<th scope='col' style='color:white;'>Comments</th>\n" +
                "</tr>\n" +
                "</thead>\n" +
                "<tr class = 'Mainframe hiderow'>\n" +
                "<td scope='col' style='color:black;'>MAINFRAME</td>\n" +
                "<td></td>\n" +
                "<td> <input type='textbox' id='Mainframe1' name = 'Mainframe' readonly></td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='dev_mainframe' name = 'Mainframe_dev' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='test_mainframe' name = 'Mainframe_test' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='stage_mainframe' name = 'Mainframe_stage' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='prod_mainframe' name = 'Mainframe_prod' readonly> </td>\n" +
                "<td> <textarea maxlength='50' id='comment_mainframe' name = 'Mainframe_comment' readonly></textarea> </td>\n" +
                "</tr>\n" +
                "\n" +
                "<tr class = 'SupportReadiness hiderow'>\n" +
                "<td scope='col' style='color:black;'>SUPPORT READINESS</td>\n" +
                "<td> Is the application supported by the United Support Center (Help Desk)\n" +
                "        and/or IT Service Management (service/infrastructure performance monitoring)? </td>\n" +
                "<td>\n" +
                "        <input type='radio' name='SupportReadiness' value='Yes' >Yes\n" +
                "        <input type='radio' name='SupportReadiness' value='No' >No\n" +
                "</td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='dev_support' name = 'SupportReadiness_dev' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='test_support' name =  'SupportReadiness_test' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='stage_support' name = 'SupportReadiness_stage' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='prod_support' name = 'SupportReadiness_prod' readonly> </td>\n" +
                "<td> <textarea maxlength='50' id='comment_support' name = 'SuppertReadiness_comment' readonly></textarea> </td>\n" +
                "</tr>\n" +
                "\n" +
                "<tr class = 'DisasterRecovery hiderow'>\n" +
                "<td scope='col' style='color:black;'>DISASTER RECOVERY\n" +
                "</td>\n" +
                "<td></td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='DisasterRecovery' name = 'DisasterRecovery' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='dev_disaster' name = 'DisasterRecovery_dev' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='test_disaster' name = 'DisasterRecovery_test' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='stage_disaster' name = 'DisasterRecovery_stage' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='prod_disaster' name = 'DisasterRecovery_prod' readonly> </td>\n" +
                "<td> <textarea maxlength='50' id='comment_disaster' name = 'DisasterRecovery_comment' readonly></textarea> </td>\n" +
                "</tr>\n" +
                "\n" +
                "<tr class = 'DesktopSoftware hiderow'>\n" +
                "<td scope='col' style='color:black;'>DESKTOP SOFTWARE</td>\n" +
                "<td> Is there any desktop or supporting desktop software? </td>\n" +
                "<td>\n" +
                "        <input type='radio' name='DesktopSoftware' value='Yes' disabled>Yes\n" +
                "        <input type='radio' name='DesktopSoftware' value='No' disabled>No\n" +
                "</td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='dev_software' name = 'DesktopSoftware_dev' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='test_software' name = 'DesktopSoftware_test' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='stage_software' name = 'DesktopSoftware_stage' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='prod_software' name = 'DesktopSoftware_prod' readonly> </td>\n" +
                "<td> <textarea maxlength='50' id='comment_software' name = 'DesktopSoftware_comment' readonly></textarea></td>\n" +
                "</tr>\n" +
                "\n" +
                "<tr class = 'Citrix hiderow'>\n" +
                "<td scope='col' style='color:black;'>CITRIX</td>\n" +
                "<td> Does the application utilize any Citrix environments? </td>\n" +
                "<td>\n" +
                "        <input type='radio' name='Citrix' value='Yes' disabled>Yes\n" +
                "        <input type='radio' name='Citrix' value='No' disabled>No\n" +
                "\n" +
                "</td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='dev_citrix' name = 'Citrix_dev' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='test_citrix' name = 'Citrix_test' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='stage_citrix' name = 'Citrix_stage' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='prod_citrix' name = 'Citrix_prod' readonly> </td>\n" +
                "<td> <textarea maxlength='50' id='comment_citrix' name = 'Citrix_comment' readonly></textarea> </td>\n" +
                "</tr>\n" +
                "\n" +
                "\n" +
                "\n" +
                "<tr class = 'ApplicationSecurity hiderow'>\n" +
                "<td scope='col' style='color:black;'>APPLICATION SECURITY</td>\n" +
                "<td><div class='ApplicationSecurity1'> Does the application utilize Global Groups? <br></div>\n" +
                "        <div class='ApplicationSecurity2'>\n" +
                "            Is the application in SECURE? <br></div>\n" +
                "        <div class='ApplicationSecurity3'>\n" +
                "            Does the application have an Internally supported access mechanism or other not listed above\n" +
                "            ( e.g., your own directory)?</div>\n" +
                "</td>\n" +
                "<td><div class='ApplicationSecurity1'><input type='radio' name='ApplicationSecurity1' value='Yes' disabled> Yes\n" +
                "        <input type='radio' name='ApplicationSecurity1' value='No' disabled>No</div>\n" +
                "        <br><br><br>\n" +
                "        <div class='ApplicationSecurity2'>\n" +
                "            <input type='radio' name='ApplicationSecurity2' value='Yes' disabled>Yes\n" +
                "            <input type='radio' name='ApplicationSecurity2' value='No' disabled>No</div>\n" +
                "        <br><br><br>\n" +
                "        <div class='ApplicationSecurity3'>\n" +
                "            <input type='radio' name='ApplicationSecurity3' value='Yes' disabled>Yes\n" +
                "            <input type='radio' name='ApplicationSecurity3' value='No' disabled>No\n" +
                "        </div>\n" +
                "</td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='dev_citrix' name = 'ApplicationSecurity_dev' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='test_security' name = 'ApplicationSecurity_test' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='stage_security' name = 'ApplicationSecurity_stage' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='prod_security' name = 'ApplicationSecurity_prod' readonly> </td>\n" +
                "<td> <textarea maxlength='50' id='comment_security' name = 'ApplicationSecurity_comment' readonly></textarea> </td>\n" +
                "</tr>\n" +
                "\n" +
                "<tr class = 'FinalBackups hiderow'>\n" +
                "\n" +
                "<td scope='col' style='color:black;'>FINAL BACKUPS</td>\n" +
                "<td> Are Final Backups Required? </td>\n" +
                "<td>\n" +
                "        <input type='radio' name='FinalBackups' value='Yes' disabled> yes\n" +
                "        <input type='radio' name='FinalBackups' value='No' disabled>No\n" +
                "\n" +
                "</td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='dev_final' name = 'FinalBackups_dev' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='test_final' name = 'FinalBackups_test' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='stage_final' name = 'FinalBackups_stage' readonly> </td>\n" +
                "<td> <input type='textbox' style='width:66%;' id='prod_final' name = 'FinalBackups_prod' readonly> </td>\n" +
                "<td> <textarea maxlength='50' id='comment_final' name = 'FinalBackups_comment' readonly></textarea> </td>\n" +
                "</tr>\n" +
                "</table>";
            $('#inputFields').append(TableServiceCategoryChecklistDataRetrieve);
                for(var i=0; i<data[3][0].length; i++){
                    var label = data[3][0][i].LabelName;
                    var label_nospace = label.replace(" ","");
                    var tr  = "<tr>\n" +
                        "<td> <label>"+label+"</label></td>\n" +
                        "<td><input type='textbox' id='"+label_nospace+i+"' name='"+label_nospace+i+"' value='"+data[3][0][i].Value+"' readonly></td>\n" +
                        "<td> <input type='textbox' id='"+label_nospace+"_dev"+i+"' style='width:66%;' name='"+label_nospace+"_dev"+i+"' value='"+data[3][0][i].Dev+"' readonly> </td>\n" +
                        "<td> <input type='textbox' id='"+label_nospace+"_test"+i+"' style='width:66%;' name='"+label_nospace+"_test"+i+"' value='"+data[3][0][i].Test+"' readonly> </td>\n" +
                        "<td> <input type='textbox' id='"+label_nospace+"_stage"+i+"' style='width:66%;' name='"+label_nospace+"_stage"+i+"' value='"+data[3][0][i].Stage+"' readonly> </td>\n" +
                        "<td> <input type='textbox' id='"+label_nospace+"_prod"+i+"' style='width:66%;' name='"+label_nospace+"_prod"+i+"' value='"+data[3][0][i].Prod+"' readonly> </td>\n" +
                        "<td> <textarea maxlength='50' id='"+label_nospace+"_comment"+i+"' name='"+label_nospace+"_comment"+i+"' readonly>"+data[3][0][i].Comment+"</textarea></td>\n" +
                        "</tr>";
                    $('#mytable').append(tr);
                }

                $(".hiderow").hide();
                var application_security_check=true;
                for(var j=0;j<data[3][1].length;j++)
                {
                    var others_name=data[3][1][j].Others;
                    var class_others=others_name.replace(" ","");
                    var other_values = data[3][1][j].Value;
                    $('.'+class_others).show();
                    if(others_name=="Mainframe")
                    {
                        $('input[name="Mainframe"]').val(other_values);
                    }
                    else if(others_name == "Disaster Recovery"){
                        $('input[name="DisasterRecovery"]').val(other_values);
                    }
                    else if(others_name == "Application Security")
                    {
                        if(application_security_check==true) {
                            var AppSec1_value = data[3][1][j].Value;
                            var AppSec2_value = data[3][1][j + 1].Value;
                            var AppSec3_value = data[3][1][j + 2].Value;
                            if (AppSec1_value == "Yes") {

                                $(".ApplicationSecurity2").show();
                                if (AppSec2_value == "Yes") {
                                    $(".ApplicationSecurity3").show();
                                    if (AppSec3_value == "Yes") {

                                    } else {

                                    }
                                } else {
                                    $(".ApplicationSecurity3").hide();
                                }
                            } else {
                                $(".ApplicationSecurity2").hide();
                                $(".ApplicationSecurity3").hide();
                            }
                            var $val1 = $('input[name="ApplicationSecurity1"]');
                            $val1.filter('[value=' + AppSec1_value + ']').prop('checked', true);
                            var $val2 = $('input[name="ApplicationSecurity2"]');
                            $val2.filter('[value=' + AppSec2_value + ']').prop('checked', true);
                            var $val3 = $('input[name="ApplicationSecurity3"]');
                            $val3.filter('[value=' + AppSec3_value + ']').prop('checked', true);
                        application_security_check=false;
                        }

                    }
                    else {
                        var $radios = $('input:radio[name='+class_others+']');
                        $radios.filter('[value=' + other_values + ']').prop('checked', true);
                    }
                }
                for(var k=0;k<data[3][2].length;k++)
                {
                    var options=data[3][2][k].Options;
                    var value=data[3][2][k].Value;
                    var label=data[3][2][k].label;
                    var label_nospace=label.replace(" ","");
                    var type=data[3][2][k].type;

                    if(type=="Check box")
                    {
                        var inputcheck= "<tr><td><label class='control-label' for= 'formInput198'><div >"+label+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label></td>";
                        inputcheck+="<td></td>";

                        var option1=options.split(",");
                        inputcheck+="<td><div class='form-group'>";
                        for (var i=0; i<option1.length; i++) {

                            var Checking = "";
                            if(value.includes(option1[i])){
                                Checking = "checked";
                            }
                            inputcheck += "<label class = 'control-label others' for = 'fromInput198'><input type='checkbox'  value = '"+option1[i]+"' class = 'form-comtrol' id='"+(option1[i]+(i + 1)).replace(/\s/g,'')+"'  placeholder ='"+option1[i]+"' "+Checking+" disabled/>" +
                                option1[i]+"</label>&nbsp;";
                        }
                        inputcheck +="</div></td>";
                        inputcheck+="<td> <input type='textbox' id='"+label_nospace+"_dev' style='width:66%;' name='ServiceCategoriesSecondTable_dev"+k+"' value='"+data[3][2][k].Dev+"' readonly> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_test' style='width:66%;' name='ServiceCategoriesSecondTable_test"+k+"' value='"+data[3][2][k].Test+"' readonly> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_stage' style='width:66%;' name='ServiceCategoriesSecondTable_stage"+k+"' value='"+data[3][2][k].Stage+"' readonly> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_prod' style='width:66%;' name='ServiceCategoriesSecondTable_prod"+k+"' value='"+data[3][2][k].Prod+"' readonly> </td>\n"+
                            "<td> <textarea maxlength='50' id='"+label_nospace+"_comment' name='ServiceCategoriesSecondTable_comment"+k+"' readonly>"+data[3][2][k].Comment+"</textarea></td></tr>";

                        $('#mytable1').append(inputcheck);
                    }
                    else if(type=="Radio box") {
                        var inputcheck= "<tr><td><label class='control-label' for= 'formInput198'><div >"+label+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label></td>";
                        inputcheck+="<td></td>";

                        var option1=options.split(",");
                        inputcheck+="<td><div class='form-group'>";
                        for (var i=0; i<option1.length; i++) {

                            var Checking = "";
                            if(value.includes(option1[i])){
                                Checking = "checked";
                            }
                            inputcheck += "<label class = 'control-label others' for = 'fromInput198'><input type='radio' name='"+label_nospace+"' value = '"+option1[i]+"' class = 'form-comtrol' id='"+((option1[i]+(i + 1)).replace(/\s/g,''))+"' name='ServiceCategoriesSecondTable"+k+"' placeholder ='"+option1[i]+"' "+Checking+" disabled/>" +
                                option1[i]+"</label>&nbsp;";
                        }
                        inputcheck +="</div></td>";
                        inputcheck+="<td> <input type='textbox' id='"+label_nospace+"_dev' style='width:66%;' name='ServiceCategoriesSecondTable_dev"+k+"' value='"+data[3][2][k].Dev+"' readonly> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_test' style='width:66%;' name='ServiceCategoriesSecondTable_test"+k+"' value='"+data[3][2][k].Test+"' readonly> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_stage' style='width:66%;' name='ServiceCategoriesSecondTable_stage"+k+"' value='"+data[3][2][k].Stage+"' readonly> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_prod' style='width:66%;' name='ServiceCategoriesSecondTable_prod"+k+"' value='"+data[3][2][k].Prod+"' readonly> </td>\n"+
                            "<td> <textarea maxlength='50' id='"+label_nospace+"_comment' name='ServiceCategoriesSecondTable_comment"+k+"' readonly>"+data[3][2][k].Comment+"</textarea></td></tr>";
                        console.log("radio box inputs---->",inputcheck);
                        $('#mytable1').append(inputcheck);
                    }
                }
                for (var m=0; m<data[3][1].length; m++){
                    var value = data[3][1][m].Others;
                    var value_nospace = value.replace(" ","");
                    $('input[name="'+value_nospace+'_dev"]').val(data[3][1][m].Dev);
                    $('input[name="'+value_nospace+'_test"]').val(data[3][1][m].Test);
                    $('input[name="'+value_nospace+'_stage"]').val(data[3][1][m].Stage);
                    $('input[name="'+value_nospace+'_prod"]').val(data[3][1][m].Prod);
                    $('textarea[name="'+value_nospace+'_comment"]').val(data[3][1][m].Comment);
                }


                // Key Mile Stone success

                $('#inputFields').append(key_mile_stone);
                var arr_tab = ['CAPM','ETPM','APP TEAM','APP SLO'];
                var arr_yes_capm = ['','','','','','',''];
                var arr_no_capm = ['','','','','','',''];
                var arr_na_capm = ['','','','','','',''];
                var arr_yes_etpm=[];
                var arr_no_etpm=[];
                var arr_na_etpm=[];
                var arr_valuedate_etpm=[];
                var arr_valuedate_app_team=[];
                var arr_valuedate_app_slo=[];
                var arr_yes_app_team=[];
                var arr_no_app_team=[];
                var arr_na_app_team=[];
                var arr_yes_app_slo=[];
                var arr_no_app_slo=[];
                var arr_na_app_slo=[];
                var arr_capm_show = ['style=\'display:none;\'','style=\'display:none;\'','style=\'display:none;\'','style=\'display:none;\'','style=\'display:none;\''];
                var arr_etpm_show = ['style=\'display:none;\'','style=\'display:none;\''];
                var arr_app_team_show = ['style=\'display:none;\'','style=\'display:none;\'','style =\'display:none;\'','style =\'display:none;\''];
                var arr_app_slo_show = ['style=\'display:none;\'','style=\'display:none;\''];
                for(var i=0; i<data[4].length; i++){
                    var data_tab_name = data[4][i].Tab_Name;
                    var seq_num = data[4][i].Seq_Num;
                    var tab_name_value = data[4][i].Tab_Name_Value;
                    if(data_tab_name == "CAPM"){
                        if(tab_name_value == "Yes"){
                            arr_yes_capm[seq_num-1] = "Checked";
                            if(seq_num=="3")
                            {
                                arr_capm_show[seq_num-1]="style = 'display:block;'";
                            }
                            if(seq_num=="4")
                            {
                                arr_capm_show[seq_num-1]="style = 'display:block;'";
                            }
                            if(seq_num=="5")
                            {
                                arr_capm_show[seq_num-1]="style = 'display:block;'";
                            }
                        }
                        else if(tab_name_value == "No"){
                            arr_no_capm[seq_num-1] = "Checked";
                            if(seq_num == "1"){
                                arr_capm_show[seq_num-1] = "style = 'display:block;'";
                            }
                            if(seq_num=="2"){
                                arr_capm_show[seq_num-1]="style = 'display:block;'";
                            }
                        }
                        else if(tab_name_value == "NA"){
                            arr_na_capm[seq_num-1] = "Checked";
                        }
                    }
                    else if(data_tab_name=="ETPM")
                    {
                        if(tab_name_value == "Yes")
                        {
                            if(seq_num == "2")
                            {
                                arr_etpm_show[0] = "style = 'display:block;'";
                                arr_valuedate_etpm[0]=data[4][i+1].Tab_Name_Value;
                            }
                            if(seq_num == "4")
                            {
                                arr_etpm_show[1] = "style = 'display:block;'";
                                arr_valuedate_etpm[1]=data[4][i+1].Tab_Name_Value;
                            }

                            arr_yes_etpm[seq_num-1]="checked";
                        }
                        else if(tab_name_value == "No")
                        {
                            arr_no_etpm[seq_num-1]="checked";
                        }
                        else if(tab_name_value=="NA")
                        {
                            arr_na_etpm[seq_num-1]="checked";
                        }
                    }
                    else if(data_tab_name=="APP TEAM")
                    {
                        if(tab_name_value == "Yes")
                        {
                            arr_yes_app_team[seq_num-1]="checked";
                            if(seq_num=="2")
                            {
                                arr_app_team_show[0]="style ='diaplay:block;'";
                                arr_valuedate_app_team[0]=data[4][i+1].Tab_Name_Value;
                            }
                            else if(seq_num=="4")
                            {
                                arr_app_team_show[1]="style ='diaplay:block;'";
                                arr_valuedate_app_team[1]=data[4][i+1].Tab_Name_Value;
                            }
                            else if(seq_num=="6")
                            {
                                arr_app_team_show[2]="style ='diaplay:block;'";
                                arr_valuedate_app_team[2]=data[4][i+1].Tab_Name_Value;
                            }
                            else if(seq_num=="8")
                            {
                                arr_app_team_show[3]="style = 'display:block;'";
                                arr_valuedate_app_team[3]=data[4][i+1].Tab_Name_Value;
                            }
                        }
                        else if(tab_name_value == "No")
                        {
                            arr_no_app_team[seq_num-1]="checked";
                        }
                        else if(tab_name_value=="NA")
                        {
                            arr_na_app_team[seq_num-1]="checked";
                        }
                    }
                    else if(data_tab_name=="APP SLO")
                    {
                        if(tab_name_value == "Yes")
                        {
                            arr_yes_app_slo[seq_num-1]="checked";
                            if(seq_num=="1")
                            {
                           arr_app_slo_show[0]="style = 'display:block;'";
                           arr_valuedate_app_slo[0]=data[4][i+1].Tab_Name_Value;
                            }
                            else if(seq_num=="3")
                            {
                                arr_app_slo_show[1]="style = 'display:block;'";
                                arr_valuedate_app_slo[1]=data[4][i+1].Tab_Name_Value;
                            }
                        }
                        else if(tab_name_value == "No")
                        {
                            arr_no_app_slo[seq_num-1]="checked";
                        }
                        else if(tab_name_value=="NA")
                        {
                            arr_na_app_slo[seq_num-1]="checked";
                        }
                    }
                }
                console.log("arr yes---> ",arr_yes_etpm,"etpm date value----> ",arr_valuedate_etpm);

                var camp_tab = " <div class='form-group hideclass' id='capm_data' >\n" +
                    "<div>\n" +
                    "    <h4><font color='red' size='5'>CAPM</font></h4>\n" +
                    "\n" +
                    "    <label  class='control-label ' for='formInput198' style='width:65%;'><font size='4' ><b>Status is Targeted for Decommission ?</b></font></label>\n" +
                    "    <input type='radio' name='CAPM1' class='status' value='Yes' "+arr_yes_capm[0]+" disabled>Yes\n" +
                    "    <input type='radio' name='CAPM1' class='status' value='No' "+arr_no_capm[0]+" disabled >No\n" +
                    "    <input type='radio' name='CAPM1' class='status' value='NA' "+arr_na_capm[0]+" disabled>N/A\n" +
                    "\n" +
                    "</div>\n" +
                    "<div class='hint_1' "+arr_capm_show[0]+">\n" +
                    "    <label><font color='red';>If no then submit request to change the life cycle status to ' Targeted for Decommission'</font></label>\n" +
                    "</div>\n" +
                    "<div>\n" +
                    "    <label class='control-label ' for='formInput198' style='width:65%;'><font size='4'><b>Service currently in Production ?</b></font></label>\n" +
                    "    <input type='radio' name='CAPM2' class='service' value='Yes' "+arr_yes_capm[1]+" disabled>Yes\n" +
                    "    <input type='radio' name='CAPM2' class='service' value='No' "+arr_no_capm[1]+" disabled>No\n" +
                    "    <input type='radio' name='CAPM2' class='service' value='NA' "+arr_na_capm[1]+" disabled>N/A\n" +
                    "</div>\n" +
                    "<div class='hint_2' "+arr_capm_show[1]+">\n" +
                    "    <label><font color='red';>If no, Retired or if the service does not exist; No further steps required.</font></label>\n" +
                    "</div>\n" +
                    "<div>\n" +
                    "    <label class='control-label ' for='formInput198' style='width:65%;'><font size='4'><b>Change service priority needed ?</b></font></label>\n" +
                    "    <input type='radio' name='CAPM3' class='change' value='Yes' "+arr_yes_capm[2]+" disabled>Yes\n" +
                    "    <input type='radio' name='CAPM3' class='change' value='No' "+arr_no_capm[2]+" disabled>No\n" +
                    "    <input type='radio' name='CAPM3' class='change' value='NA' "+arr_na_capm[2]+" disabled>N/A\n" +
                    "</div>\n" +
                    "<div class='hint_3' "+arr_capm_show[2]+">\n" +
                    "    <label><font color='brown';>Priority change request should be submitted in Service now or any ITSM</font></label>\n" +
                    "</div>\n" +
                    "<div>\n" +
                    "    <label class='control-label ' for='formInput198' style='width:65%;'><font size='4'><b>CI Relationships exists?</b></font></label>\n" +
                    "    <input type='radio' name='CAPM4' class='relationship' value='Yes' "+arr_yes_capm[3]+" disabled>Yes\n" +
                    "    <input type='radio' name='CAPM4' class='relationship' value='No' "+arr_no_capm[3]+" disabled>No\n" +
                    "    <input type='radio' name='CAPM4' class='relationship' value='NA' "+arr_na_capm[3]+" disabled>N/A\n" +
                    "</div>\n" +
                    "<div class ='addquestion CAPM5' "+arr_capm_show[3]+">\n" +
                    "    <label class='control-label ' for='formInput198' style='width:65%;'><font color='blue';>Item will be retired?</font></label>\n" +
                    "    <input type='radio' name='CAPM5' class='item' value='Yes' "+arr_yes_capm[4]+" disabled>Yes\n" +
                    "    <input type='radio' name='CAPM5' class='item' value='No' "+arr_no_capm[4]+" disabled>No\n" +
                    "    <input type='radio' name='CAPM5' class='item' value='NA' "+arr_na_capm[4]+" disabled>N/A\n" +
                    "</div>\n" +
                    "\n" +
                    "<div class='hint_4' "+arr_capm_show[4]+">\n" +
                    "    <label><font color='brown';>SLO to make appropriate updates?</font></label>\n" +
                    "</div>\n" +
                    "\n" +
                    "<div>\n" +
                    "    <label class='control-label ' for='formInput198' style='width:65%;'><font size='4'><b>SLO has made Appropriate updates ?</b></font></label>\n" +
                    "    <input type='radio' name='CAPM6' value='Yes' "+arr_yes_capm[5]+" disabled>Yes\n" +
                    "    <input type='radio' name='CAPM6' value='No' "+arr_no_capm[5]+" disabled>No\n" +
                    "    <input type='radio' name='CAPM6' value='NA' "+arr_na_capm[5]+" disabled>N/A\n" +
                    "</div>\n" +
                    "<div>\n" +
                    "    <label class='control-label ' for='formInput198' style='width:65%;'><font size='4'>Application part of EDR list?</font></label>\n" +
                    "    <input type='radio' name='CAPM7' value='Yes' "+arr_yes_capm[6]+" disabled>Yes\n" +
                    "    <input type='radio' name='CAPM7' value='No' "+arr_no_capm[6]+" disabled>No\n" +
                    "    <input type='radio' name='CAPM7' value='NA' "+arr_na_capm[6]+" disabled>N/A\n" +
                    "</div>\n" +
                    "</div>";
                var etpm_tab="\n" +
                    "<div class='form-group hideclass' id='et_team_data'>\n" +
                    "\n" +
                    "    <div>\n" +
                    "        <h4><font color='red' size='5'>ET TEAM/ET PM TAB</font></h4>\n" +
                    "\n" +
                    "        <label  class='control-label ' for='formInput198' style='width:65%;'><font size='4'><b>Final Artifact- Review and Approval</b></font></label>\n" +
                    "        <input type='radio' name='ETPM1' class='final_artifact' value='Yes'"+arr_yes_etpm[0]+" disabled>Yes\n" +
                    "        <input type='radio' name='ETPM1' class='final_artifact' value='No'"+arr_no_etpm[0]+" disabled>No\n" +
                    "        <input type='radio' name='ETPM1' class='final_artifact' value='NA'"+arr_na_etpm[0]+" disabled>N/A\n" +
                    "\n" +
                    "    </div>\n" +
                    "\n" +
                    "    <div>\n" +
                    "        <label  class='control-label ' for='formInput198' style='width:65%;'><font size='4'><b>Provide Chargeback Validation Report</b></font></label>\n" +
                    "        <input type='radio' name='ETPM2' class='Provide' value='Yes' onclick='provide_radio();' "+arr_yes_etpm[1]+" disabled>Yes\n" +
                    "        <input type='radio' name='ETPM2' class='provide' value='No'"+arr_no_etpm[1]+" disabled>No\n" +
                    "        <input type='radio' name='ETPM2' class='provide' value='NA'"+arr_na_etpm[1]+" disabled>N/A\n" +
                    "    </div>\n" +
                    "\n" +
                    "    <div class='form-group ETPM3' "+arr_etpm_show[0]+" id='et_team_provided_date'>\n" +
                    "\n" +
                    "        <label  class='control-label ' for='formInput198'><font color='green' size='4'><b>Provided Date</b></font></label>\n" +
                    "        <input type='text' name ='ETPM3' class='datepicker' id='datepicker1' placeholder='mm/dd/yyyy' value='"+arr_valuedate_etpm[0]+"' readonly>\n" +
                    "\n" +
                    "    </div>\n" +
                    "\n" +
                    "    <div>\n" +
                    "        <label  class='control-label ' for='formInput198' style='width:65%;'><font size='4'><b>Submit Decommission requests:\n" +
                    "            Use ITG/Service Catalog for components / services listed in the Final Artifact</b></font></label>\n" +
                    "        <input type='radio' name='ETPM4' class='submit_decom_req' value='Yes' onclick='submit_decom_req_radio();' "+arr_yes_etpm[3]+" disabled>Yes\n" +
                    "        <input type='radio' name='ETPM4' class='submit_decom_req' value='No' "+arr_no_etpm[3]+" disabled>No\n" +
                    "        <input type='radio' name='ETPM4' class='submit_decom_req' value='NA'"+arr_na_etpm[3]+" disabled>N/A\n" +
                    "    </div>\n" +
                    "\n" +
                    "    <div class='form-group ETPM5' "+arr_etpm_show[1]+" id='et_team_submission_date'>\n" +
                    "\n" +
                    "        <label  class='control-label ' for='formInput198'><font color='green' size='4'><b>Submission Date</b></font></label>\n" +
                    "        <input type='text' name ='ETPM5' class='datepicker' id='datepicker2' placeholder='mm/dd/yyyy' value='"+arr_valuedate_etpm[1]+"' readonly>\n" +
                    "\n" +
                    "    </div>\n" +
                    "\n" +
                    "</div>";
                var app_team_tab="<div class='form-group hideclass' id='app_team_data'>\n" +
                    "\n" +
                    "<div>\n" +
                    "    <h4><font color='red' size='5'>APP TEAM</font></h4>\n" +
                    "\n" +
                    "    <label  class='control-label ' for='formInput198' style='width:65%;'><font  size='4'><b>Final Artifact (Decommission List) Review and Approval</b></font></label>\n" +
                    "    <input type='radio' name='APP_TEAM1' class='decommission_list' value='Yes' "+arr_yes_app_team[0]+" disabled>Yes\n" +
                    "    <input type='radio' name='APP_TEAM1' class='decommission_list' value='No'"+arr_no_app_team[0]+" disabled>No\n" +
                    "    <input type='radio' name='APP_TEAM1' class='decommission_list' value='NA'"+arr_na_app_team[0]+" disabled>N/A\n" +
                    "\n" +
                    "</div>\n" +
                    "\n" +
                    "<div>\n" +
                    "    <label  class='control-label ' for='formInput198' style='width:65%;'><font  size='4'><b>Stop/Remove Jobs/Application Interfaces/SSIS Jobs etc.,\n" +
                    "        to  impacted applications Stopping jobs and interaction with the app.</b></font></label>\n" +
                    "    <input type='radio' name='APP_TEAM2' class='Stop' value='Yes' onclick='stop_radio();'"+arr_yes_app_team[1]+" disabled>Yes\n" +
                    "    <input type='radio' name='APP_TEAM2' class='Stop' value='No'"+arr_no_app_team[1]+" disabled>No\n" +
                    "    <input type='radio' name='APP_TEAM2' class='Stop' value='NA'"+arr_na_app_team[1]+" disabled>N/A\n" +
                    "</div>\n" +
                    "\n" +
                    "\n" +
                    "<div class='form-group APP_TEAM3' "+arr_app_team_show[0]+" id='submission_date1'>\n" +
                    "\n" +
                    "    <label  class='control-label ' for='formInput198'><font color='green' size='4'><b>Submission Date</b></font></label>\n" +
                    "    <input type='text' name ='APP_TEAM3' class='datepicker' id='app_datepicker1' placeholder='mm/dd/yyyy' value='"+arr_valuedate_app_team[0]+"' readonly>\n" +
                    "\n" +
                    "</div>\n" +
                    "\n" +
                    "<div>\n" +
                    "    <label class='control-label ' for='formInput198'  style='width:65%;'><font size='4'><b>(Optional) Impact Analysis of Application Decommission</b></font></label>\n" +
                    "    <input type='radio' name='APP_TEAM4' class='impact_analysis' value='Yes' onclick='impact_analysis_radio();'"+arr_yes_app_team[3]+" disabled>Yes\n" +
                    "    <input type='radio' name='APP_TEAM4' class='impact_analysis' value='No'"+arr_no_app_team[3]+" disabled>No\n" +
                    "    <input type='radio' name='APP_TEAM4' class='impact_analysis' value='NA'"+arr_na_app_team[3]+" disabled>N/A\n" +
                    "</div>\n" +
                    "\n" +
                    "\n" +
                    "\n" +
                    "<div class='form-group APP_TEAM5' "+arr_app_team_show[1]+" id='app_submission_date2'>\n" +
                    "\n" +
                    "    <label  class='control-label ' for='formInput198'><font color='green' size='4'><b>Submission Date</b></font></label>\n" +
                    "    <input type='text' name ='APP_TEAM5' class='datepicker' id='app_datepicker2' placeholder='mm/dd/yyyy' value='"+arr_valuedate_app_team[1]+"' readonly>\n" +
                    "\n" +
                    "</div>\n" +
                    "\n" +
                    "<div>\n" +
                    "    <label class='control-label ' for='formInput198'  style='width:65%;'><font size='4'><b>ServiceNow: Change Request</b></font></label>\n" +
                    "    <input type='radio' name='APP_TEAM6' class='service_now' value='Yes' onclick='service_now_radio();'"+arr_yes_app_team[5]+" disabled>Yes\n" +
                    "    <input type='radio' name='APP_TEAM6' class='service_now' value='No'"+arr_no_app_team[5]+" disabled>No\n" +
                    "    <input type='radio' name='APP_TEAM6' class='service_now' value='NA'"+arr_na_app_team[5]+" disabled>N/A\n" +
                    "</div>\n" +
                    "\n" +
                    "<div class='form-group APP_TEAM7' "+arr_app_team_show[2]+" id='app_submission_date3'>\n" +
                    "\n" +
                    "    <label  class='control-label ' for='formInput198'><font color='green' size='4'><b>Submission Date</b></font></label>\n" +
                    "    <input type='text' name ='APP_TEAM7'class='datepicker' id='app_datepicker3' placeholder='mm/dd/yyyy' value='"+arr_valuedate_app_team[2]+"' readonly>\n" +
                    "\n" +
                    "</div>\n" +
                    "\n" +
                    "<div>\n" +
                    "    <label class='control-label ' for='formInput198'  style='width:65%;'><font size='4'><b>Secure:   Remove Application</b></font></label>\n" +
                    "    <input type='radio' name='APP_TEAM8' class='secure' value='Yes' onclick='secure_radio();'"+arr_yes_app_team[7]+" disabled>Yes\n" +
                    "    <input type='radio' name='APP_TEAM8' class='secure' value='No'"+arr_no_app_team[7]+" disabled>No\n" +
                    "    <input type='radio' name='APP_TEAM8' class='secure' value='NA'"+arr_na_app_team[7]+" disabled>N/A\n" +
                    "</div>\n" +
                    "\n" +
                    "<div class='form-group APP_TEAM9' "+arr_app_team_show[3]+" id='app_submission_date4'>\n" +
                    "\n" +
                    "    <label  class='control-label APP_TEAM9' for='formInput198'><font color='green' size='4'><b>Submission Date</b></font></label>\n" +
                    "    <input type='text' name ='APP_TEAM9' class='datepicker' id='app_datepicker4' placeholder='mm/dd/yyyy' value='"+arr_valuedate_app_team[3]+"' readonly>\n" +
                    "\n" +
                    "</div>\n" +
                    "\n" +
                    "<div>\n" +
                    "    <label class='control-label ' for='formInput198'  style='width:65%;'><font  size='4'><b>Global Groups:  Remove</b></font></label>\n" +
                    "    <input type='radio' name='APP_TEAM10' class='global' value='Yes'"+arr_yes_app_team[9]+" disabled>Yes\n" +
                    "    <input type='radio' name='APP_TEAM10' class='global' value='No'"+arr_no_app_team[9]+" disabled>No\n" +
                    "    <input type='radio' name='APP_TEAM10' class='global' value='NA'"+arr_na_app_team[9]+" disabled>N/A\n" +
                    "</div>\n" +
                    "\n" +
                    "<div>\n" +
                    "<label class='control-label ' for='formInput198'  style='width:65%;'><font  size='4'><b>Master Unique Identifier (MUI):  Remove</b></font></label>\n" +
                    "<input type='radio' name='APP_TEAM11' class='mui' value='Yes'"+arr_yes_app_team[10]+" disabled>Yes\n" +
                    "<input type='radio' name='APP_TEAM11' class='mui' value='No'"+arr_no_app_team[10]+" disabled>No\n" +
                    "<input type='radio' name='APP_TEAM11' class='mui' value='NA'"+arr_na_app_team[10]+" disabled>N/A\n" +
                    "</div>\n" +
                    "</div>\n";
                var app_slo_tab="<div class='form-group hideclass' id='app_slo_data'>\n" +
                    "\n" +
                    "<div>\n" +
                    "    <h4><font color='red' size='5'>APP SLO</font></h4>\n" +
                    "\n" +
                    "    <label  class='control-label ' for='formInput198' style='width:65%;'><font  size='4'><b>Submit request to change the apps status</b></font></label>\n" +
                    "    <input type='radio' name='APP_SLO1' class='submit_request' value='Yes' onclick='submit_request_radio();'"+arr_yes_app_slo[0]+" disabled>Yes\n" +
                    "    <input type='radio' name='APP_SLO1' class='submit_request' value='No'"+arr_no_app_slo[0]+" disabled>No\n" +
                    "    <input type='radio' name='APP_SLO1' class='submit_request' value='NA'"+arr_na_app_slo[0]+" disabled>N/A\n" +
                    "\n" +
                    "</div>\n" +
                    "\n" +
                    "<div class='form-group APP_SLO2' "+arr_app_slo_show[0]+" id='app_slo_submission_date1'>\n" +
                    "\n" +
                    "    <label  class='control-label ' for='formInput198'><font color='green' size='4'><b>Submission Date</b></font></label>\n" +
                    "    <input type='text' name ='APP_SLO2' class='datepicker' id='app_slo_datepicker1' placeholder='mm/dd/yyyy' value='"+arr_valuedate_app_slo[0]+"' readonly>\n" +
                    "\n" +
                    "</div>\n" +
                    "<div>\n" +
                    "    <label  class='control-label ' for='formInput198' style='width:65%;'><font size='4'><b>Request submitted to Retire the Service or Service is Retired</b></font></label>\n" +
                    "    <input type='radio' name='APP_SLO3' class='retired' value='Yes' onclick='retired_radio();' "+arr_yes_app_slo[2]+" disabled>Yes\n" +
                    "    <input type='radio' name='APP_SLO3' class='retired' value='No' "+arr_no_app_slo[2]+" disabled>No\n" +
                    "    <input type='radio' name='APP_SLO3' class='retired' value='NA' "+arr_na_app_slo[2]+" disabled>N/A\n" +
                    "</div>\n" +
                    "<div class='form-group APP_SLO4' "+arr_app_slo_show[1]+" id='app_slo_submission_date2'>\n" +
                    "    <label  class='control-label' for='formInput198'><font color='green' size='4'><b>Submission Date</b></font></label>\n" +
                    "    <input type='text' name ='APP_SLO4' class='datepicker' id='app_slo_datepicker2' placeholder='mm/dd/yyyy' value='"+arr_valuedate_app_slo[1]+"' readonly>\n" +
                    "</div>\n" +
                    "</div>\n";
                $('#inputFields').append(camp_tab);
                $('#inputFields').append(etpm_tab);
                $('#inputFields').append(app_team_tab);
                $('#inputFields').append(app_slo_tab);


            },



        });
    });
</script>
</body>
</html>
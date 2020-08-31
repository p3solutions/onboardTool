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
<script type="application/javascript">
    function ExportPdf() {
        $("#loginForm").attr('action', 'Intake_Review_Data');
        $("#loginForm").attr('target', '_blank');
        $("#data_submit").val("true");
        $("#loginForm").submit();
    }

    $(document).ready(function () {
        $.ajax({
            url: "Intake_Review_Data",
            type: 'post',
            dataType: 'json',
            success: function (data) {

                var userlistdiv = $('#table1')
                console.log("Request:", data);
                userlistdiv.empty();
                var Application = '';
                var Retention = '';
                var Data_Management = '';
                var Requirements = '';
                var Technical_Application = '';
                var Technical_Retention = '';
                var Technical_Classification = '';
                var screen_requirements = '';
                var archive_requirements = '';

                $.each(data, function (key, value) {
                    var array = value.split("/");

                    var category = array[1];
                    if (category == 'P1') {
                        Application = Application + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P2') {
                        Retention = Retention + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P3') {
                        Data_Management = Data_Management + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P4') {
                        Requirements = Requirements + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P5') {
                        Technical_Application = Technical_Application + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P6') {
                        Technical_Retention = Technical_Retention + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P7') {
                        Technical_Classification = Technical_Classification + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }

                    if (category == 'P8') {
                        screen_requirements = screen_requirements + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P9') {
                        archive_requirements = archive_requirements + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                });
                $('#Intake_Business_Application').append(createTable(Application));
                $('#Intake_Business_Legal').append(createTable(Retention));
                $('#Intake_Business_Archive').append(createTable(Data_Management));
                $('#System_Requirements').append(createTable(Requirements));

                $('#Intake_Technical_Application').append(createTable(Technical_Application));
                $('#Intake_Technical_Legal').append(createTable(Technical_Retention));
                $('#Intake_Technical_Privacy').append(createTable(Technical_Classification));

                $('#Screen_Requirements').append(createTable(screen_requirements));
                $('#Archive_Requirements').append(createTable(archive_requirements));
            },
            error: function (error) {
                alert('error');
            }
        });
    });


    function createTable(rows) {
        return '<table width=\'0\' border=\'0\' align=\'left\'\n' +
            'cellpadding=\'0\'\n' +
            'cellspacing=\'0\'>\n' +
            '\n' +
            '<tbody> ' + rows + '  </tbody>\n' +
            '</table>';
    }


    $(document).ready(function () {
        var value;
        $('#button_id').click(function () {
            $('#myModal').modal('show');
            $.ajax({
                url: 'List_Users',
                type: 'post',
                dataType: 'json',
                success: function (response) {
                    var userlistdiv = $('#user_list_div_id_name')
                    console.log("Request:", response);
                    userlistdiv.empty();
                    var usersList = '<div class="checkbox"> <ul id="sortable" style="cursor: pointer">';
                    console.log('1->', usersList)
                    $.each(response, function (key, value) {
                        //userlistdiv.append('<input  type="checkbox"   value="' + key + '">' + value)
                        usersList += '<li><input type="checkbox" value="' + key + '" >' + value + '</li>';
                    });
                    usersList += '</ul>' + '</div>';
                    console.log('->', usersList)
                    userlistdiv.append(usersList)
                    userlistdiv.append('')
                    $("#sortable").sortable({

                    });
                    $("#sortable").sortable("disable");
                }
            });


        });
    });
    $(document).ready(function () {

        $('#email_id').click(function () {
            var selectedEmail = [];
                $('#user_list_div_id_name input:checked').each(function () {
                    selectedEmail.push($(this).attr('value'));
                });
            console.log("hm", selectedEmail);
            if (selectedEmail.length == 0) {
                BootstrapDialog.show({
                    title: 'INFORMATION',
                    message: 'Please Select any User',
                    buttons: [{
                        id: 'btn-ok',
                        icon: 'glyphicon glyphicon-check',
                        label: 'OK',
                        cssClass: 'btn-primary',
                        data: {
                            js: 'btn-confirm',
                            'user-id': '3'
                        },
                        autospin: false,
                        action: function (dialogRef) {
                            dialogRef.close();
                        }
                    }]


                });
                return false;
            }
            else {
                BootstrapDialog.alert(selectedEmail.length + " User selected");
            }

            console.log("emails", selectedEmail);
            $.ajax({
                url: 'Intake_Review_Email',
                type: 'post',
                contentType: 'application/json; charset=utf-8',
                headers: {"signorder": $('#signorder').is(':checked')},
                dataType: 'json',
                data: JSON.stringify(selectedEmail),
                success: function (data) {

                }
            });


        });
    });
    $(document).ready(function () {

        $('#signorder').click(function () {
          var flag = $('#signorder').is(':checked');
            if (flag)
            {
                $("#sortable").sortable("enable");
            }
            else {
                $("#sortable").sortable("disable");

            }
        })
    });
   /* function disableDraggable(elements){
        for (var i = 0; i < elements.length; i++) {
            $("#" + elements[i]).addClass("disable-sort");
            $("#" + elements[i]).fadeTo("fast", 0.5);
        }
    }*/
    $(document).ready(function () {
        $('#search_bar').keyup(function () {
            filter(this);
        });
    });

    function filter(element) {
        var value = $(element).val();
        $("#sortable > li").each(function () {
            if ($(this).text().indexOf(value) > -1) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }

</script>


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

                <!-- ========== LEFT SIDEBAR ========== -->
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

                                <%--   <li class="nav-header">
                                       <a href="AppEmphasize_EditProject.jsp"><span class="">Plan and pirority</span></a>
                                   </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-archive"></i> <span>Plan and pirority</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="AppEmphasize_EditProject.jsp" class="active-menu"> <span>Project Information</span></a></li>
                                        <li><a href="AppEmphasize_Application.jsp" class="active-menu"> <span>Application Information</span></a></li>
                                        <li><a href="AppEmphasize_CostCalculation.jsp" > <span>Application Complexity</span></a></li>
                                        <li><a href="AppEmphasize_PrioritizedApplications.jsp"> <span>Prioritized Applications</span></a></li>
                                        <li><a href="AppEmphasize_Preview.jsp"> <span>Review Page</span></a></li>
                                    </ul>
                                </li>
                                <%--<li class="has-children">
                                    <a href="AppEmphasize_EditProject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                        <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a></li>
                                    </ul>
                                </li>--%>


                                <%--<li class="has-children">
                                    <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity </span></a></li>
                                    </ul>
                                </li>--%>

                                <%--<li>
                                    <a href="AppEmphasize_PrioritizedApplications.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                                </li>--%>

                                <%-- <li class="nav-header">
                                     <a href='Applications.jsp'><span class="">Intake Module</span></a>
                                 </li>

                                 <li class="has-children">
                                     <a href="Applications.jsp"><i class="fa fa-magic"></i> <span>Business</span> <i class="fa fa-angle-right arrow"></i></a>
                                     <ul class="child-nav">
                                         <li><a href="Applications.jsp"> <span>Application Information</span></a></li>
                                         <li><a href="Applications.jsp"> <span>Legacy Retention Information</span></a></li>
                                         <li><a href="Applications.jsp"> <span>Archive Data Management</span></a></li>
                                         <li><a href="Applications.jsp"> <span>System Requirements</span></a></li>
                                     </ul>
                                 </li>

                                 <li class="has-children">
                                     <a href="Applications.jsp"><i class="fa fa-bars"></i> <span>Technical</span> <i class="fa fa-angle-right arrow"></i></a>
                                     <ul class="child-nav">
                                         <li><a href="Applications.jsp"> <span>Application Data Information</span></a></li>
                                         <li><a href="Applications.jsp"> <span>Infrastructure & Environment Inforamation</span></a></li>
                                         <li><a href="Applications.jsp"> <span>Technical Information</span></a></li>
                                     </ul>
                                 </li>
                                 <li class="has-children">
                                     <a href="Applications.jsp"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                     <ul class="child-nav">
                                         <li><a href="Applications.jsp"> <span>Screen/Report Requirements</span></a></li>
                                         <li><a href="Applications.jsp"> <span>Archive Requirements</span></a></li>
                                     </ul>
                                 </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-file-text"></i> <span>Intake Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Applications.jsp" class="active-menu"> <span>Application Details</span></a></li>
                                        <li><a href="Intake_Business.jsp" > <span>Business Details</span></a></li>
                                        <li><a href="Intake_TechnicalDetails.jsp"> <span>Technical Details</span></a></li>
                                        <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a></li>
                                        <li><a href="Intake_ReviewPage.jsp"> <span>Review Page</span></a></li>
                                    </ul>
                                </li>
                                <%--<li class="nav-header">
                                    <a href='Archive_Execution.jsp'><span class="">Archive Execution Module</span></a>
                                </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Archive_Execution.jsp" class="active-menu"> <span>Archive Execution</span></a></li>
                                        <li><a href="archivesummary.jsp" > <span>Archive summary</span></a></li>

                                    </ul>
                                </li>
                                <%--   <li class="nav-header">
                                       <a href='RoleUIDashboard.jsp'><span class="">Report Module</span></a>
                                   </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-paint-brush"></i> <span>Report Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="RoleUIDashboard.jsp" class="active-menu"> <span>Reports Dashboard</span></a></li>
                                        <li><a href="RoleDashboard.jsp" class="active-menu"> <span>Role Dashboard</span></a></li>
                                        <li><a href="ProjectDashboard.jsp" > <span>Project Dashboard</span></a></li>
                                        <li><a href="ApplicationDashboard.jsp"> <span>Application Dashboard</span></a></li>
                                    </ul>
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


                                                                        <span><h2
                                                                                style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Bussiness Details</h2></span>
                                                                        <div id="Intake_Business_Application">
                                                                            <h3>Intake Business Application
                                                                                Information </h3>
                                                                        </div>
                                                                        <div id="Intake_Business_Legal">
                                                                            <h3>Intake Business Legal Retention</h3>
                                                                        </div>
                                                                        <div id="Intake_Business_Archive">
                                                                            <h3>Intake Business Archive Data
                                                                                Management</h3>
                                                                        </div>
                                                                        <div id="System_Requirements">
                                                                            <h3>SystemRequirements</h3>
                                                                        </div>

                                                                        <%--<table width='0' border='0' align='left'--%>


                                            </div>


                                            </td>

                                            </tr>
                                            <tr align='left'>
                                                <td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>


                                                                        <span><h2
                                                                                style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Technical Details</h2></span>
                                                    <div id="Intake_Technical_Application">
                                                        <h3>Application
                                                            Information </h3>
                                                    </div>
                                                    <div id="Intake_Technical_Legal">
                                                        <h3>Legacy Retention Information</h3>
                                                    </div>
                                                    <div id="Intake_Technical_Privacy">
                                                        <h3>Intake Documentations</h3>
                                                    </div>


                                                    <%--<table width='0' border='0' align='left'--%>


                                        </div>


                                        </td>

                                        </tr>
                                        <tr align='left'>
                                            <td style='color:#404041;font-size:12px;line-height:16px;padding:10px 16px 20px 18px'>


                                                                        <span><h2
                                                                                style='color: #848484; font-family: arial,sans-serif; font-size: 150%;'>Archival Reqiurements Details</h2></span>
                                                <%--<div id="Screen_Requirements">
                                                    <h3>Screen Requirements </h3>
                                                </div>--%>
                                                <div id="Archive_Requirements">
                                                    <h3>Archive Requirements</h3>
                                                </div>
                                    </div>


                                    </td>

                                    </tr>

                                    </tbody>


                                    </table>

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

</body>
</html>
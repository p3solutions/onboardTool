<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Decomm Manager - Archive Executive Sample</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <a href="https://icons8.com/icon/103369/add-row"></a>
    <a href="https://icons8.com/icon/14320/delete-row"></a>

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">

    <link rel="stylesheet" type="text/css" href="css/date-picker/jquery.timepicker.css"/>
    <link rel="stylesheet" type="text/css" href="css/date-picker/bootstrap-datepicker.css"/>
    <script type="text/javascript" src="js/archivesummary/jqueryprogressbar.js"></script>
    <link rel="stylesheet" type="text/css" href="old/css/loading-bar.css"/>
    <script type="text/javascript" src="js/archivesummary/loading-bar.js"></script>

    <script type="text/javascript" src="js/archivesummary/main.js"></script>
    <script src="https://docraptor.com/docraptor-1.0.0.js"></script>

    <script src="js/archivesummary/treeTable.js"></script>

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/icheck/skins/line/red.css">
    <link rel="stylesheet" href="css/icheck/skins/line/green.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" type="text/css" href="css/date-picker/jquery.timepicker.css"/>
    <link rel="stylesheet" type="text/css" href="css/date-picker/bootstrap-datepicker.css"/>

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script type="text/javascript" src="js_in_pages/archive_exec.js"></script>
    <script type="text/javascript" src="js_in_pages/tree.js"></script>
    <link rel="stylesheet" href="js_in_pages/archive_exec.css" type="text/css"/>
    <link rel="stylesheet" href="old/css0/progressbar.css" type="text/css"/>
    <script src="js/archivesummary/jstree.min.js"></script>


    <!-- Resource Assigned DropDown Link Ignite UI Required Combined CSS Files -->
    <link href="http://cdn-na.infragistics.com/igniteui/2019.1/latest/css/themes/infragistics/infragistics.theme.css" rel="stylesheet" />
    <link href="http://cdn-na.infragistics.com/igniteui/2019.1/latest/css/structure/infragistics.css" rel="stylesheet" />
    <script src="http://ajax.aspnetcdn.com/ajax/modernizr/modernizr-2.8.3.js"></script>
    <script src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
    <script src="http://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
    <!-- Resource Assigned DropDown Link Ignite UI Required Combined CSS Files -->

    <style>
        /* The Modal (background) */
        .modal
        {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0, 0, 0); /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content_add_popup
        {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            height: 55%;
        }

        .modal-content1
        {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            height: 46%;
        }

        .modal-content2
        {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            height: 47%;
        }

        /* The Close Button */
        .close
        {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus
        {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

        /*popup input text field taskname style*/
        #taskname
        {
            width: 300px;
            height: 50px;
            border: 2px ridge black;
            border-radius: 4px;
        }

        #modifytaskname
        {
            width: 300px;
            height: 50px;
            border: 2px ridge black;
            border-radius: 4px;
        }

        .node
        { /* Change width and height */
            width: 1em;
            height: 1em;
        }

        .button
        {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .button2
        {
            background-color: rgb(52, 152, 219);
            border-radius: 12px;
        }

        /* Blue */
        .mem_ass
        {
            height: 30px;
        }
        .bootstrap-dialog-message
        {
            width: 250px;
            border: 3px;
            padding: 0px;
            margin: auto;
        }

        /*tbody tr {
            display : none;
        }*/
        .parent {
            display : table-row;
        }
        .open {
            display : table-row;
        }

    </style>

</head>

<body class="top-navbar-fixed" <%--onload="UserList();"--%>>
<%
    HttpSession details = request.getSession();
    String prjname = (String) details.getAttribute("nameofproject");
%>




<form class="form-signin" name="loginForm" method="post" action="archive_exec">
    <%


        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.

        if (session.getAttribute("username") == null) {
            response.sendRedirect("Login.jsp");
        }
    %>


    <div class="main-wrapper">

        <!-- ========== TOP NAVBAR ========== -->
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

                    <a class="navbar-brand" href="Project_List.jsp" id="project_title"></a>
                    <input type="text" id="project_name" name="project_name" value=""
                           style="display:none;">


                    <!-- /.navbar-header -->

                    <div class="collapse navbar-collapse" id="navbar-collapse-1">

                        <!-- /.nav navbar-nav -->
                        <ul class="nav navbar-nav navbar-right">

                            <li><a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a>
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
                                        <li><a href="AppEmphasize_EditProject.jsp" > <span>Project Information</span></a></li>
                                        <li><a href="AppEmphasize_Application.jsp"> <span>Application Information</span></a></li>
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
                                        <li><a href="Applications.jsp" > <span>Archive Intake</span></a></li>
                                        <li><a href="Decomm_Intake_Applications.jsp" > <span>Decomm Intake</span></a></li>
                                        <%--<li><a href="Intake_TechnicalDetails.jsp"> <span>Technical Details</span></a></li>
                                        <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a></li>
                                        <li><a href="Intake_ReviewPage.jsp"> <span>Review Page</span></a></li>--%>
                                    </ul>
                                </li>
                                <%--<li class="nav-header">
                                    <a href='Archive_Execution.jsp'><span class="">Archive Execution Module</span></a>
                                </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav" id="myDIV">
                                        <li class="1btn"><a href="Archive_Execution.jsp" > <span class="activ-pro">Archive Execution</span></a></li>
                                        <li><a href="archivesummary.jsp" > <span>Archive summary</span></a></li>

                                    </ul>
                                </li>
                                <%--   <li class="nav-heAppEmphasize_EditProjectader">
                                       <a href='RoleUIDashboard.jsp'><span class="">Report Module</span></a>
                                   </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-paint-brush"></i> <span>Report Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="RoleUIDashboard.jsp" > <span>Reports Dashboard</span></a></li>
                                        <li><a href="RoleDashboard.jsp" > <span>Role Dashboard</span></a></li>
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

                <!-- Projects List Start -->

                <div class="main-page">

                    <section>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="container-fluid">
                                    <div class="row">

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <center><label>Initiate</label></center>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-success progress-bar-striped"
                                                         role="progressbar" id="prog_bar" style="" aria-valuenow=""
                                                         aria-valuemin="0" aria-valuemax="100"><span
                                                            style="color:black;"></span></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <center><label>Plan</label></center>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-success progress-bar-striped"
                                                         role="progressbar" id="prog_bar1" style="" aria-valuenow=""
                                                         aria-valuemin="0" aria-valuemax="100"><span
                                                            style="color:black;"></span></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <center><label>Execute</label></center>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-success progress-bar-striped"
                                                         role="progressbar" id="prog_bar2" style="" aria-valuenow=""
                                                         aria-valuemin="0" aria-valuemax="100"><span
                                                            style="color:black;"></span></div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <center><label>Closure</label></center>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-success progress-bar-stripedss-bar"
                                                         role="progressbar" id="prog_bar3" style="" aria-valuenow=""
                                                         aria-valuemin="0" aria-valuemax="100"><span
                                                            style="color:black;"></span></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <script>
                                        $(function () {
                                            $.contextMenu({
                                                selector: '.context-menu-one',
                                                items: $.contextMenu.fromMenu($('#html5menu'))
                                            });
                                        });
                                    </script>

                                    <div class="table-responsive">

                                        <table class="table table-bordered" style="align:center" id="table1">
                                            <thead style="background-color: #3498db;">
                                            <tr>
                                                <th style="width:20%;color: white;">Tasks</th>
                                                <th style="color: white;">Resource Assigned</th>
                                                <th style="color: white;">Plan start date</th>
                                                <th style="color: white;">Plan End date</th>
                                                <th style="color: white;">Actual start date</th>
                                                <th style="color: white;">Actual End date</th>
                                                <th style="color: white;">Planned Hours</th>
                                                <th style="color: white;">Actual Hours</th>
                                                <th style="color: white;">Progress %</th>
                                                <th style="color: white;">Status</th>
                                                <th style="color: white;">Comments</th>
                                                <th style="color: white;">Action</th>
                                            </tr>
                                            </thead>

                                            <tbody id="table_data">
                                            <%--append the value in ajax call--%>
                                            <%--<input id='checkboxSelectCombo' placeholder="Enter the User">--%>


                                            </tbody>

                                        </table>
                                    </div>
                                    <input type="hidden" id="authority_info" value="" hidden>
                                    <script>
                                        if (document.getElementById('authority_info').value == "R")
                                            checkk();
                                    </script>
                                    <div id="sample">
                                    </div>
                                    <div id="archive_execution_button">

                                        <input type="button" name="subbtn" class="btn btn-primary" value="Submit"
                                               onclick="update()">
                                    </div>
                                </div>

                            </div>
                        </div>
                        <input type="hidden" name="projectname" id="projectname" value="<%=prjname%>">

</form>
</div>
<!-- /.row -->
</section>
<!-- /.section -->

</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->
<!-- ADD popup -->
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-dialog" style="width:2000px">
        <div class="modal-content_add_popup">
            <%--<span class="close" style="color:white;">&times;</span>--%>
            <div class="modal-header" style="background-color:rgb(52, 152, 219);">
                <h4 style="color:white;">Create Task</h4>
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <b style="font-size:16px;">Task Name:</b>
                        <input type="text" id="taskname" name="firstname" autocomplete="off" required>
                    </tr>
                    <tr>
                        <label class="container">
                            <input type="radio" class="node" id="node1" name="radio" checked="checked"
                                   required="required"><b>Similar Node</b></input>
                        </label>
                    </tr>
                    <tr>
                        <label class="container">
                            <input type="radio" class="node" id="node2" name="radio" required="required"><b>Child
                            Node</b></input>
                            <span class="checkmark"></span>
                        </label>
                    </tr>
                </table>
                <input type="hidden" id="sequence"/>
            </div>
            <div class="modal-footer">
                <button class="button button2"
                        onclick="createnode(document.getElementById('sequence').value,document.getElementById('taskname').value,'<%=prjname%>',$('#node2').prop('checked'));">
                    Create Node
                </button>
                <button class="button button2" id="cancelbtn">cancel</button>
            </div>
        </div>
    </div>

</div>

<!-- Delete pop-up -->
<div id="myModal1" class="modal">

    <!-- Modal content -->
    <div class="modal-dialog" style="width:2000px">
        <div class="modal-content1">
            <%--<span class="close" style="color:white;">&times;</span>--%>
            <div class="modal-header" style="background-color:rgb(52, 152, 219);">
                <h4 style="color:white;">Delete Task</h4>
            </div>
            <div class="modal-body">
                <p style="font-size:18px;">Are you sure, you want to delete this <span id="taskdelete"
                                                                                       style="font-size:24px;"></span>
                <p style="font-size:18px;"> task and all relevant task permenantly?</p>
                <input type="hidden" id="sequence1"/>
            </div>
            <div class="modal-footer">
                <button class="button button2"
                        onclick="deletenode(document.getElementById('sequence1').value,'<%=prjname%>');"><u>Y</u>es
                </button>
                <button class="button button2" id="cancelbtn1"><u>N</u>o</button>
            </div>
        </div>
    </div>

</div>
<!--Modify pop-up -->
<div id="myModal2" class="modal">

    <!-- Modal content -->
    <div class="modal-dialog" style="width:2000px">
        <div class="modal-content2">
            <%--<span class="close" style="color:white;">&times;</span>--%>
            <div class="modal-header" style="background-color:rgb(52, 152, 219);">
                <h4 style="color:white;">Edit Task</h4>l
            </div>
            <div class="modal-body">
                <table>
                    <tr>
                        <b style="font-size:16px;">Task Name:</b>
                        <input type="text" id="modifytaskname" name="firstname" autocomplete="off" required>
                    </tr>
                    <tr>
                    </tr>
                </table>
                <input type="hidden" id="sequence2"/>
            </div>
            <div class="modal-footer">
                <button class="button button2"
                        onclick="editnode(document.getElementById('sequence2').value,'<%=prjname%>',document.getElementById('modifytaskname').value);">
                    Apply
                </button>
                <button class="button button2" id="cancelbtn2">cancel</button>
            </div>
        </div>
    </div>
</div>
<datalist id="userlist">
</datalist>

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
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all"/>
<script src="js/amcharts/themes/light.js"></script>
<script src="js/toastr/toastr.min.js"></script>
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== PAGE JS FILES ========== -->
<script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<!-- ========== THEME JS ========== -->
<script src="js/jquery.doubleScroll.js"></script>

<script>
    $(document).ready(function () {
        $('.table-responsive').doubleScroll();
    });
</script>

<script>
    var username_dropdown="";
    $(document).ready(function () {
        var projectname=$('#projectname').val();
        console.log('projectname'+projectname);
        $.ajax({
            url: 'Archive_User_List',
            type: 'post',
            data: {projectname:projectname},
            dataType: 'json',
            success: function (data) {
                console.log('json drop down data-----',data);
                var str="";
                $.each(data, function (key, value) {
                    str+="{ Name: '"+value+"' },\n";
                });
                username_dropdown=str.substring(0,str.length-2);
                console.log("username_dropdown=----->",username_dropdown);
            },
            /*error: function (e) {
                //salert("err");
                console.log("ERROR : ", e);
            }*/
        });
    });
    $(document).ready(function () {
        $.ajax({
            url: 'Login_Time_Archive_Exceution',
            type: 'post',
            success: function (data) {
                console.log("data------>authority info",data);
                $('#authority_info').val(data);
            }
        });
    });

    $(document).ready(function () {
        /*var title = $('#sitetitle1').html().split('-');
        var projectName = title[1];*/
        $.ajax({
            url: 'ProgresssbarRetrieveData',
            type: 'post',
            /*data: {projectName: projectName},*/
            dataType: 'json',
            success: function (data) {
                var s = "Ideation and Initiate";
                console.log();
                var Initiate=0;
                var Plan=0;
                var Execute=0;
                var Closure=0;
                $.each(data, function (key, value) {
                    if (key == "Ideation and Initiate") {
                        $('#prog_bar').attr("aria-valuenow", value);
                        $('#prog_bar').attr("style", "width:" + value + "%");
                        $('#prog_bar span:first').html(value + "%");
                        Initiate=parseInt(value);
                    } else if (key == "Plan") {
                        $('#prog_bar1').attr("aria-valuenow", value);
                        $('#prog_bar1').attr("style", "width:" + value + "%");
                        $('#prog_bar1 span:first').html(value + "%");
                        Plan=parseInt(value);
                    } else if (key == "Execute") {
                        $('#prog_bar2').attr("aria-valuenow", value);
                        $('#prog_bar2').attr("style", "width:" + value + "%");
                        $('#prog_bar2 span:first').html(value + "%");
                        Execute=parseInt(value);
                    } else if (key == "Closure") {
                        $('#prog_bar3').attr("aria-valuenow", value);
                        $('#prog_bar3').attr("style", "width:" + value + "%");
                        $('#prog_bar3 span:first').html(value + "%");
                        Closure=parseInt(value);
                    }
                });
                Progressbar_ColorDesign(Initiate,Plan,Execute,Closure);

            }
        });
    });

    $(document).ready(function () {
        /* var title = $('#sitetitle1').html().split('-');
         var projectName = title[1];*/
        /* console.log("projectname :",projectName.length);*/
        $.ajax({
            url: 'Table_Data_Retrive',
            type: 'post',
            /*  data: {projectName: projectName},*/
            dataType: 'json',
            success: function (data) {
                console.log("data", data);
                var i;
                for(i=0;i<data.length-2;i++)
                {
                    var title = $('#project_title');
                    title.html("Onboarding Tool-"+data[data.length-2].projectname);
                    var tboady_id=$('#table_data');
                    var planstartdate="<td id='basicExample'><input type='text' class='in date start'\n" +
                        "id='pln_srt_date"+i+"'" +
                        "name='pln_srt_date"+i+"'" +
                        "value='"+data[i].pln_srt_date+"'" +
                        "onClick=\"check_previous("+data[i].seq_num+","+data[i].level+",document.getElementById('level"+(i-1)+"').value,"+data[data.length-2].IdeationandInitiate+","+data[data.length-2].Plan+","+data[data.length-2].Execute+","+data[data.length-2].Closure+",1);\" style='width: 90px'/>" +
                        "</td>";
                    var planenddate="<td id='basicExample'><input type='text' class='in date start'\n" +
                        "id='pln_end_date"+i+"'\n" +
                        "name='pln_end_date"+i+"'\n" +
                        "value='"+data[i].pln_end_date+"'\n" +
                        "onClick=\"check_previous('"+data[i].seq_num+"','"+data[i].level+"',document.getElementById('level"+(i-1)+"').value,'"+data[data.length-2].IdeationandInitiate+"','"+data[data.length-2].Plan+"','"+data[data.length-2].Execute+"','"+data[data.length-2].Closure+"',2);\" style='width: 90px'/>\n" +
                        "</td>\n";
                    var actualstartdate="<td id='basicExample'><input type='text' class='in date start'\n" +
                        "id='act_srt_date"+i+"'\n" +
                        "name='act_srt_date"+i+"'\n" +
                        "value='"+data[i].act_srt_date+"'\n" +
                        "onClick=\"check_previous('"+data[i].seq_num+"','"+data[i].level+"',document.getElementById('level"+(i-1)+"').value,'"+data[data.length-2].IdeationandInitiate+"','"+data[data.length-2].Plan+"','"+data[data.length-2].Execute+"','"+data[data.length-2].Closure+"',3);\" style='width: 90px'/>\n" +
                        "</td>\n";
                    var actualenddate="<td id='basicExample'><input type='text' class='in date start'\n" +
                        "id='act_end_date"+i+"'\n" +
                        "name='act_end_date"+i+"'\n" +
                        "value='"+data[i].act_end_date+"'\n" +
                        "onClick=\"check_previous('"+data[i].seq_num+"','"+data[i].level+"',document.getElementById('level"+(i-1)+"').value,'"+data[data.length-2].IdeationandInitiate+"','"+data[data.length-2].Plan+"','"+data[data.length-2].Execute+"','"+data[data.length-2].Closure+"',4);\" style='width: 90px'/>\n" +
                        "</td>";
                    var planhours="<td id='basicExample'><input type='text' class='in date start'\n" +
                        "id='phours"+i+"' name='phrs"+i+"'\n" +
                        "value='"+data[i].planned_hrs+"'\n" +
                        "onclick=\"getID('"+data[i].level+"',document.getElementById('pln_srt_date"+i+"').value,document.getElementById('pln_end_date"+i+"').value,document.getElementById('act_srt_date"+i+"').value,document.getElementById('status"+i+"'),document.getElementById('phours"+i+"'),document.getElementById('hours"+i+"'),document.getElementById('progressbar"+i+"'),document.getElementById('act_end_date"+i+"').value);\"/>\n" +
                        "</td>\n";
                    var actualhours="<td id='basicExample'><input type='text' class='in date start'\n" +
                        "id='hours"+i+"' name='hrs"+i+"'\n" +
                        "value='"+data[i].hours+"'\n" +
                        "onclick=\"call_fun(document.getElementById('mem_ass"+i+"').value,document.getElementById('name"+i+"').value,document.getElementById('seqnum"+i+"').value,document.getElementById('pln_srt_date"+i+"').value,document.getElementById('pln_end_date"+i+"').value,document.getElementById('act_srt_date"+i+"').value,document.getElementById('phours"+i+"').value,document.getElementById('hours"+i+"').value,document.getElementById('act_end_date"+i+"').value,'"+data[data.length-2].IdeationandInitiate+"','"+data[data.length-2].Plan+"','"+data[data.length-2].Execute+"','"+data[data.length-2].Closure+"','"+data[data.length-2].projectname+"');\"/>\n" +
                        "</td>";
                    var memberassigned="<td><input list='userlist' class='in mem_ass' id='mem_ass"+i+"'" +
                        "placeholder='enter' name='mem_ass'" +
                        "value='"+data[i].mem_ass+"'' style='text-align:center;'/>\n" +
                        "</td>";
                    $.each(data[data.length-1], function (key, value) {
                        if (value==i)
                        {

                            planstartdate="<td id='basicExample'><input type='text' class='in date start'\n" +
                                "id='pln_srt_date"+i+"'" +
                                "name='pln_srt_date"+i+"'" +
                                "value='"+data[i].pln_srt_date+"'" +
                                "style='width: 90px' readonly/>" +
                                "</td>";
                            planenddate="<td id='basicExample'><input type='text' class='in date start'\n" +
                                "id='pln_end_date"+i+"'\n" +
                                "name='pln_end_date"+i+"'\n" +
                                "value='"+data[i].pln_end_date+"'\n" +
                                "style='width: 90px' readonly/>\n" +
                                "</td>\n";
                            actualstartdate="<td id='basicExample'><input type='text' class='in date start'\n" +
                                "id='act_srt_date"+i+"'\n" +
                                "name='act_srt_date"+i+"'\n" +
                                "value='"+data[i].act_srt_date+"'\n" +
                                "style='width: 90px' readonly/>\n" +
                                "</td>\n";
                            actualenddate="<td id='basicExample'><input type='text' class='in date start'\n" +
                                "id='act_end_date"+i+"'\n" +
                                "name='act_end_date"+i+"'\n" +
                                "value='"+data[i].act_end_date+"'\n" +
                                "style='width: 90px' readonly/>\n" +
                                "</td>";
                            planhours="<td id='basicExample'><input type='text' class='in date start'\n" +
                                "id='phours"+i+"' name='phrs"+i+"'\n" +
                                "value='"+data[i].planned_hrs+"'\n" +
                                "readonly/>\n" +
                                "</td>\n";
                            actualhours="<td id='basicExample'><input type='text' class='in date start'\n" +
                                "id='hours"+i+"' name='hrs"+i+"'\n" +
                                "value='"+data[i].hours+"'\n" +
                                "readonly/>\n" +
                                "</td>";
                            memberassigned="<td><input list='userlist' class='in mem_ass' id='mem_ass"+i+"'" +
                                "placeholder='enter' name='mem_ass'" +
                                "value='"+data[i].mem_ass+"'' style='text-align:center;' readonly/>\n" +
                                "</td>";
                        }


                    });

                    if(data[i].level==1)
                    {
                        //alert("level1 :"+data[i].name);
                        var level1="<tr class='parent' id='2479' style='text-align:center;' data-tt-id=\""+data[i].id+"\">\n" +
                            "<td style='width:200px;'>\n" +
                            "<b>\n" +
                            "<span style='color:#3071a9;font-size:150%; position:relative; left:5px;'>\n" +
                            "<input type='text' placeholder='enter' class='maintask' id='name"+i+"' name='name"+i+"' value='"+data[i].name+"' readonly /></span>\n" +
                            "<span style='float:right;cursor:pointer;' onclick=\"sub("+data[i].seq_num+","+parseInt(data[i].level)+1+","+data[data.length-2].value+","+data[i].id+");\"></span>\n" +
                            "</b>\n" +
                            "</td>"+
                            "<td style='display:none'><input type='text' id='seqnum"+i+"' name='seqnum"+i+"' value='"+data[i].seq_num+"' hidden /></td>\n" +
                            "<td style='display:none'><input type='text' id='level"+i+"' name='level"+i+"' value='"+data[i].level+"' hidden /></td>\n" +
                            "<td></td>\n"+
                            "<td id='basicExample'><input type='text' class='in date start' id='pln_srt_date" + i + "' name='pln_srt_date" + i + "' value='" + data[i].pln_srt_date + "' style='width: 90px' readonly/></td>"+
                            "<td id='basicExample'><input type='text' class='in date start' id='pln_end_date"+i+"' name='pln_end_date"+i+"' value='"+data[i].pln_end_date+"' style='width: 90px' readonly/></td>\n" +
                            "<td id='basicExample'><input type='text' class='in date start' id='act_srt_date"+i+"' name='act_srt_date"+i+"' value='"+data[i].act_srt_date+"' style='width: 90px' readonly/></td>\n" +
                            "<td id='basicExample'><input  type='text' class='in date start' id='act_end_date"+i+"' name='act_end_date"+i+"' value='"+data[i].act_end_date+"' style='width: 90px' readonly/></td>\n"+
                            "<td><input type='text' class='in'  id='phours"+i+"' name='phrs"+i+"' value='"+data[i].planned_hrs+"' onclick='getID('"+data[i].level+"',document.getElementById('pln_srt_date"+i+"').value,document.getElementById('pln_end_date"+i+"').value,document.getElementById('act_srt_date"+i+"').value,document.getElementById('status"+i+"'),document.getElementById('phours"+i+"'),document.getElementById('hours"+i+"'),document.getElementById('progressbar"+i+"'),document.getElementById('act_end_date"+i+"').value)' readonly/></td>\n" +
                            "<td><input type='text' class='in'  id='hours"+i+"' name='hrs"+i+"' value='"+data[i].hours+"' onclick='getID('"+data[i].level+"',document.getElementById('pln_srt_date"+i+"').value,document.getElementById('pln_end_date"+i+"').value,document.getElementById('act_srt_date"+i+"').value,document.getElementById('status"+i+"'),document.getElementById('phours"+i+"'),document.getElementById('hours"+i+"'),document.getElementById('progressbar"+i+"'),document.getElementById('act_end_date"+i+"').value)' readonly/></td>\n" +
                            "<td><div class=''id='parent_progressbar"+i+"'> </div></td>\n" +
                            "<td ><input type='text' style='background-color:transparent;width:20%;' id='status"+i+"'  /></td>\n" +
                            "<td></td>\n" +
                            "<td>\n" +
                            "</td>\n" +
                            "<script>\n" +
                            "getDetID(document.getElementById('phours"+i+"'),document.getElementById('hours"+i+"'),document.getElementById('progressbar"+i+"'),document.getElementById('status"+i+"'),document.getElementById('act_end_date"+i+"').value,'"+data[i].comments+"',"+i+",'"+data[data.length-2].projectname+"','"+data[i].name+"');" +
                            "<\/script>\n" +
                            "</tr>";
                        /*  $("#table1").on("click","a",function(e) {
                              alert("ewfwsd");
                              e.preventDefault();
                              $(this).closest("tr").nextUntil(".parent").toggleClass("open");
                          });*/

                        tboady_id.append(level1);
                    }
                    else {
						//console.log('Testing : ',(data[i].comments == 'null' || data[i].comments == null || data[i].comments == undefined)? '':data[i].comments);
						var cmt = (data[i].comments == 'null' || data[i].comments == null || data[i].comments == undefined)? '':data[i].comments;
                        var child="<tr class='child-2479' style='text-align:center;' data-tt-id='"+data[i].id+"'\n" +
                            "data-tt-parent-id='"+data[i].ref_id+"'>\n" +
                            "&nbsp;&nbsp;\n" +
                            "<td style='width:230px;'>\n" +
                            "<span style='color:#00BFFF;font-size:100%; position:relative; left:5px;'>\n" +
                            "<input type='text' style='width:270px' placeholder='enter' id='name"+i+"' name='name"+i+"'\n" +
                            "value='"+data[i].name+"' readonly/></span>\n" +
                            "<span style='float:right;cursor:pointer;'\n" +
                            "onclick='sub('"+data[i].seq_num+"','"+parseInt(data[i].level)+1+"','"+data[data.length-2].value+"','"+data[i].id+"')'></span>\n" +
                            "</td><td style='display:none'><input type='text' id='seqnum"+i+"'\n" +
                            "name='seqnum"+i+"'\n" +
                            "value='"+data[i].seq_num+"' hidden/>\n" +
                            "</td>\n" +
                            "<td style='display:none'><input type='text' id='level"+i+"'\n" +
                            "name='level"+i+"'\n" +
                            "value='"+data[i].level+"' hidden/>\n" +
                            "</td>\n" +
                            memberassigned+planstartdate+ planenddate +
                            actualstartdate+actualenddate+planhours+actualhours+
                            "<td>\n" +
                            "<div class='' id='parent_progressbar"+i+"'> </div>\n" +
                            "</td>\n" +
                            "<td><input type='text'\n" +
                            "style='background-color:transparent;width:20%;'\n" +
                            "id='status"+i+"'/></td>\n" +
                            "<td><input type='text' id='cmnts"+i+"' name='cmnts"+i+"'\n" +
                            "value='"+cmt+"'/></td>\n" +
                            "<td>\n" +"\n" +
                            "<i class='fa fa-plus' aria-hidden='true' id='myBtn"+i+"'\n" +
                            "onclick=\"popup(this.id);\"></i>\n" +
                            "<i class='fa fa-trash-o' aria-hidden='true' id='delete"+i+"'\n" +
                            "onclick=\"delete_popup(this.id);\"></i>\n" +
                            "<i class='fa fa-pencil-square-o' aria-hidden='true'\n" +
                            "id='modify"+i+"' onclick=\"modify_popup(this.id);\"></i>\n" +
                            "</td><script>\n" +
                            "getDetID(document.getElementById('phours"+i+"'), document.getElementById('hours"+i+"'), document.getElementById('progressbar"+i+"'), document.getElementById('status"+i+"'), document.getElementById('act_end_date"+i+"').value, '"+data[i].comments+"', "+i+", '"+data[data.length-2].projectname+"','"+data[i].name+"');\n" +
                            "<\/script>" +
                            "<script>\n" +
                            "\n" +
                            "    var colors = [\n" +
                            "        "+username_dropdown +
                            "    ];\n" +
                            "\n" +
                            "    $(function () {\n" +
                            "\n" +
                            "\n" +
                            "\n" +
                            "        $(\"#mem_ass\"+"+i+").igCombo({\n" +
                            "            width: 250,\n" +
                            "            dataSource: colors,\n" +
                            "            textKey: \"Name\",\n" +
                            "            valueKey: \"Name\",\n" +
                            "            multiSelection: {\n" +
                            "                enabled: true,\n" +
                            "                showCheckboxes: true\n" +
                            "            },\n" +
                            "            dropDownOrientation: \"bottom\"\n" +
                            "        });\n" +
                            "\n" +
                            "    });\n" +
                            "\n" +
                            "<\/script></tr>";
                        tboady_id.append(child);

                    }
                    $(function() {
                        $('tr.parent td span.btn')
                            .on("click", function(){
                                var idOfParent = $(this).parents('tr').attr('id');
                                $('tr.child-'+idOfParent).toggle();
                            });
                        $('tr[class^=child-]').hide().children('td');
                    });
                }
                var scriptfortree="<script type='text/javascript'>\n" +
                    "com_github_culmat_jsTreeTable.register(this)\n" +
                    "treeTable($('#table1'))\n" +
                    "<\/script>";
                $('#sample').append(scriptfortree);
                /*var add_button="<input type='button' name='addbtn' class='btn btn-primary'\n" +
                    "onclick=\"sub("+(i+1)+",1,'"+data[data.length-1].value+"','"+data[data.length-1].value+"');\"\n" +
                    "value='Add'>";
                $('#archive_execution_button').append(add_button);*/
            }
        });
    });


</script>
<script>
    // Add active class to the current button (highlight it)
    var header = document.getElementById("myDIV");
    var btns = header.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function() {
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
</script>
<%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>

<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
<!-- Ignite UI Required Combined JavaScript Files -->
<script src="http://cdn-na.infragistics.com/igniteui/2019.1/latest/js/infragistics.core.js"></script>
<script src="http://cdn-na.infragistics.com/igniteui/2019.1/latest/js/infragistics.lob.js"></script>

</body>

</html>

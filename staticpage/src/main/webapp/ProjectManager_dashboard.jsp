<html lang="en">
<head>
    <title>PM-Dashboard</title>
    <meta charset="UTF-8"/>

    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript" src="js_in_pages/edit_project.js"></script>
    <script type="text/javascript" src="js_in_pages/tree.js"></script>
    <link rel="stylesheet" href="css/PMD.css" type="text/css"/>
    <%--  <script type="application/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
      <script type="application/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>--%>
    <script type="application/javascript" src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" type="text/css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/dataTables.jqueryui.min.css" type="text/css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" rel="stylesheet"/>

</head>

<body class="top-navbar-fixed">
<%
    HttpSession details = request.getSession();
    String prjname = (String) details.getAttribute("nameofproject");
    //String appname = (String) session.getAttribute("appidd");
    String appname = (String) details.getAttribute("applications");
    String role = (String) details.getAttribute("role");

%>

<form class="form-signin" name="loginForm" method="post">

    <div class="main-wrapper">

        <!-- ========== TOP NAVBAR ========== -->
        <nav class="navbar top-navbar bg-white box-shadow">
            <div class="container-fluid">
                <div class="row">
                    <div class="navbar-header no-padding">
                        <a class="navbar-brand" href="Project_List.jsp">
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


                    <a class="navbar-brand" href="Project_List.jsp"></a>


                    <div class="collapse navbar-collapse" id="navbar-collapse-1">

                        <!-- /.nav navbar-nav -->
                        <ul class="nav navbar-nav navbar-right">

                            <li><a href="#"><span id="nav_userid">&nbsp;</span>logged in as &nbsp;<span
                                    id='nav_role'></span></a></li>
                            <li><a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a></li>
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
                                    <a href=""><i class="fa fa-archive"></i> <span>Plan and pirority</span> <i
                                            class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="AppEmphasize_EditProject.jsp" class="active-menu"> <span>Project Information</span></a>
                                        </li>
                                        <li><a href="AppEmphasize_Application.jsp" class="active-menu"> <span>Application Information</span></a>
                                        </li>
                                        <li><a href="AppEmphasize_CostCalculation.jsp">
                                            <span>Application Complexity</span></a></li>
                                        <li><a href="AppEmphasize_PrioritizedApplications.jsp"> <span>Prioritized Applications</span></a>
                                        </li>
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
                                    <a href=""><i class="fa fa-file-text"></i> <span>Intake Module</span> <i
                                            class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Applications.jsp" class="active-menu">
                                            <span>Application Details</span></a></li>
                                        <li><a href="Intake_Business.jsp"> <span>Business Details</span></a></li>
                                        <li><a href="Intake_TechnicalDetails.jsp"> <span>Technical Details</span></a>
                                        </li>
                                        <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a>
                                        </li>
                                        <li><a href="Intake_ReviewPage.jsp"> <span>Review Page</span></a></li>
                                    </ul>
                                </li>
                                <%--<li class="nav-header">
                                    <a href='Archive_Execution.jsp'><span class="">Archive Execution Module</span></a>
                                </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span> <i
                                            class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Archive_Execution.jsp" class="active-menu">
                                            <span>Archive Execution</span></a></li>
                                        <li><a href="archivesummary.jsp"> <span>Archive summary</span></a></li>

                                    </ul>
                                </li>
                                <%--   <li class="nav-header">
                                       <a href='RoleUIDashboard.jsp'><span class="">Report Module</span></a>
                                   </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-paint-brush"></i> <span>Report Module</span> <i
                                            class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="RoleUIDashboard.jsp" class="active-menu">
                                            <span>Reports Dashboard</span></a></li>
                                        <li><a href="RoleDashboard.jsp" class="active-menu"> <span>Role Dashboard</span></a>
                                        </li>
                                        <li><a href="ProjectDashboard.jsp"> <span>Project Dashboard</span></a></li>
                                        <li><a href="ApplicationDashboard.jsp"> <span>Application Dashboard</span></a>
                                        </li>
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
                    <div class="container-fluid">
                        <div class="row page-title-div">
                            <div class="col-sm-6">
                                <h2 class="title">Dashboard</h2>
                            </div>
                            <!-- /.col-sm-6
                            <div class="col-sm-6 right-side">
                                <a class="btn bg-black toggle-code-handle tour-four" role="button">Toggle Code!</a>
                            </div>
                             /.col-sm-6 text-right -->
                        </div>
                        <!-- /.row -->
                        <div class="row breadcrumb-div">
                            <div class="col-sm-6">
                                <ul class="breadcrumb">
                                    <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
                                    <li class="active">Dashboard</li>
                                </ul>
                            </div>
                            <!-- /.col-sm-6 -->
                            <div class="col-sm-6 text-right hidden-xs">
                                <a href="#"><i class="fa fa-comments"></i> Talk to us</a>
                                <a href="#" class="pl-20"><i class="fa fa-cog"></i> Settings</a>

                            </div>
                            <!-- /.col-sm-6 -->
                        </div>
                        <!-- /.row -->
                    </div>

                    <section class="section">
                        <div class="container-fluid">
                            <div class="row">
                                <%--<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat bg-primary" href="#">
                                        &lt;%&ndash;<span class="number counter" id="project_count"></span>&ndash;%&gt;
                                        <h1 class="ui-valuet" id="project_count"></h1>
                                        <span class="name">  Project </span>
                                        <span class="bg-icon"><i class="fa fa-file-text"></i></span>
                                    </a>
                                    <!-- /.dashboard-stat -->

                                    <!-- /.src-code -->
                                </div>--%>
                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat bg-primary" href="#">
                                        <%--<span class="number counter" id="project_count"></span>--%>
                                        <h1 class="ui-valuet" id="application_count"></h1>
                                        <span class="name">  Applications </span>
                                        <span class="bg-icon"><i class="fa fa-file-text"></i></span>
                                    </a>
                                    <!-- /.dashboard-stat -->

                                    <!-- /.src-code -->
                                </div>
                                <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat bg-danger" href="#">
                                        <%--<span class="number counter" id="application_count"></span>--%>
                                        <h1 class="ui-valuet" id="applive"></h1>
                                        <span class="name"> Applications in  live </span>
                                        <span class="bg-icon"><i class="fa fa-list-alt"></i></span>
                                    </a>
                                    <!-- /.dashboard-stat -->

                                    <!-- /.src-code -->
                                </div>
                                <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat bg-warning" href="#">
                                        <%--<span class="number counter" id="resource_count1"></span>--%>
                                        <h1 class="ui-valuet" id="appdev"></h1>
                                        <span class="name"> Applications in Development</span>
                                        <span class="bg-icon"><i class="fa fa-user"></i></span>
                                    </a>
                                    <!-- /.dashboard-stat -->

                                    <!-- /.src-code -->
                                </div>
                                <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                                    <a class="dashboard-stat bg-success" href="#">
                                        <h1 class="ui-valuet" id="resource_count">3</h1>
                                        <%--<span class="number counter">3</span>--%>
                                        <span class="name"> Applications Ready for Decommission </span>
                                        <span class="bg-icon"><i class="fa fa-thumbs-o-up"></i></span>
                                    </a>
                                    <!-- /.dashboard-stat -->

                                    <!-- /.src-code -->
                                </div>
                                <!-- /.col-lg-3 col-md-3 col-sm-6 col-xs-12 -->

                            </div>
                            <!-- /.row -->


                            <div class="content">
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card">


                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <div class="panel">
                                                            <div class="header">
                                                                <h4 class="title">Application Information</h4>

                                                            </div>
                                                            <div class="panel-body">

                                                                <table id="example" class="table table-striped">
                                                                    <thead>
                                                                    <tr>
                                                                       <%-- <th>Select</th>--%>
                                                                        <th>Application Name</th>
                                                                        <th>Read only Date</th>
                                                                        <th>StartDate</th>
                                                                        <th>EndDate</th>
                                                                        <th>% of Completion</th>
                                                                        <th>No of Resources</th>
                                                                        <th>Application State</th>
                                                                        <th>Status</th>

                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>


                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-12">

                                                        <div class="panel">
                                                            <div class="header">
                                                                <h4 class="title">Application Information</h4>


                                                            </div>

                                                            <div class="panel-body">

                                                                <table id="sample" class="table table-striped">
                                                                    <thead>
                                                                    <tr>
                                                                        <th>Select</th>
                                                                        <th>Application Name</th>
                                                                        <th>Assigned To</th>
                                                                        <th>StartDate</th>
                                                                        <th>End Date</th>
                                                                        <%-- <th>Read Only Date </th>--%>
                                                                        <th>Status</th>


                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <tr>
                                                                        <td><input class="single_Checkbox"
                                                                                   type="checkbox" id="" name=""/></td>
                                                                        <td data-column="Task">Ideation & Initiation
                                                                        </td>
                                                                        <td data-column="assignedto">Angie</td>
                                                                        <td data-column="startDate">01/01/2019</td>
                                                                        <td data-column="EndDate">01/03/2019</td>
                                                                        <td data-column="status" style="color:green">
                                                                            Completed
                                                                        </td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td><input class="single_Checkbox"
                                                                                   type="checkbox" id="" name=""/></td>
                                                                        <td data-column="Task">Plan</td>
                                                                        <td data-column="assignedto">Angie</td>
                                                                        <td data-column="startDate">01/01/2019</td>
                                                                        <td data-column="EndDate">01/03/2019</td>
                                                                        <td data-column="status" style="color:green">
                                                                            Completed
                                                                        </td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td><input class="single_Checkbox"
                                                                                   type="checkbox" id="" name=""/></td>
                                                                        <td data-column="Task">Execution</td>
                                                                        <td data-column="assignedto">Angie</td>
                                                                        <td data-column="startDate">01/01/2019</td>
                                                                        <td data-column="EndDate">01/03/2019</td>
                                                                        <td data-column="status" style="color:green">
                                                                            Completed
                                                                        </td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td><input class="single_Checkbox"
                                                                                   type="checkbox" id="" name=""/></td>
                                                                        <td data-column="Task">CLosure</td>
                                                                        <td data-column="assignedto">Angie</td>
                                                                        <td data-column="startDate">01/01/2019</td>
                                                                        <td data-column="EndDate">01/03/2019</td>
                                                                        <td data-column="status" style="color:green">
                                                                            Completed
                                                                        </td>

                                                                    </tr>

                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <!--column chart -->


                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="card1">
                                                            <div class="header">
                                                                <h4 class="title">Project Statistics</h4>

                                                            </div>
                                                            <div class="content">
                                                                <div id="container"
                                                                     style="width: 550px; height: 400px; margin: 0 auto"></div>


                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <div class="card1 ">
                                                            <div class="header">
                                                                <h4 class="title">Application Statistics</h4>
                                                                <div class="col-md-6">
                                                                    <div class="form-group row">
                                                                        <label class="col-md-3 col-form-label">Project</label>
                                                                        <div class="col-md-9">
                                                                            <select class="form-control">
                                                                                <option>BPCS</option>
                                                                                <option>Microsiga</option>
                                                                                <option>SEEKGIT</option>
                                                                            </select>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <br>
                                                            <br>
                                                            <div class="content">
                                                                <div id="piechart"
                                                                     style="width: 570px; height: 350px;"></div>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-4 col-md-5">





                                                        <div class="row">
                                                            <div class="col-md-12">

                                                                <div class="panel">
                                                                    <div class="header">
                                                                        <h4 class="title">Team Members</h4>
                                                                        <div class="col-md-7">
                                                                            <div class="form-group row">
                                                                                <label class="col-sm-9 col-form-label"><div class="required_fie">Role Name</div></label>
                                                                                <div class="col-sm-20">
                                                                                    <select id="dates-field2"
                                                                                            class="selectpicker multiselect-ui form-control dropdown"
                                                                                            data-show-subtext="true"
                                                                                            data-live-search="true"
                                                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                                                        <option data-subtext="All">
                                                                                            All
                                                                                        </option>
                                                                                        <option data-subtext="Archival Admin">
                                                                                            ArchivalAdmin
                                                                                        </option>
                                                                                        <option data-subtext="Legacy Technical SME">
                                                                                            LegacyTechnicalSME
                                                                                        </option>
                                                                                        <option data-subtext="Legacy Business SME">
                                                                                            LegacyBusinessSME
                                                                                        </option>
                                                                                        <option data-subtext="Archival Program Manager">
                                                                                            ArchivalProgramManager
                                                                                        </option>
                                                                                        <option data-subtext="Archival Project Manager">
                                                                                            ArchivalProjectManager
                                                                                        </option>
                                                                                        <option data-subtext="Legacy Program Manager">
                                                                                            LegacyProgramManager
                                                                                        </option>
                                                                                        <option data-subtext="Archival Business Analyst">
                                                                                            ArchivalBusinessAnalyst
                                                                                        </option>
                                                                                        <option data-subtext="Archival Technical Lead">
                                                                                            ArchivalTechnicalLead
                                                                                        </option>
                                                                                        <option data-subtext="Archival Developer">
                                                                                            ArchivalDeveloper
                                                                                        </option>
                                                                                        <option data-subtext="Test Lead">TestLead</option>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-md-7">
                                                                            <div class="form-group row">
                                                                                <label class="col-sm-9 col-form-label"><div class="required_fie">Application Name</div></label>
                                                                                <div class="col-sm-20">
                                                                                    <select id="application_name" name="application_name"
                                                                                            class="selectpicker multiselect-ui form-control dropdown"
                                                                                            data-show-subtext="true"
                                                                                            data-live-search="true"
                                                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                                                    </select>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>

                                                                    <div class="panel-body">

                                                                        <table id="datatable" class="table table-striped">
                                                                            <thead>
                                                                            <tr>
                                                                                <th>Role Name</th>
                                                                                <th>User Name</th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody id="RoleId">
                                                                             </tbody>
                                                                        </table>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>


                                    </div>
                                    <!-- /.container-fluid -->

                                </div>
                            </div>
                        </div>
                </div>


                </section>
                <%--<footer class="footer">
                    <div class="container-fluid">
                        <span class="text-muted d-block text-center text-sm-left d-sm-inline-block">Copyright � 2018 <a href="http://www.platform3solutions.com/" target="_blank">Platform3solutions.com</a>. All rights reserved.</span>
                        <span class="float-none float-sm-right d-block mt-1 mt-sm-0 text-center"></span>
                    </div>
                </footer>--%>

            </div>


        </div>
        <!-- /.content-container -->

    </div>
    <!-- /.content-wrapper -->


    </div>
    <!-- /.main-wrapper -->


    </div>
    </div>
    </div>

    <script language="JavaScript">
        google.charts.load('current', {packages: ['corechart']});

        function drawChart() {
            // Define the chart to be drawn.
            var data = google.visualization.arrayToDataTable([
                ['Tasks', 'completion'],
                ['Ideation & Initiation', 100],
                ['Plan', 40],
                ['Execute', 20],
                ['Plan', 0],

            ]);

            var options = {title: ''};

            // Instantiate and draw the chart.
            var chart = new google.visualization.ColumnChart(document.getElementById('container'));
            chart.draw(data, options);
        }

        google.charts.setOnLoadCallback(drawChart);
    </script>


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

    <div data-notify="container" class="col-xs-11 col-sm-4 alert alert-success alert-with-icon animated fadeInDown"
         role="alert" data-notify-position="top-right"
         style="display: inline-block; margin: 0px auto; position: fixed; transition: all 0.5s ease-in-out 0s; z-index: 1031; top: 20px; right: 20px;">
        <button type="button" aria-hidden="true" class="close" data-notify="dismiss"
                style="position: absolute; right: 10px; top: 50%; margin-top: -13px; z-index: 1033;">�
        </button>
        <span data-notify="icon" class="fa fa-2x fa-gift"></span> <span data-notify="title"></span> <span
            data-notify="message">Welcome to <b>Project Manager Dashboard</b> - a beautiful Project Manager  Panel for your  project.</span><a
            href="#" target="_blank" data-notify="url"></a></div>
    <input type="hidden" id="projectname" name="projectname" value="<%=prjname%>">
    <input type="hidden" id="appname" name="appname" value="<%=appname%>">
    <input type="hidden" id="role" name="role" value="<%=role%>">
    <script>
        $(function () {

            // Counter for dashboard stats
            $('.counter').counterUp({
                delay: 10,
                time: 1000
            });

            // Welcome notification
            toastr.options = {
                "closeButton": true,
                "debug": false,
                "newestOnTop": false,
                "progressBar": false,
                "positionClass": "toast-top-right",
                "preventDuplicates": false,
                "onclick": null,
                "showDuration": "300",
                "hideDuration": "1000",
                "timeOut": "3500",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
                "showMethod": "fadeIn",
                "hideMethod": "fadeOut"
            }
            toastr["success"]("One stop solution to your website admin panel!", "Welcome to Onboard!");

        });
    </script>
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['corechart']});
        google.charts.setOnLoadCallback(drawChart);

        function drawChart() {

            var data = google.visualization.arrayToDataTable([
                ['Tasks', 'completion'],
                ['Requirements', 100],
                ['Deployments', 40],
                ['Execute', 20],
                ['Testing', 0],
            ]);

            var options = {
                title: ''
            };

            var chart = new google.visualization.PieChart(document.getElementById('piechart'));

            chart.draw(data, options);
        }
    </script>
    <script>
        /*$(document).ready(function () {
            //alert("efdsx");
            $('#example').DataTable();
        });
        $(document).ready(function () {
            //alert("efdsx");
            $('#sample').DataTable();
        });*/
        /*$(document).ready(function () {
            //alert("efdsx");
           var table= $('#datatable').DataTable();
        });*/
        /*$('#application_name').on('change', function(){
            alert("sample---->");
            table.search(this.value).draw();
        });*/
    </script>
    <script type="application/javascript">
        $(document).ready(function () {
            var projectname=document.getElementById("projectname").value;
            var applicationname=document.getElementById("appname").value;
            var select = $('#application_name');
            select.empty();
            $.ajax({
                url: 'Project_Manager_Servlet',
                type: 'post',
                data: {appname:applicationname,projectname: projectname},
                dataType: 'json',
                success: function (data) {
                    console.log("card details",data);
                    $('#project_count').html(data.project_count);
                    $('#application_count').html(data.app_count);
                    $('#applive').html(data.live_app_count);
                    $('#appdev').html(data.AppInDevelopmentCount);
                    var testing=data.AppDropdown;
                    var option=testing.split(",");
                    for (var i=0; i<option.length; i++){
                        $('#application_name').append('<option>' + option[i] + '</option>')
                    }
                    var app=$('#application_name').val();
                    var role=$('#dates-field2').val();
                    var projectname=document.getElementById("projectname").value;
                    $.ajax({
                        url: 'TeamMember',
                        type: 'post',
                        data: {appname:app,projectname: projectname,role:role},
                        dataType: 'json',
                        success: function (data) {
                            console.log("datattt---->",data);
                            if(data[0].Roles=="All")
                            {
                                var length = data[1].length;
                                var role = "";
                                $.each(data[1], function (key, value) {
                                    role += "<tr>\n" +
                                        "<td data-column='Task'>" + key.replace(/[0-9]/g, '') +
                                        "</td>\n";
                                    role += "<td data-column='assignedto'>" + value + "</td>\n" +
                                        "</tr>";
                                });
                                $('#RoleId').html(role);
                            }
                            else {
                                var length = data[1].length;
                                var role = "";
                                $.each(data[1], function (key, value) {
                                    role += "<tr>\n" +
                                        "<td data-column='Task'>" + data[0].Roles +
                                        "</td>\n";
                                    role += "<td data-column='assignedto'>" + value + "</td>\n" +
                                        "</tr>";
                                });
                                $('#RoleId').html(role);
                            }
                        }
                    });
                }
            });

        });
        $('.dropdown').change(function()
        {
            var app=$('#application_name').val();
            var role=$('#dates-field2').val();
            var projectname=document.getElementById("projectname").value;
            //alert("ans "+app+" "+role);
            $.ajax({
                url: 'TeamMember',
                type: 'post',
                data: {appname:app,projectname: projectname,role:role},
                dataType: 'json',
                success: function (data) {
                    console.log("datattt---->",data);
                    if(data[0].Roles=="All")
                    {
                        var length = data[1].length;
                        var role = "";
                        var j=1;
                        $.each(data[1], function (key, value) {
                            if(j%5==0)
                            {
                                role+="<div id='divid"+j+"'>";
                            }
                            role += "<tr>\n" +
                                "<td data-column='Task'>" + key.replace(/[0-9]/g, '') +
                                "</td>\n";
                            role += "<td data-column='assignedto'>" + value + "</td>\n" +
                                "</tr>";
                            j++;
                        });
                        $('#RoleId').html(role);
                    }
                    else {
                        var length = data[1].length;
                        var role = "";
                        $.each(data[1], function (key, value) {
                            role += "<tr>\n" +
                                "<td data-column='Task'>" + data[0].Roles +
                                "</td>\n";
                            role += "<td data-column='assignedto'>" + value + "</td>\n" +
                                "</tr>";
                        });
                        $('#RoleId').html(role);
                    }
                }
            });

        });

        var datatable = $('#example');
        $(document).ready(function () {
            var projectname = document.getElementById("projectname").value;
            var applicationname = document.getElementById("appname").value;
            var select = $('#application_name');
            select.empty();
            $.ajax({
                url: 'Project_Information',
                type: 'post',
                data: {appname: applicationname, projectname: projectname},
                dataType: 'json',
                success: function (data)
                {
                    console.log("project information",data)
                    var obj = data;
                    var appinfo = "";



                    for(var i=0;i<obj.length;i++)
                    {

                        var status = obj[i]["AppName"] + "status";

                        appinfo += "<tr>";
                        appinfo +=  "<td>"+obj[i]["AppName"] + "</td>";
                        appinfo += "<td>"+obj[i]["ReadOnlyDate"]+ "</td>";
                        appinfo +=  "<td>"+obj[i]["StartDate"]+ "</td>";

                        appinfo += "<td>"+obj[i]["EndDate"]+ "</td>";
                        appinfo +="<td>"+obj[i]["Percentage"]+ "</td>";
                        appinfo += "<td>"+obj[i]["ResourceCount"]+ "</td>";
                        appinfo +=  "<td>"+obj[i]["ApplicationState"]+ "</td>";
                        appinfo +=  "<td>"+obj[i][status]+ "</td>";
                        appinfo += "</tr>";


                        //$("#example").append(appinfo1 + appinfo2 + appinfo3 +appinfo4 +appinfo5+appinfo6+appinfo7+appinfo8+appinfo9+appinfo10 )



                    }
                    $("#example").append(appinfo);
                }
                });

            });



    </script>
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js" type="text/javascript"></script>
    <script src="https://cdn.datatables.net/1.10.19/js/dataTables.jqueryui.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
</form>
</body>
</html>

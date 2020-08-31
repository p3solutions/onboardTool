<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>UserConfiguration Page</title>
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>
    <link rel="stylesheet" href="styles/styles.css" type="text/css"/>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css"/>
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">
    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/icheck/skins/line/red.css">
    <link rel="stylesheet" href="css/icheck/skins/line/green.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css"/>
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
    <link rel="stylesheet" href="css/admin_module/admin_module_send_invites.css" media="screen">

    <!-- date picker -->
    <link rel="stylesheet" type="text/css" href="css/date-picker/bootstrap-datepicker.css" />
    <link rel="stylesheet" type="text/css" href="css/date-picker/jquery.timepicker.css"/>

    <!-- date picker -->

    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


</head>

<style type="text/css">
    .breadcrumb-div {
        background-color: #e7e7e7;
        color: #010101; }
    #button1{

        padding:20px;


    }

    #return-to-top {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: rgb(0, 0, 0);
        background: rgba(0, 0, 0, 0.7);
        width: 50px;
        height: 50px;
        display: block;
        text-decoration: none;
        -webkit-border-radius: 35px;
        -moz-border-radius: 35px;
        border-radius: 35px;
        display: none;
        -webkit-transition: all 0.3s linear;
        -moz-transition: all 0.3s ease;
        -ms-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }
    #return-to-top i {
        color: #fff;
        margin: 0;
        position: relative;
        left: 16px;
        top: 13px;
        font-size: 19px;
        -webkit-transition: all 0.3s ease;
        -moz-transition: all 0.3s ease;
        -ms-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }
    #return-to-top:hover {
        background: rgba(0, 0, 0, 0.9);
    }
    #return-to-top:hover i {
        color: #fff;
        top: 5px;
    }
</style>

<style>
    .tablink {
        background-color: blue;
        color: white;
        float: left;
        border: none;
        outline: none;
        cursor: pointer;
        padding: 14px 16px;
        font-size: 17px;
        width: 25%;
    }

    .tablink:hover {
        background-color: #777;
    }

    /* Style the tab content (and add height:100% for full page content) */
    .tabcontent {
        color: white;
        display: none;
        padding: 100px 20px;
        height: 100%;
    }
    .active
    {
        background-color: rgb(192,192,192);
    }
</style>


<body class="top-navbar-fixed">


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
                <!-- /.navbar-header -->


                <div class="collapse navbar-collapse" id="navbar-collapse-1">

                    <!-- /.nav navbar-nav -->
                    <ul class="nav navbar-nav navbar-right">

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
                            <li class="has-children ">
                                <a href=""><i class="fa fa-archive"></i> <span>Plan and pirority</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav"  id="myDIV">
                                    <li class="btn"><a href="AppEmphasize_EditProject.jsp" > <span  class="activ-pro">Project Information</span></a></li>
                                    <li ><a href="AppEmphasize_Application.jsp" > <span>Application Information</span></a></li>
                                    <li ><a href="AppEmphasize_CostCalculation.jsp" > <span>Application Complexity</span></a></li>
                                    <li ><a href="AppEmphasize_PrioritizedApplications.jsp"> <span>Prioritized Applications</span></a></li>
                                    <li ><a href="AppEmphasize_Preview.jsp"> <span>Review Page</span></a></li>
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
                                <ul class="child-nav">
                                    <li><a href="Archive_Execution.jsp" > <span>Archive Execution</span></a></li>
                                    <li><a href="archivesummary.jsp" > <span>Archive summary</span></a></li>

                                </ul>
                            </li>
                            <%--   <li class="nav-header">
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

            <div class="main-page">
                <div class="container-fluid">

                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h2 class="title">Key Mile Stones</h2>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-6">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i>Home</a></li>

                            </ul>
                        </div>



                    </div>
                    <!-- /.row -->
                </div>
                <section>
                    <a href="javascript:" id="return-to-top"><i class="icon-chevron-up"></i></a>
                    <br>
                    <div class="row">

                        <div class="container">

                            <div class="panel-group" id="panels1">

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"> <a  data-parent="#panels1" > Key Mile Stones  </a> </h4>
                                    </div>
                                    <br>
                                    <div align="center">



                                        <div class="row">
                                            <div class="col-sm-12 form-group" align="right">
                                                <div>
                                                    <button class="tablink" class="colour_change_tab" id="capm_tab_color" onclick="capm_fun(this.id);">CAPM</button>
                                                    <button class="tablink" class="colour_change_tab" id="camp_tab_color1" onclick="et_team_fun(this.id);">ETPM</button>
                                                    <button class="tablink" class="colour_change_tab" id="camp_tab_color2" onclick="app_team_fun(this.id);">APP TEAM</button>
                                                    <button class="tablink" class="colour_change_tab" id="camp_tab_color3" onclick="app_slo_fun(this.id);">APP SLO</button>
                                                </div>
                                                <br><br><br><br>

                                                <div id="collapse2" class="panel-collapse">
                                                    <div class="panel-body text-left">
                                                        <!-- Table Info -->
                                                        <form name="TableSubmitForm">
                                                            <div class="form-group hideclass" id="capm_data" style="display:none;" >
                                                                <div>
                                                                    <h4><font color="red" size="5">CAPM</font></h4>

                                                                    <label  class="control-label " for="formInput198" style="width:65%;"><font size="4"><b>Status is Targeted for Decommission ?</b></font></label>
                                                                    <input type="radio" name="CAPM1" class="status" value="Yes">Yes
                                                                    <input type="radio" name="CAPM1" class="status" value="No">No
                                                                    <input type="radio" name="CAPM1" class="status" value="NA">N/A

                                                                </div>
                                                                <div class="hint_1" style="display:none;">
                                                                    <label><font color="red";>If no then submit request to change the life cycle status to " Targeted for Decommission"</font></label>
                                                                </div>
                                                                <div>
                                                                    <label class="control-label " for="formInput198" style="width:65%;"><font size="4"><b>Service currently in Production ?</b></font></label>
                                                                    <input type="radio" name="CAPM2" class="service" value="Yes">Yes
                                                                    <input type="radio" name="CAPM2" class="service" value="No">No
                                                                    <input type="radio" name="CAPM2" class="service" value="NA">N/A
                                                                </div>
                                                                <div class="hint_2" style="display:none;">
                                                                    <label><font color="red";>If no, Retired or if the service does not exist; No further steps required.</font></label>
                                                                </div>
                                                                <div>
                                                                    <label class="control-label " for="formInput198" style="width:65%;"><font size="4"><b>Change service priority needed ?</b></font></label>
                                                                    <input type="radio" name="CAPM3" class="change" value="Yes">Yes
                                                                    <input type="radio" name="CAPM3" class="change" value="No">No
                                                                    <input type="radio" name="CAPM3" class="change" value="NA">N/A
                                                                </div>
                                                                <div class="hint_3" style="display:none;">
                                                                    <label><font color="brown";>Priority change request should be submitted in Service now or any ITSM</font></label>
                                                                </div>
                                                                <div>
                                                                    <label class="control-label " for="formInput198" style="width:65%;"><font size="4"><b>CI Relationships exists?</b></font></label>
                                                                    <input type="radio" name="CAPM4" class="relationship" value="Yes">Yes
                                                                    <input type="radio" name="CAPM4" class="relationship" value="No">No
                                                                    <input type="radio" name="CAPM4" class="relationship" value="NA">N/A
                                                                </div>
                                                                <div class ="addquestion CAPM5" style="display:none;">
                                                                    <label class="control-label " for="formInput198" style="width:65%;"><font color="blue";>Item will be retired?</font></label>
                                                                    <input type="radio" name="CAPM5" class="item" value="Yes">Yes
                                                                    <input type="radio" name="CAPM5" class="item" value="No">No
                                                                    <input type="radio" name="CAPM5" class="item" value="NA">N/A
                                                                </div>

                                                                <div class="hint_4" style="display:none;">
                                                                    <label><font color="brown";>SLO to make appropriate updates?</font></label>
                                                                </div>

                                                                <div>
                                                                    <label class="control-label " for="formInput198" style="width:65%;"><font size="4"><b>SLO has made Appropriate updates ?</b></font></label>
                                                                    <input type="radio" name="CAPM6" value="Yes">Yes
                                                                    <input type="radio" name="CAPM6" value="No">No
                                                                    <input type="radio" name="CAPM6" value="NA">N/A
                                                                </div>
                                                                <div>
                                                                    <label class="control-label " for="formInput198" style="width:65%;"><font size="4">Application part of EDR list?</font></label>
                                                                    <input type="radio" name="CAPM7" value="Yes">Yes
                                                                    <input type="radio" name="CAPM7" value="No">No
                                                                    <input type="radio" name="CAPM7" value="NA">N/A
                                                                </div>
                                                            </div>



                                                            <div class="form-group hideclass" id="et_team_data" style="display:none;">

                                                                <div>
                                                                    <h4><font color="red" size="5">ET TEAM/ET PM TAB</font></h4>

                                                                    <label  class="control-label " for="formInput198" style="width:65%;"><font size="4"><b>Final Artifact- Review and Approval</b></font></label>
                                                                    <input type="radio" name="ETPM1" class="final_artifact" value="Yes">Yes
                                                                    <input type="radio" name="ETPM1" class="final_artifact" value="No">No
                                                                    <input type="radio" name="ETPM1" class="final_artifact" value="NA">N/A

                                                                </div>

                                                                <div>
                                                                    <label  class="control-label " for="formInput198" style="width:65%;"><font size="4"><b>Provide Chargeback Validation Report</b></font></label>
                                                                    <input type="radio" name="ETPM2" class="Provide" value="Yes">Yes
                                                                    <input type="radio" name="ETPM2" class="provide" value="No">No
                                                                    <input type="radio" name="ETPM2" class="provide" value="NA">N/A
                                                                </div>

                                                                <div class="form-group ETPM3" style="display:none;" id="et_team_provided_date">

                                                                    <label  class="control-label " for="formInput198"><font color="green" size="4"><b>Provided Date</b></font></label>
                                                                    <input type="text" name ="ETPM3" class="datepicker" id="datepicker1" placeholder="mm/dd/yyyy">

                                                                </div>

                                                                <div>
                                                                    <label  class="control-label " for="formInput198" style="width:65%;"><font size="4"><b>Submit Decommission requests:
                                                                        Use ITG/Service Catalog for components / services listed in the Final Artifact</b></font></label>
                                                                    <input type="radio" name="ETPM4" class="submit_decom_req" value="Yes">Yes
                                                                    <input type="radio" name="ETPM4" class="submit_decom_req" value="No">No
                                                                    <input type="radio" name="ETPM4" class="submit_decom_req" value="NA">N/A
                                                                </div>

                                                                <div class="form-group ETPM5" style="display:none;" id="et_team_submission_date">

                                                                    <label  class="control-label " for="formInput198"><font color="green" size="4"><b>Submission Date</b></font></label>
                                                                    <input type="text" name ="ETPM5" class="datepicker" id="datepicker2" placeholder="mm/dd/yyyy">

                                                                </div>

                                                            </div>




                                                            <div class="form-group hideclass" id="app_team_data" style="display:none;">

                                                                <div>
                                                                    <h4><font color="red" size="5">APP TEAM</font></h4>

                                                                    <label  class="control-label " for="formInput198" style="width:65%;"><font  size="4"><b>Final Artifact (Decommission List) Review and Approval</b></font></label>
                                                                    <input type="radio" name="APP_TEAM1" class="decommission_list" value="Yes">Yes
                                                                    <input type="radio" name="APP_TEAM1" class="decommission_list" value="No">No
                                                                    <input type="radio" name="APP_TEAM1" class="decommission_list" value="NA">N/A

                                                                </div>

                                                                <div>
                                                                    <label  class="control-label " for="formInput198" style="width:65%;"><font  size="4"><b>Stop/Remove Jobs/Application Interfaces/SSIS Jobs etc.,
                                                                        to  impacted applications Stopping jobs and interaction with the app.</b></font></label>
                                                                    <input type="radio" name="APP_TEAM2" class="Stop" value="Yes">Yes
                                                                    <input type="radio" name="APP_TEAM2" class="Stop" value="No">No
                                                                    <input type="radio" name="APP_TEAM2" class="Stop" value="NA">N/A
                                                                </div>


                                                                <div class="form-group APP_TEAM3" style="display:none;" id="submission_date1">

                                                                    <label  class="control-label " for="formInput198"><font color="green" size="4"><b>Submission Date</b></font></label>
                                                                    <input type="text" name ="APP_TEAM3" class="datepicker" id="app_datepicker1" placeholder="mm/dd/yyyy">

                                                                </div>

                                                                <div>
                                                                    <label class="control-label " for="formInput198"  style="width:65%;"><font size="4"><b>(Optional) Impact Analysis of Application Decommission</b></font></label>
                                                                    <input type="radio" name="APP_TEAM4" class="impact_analysis" value="Yes">Yes
                                                                    <input type="radio" name="APP_TEAM4" class="impact_analysis" value="No">No
                                                                    <input type="radio" name="APP_TEAM4" class="impact_analysis" value="NA">N/A
                                                                </div>



                                                                <div class="form-group APP_TEAM5" style="display:none;" id="app_submission_date2">

                                                                    <label  class="control-label " for="formInput198"><font color="green" size="4"><b>Submission Date</b></font></label>
                                                                    <input type="text" name ="APP_TEAM5" class="datepicker" id="app_datepicker2" placeholder="mm/dd/yyyy">

                                                                </div>

                                                                <div>
                                                                    <label class="control-label " for="formInput198"  style="width:65%;"><font size="4"><b>ServiceNow: Change Request</b></font></label>
                                                                    <input type="radio" name="APP_TEAM6" class="service_now" value="Yes">Yes
                                                                    <input type="radio" name="APP_TEAM6" class="service_now" value="No">No
                                                                    <input type="radio" name="APP_TEAM6" class="service_now" value="NA">N/A
                                                                </div>

                                                                <div class="form-group APP_TEAM7" style="display:none;" id="app_submission_date3">

                                                                    <label  class="control-label " for="formInput198"><font color="green" size="4"><b>Submission Date</b></font></label>
                                                                    <input type="text" name ="APP_TEAM7"class="datepicker" id="app_datepicker3" placeholder="mm/dd/yyyy">

                                                                </div>

                                                                <div>
                                                                    <label class="control-label " for="formInput198"  style="width:65%;"><font size="4"><b>Secure:   Remove Application</b></font></label>
                                                                    <input type="radio" name="APP_TEAM8" class="secure" value="Yes">Yes
                                                                    <input type="radio" name="APP_TEAM8" class="secure" value="No">No
                                                                    <input type="radio" name="APP_TEAM8" class="secure" value="NA">N/A
                                                                </div>

                                                                <div class="form-group APP_TEAM9" style="display:none;" id="app_submission_date4">

                                                                    <label  class="control-label APP_TEAM9" for="formInput198"><font color="green" size="4"><b>Submission Date</b></font></label>
                                                                    <input type="text" name ="APP_TEAM9" class="datepicker" id="app_datepicker4" placeholder="mm/dd/yyyy">

                                                                </div>

                                                                <div>
                                                                    <label class="control-label " for="formInput198"  style="width:65%;"><font  size="4"><b>Global Groups:  Remove</b></font></label>
                                                                    <input type="radio" name="APP_TEAM10" class="global" value="Yes">Yes
                                                                    <input type="radio" name="APP_TEAM10" class="global" value="No">No
                                                                    <input type="radio" name="APP_TEAM10" class="global" value="NA">N/A
                                                                </div>

                                                                <div>
                                                                    <label class="control-label " for="formInput198"  style="width:65%;"><font  size="4"><b>Master Unique Identifier (MUI):  Remove</b></font></label>
                                                                    <input type="radio" name="APP_TEAM11" class="mui" value="Yes">Yes
                                                                    <input type="radio" name="APP_TEAM11" class="mui" value="No">No
                                                                    <input type="radio" name="APP_TEAM11" class="mui" value="NA">N/A
                                                                </div>
                                                            </div>





                                                            <div class="form-group hideclass" id="app_slo_data" style="display:none;">

                                                                <div>
                                                                    <h4><font color="red" size="5">APP SLO</font></h4>

                                                                    <label  class="control-label " for="formInput198" style="width:65%;"><font  size="4"><b>Submit request to change the apps status</b></font></label>
                                                                    <input type="radio" name="APP_SLO1" class="submit_request" value="Yes">Yes
                                                                    <input type="radio" name="APP_SLO1" class="submit_request" value="No">No
                                                                    <input type="radio" name="APP_SLO1" class="submit_request" value="NA">N/A

                                                                </div>

                                                                <div class="form-group APP_SLO2" style="display:none;" id="app_slo_submission_date1">

                                                                    <label  class="control-label " for="formInput198"><font color="green" size="4"><b>Submission Date</b></font></label>
                                                                    <input type="text" name ="APP_SLO2" class="datepicker" id="app_slo_datepicker1" placeholder="mm/dd/yyyy">

                                                                </div>

                                                                <div>
                                                                    <label  class="control-label " for="formInput198" style="width:65%;"><font size="4"><b>Request submitted to Retire the Service or Service is Retired</b></font></label>
                                                                    <input type="radio" name="APP_SLO3" class="retired" value="Yes">Yes
                                                                    <input type="radio" name="APP_SLO3" class="retired" value="No">No
                                                                    <input type="radio" name="APP_SLO3" class="retired" value="NA">N/A

                                                                </div>

                                                                <div class="form-group APP_SLO4" style="display:none;" id="app_slo_submission_date2">

                                                                    <label  class="control-label" for="formInput198"><font color="green" size="4"><b>Submission Date</b></font></label>
                                                                    <input type="text" name ="APP_SLO4" class="datepicker" id="app_slo_datepicker2" placeholder="mm/dd/yyyy">

                                                                </div>

                                                            </div>

                                                        </form>

                                                        <button type="button" class="btn btn-primary pull-right" onclick="Submit();">Save & Continue</button>
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


    <script>

        $(document).click(function(){
            $(".colour_change_tab").on({

                click: function(){
                    $(this).css("background-color", "red");
                    /* $(this).css("font-size", "24px");
                    $(this).css("color", "yellow");
                    $(this).css("font-family", "arial"); */
                }
            });
        });

    </script>

    <script>
        $(".capm").change(function()
            {
                //alert(this.value);
                if("capm_data"==this.value)
                {
                    $("capm_data").show();
                }
                else{
                    $(".capm_data").hide();
                }
            }
        );
    </script>



    <script>
        $(".status").change(function()
            {
                //alert(this.value);
                if("No"==this.value)
                {
                    $(".hint_1").show();
                }
                else{
                    $(".hint_1").hide();
                }
            }
        );
    </script>

    <script>
        $(".service").change(function()
            {
                //alert(this.value);
                if("No"==this.value)
                {
                    $(".hint_2").show();
                }
                else{
                    $(".hint_2").hide();
                }
            }
        );
    </script>

    <script>
        $(".change").change(function()
            {
                //alert(this.value);
                if("Yes"==this.value)
                {
                    $(".hint_3").show();
                }
                else{
                    $(".hint_3").hide();
                }
            }
        );
    </script>

    <script>
        $(".relationship").change(function()
            {
                //alert(this.value);
                if("Yes"==this.value)
                {
                    $(".addquestion").show();
                }
                else{
                    $(".addquestion").hide();
                    $(".hint_4").hide();
                }
            }
        );
    </script>
    <script>
        $(".item").change(function()
            {
                //alert(this.value);
                if("No"==this.value)
                {
                    $(".hint_4").show();
                }
                else{
                    $(".hint_4").hide();
                }
            }
        );
    </script>

    <script>
        function capm_fun(id)
        {
            $(".hideclass").hide();
            $(".tablink").removeClass("active");
            $("#"+id).addClass("active");
            $("#capm_data").toggle()
        }

        function et_team_fun(id)
        {
            $(".hideclass").hide();
            $(".tablink").removeClass("active");
            $("#"+id).addClass("active");
            $("#et_team_data").toggle()

        }
        function app_team_fun(id)
        {
            $(".hideclass").hide();
            $(".tablink").removeClass("active");
            $("#"+id).addClass("active");
            $("#app_team_data").toggle()
        }
        function app_slo_fun(id)
        {
            $(".hideclass").hide();
            $(".tablink").removeClass("active");
            $("#"+id).addClass("active");
            $("#app_slo_data").toggle()
        }
    </script>

    <script>

        $("input[name='ETPM4']").change(function ()
        {
            var value=$("input:radio[name='ETPM4']:checked").val();
            if(value=="Yes")
            {
                $('.ETPM5').show();
            }
            else
            {
                $('.ETPM5').hide();

            }
        });

        $("input[name='ETPM2']").change(function()
        {
            var value=$("input:radio[name='ETPM2']:checked").val();
            if(value=="Yes")
            {
                $('.ETPM3').show();
            }
            else
            {
                $('.ETPM3').hide();
            }
        });
    </script>

    <script>
        $("input[name='APP_TEAM2']").change(function()
        {
           var value=$("input:radio[name='APP_TEAM2']:checked").val();
            if(value=="Yes")
            {
              $('.APP_TEAM3').show();
            }
            else {
                $('.APP_TEAM3').hide();
            }
        });
        $("input[name='APP_TEAM4']").change(function()
        {
           var value=$("input:radio[name='APP_TEAM4']:checked").val();
            if(value=="Yes")
            {
              $('.APP_TEAM5').show();
            }
            else {
                $('.APP_TEAM5').hide();
            }
        });$("input[name='APP_TEAM6']").change(function()
        {
           var value=$("input:radio[name='APP_TEAM6']:checked").val();
            if(value=="Yes")
            {
              $('.APP_TEAM7').show();
            }
            else {
                $('.APP_TEAM7').hide();
            }
        });
        $("input[name='APP_TEAM8']").change(function()
        {
           var value=$("input:radio[name='APP_TEAM8']:checked").val();
            if(value=="Yes")
            {
              $('.APP_TEAM9').show();
            }
            else {
                $('.APP_TEAM9').hide();
            }
        });
$("input[name='APP_SLO1']").change(function()
        {
           var value=$("input:radio[name='APP_SLO1']:checked").val();
            if(value=="Yes")
            {
              $('.APP_SLO2').show();
            }
            else {
                $('.APP_SLO2').hide();
            }
        });
$("input[name='APP_SLO3']").change(function()
        {
           var value=$("input:radio[name='APP_SLO3']:checked").val();
            if(value=="Yes")
            {
              $('.APP_SLO4').show();
            }
            else {
                $('.APP_SLO4').hide();
            }
        });

    </script>

    <!-- <script>
    $(".capm").change(function()
            {
            //alert(this.value);
            if("capm"==this.value)
                {
                $(".capm_data").show();
                }
            else{
                $(".capm_data").hide();
            }
            }
                );
    </script> -->

    <!-- <script>
        $('.datepicker1').datepicker({
        format: mm/dd/yyyy,
        autoclose: true
        });
        </script> -->

    <script>
        $( function() {
            $( ".datepicker" ).datepicker();
        } );
    </script>
<script>
    var url_string=window.location.href;
    var url = new URL(url_string);
    var appname = url.searchParams.get("appname");
    var projname=url.searchParams.get("projectname");
    console.log("Application:",appname,"Project:",projname);
    function Submit() {
        var f = document.TableSubmitForm;
        f.method = "post";
        f.action = "DecommManageKeyMileStoneDbUpdateServlet?appname="+appname+"&prjname="+projname;
        f.submit();
    }
    $(document).ready(function(){
        $('#capm_data').show();
        $('#capm_tab_color').addClass('active');
        $.ajax({
            url: "DecommManageKeyMileStoneDataRetrieveServlet",
            type: 'POST',
            data: {ApplicationName:appname,ProjectName: projname},
            dataType: "json",
            success: function (data) {
                console.log("Data Retrieve json array----->",data);
                var value_tab_name = ['CAPM3','CAPM4','ETPM2','ETPM4','APP_TEAM2','APP_TEAM4','APP_TEAM6','APP_TEAM8','APP_SLO1','APP_SLO3'];
                var tab_hide_show =  ['hint_3','CAPM5','ETPM3','ETPM5','APP_TEAM3','APP_TEAM5','APP_TEAM7','APP_TEAM9','APP_SLO2','APP_SLO4'];
                var k = 0;
                var hint_no_tab = ['CAPM1','CAPM2','CAPM5'];
                var hint_hide_show = ['hint_1','hint_2','hint_4'];
                var n = 0;
                for(var i=0; i<data.length; i++) {
                    var tab_name =(data[i].Tab_Name).replace(' ','_');
                    var seq_num = data[i].Seq_Num;
                    var value = data[i].Tab_Name_Value;
                    console.log("data check-->",value_tab_name.includes(tab_name));
                    if (value_tab_name.includes(tab_name+seq_num)){
                        if(value=='Yes'){
                            $('.'+tab_hide_show[k]).show();
                        }
                        k++;
                    }
                    if(hint_no_tab.includes(tab_name+seq_num)){
                        if(value='No'){
                            $('.'+hint_hide_show[n]).show();
                        }
                        n++;
                    }
                    if(value==undefined){
                        value = "";
                    }
                    if(value.includes('/'))
                    {
                     $('input[name=' + tab_name + seq_num + ']').val(value);

                    }else {
                        console.log("All Values", value, data[i].Seq_Num);
                        /* console.log("All Values Index",data[i].Seq_Num);*/
                        if (value != "") {
                            var $radios = $('input:radio[name=' + tab_name + seq_num + ']');
                            $radios.filter('[value=' + value + ']').prop('checked', true);
                        }
                    }
                }
            },
            error: function (e) {
                console.log(e);
            }
        });
    });

</script>

    <!-- /.main-wrapper -->
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
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
    <script src="js/admin_module/admin_module_send_invites.js"></script>


</body>
</html>
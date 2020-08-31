<!DOCTYPE html>
<html lang="en">
<head id ="link_id">
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
    <%--<link href="css/themes/infragistics/infragistics.theme.css" rel="stylesheet" type="text/css" />--%>
    <link href="http://cdn-na.infragistics.com/igniteui/2019.1/latest/css/themes/infragistics/infragistics.theme.css" rel="stylesheet" />
    <link href="http://cdn-na.infragistics.com/igniteui/2019.1/latest/css/structure/infragistics.css" rel="stylesheet" />
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">

    <%--<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />--%>

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
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/css/bootstrap-multiselect.css">
    <%--<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css"/>
   <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>
--%>    <%--  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.bundle.min.js"></script>--%>
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

    #myModal1 {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    #modal-content1 {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 40%;
        height: 50%;
        overflow: scroll;
    }
    #myModaldelete {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    #modal-contentdelete1 {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 40%;
        height: 50%;
        overflow: scroll;
    }
    /* The Modal (background) */
    #myModal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content */
    #modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 40%;
        height: 70%;
        overflow: scroll;

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

    .mainframe
    {
        height: 30px;
    }
    .disaster_rec{
        height: 30px;
    }


</style>

<style>
    .scrollbar
    {

        height: 700px;

        overflow-y: auto;
    }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script>
$(document).click(function())
{

	alert("hi");
$("input[type='radio']").change(function()
{
if($(this).val()="answer_yes")
{
$(".add_question").show();
}
else
{
$(".add_question").hide();
}
});
});
</script> -->



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
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-ellipsis-v"></i>
                    </button>
                    <button type="button" class="navbar-toggle mobile-nav-toggle" >
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <!-- /.navbar-header -->
                <a class="navbar-brand" href="Project_List" id="sitetitle"></a>

                <div class="collapse navbar-collapse" id="navbar-collapse-1">

                    <!-- /.nav navbar-nav -->
                    <ul class="nav navbar-nav navbar-right">

                        <li><a href="#"><span id="nav_userid">&nbsp;</span>logged in as &nbsp;<span id='nav_role'></span></a></li>
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

                            <li class="nav-header">
                                <a href="AppEmphasize_EditProject.jsp"><span class="">App Emphasize Module</span></a>
                            </li>
                            <li class="has-children">
                                <a href="AppEmphasize_EditProject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav">
                                    <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                    <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a></li>
                                </ul>
                            </li>

                            <li class="has-children">
                                <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav">
                                    <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity</span></a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="AppEmphasize_PrioritizedApplications.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                            </li>

                            <li class="nav-header">
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
                            </li>
                            <li ><a href="Archive_Execution.jsp"><i class="fa fa-suitcase"></i> <span>Archive Execution Module</span></a>
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
                            <h2 class="title">Service Categories Checklist</h2>
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
                                        <h4 class="panel-title"> <a  data-parent="#panels1" > Service Categories Checklist  </a> </h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse">
                                        <div class="panel-body text-left">
                                            <form name="ServiceCategoriesForm" class="scrollbar">
                                            <div id="inputFields">
                                                <%--
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198">Service Categories</label>
                                                    <select style="width:100%;"

                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                        <option value="UNIX / Linux Server">UNIX / Linux Server</option>
                                                        <option value="Windows Server">Windows Server</option>
                                                    </select>


                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"><b>Data Bases</b> </label>
                                                    <select style="width:100%;"

                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                        <option value="DB2">DB2</option>
                                                        <option value="MS SQL">MS SQL</option>
                                                        <option value="MySQL">MySQL</option>
                                                        <option value="Oracle">Oracle</option>
                                                        <option value="Sybase">Sybase</option>
                                                    </select>

                                                </div>

                                                <div>
                                                    <label class="control-label" for="formInput198"><b>Storage</b></label>
                                                    <select style="width:100%;"

                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;
                                                    >
                                                        <option value="Storage - SAN">Storage - SAN</option>
                                                        <option value="Storage - NAS">Storage - NAS</option>
                                                        <option value="Storage - NAS Mounts">Storage - NAS Mounts</option>
                                                    </select>
                                                </div>
                                                <br>

                                                <div>
                                                    <label class="control-label" for="formInput198"><b>Products</b></label>
                                                    <select style="width:100%;"

                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                        <option value="AWS">AWS</option>
                                                        <option value="Azure">Azure</option>
                                                        <option value="Backups">Backups</option>
                                                        <option value="Citrix">Citrix</option>
                                                        <option value="DataStage (ETL)">DataStage (ETL)</option>
                                                        <option value="Desktop Software">Desktop Software</option>
                                                    </select>
                                                </div>
                                                <br>
                                                <div>
                                                    <label class="control-label" for="formInput198"><b>Services</b></label>
                                                    <select style="width:100%;"

                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                        <option value="DNS Entries">DNS Entries</option>
                                                        <option value="ECG - Electronic Customer Gateway (File Transfer)"> ECG - Electronic Customer Gateway (File Transfer) </option>
                                                        <option value="F5 / Load Balancing">F5 / Load Balancing</option>
                                                        <option value="Firewall Rules">Firewall Rules</option>
                                                        <option value="HA (High Availability)">HA (High Availability)</option>
                                                        <option value="IIS">IIS</option>
                                                        <option value="Job Control ">Job Control </option>
                                                        <option value="SharePoint">SharePoint</option>
                                                        <option value="SQL Analysis Services">SQL Analysis Services</option>
                                                        <option value="SQL Reporting Services  (SRS)">SQL Reporting Services  (SRS)</option>
                                                        <option value="SQL Server Integration Services  (SSIS)">SQL Server Integration Services  (SSIS)</option>
                                                        <option value="SSL Certificates">SSL Certificates</option>
                                                        <option value="Team Foundation Server (TFS)">Team Foundation Server (TFS)</option>
                                                        <option value="URLs">URLs</option>
                                                        <option value="Vignette (Web Content Management)">Vignette (Web Content Management)</option>
                                                        <option value="Web Analytics">Web Analytics</option>
                                                        <option value="WebSphere">WebSphere</option>
                                                        <option value="WMB">WMB</option>
                                                        <option value="WMQ">WMQ</option>
                                                    </select>
                                                </div>
                                                <br>
                                                <div class="multiple_entry">
                                                    <label><b>Others</b></label></br>
                                                    <input type="checkbox" class="mainframe_checkbox" value="mainframe_value" name="others1" onchange="valueChanged()">Mainframe </br>
                                                    <input type="checkbox" class="support_readiness_checkbox" value="support_readiness_value" name="others2" onchange="valueChanged2()">Support Readiness </br>
                                                    <input type="checkbox" class="desktop_software_checkbox" value="desktop_software_value" name="others3" onchange="valueChanged3()">Desktop Software </br>
                                                    <input type="checkbox" class="disaster_recovery_checkbox" value="disaster_recovery_value" name="others4" onchange="valueChanged4()">Disaster Recovery </br>
                                                    <input type="checkbox" class="citrix_checkbox" value="citrix_value" name="others5" onchange="valueChanged5()">Citrix </br>
                                                    <input type="checkbox" class="application_security_checkbox" value="application_security_value" name="others6" onchange="valueChanged1()">Application Security </br>
                                                    <input type="checkbox" class="final_backup_checkbox" value="final_backups_value" name="others7" onchange="valueChanged6()">Final Backups

                                                </div>--%>
                                            </div>                                     <!-- <button type="button" style="margin:5px;" class="btn btn-success pull-left" id="myBtn" onclick="addothers();">Add</button> -->
                                                <button type="button" style="margin:5px;" class="btn btn-success pull-left" id="myBtn" onclick="">Add</button>
                                                <%--<button type="button" style="margin:5px;" class="btn btn-warning pull-left" onclick="">Modify</button>--%>
                                               <%-- <button type="button" style="margin:5px;" class="btn btn-danger  pull-left" id="Deletebtn"
                                                        onclick="">Delete
                                                </button>--%>
                                                <button type="button" class="btn btn-primary pull-right" onclick="Submit();">Save & Continue</button>
                                            </form>
                                        </div>

                                        <!--End of Table Info -->
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

<div id="myModal" class="modal">

    <!-- Modal content -->
    <div id="modal-content">
        <span class="close">&times;</span>
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="label"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="project_name" name="project_name" value="">

                <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">


                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="idname"  name="idname" required>
                        </div>
                    </div>
                </div><br/>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="types" class="form-control" name="types" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row hidefield" id="check" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="number"  name="number1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="rdo" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="radio_number"  name="radio_number">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="drop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="drop_number"  name="drop_number" onChange="drp_dwn()">
                        </div>
                    </div>
                    <br/>
                </div>

                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo"></div>
                        </div>
                    </div>
                </div>
                <div id="options">
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo1"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo2"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="mandatory" class="form-control" name="mandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>
        <button type="button" id="submit" class="btn btn-primary" >Submit</button>
        <button type="button" onclick="window.location.href=''" class="btn btn-default">Cancel</button>
    </div>
</div>
<div id="myModaldelete" class="modal">

    <!-- Modal content -->
    <div class="modal-dialog" style="width:2000px">
        <div id="modal-contentdelete1">
            <%--<span class="close" style="color:white;">&times;</span>--%>
            <form name="DeleteForm">
                <div class="modal-header" style="background-color:rgb(52, 152, 219);">
                    <h1 style="color:white;">Delete Task</h1>
                </div>
                <div class="modal-body">
                    <p style="font-size:24px;">Are you sure, you want to delete this <span id="taskdelete"
                                                                                           style="font-size:24px;"></span>
                    <p style="font-size:24px;">input field permanently?</p>
                    <input type="hidden" id="sequence1"/>
                </div>
            </form>
            <div class="modal-footer">
                <button type="button" id="submit2" class="btn btn-primary" >Yes</button>
                <button type="button" onclick="window.location.href=''" class="btn btn-default">No</button>
            </div>
        </div>
    </div>

</div>
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
<!-- ========== THEME JS ========== -->

<script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>


<!-- ========== THEME JS ========== -->

<script>
    var url_string=window.location.href;
    var url = new URL(url_string);
    var appname = url.searchParams.get("appname");
    var projname=url.searchParams.get("projectname");
    console.log("Application:",appname,"Project:",projname);
    var mainframe_val=[];
    var modal = document.getElementById("myModal");

    // Get the button that opens the modal
    var btn = document.getElementById("myBtn");

    // Get the <span> element that closes the modal
    var span = document.getElementsByClassName("close")[0];

    // When the user clicks the button, open the modal
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks on <span> (x), close the modal
    span.onclick = function() {
        modal.style.display = "none";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    $(document).ready(function(){
        $.ajax({
            url: "DecommManageServiceCategoriesDataRetrieveServlet",
            type: 'POST',
            data: {ApplicationName:appname,ProjectName: projname},
            dataType: "json",
            success: function (data) {
                console.log("Data Retrieve json array----->",data);
                if (!$.isArray(data)) {
                    data = [data];
                }

                $.each(data, function(key, value){
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
                            "<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                            "</div>";
                        $('#inputFields').append(inputtext);
                    }
                    else if(Type=="Datepicker")
                    {
                        var inputdate="<div class='form-group'>" +
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                            "</div>";
                        $('#inputFields').append(inputdate);

                    }
                    else if(Type=="Dropdown")
                    {
                        var inputdrop= "<div class='form-group col-md-12'><label class='control-label col-sm-4' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                            "<select  id = 'hi' class='selectpicker col-sm-8' multiple data-live-search='true' value='"+Value+"' name='"+ColumnName+"'>";
                        var Options=value.options;
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
                        inputdrop +="</select></div>";
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
                            inputcheck += "<label class = 'control-label others' for = 'fromInput198'><input type='checkbox'  value = '"+option[i]+"' class = 'form-comtrol' id="+((option[i]+(i + 1)).replace(/\s/g,''))+ "' placeholder ='"+option[i]+"' name= '"+ColumnName+"' "+Checking+"/>" +
                                option[i]+"</label>&nbsp;&nbsp;";
                        }
                        inputcheck +="</div>";
                        $('#inputFields').append(inputcheck);
                        /*if (LabelName=="Others" && ColumnName=="ServiceCategories6"){
                        var others= "<div class='form-group'>\n" +
                            "<table  class='Mainframe hidetable' style='display:none;'>\n" +
                            "<tr>\n" +
                            "<td><b>MAINFRAME</b></td>\n" +
                            "<td>\n" +
                            "<select class=\"selectpicker multiselect-ui form-control style='width:100%;'\n>\n" +
                            "<option value='CICS Regions'>CICS Regions</option>\n" +
                            "<option value='DB2'>DB2</option>\n" +
                            "<option value='Endevor Flows'>Endevor Flows</option>\n" +
                            '<option value="HLQ\'s (high level qualifiers) to be eliminated">HLQ\'s (high level qualifiers) to be eliminated</option>\n' +
                            "<option value='IMS Regions'>IMS Regions</option>\n" +
                            "<option value='Mainframe  Storage '>Mainframe  Storage </option>\n" +
                            "<option value='Mainframe Batch Processing'>Mainframe Batch Processing</option>\n" +
                            "<option value='Mainframe Capacity'>Mainframe Capacity </option>\n" +
                            "<option value='Tape Media'>Tape Media</option>\n" +
                            "<option value='VSAM'>VSAM</option>\n" +
                            "</select>\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table style='display:none;' class='Support_Readiness hidetable'>\n" +
                            "<tr><td><b>SUPPORT READINESS</b></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td>\n" +
                            "<font color='blue'>  Is the application supported by the United Support Center (Help Desk) and/or\n" +
                            "IT Service Management (service/infrastructure performance monitoring)? </font></td>\n" +
                            "</td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='support' value='yes'>yes\n" +
                            "<input type='radio' name='support' value='No'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table style='display:none;' class='Disaster_Recovery hidetable'>\n" +
                            "<tr>\n" +
                            "<td><b>DISASTER RECOVERY</b></td>\n" +
                            "<td>\n" +
                            "<select style='width:100%'\n>\n" +
                            "<option value='Rapid Recovery '>Rapid Recovery </option>\n" +
                            "<option value='SRM'>SRM</option>\n" +
                            "<option value='Tier 0'>Tier 0</option>\n" +
                            "<option value='Tier 1'>Tier 1</option>\n" +
                            "<option value='Tier 2'>Tier 2</option>\n" +
                            "<option value='Legacy Recovery'>Legacy Recovery</option>\n" +
                            "<option></option>\n" +
                            "</select>\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table style='display:none;' class='Desktop_Software hidetable'>\n" +
                            "<tr>\n" +
                            "<td> <b>DESKTOP SOFTWARE</b> </td>\n" +
                            "<td></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td><font color='blue';> Is there any desktop or supporting desktop software? </font> </td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='desktop' value='yes'>yes\n" +
                            "<input type='radio' name='desktop' value='No'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table class='Citrix hidetable' style='display:none;'>\n" +
                            "<tr>\n" +
                            "<td><b>CITRIX</b></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td> <font color='blue';> Does the application utilize any Citrix environments? </font> </td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='citrix' value='yes'>yes\n" +
                            "<input type='radio' name='citrix' value='No'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table class='Application_Security hidetable' style='display:none;'>\n" +
                            "<tr>\n" +
                            "<td><b>APPLICATION SECURITY</b></td>\n" +
                            "</tr>\n" +
                            "<tr >\n" +
                            "<td> <font color='blue';> Does the application utilize Global Groups?</font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='citrix' class='citrix' value='answer_yes'>yes\n" +
                            "<input type='radio' name='citrix'  class='citrix' value='no'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "<tr class='add_question' style='display:none;'>\n" +
                            "<td><font color='blue';>Is the application in SECURE?</font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='citrix_1' class='citrix_1' value='answer_second_yes'>yes\n" +
                            "<input type='radio' name='citrix_1' class='citrix_1' value='no'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "<tr class='add_question_2' style='display:none;'>\n" +
                            "<td> <font color='blue';> Does the application have an Internally supported access mechanism or other not listed above\n" +
                            "( e.g., your own directory)?</font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='citrix_2' class='citrix_2' value='answer_thrid_yes' >Yes\n" +
                            "<input type='radio' name='citrix_2' class='citrix_2' value='no'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "<table style='display:none;' class='Final_Backups hidetable'>\n" +
                            "<tr>\n" +
                            "<td><b>FINAL BACKUPS</b></td>\n" +
                            "</tr>\n" +
                            "<tr>\n" +
                            "<td><font color='blue';> Are Final Backups Required?     </font></td>\n" +
                            "<td>\n" +
                            "<input type='radio' name='backup' class='backup' value='yes'>yes\n" +
                            "<input type='radio' name='backup' class='backup' value='no'>No\n" +
                            "</td>\n" +
                            "</tr>\n" +
                            "</table>\n" +
                            "</div>";
                            $('#inputFields').append(others);
                        }*/

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
                            inputdrop+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' value='"+option[i]+"' placeholder ='"+option[i]+"' name='"+ColumnName+"' "+Checking+"/>"+
                                option[i]+"</label>&nbsp;&nbsp;";
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
                            "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'></textarea>"+
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
                            inputcheck += "<label class = 'control-label others' for = 'fromInput198'><input type='checkbox'  value = '"+option[i]+"' class = 'form-comtrol "+ColumnName+"' id='"+((option[i]).replace(/\s/g,''))+ "' placeholder ='"+option[i]+"' name= '"+ColumnName+"' "+Checking+"/>" +
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
                                "<select id = 'hi' class='selectpicker'  data-live-search='true' value='"+Mainframe_value+"' name='Mainframe'>\n" +
                               /* "  <option>CICS Regions</option>\n" +
                                "  <option>DB2</option>\n" +
                                "  <option>Endevor Flows</option>\n" +
                                "  <option>HLQ\\'s (high level qualifiers) to be eliminated</option>\n" +
                                "  <option>IMS Regions</option>\n" +
                                "  <option>Mainframe  Storage</option>\n" +
                                "  <option>Mainframe Batch Processing</option>\n" +
                                "  <option>Mainframe Capacity</option>\n" +
                                "  <option>Tape Media</option>\n" +
                                "  <option>VSAM</option>\n" +*/
                                mainframeoptions+
                                "</select>"+
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
                                "<input type='radio' name='SupportReadiness' value='Yes'"+Support_Readiness_value_yes+">yes\n" +
                                "<input type='radio' name='SupportReadiness' value='No'"+Support_Readiness_value_No+">No\n" +
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
                                "<input type='radio' name='DesktopSoftware' value='Yes'"+Desktop_Software_value_Yes+">yes\n" +
                                "<input type='radio' name='DesktopSoftware' value='No'"+Desktop_Software_value_No+">No\n" +
                                "</td>\n" +
                                "</tr>\n" +
                                "</table>\n" +
                                "<table class='Disaster_Recovery hidetable' "+Disaster_Recovery_check+">\n" +
                                "<tr>\n" +
                                "<td><b>DISASTER RECOVERY</b></td>\n" +
                                "<td>\n" +
                               /* "<input class='form-control disaster_rec' name='DisasterRecovery' id='disaster_rec' value='"+Disaster_Recovery_value+"' placeholder='select...' value='' autocomplete='off' style='width:100%;'>\n" +*/
                                "<select class='selectpicker'  data-live-search='true' name='DisasterRecovery' value='"+Disaster_Recovery_value+"'>\n" +
                                disasterrecoveryoptions+
                                "</select>"+
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
                                "<input type='radio' name='Citrix' value='Yes'"+Citrix_value_Yes+">yes\n" +
                                "<input type='radio' name='Citrix' value='No'"+Citrix_value_No+">No\n" +
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
                                "<input type='radio' name='ApplicationSecurity1' class='citrix' value='Yes'"+Application_Security_value_Yes1+">yes\n" +
                                "<input type='radio' name='ApplicationSecurity1'  class='citrix' value='No'"+Application_Security_value_No1+">No\n" +
                                "</td>\n" +
                                "</tr>\n" +
                                "<tr class='add_question' "+Application_Security_Display2+">\n" +
                                "<td><font color='blue';>Is the application in SECURE?</font></td>\n" +
                                "<td>\n" +
                                "<input type='radio' name='ApplicationSecurity2' class='citrix_1' value='Yes'"+Application_Security_value_Yes2+">yes\n" +
                                "<input type='radio' name='ApplicationSecurity2' class='citrix_1' value='No' "+Application_Security_value_No2+">No\n" +
                                "</td>\n" +
                                "</tr>\n" +
                                "<tr class='add_question_2' "+Application_Security_Display3+">\n" +
                                "<td> <font color='blue';> Does the application have an Internally supported access mechanism or other not listed above\n" +
                                "( e.g., your own directory)?</font></td>\n" +
                                "<td>\n" +
                                "<input type='radio' name='ApplicationSecurity3' class='citrix_2' value='Yes'"+Application_Security_value_Yes3+" >Yes\n" +
                                "<input type='radio' name='ApplicationSecurity3' class='citrix_2' value='No'"+Application_Security_value_No3+">No\n" +
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
                                "<input type='radio' name='FinalBackups' class='backup' value='Yes'"+Final_Backups_value_Yes+">yes\n" +
                                "<input type='radio' name='FinalBackups' class='backup' value='No'"+Final_Backups_value_No+">No\n" +
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
                /*script+="<script>var mainframe_dropdown = [{Name:'CICS Regions'},{Name:'DB2'},{Name:'Endevor Flows'},{Name:'HLQ\\'s (high level qualifiers) to be eliminated'},{Name:'IMS Regions'},{Name:'Mainframe  Storage'},{Name:'Mainframe Batch Processing'},{Name:'Mainframe Capacity'},{Name:'Tape Media'},{Name:'VSAM'}, ];\n"+
                    "$('#mainframe').igCombo({\n" +
                    "width: 250," +
                    "dataSource: mainframe_dropdown," +
                    "textKey: 'Name'," +
                    "valueKey: 'Name'," +
                    "multiSelection: {" +
                    "enabled: true," +
                    "showCheckboxes: true" +
                    "},dropDownOrientation: 'bottom'}); <\/script>";
                script+="<script>var disaster_rec_dropdown = [{Name:'Rapid Recovery'},{Name:'SRM'},{Name:'Tier 0'},{Name:'Tier 1'},{Name:'Tier 2'},{Name:'Legacy Recovery'}, ];\n" +
                    "$('#disaster_rec').igCombo({\n" +
                    "width: 250,\n" +
                    "dataSource: disaster_rec_dropdown," +
                    "textKey: 'Name',"+
                    "valueKey: 'Name'," +
                    "multiSelection: {" +
                    "enabled: true," +
                    "showCheckboxes: true" +
                    "},dropDownOrientation: 'bottom'});*/
                $('#scripttag').append(script);
                },
            error: function (e) {
                console.log(e);
            }
        });

    });
    $(document).ready(function(){
        for(var i=0;i<mainframe_val.length;i++) {
            $('#mainframe').igCombo("values", mainframe_val[i]);
        }
    $.ajax({
        url: "DecommManageServiceCategoriesDataRetrieveOthersServlet",
        type: 'POST',
        data: {ApplicationName:appname,ProjectName: projname},
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve json array----->",data);
        },
        error: function (e) {
            console.log(e);
        }
    });
    });

</script>
<script>
    // Get the modal
    var modal2 = document.getElementById("myModaldelete");

    // Get the button that opens the modal
    var btn2 = document.getElementsByClassName("deletepopup");

    // Get the <span> element that closes the modal
    var span2= document.getElementsByClassName("close")[1];

    // When the user clicks the button, open the modal
    $('.deletepopup').click(function() {
        alert("Testing index"+$(this).index('.deletepopup'));
        modal2.style.display = "block";
    });
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal2) {
            modal2.style.display = "none";
        }
    }
    $('#Deletebtn').click(function()
    {
        $(".hidepencil").hide();
        $(".hidedelete").toggle();
    });
    $('#Modifybtn').click(function()
    {
        $(".hidedelete").hide();
        $(".hidepencil").toggle();
    });

    $('#submit').click(function() {
        var labelname = $('#label').val();
        var columnname = $('#idname').val();
        var type = $('#types').val();
        var mandatory = $('#mandatory').val();
        var num = 1;
        var options = "";
        if (type == "Check box") {
            num = $('#number').val();
            var length = $('.checkclass').length;
            for (var i = 1; i <= length; i++) {
                var checklabel = $('#label' + i).val();
                options += checklabel + ",";
            }
        } else if (type == "Radio box") {
            num = $('#radio_number').val();
            var length = $('.radioclass').length;
            for (var i = 1; i <= length; i++) {
                var radiolabel = $('#Rlabel' + i).val();
                options += radiolabel + ",";
            }

        } else if (type == "Dropdown") {
            num = $('#drop_number').val();
            var length = $('.dropclass').length;
            for (var i = 1; i <= length; i++) {
                var drplabel = $('#drp_label' + i).val();
                options += drplabel + ",";
            }

        }
        options=options.substring(0,options.length-1);
    $.ajax({
        url: "DecommManageServiceCategoriesAddServlet",
        type: 'POST',
        data: {ApplicationName:appname,ProjectName: projname,LabelName:labelname,ColumnName:columnname,Type:type,Mandatory:mandatory,Number:num,Options:options},
        dataType: "json",
        success: function (data) {
            var required = "";
            console.log("data add---->",data);
            var num=parseInt($('.editpopup').length)+1;
            var required_field = "";
            if (data.Mandatory == "Yes"){
                required_field = "class = 'required_fie'";
            }
            if (data.CheckExistance == true)
            {
                alert("Alredey Label or Column name Existed ");
            }
            else if(data.Type=="Text box")
            {
                var inputtext="<div class='form-group'>"+
                    "<label class='control-label' for='formInput198'><div "+required_field+">"+data.LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                    "<input type='text' class='form-control' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
                    "</div>";
                $('#inputFields').append(inputtext);
            }
            else if(data.Type=="Datepicker")
            {
                var inputdate="<div class='form-group'>"+
                    "<label class='control-label' for= 'formInput198'><div "+required_field+">"+data.LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                    "<input type='text' class='form-control datepicker1' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
                    "</div>";
                $('#inputFields').append(inputdate);
                var script="<script>$('.datepicker1').datepicker({\n" +
                    "format: \"mm/dd/yyyy\",\n" +
                    "autoclose: true\n" +
                    "});<\/script>";
                $('#scripttag').append(script);
            }
            else if(data.Type=="Radio box")
            {
                var input="";
                input+= "<div class='form-group'>"+
                    "<label class='control-label' for= 'formInput198'><div "+required_field+">"+data.LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
                var Options=data.Options;
                //var sub_option = Options.substring(0, Options.length - 1);
                var option=Options.split(",");
                for (var i=0; i<option.length; i++){

                    input+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id='"+option[i]+(i+1)+"' placeholder ='"+option[i]+"' name='"+data.ColumnName+num+"' value='"+option[i]+"' />"+
                        option[i]+"</label>";

                }
                input +="</div>";
                $('#inputFields').append(input);
            }
            else if(data.Type=="Check box")
            {
                var input="";
                input+= "<div class='form-group'>"+
                    "<label class='control-label' for= 'formInput198'><div "+required_field+">"+data.LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
                var Options=data.Options;
                //var sub_option = Options.substring(0, Options.length - 1);
                var option=Options.split(",");
                for (var i=0; i<option.length; i++) {

                    input += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value='"+option[i]+"' name='" + data.ColumnName+num+"'/>" +
                        option[i] + "</label>";
                }
                input +="</div>";
                $('#inputFields').append(input);
            }
            else if(data.Type=="Dropdown")
            {
                var select="";
                select+= "<div class='form-group'><label class='control-label' for= 'formInput198'><div "+required_field+">"+data.LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                    "<select style = 'width:100%;' name = "+data.ColumnName+num+">";
                var Options=data.Options;
                var sub_option = Options.substring(0, Options.length - 1);
                var option=sub_option.split(",");
                for(var i=0;i<option.length;i++) {
                    select += "<option label=" + option[i] + " class='control-label' for= 'formInput198' >" + option[i] + "</option>";
                }
                select +="</select></div>";
                $('#inputFields').append(select);
            }
        },
        error: function (e) {
            console.log(e);
        }
    });
    });
    $('#submit2').click(function(){
        var deleteseq=parseInt($('#sequence1').val())+1;
        var f=document.DeleteForm;
        f.method = "post";
        f.action = "DecommManagerServiceCategoriesDeleteServlet?ApplicationName="+appname+"&ProjectName="+projname+"&DeleteNumber="+deleteseq;
        f.submit();
    });
</script>
<script>
    $('#types').change(function()
    {
        var type=$('#types').val();
        //alert('Type--> '+type);
        $(".hidefield").hide();
        if(type=="Check box")
        {
            $('#check').show();


        }
        else if(type=="Radio box")
        {
            $('#rdo').show();

        }
        else if(type=="Dropdown")
        {
            $('#drop').show();
        }
        //alert('types--->'+type);
    });
    $('#radio_number').change(function(){
        var count=$('#radio_number').val();
        var s="";
        for(var i=1;i<=count;i++) {
            s += '<label class="hidefield">Radiobox Label' + i + ':</label><input type="text" class="form-control hidefield radioclass" id="Rlabel'+i+'" name="Rlabel' + i + '"><br/>'; //Create one textbox as HTML
        }
        $('#options').html(s);
    });
    $('#number').change(function()
    {
        var count=$('#number').val();
        var s="";
        for(var i = 1; i <=count; i++) {
            s+= '<label class="hidefield">Checkbox Label'+i +':</label><input type="text" class="form-control hidefield checkclass" id="label'+i+'" name="label'+i+'"><br/>'; //Create one textbox as HTML
        }
        $('#options').html(s);
    });
    $('#drop_number').change(function()
    {
        var drop=$('#drop_number').val();
        /*console.log('drop---> '+drop);
        alert('drop---> '+drop);*/
        var s="";
        for(var i=1;i<=drop;i++)
        {
            s+='<label class="hidefield">Options Label'+i +':</label><input type="text" class="form-control hidefield dropclass" id="drp_label'+i+'" name="drp_label'+i+'"><br/>';
        }
        $('#options').html(s);
    });
    function Submit(){
        //alert("Hello");
        var name = $('#Mainframe').attr('name');
        var val = [];
        $. each($("input[name='"+name+"']:checked"), function(){
            val. push($(this). val());
        });
        /*alert("hiiiiiiiiiiii "+val);*/
        console.log("Testing_Process: ",val);
        var classlength = $('.editpopup').length;
        var f = document.ServiceCategoriesForm;
        f.method = "post";
        f.action = "DecommManageSerivceCategoriesDBUpdateServlet?appname="+appname+"&prjname="+projname+"&classlength="+classlength+"&OthersVal"+val;
        f.submit();
    }
</script>
<div id ='scripttag'>

</div>

<script src="http://cdn-na.infragistics.com/igniteui/2019.1/latest/js/infragistics.core.js"></script>
<script src="http://cdn-na.infragistics.com/igniteui/2019.1/latest/js/infragistics.lob.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
</body>

</html>
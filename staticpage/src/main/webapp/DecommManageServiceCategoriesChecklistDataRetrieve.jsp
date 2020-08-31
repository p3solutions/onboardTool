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
    .scroll{
        overflow-x: scroll;
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
                                            <form name="ChecklistForm">

                                                <div class="form-group">

                                                    <div>
                                                        <div style="overflow-x:scroll;">
                                                        <h3>SERVICES - ENVIRONMENT INFORMATION</h3>
                                                        <table class="table table-bordered hidetable CrossApplicationTeamProjectManagerClass" id="mytable">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">Label</th>
                                                                <th scope="col" style="color:white;">Data</th>
                                                                <th scope="col" style="color:white;">Dev</th>
                                                                <th scope="col" style="color:white;">Test</th>
                                                                <th scope="col" style="color:white;">Stage</th>
                                                                <th scope="col" style="color:white;">Prod</th>
                                                                <th scope="col" style="color:white;">Additional Comments</th>
                                                            </tr>
                                                            </thead >
                                                        </table>
                                                        </div>
                                                        <div id="mytable_1" class = "scroll">
                                                            <h4>OTHERS</h4>
                                                            <table class="table table-bordered hidetable" id="mytable1">
                                                                <thead style="color:white;background-color:DodgerBlue;">
                                                                <tr >
                                                                    <th scope="col" style="color:white;">Label</th>
                                                                    <th scope="col" style="color:white;">Data</th>
                                                                    <th scope="col" style="color:white;">Values</th>
                                                                    <th scope="col" style="color:white;">Dev</th>
                                                                    <th scope="col" style="color:white;">Test</th>
                                                                    <th scope="col" style="color:white;">Stage</th>
                                                                    <th scope="col" style="color:white;">Prod</th>
                                                                    <th scope="col" style="color:white;">Comments</th>
                                                                </tr>
                                                                </thead>
                                                                <tr class = "Mainframe hiderow">
                                                                    <td scope="col" style="color:black;">MAINFRAME</td>
                                                                    <td></td>
                                                                    <td> <input type="textbox" id="Mainframe1" name = "Mainframe" readonly> </td>
                                                                    <td> <input type="textbox" id="dev_mainframe" name = "Mainframe_dev"> </td>
                                                                    <td> <input type="textbox" id="test_mainframe" name = "Mainframe_test"> </td>
                                                                    <td> <input type="textbox" id="stage_mainframe" name = "Mainframe_stage"> </td>
                                                                    <td> <input type="textbox" id="prod_mainframe" name = "Mainframe_prod"> </td>
                                                                    <td> <textarea maxlength='50' id="comment_mainframe" name = "Mainframe_comment"></textarea> </td>
                                                                </tr>

                                                                <tr class = "SupportReadiness hiderow">
                                                                    <td scope="col" style="color:black;">SUPPORT READINESS</td>
                                                                    <td> Is the application supported by the United Support Center (Help Desk)
                                                                        and/or IT Service Management (service/infrastructure performance monitoring)? </td>
                                                                    <td>
                                                                        <input type="radio" name="SupportReadiness" value="Yes" disabled>Yes
                                                                        <input type="radio" name="SupportReadiness" value="No" disabled>No
                                                                    </td>
                                                                    <td> <input type="textbox" id="dev_support" name = "SupportReadiness_dev"> </td>
                                                                    <td> <input type="textbox" id="test_support" name =  "SupportReadiness_test"> </td>
                                                                    <td> <input type="textbox" id="stage_support" name = "SupportReadiness_stage"> </td>
                                                                    <td> <input type="textbox" id="prod_support" name = "SupportReadiness_prod"> </td>
                                                                    <td> <textarea maxlength='50' id="comment_support" name = "SupportReadiness_comment"></textarea> </td>
                                                                </tr>

                                                                <tr class = "DisasterRecovery hiderow">
                                                                    <td scope="col" style="color:black;">DISASTER RECOVERY
                                                                    </td>
                                                                    <td></td>
                                                                    <td> <input type="textbox" id="DisasterRecovery" name = "DisasterRecovery" readonly> </td>
                                                                    <td> <input type="textbox" id="dev_disaster" name = "DisasterRecovery_dev"> </td>
                                                                    <td> <input type="textbox" id="test_disaster" name = "DisasterRecovery_test"> </td>
                                                                    <td> <input type="textbox" id="stage_disaster" name = "DisasterRecovery_stage"> </td>
                                                                    <td> <input type="textbox" id="prod_disaster" name = "DisasterRecovery_prod"> </td>
                                                                    <td> <textarea maxlength='50' id="comment_disaster" name = "DisasterRecovery_comment"></textarea> </td>
                                                                </tr>

                                                                <tr class = "DesktopSoftware hiderow">
                                                                    <td scope="col" style="color:black;">DESKTOP SOFTWARE</td>
                                                                    <td> Is there any desktop or supporting desktop software? </td>
                                                                    <td>
                                                                        <input type="radio" name="DesktopSoftware" value="Yes" disabled>Yes
                                                                        <input type="radio" name="DesktopSoftware" value="No" disabled>No
                                                                    </td>
                                                                    <td> <input type="textbox" id="dev_software" name = "DesktopSoftware_dev"> </td>
                                                                    <td> <input type="textbox" id="test_software" name = "DesktopSoftware_test"> </td>
                                                                    <td> <input type="textbox" id="stage_software" name = "DesktopSoftware_stage"> </td>
                                                                    <td> <input type="textbox" id="prod_software" name = "DesktopSoftware_prod"> </td>
                                                                    <td> <textarea maxlength='50' id="comment_software" name = "DesktopSoftware_comment"></textarea></td>
                                                                </tr>

                                                                <tr class = "Citrix hiderow">
                                                                    <td scope="col" style="color:black;">CITRIX</td>
                                                                    <td> Does the application utilize any Citrix environments? </td>
                                                                    <td>
                                                                        <input type="radio" name="Citrix" value="Yes" disabled>Yes
                                                                        <input type="radio" name="Citrix" value="No" disabled>No

                                                                    </td>
                                                                    <td> <input type="textbox" id="dev_citrix" name = "Citrix_dev"> </td>
                                                                    <td> <input type="textbox" id="test_citrix" name = "Citrix_test"> </td>
                                                                    <td> <input type="textbox" id="stage_citrix" name = "Citrix_stage"> </td>
                                                                    <td> <input type="textbox" id="prod_citrix" name = "Citrix_prod"> </td>
                                                                    <td> <textarea maxlength='50' id="comment_citrix" name = "Citrix_comment"></textarea> </td>
                                                                </tr>



                                                                <tr class = "ApplicationSecurity hiderow">
                                                                    <td scope="col" style="color:black;">APPLICATION SECURITY</td>
                                                                    <td><div class="ApplicationSecurity1"> Does the application utilize Global Groups? <br></div>
                                                                        <div class="ApplicationSecurity2">
                                                                            Is the application in SECURE? <br></div>
                                                                        <div class="ApplicationSecurity3">
                                                                            Does the application have an Internally supported access mechanism or other not listed above
                                                                            ( e.g., your own directory)?</div>
                                                                    </td>
                                                                    <td><div class="ApplicationSecurity1"><input type="radio" name="ApplicationSecurity1" value="Yes" disabled> Yes
                                                                        <input type="radio" name="ApplicationSecurity1" value="No" disabled>No</div>
                                                                        <br><br><br>
                                                                        <div class="ApplicationSecurity2">
                                                                            <input type="radio" name="ApplicationSecurity2" value="Yes" disabled>Yes
                                                                            <input type="radio" name="ApplicationSecurity2" value="No" disabled>No</div>
                                                                        <br><br><br>
                                                                        <div class="ApplicationSecurity3">
                                                                            <input type="radio" name="ApplicationSecurity3" value="Yes" disabled>Yes
                                                                            <input type="radio" name="ApplicationSecurity3" value="No" disabled>No
                                                                        </div>
                                                                    </td>
                                                                    <td> <input type="textbox" id="dev_citrix" name = "ApplicationSecurity_dev"> </td>
                                                                    <td> <input type="textbox" id="test_security" name = "ApplicationSecurity_test"> </td>
                                                                    <td> <input type="textbox" id="stage_security" name = "ApplicationSecurity_stage"> </td>
                                                                    <td> <input type="textbox" id="prod_security" name = "ApplicationSecurity_prod"> </td>
                                                                    <td> <textarea maxlength='50' id="comment_security" name = "ApplicationSecurity_comment"></textarea> </td>
                                                                </tr>

                                                                <tr class = "FinalBackups hiderow">

                                                                    <td scope="col" style="color:black;">FINAL BACKUPS</td>
                                                                    <td> Are Final Backups Required? </td>
                                                                    <td>
                                                                        <input type="radio" name="FinalBackups" value="Yes" disabled> yes
                                                                        <input type="radio" name="FinalBackups" value="No" disabled>No

                                                                    </td>
                                                                    <td> <input type="textbox" id="dev_final" name = "FinalBackups_dev"> </td>
                                                                    <td> <input type="textbox" id="test_final" name = "FinalBackups_test"> </td>
                                                                    <td> <input type="textbox" id="stage_final" name = "FinalBackups_stage"> </td>
                                                                    <td> <input type="textbox" id="prod_final" name = "FinalBackups_prod"> </td>
                                                                    <td> <textarea maxlength='50' id="comment_final" name = "FinalBackups_comment"></textarea> </td>
                                                                </tr>

                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>

















                                                <button type="button" class="btn btn-primary pull-right" id = "save">Save & Continue</button>
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
    $(document).ready(function() {
        $.ajax({
            url: "DecommManageServiceCategoriesServerServlet",
            type: 'POST',
            data: {ApplicationName: appname, ProjectName: projname},
            dataType: "json",
            success: function (data) {
                console.log("Data Retrieve json array----->", data);
                var application_security_check=true;
                for(var i=0; i<data[0].length; i++){
                    var label = data[0][i].LabelName;
                    var label_nospace = label.replace(" ","");
                    var tr  = "<tr>\n" +
                        "<td> <label>"+label+"</label></td>\n" +
                        "<td><input type='textbox' id='"+label_nospace+i+"' name='"+label_nospace+i+"' value='"+data[0][i].Value+"' readonly></td>\n" +
                        "<td> <input type='textbox' id='"+label_nospace+"_dev"+i+"' name='"+label_nospace+"_dev"+i+"' value='"+data[0][i].Dev+"'> </td>\n" +
                        "<td> <input type='textbox' id='"+label_nospace+"_test"+i+"' name='"+label_nospace+"_test"+i+"' value='"+data[0][i].Test+"'> </td>\n" +
                        "<td> <input type='textbox' id='"+label_nospace+"_stage"+i+"' name='"+label_nospace+"_stage"+i+"' value='"+data[0][i].Stage+"'> </td>\n" +
                        "<td> <input type='textbox' id='"+label_nospace+"_prod"+i+"' name='"+label_nospace+"_prod"+i+"' value='"+data[0][i].Prod+"'> </td>\n" +
                        "<td> <textarea maxlength='50' id='"+label_nospace+"_comment"+i+"' name='"+label_nospace+"_comment"+i+"' >"+data[0][i].Comment+"</textarea></td>\n" +
                        "</tr>";
                    $('#mytable').append(tr);
                }
                $(".hiderow").hide();
                for(var j=0;j<data[1].length;j++)
                {
                    var others_name=data[1][j].Others;
                    var class_others=others_name.replace(" ","");
                    var other_values = data[1][j].Value;
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
                            var AppSec1_value = data[1][j].Value;
                            var AppSec2_value = data[1][j + 1].Value;
                            var AppSec3_value = data[1][j + 2].Value;
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
                for(var k=0;k<data[2].length;k++)
                {
                    var options=data[2][k].Options;
                    var value=data[2][k].Value;
                    var label=data[2][k].label;
                    var label_nospace=label.replace(" ","");
                    var type=data[2][k].type;

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
                        inputcheck+="<td> <input type='textbox' id='"+label_nospace+"_dev' style='width:66%;' name='ServiceCategoriesSecondTable_dev"+k+"' value='"+data[2][k].Dev+"'> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_test' style='width:66%;' name='ServiceCategoriesSecondTable_test"+k+"' value='"+data[2][k].Test+"'> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_stage' style='width:66%;' name='ServiceCategoriesSecondTable_stage"+k+"' value='"+data[2][k].Stage+"'> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_prod' style='width:66%;' name='ServiceCategoriesSecondTable_prod"+k+"' value='"+data[2][k].Prod+"'> </td>\n"+
                            "<td> <textarea maxlength='50' id='"+label_nospace+"_comment' name='ServiceCategoriesSecondTable_comment"+k+"'>"+data[2][k].Comment+"</textarea></td></tr>";

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
                        inputcheck+="<td> <input type='textbox' id='"+label_nospace+"_dev' style='width:66%;' name='ServiceCategoriesSecondTable_dev"+k+"' value='"+data[2][k].Dev+"'> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_test' style='width:66%;' name='ServiceCategoriesSecondTable_test"+k+"' value='"+data[2][k].Test+"'> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_stage' style='width:66%;' name='ServiceCategoriesSecondTable_stage"+k+"' value='"+data[2][k].Stage+"'> </td>\n" +
                            "<td> <input type='textbox' id='"+label_nospace+"_prod' style='width:66%;' name='ServiceCategoriesSecondTable_prod"+k+"' value='"+data[2][k].Prod+"'> </td>\n"+
                            "<td> <textarea maxlength='50' id='"+label_nospace+"_comment' name='ServiceCategoriesSecondTable_comment"+k+"'>"+data[2][k].Comment+"</textarea></td></tr>";

                        $('#mytable1').append(inputcheck);
                    }
                }
              for (var m=0; m<data[1].length; m++){
                  var value = data[1][m].Others;
                  var value_nospace = value.replace(" ","");
                  $('input[name="'+value_nospace+'_dev"]').val(data[1][m].Dev);
                  $('input[name="'+value_nospace+'_test"]').val(data[1][m].Test);
                  $('input[name="'+value_nospace+'_stage"]').val(data[1][m].Stage);
                  $('input[name="'+value_nospace+'_prod"]').val(data[1][m].Prod);
                  $('textarea[name="'+value_nospace+'_comment"]').val(data[1][m].Comment);
              }
                /* var data_value = ['Service Categories','Data Bases','Storage','Products','Services'];
                 var multidropdown=['Mainframe'];
                 var Support_Readiness_value_yes="";
                 var Support_Readiness_value_No="";
                 for (var i=0; i<data.length; i++){
                     var label_name = data[i].LabelName;
                     if(data_value.includes(label_name)){
                         var lab_name_rep = label_name.replace(' ','');
                         $('#'+lab_name_rep).val(data[i].Value);
                     }
                     else if(label_name=='Others')
                     {
                         $(".hiderow").hide();
                         for(var j=0;j<data[i].OthersJsonArray.length;j++)
                         {
                             var others_name=data[i].OthersJsonArray[j].Others;
                             var class_others=others_name.replace(" ","");
                             var other_values = data[i].OthersJsonArray[j].Value;
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
                                var AppSec1_value=data[i].OthersJsonArray[j].values[0].Value;
                                 var AppSec2_value=data[i].OthersJsonArray[j].values[1].Value;
                                 var AppSec3_value=data[i].OthersJsonArray[j].values[2].Value;
                                if(AppSec1_value=="Yes")
                                {

                                $(".ApplicationSecurity2").show();
                                if(AppSec2_value=="Yes")
                                {
                                    $(".ApplicationSecurity3").show();
                                    if(AppSec3_value=="Yes")
                                    {

                                    }
                                    else {

                                    }
                                }
                                else {
                                    $(".ApplicationSecurity3").hide();
                                }
                                }
                                else {
                                    $(".ApplicationSecurity2").hide();
                                    $(".ApplicationSecurity3").hide();
                                }
                                 var $val1=$('input[name="ApplicationSecurity1"]');
                                 $val1.filter('[value='+AppSec1_value+']').prop('checked', true);
                                 var $val2=$('input[name="ApplicationSecurity2"]');
                                 $val2.filter('[value='+AppSec2_value+']').prop('checked', true);
                                 var $val3=$('input[name="ApplicationSecurity3"]');
                                 $val3.filter('[value='+AppSec3_value+']').prop('checked', true);

                             }
                             else {
                                 var $radios = $('input:radio[name='+class_others+']');
                                 $radios.filter('[value=' + other_values + ']').prop('checked', true);
                             }
                         }
                     }

                 }*/
            },
            error: function (e) {
                console.log(e);
            }
        });
    });

    $.ajax({
        url: "DecommManageSerCatCheckDtRetrieveServlet",
        type: 'POST',
        data: {ApplicationName: appname, ProjectName: projname},
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve Json array in second ajax----->", data);
            var Others_value = '';
            for(var i=0; i<data.length; i++){
                var others = (data[i].others).replace(' ','');
                $('input[name ="'+others+'_dev"]').val(data[i].Dev);
                $('input[name ="'+others+'_test"]').val(data[i].Test);
                $('input[name ="'+others+'_stage"]').val(data[i].Stage);
                $('input[name ="'+others+'_prod"]').val(data[i].Prod);
                $('input[name="'+others+'_comment"]').val(data[i].Comment);
            }
        },
        error: function (e) {
            console.log(e);
        }
    });

    $('#save').click(function(){

        var f = document.ChecklistForm;
        f.method = "post";
        f.action ="DecommManageSerCatCheckDtRetrieveSaveServlet?ApplicationName="+appname+"&ProjectName="+projname;
        f.submit();
    });

</script>


<script src="http://cdn-na.infragistics.com/igniteui/2019.1/latest/js/infragistics.core.js"></script>
<script src="http://cdn-na.infragistics.com/igniteui/2019.1/latest/js/infragistics.lob.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-multiselect/0.9.13/js/bootstrap-multiselect.js"></script>
</body>

</html>
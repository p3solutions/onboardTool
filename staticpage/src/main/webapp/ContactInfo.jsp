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
                                    <li><a href="Intake_Business.jsp" > <span>Archive Requirements</span></a></li>
                                    <li><a href="Decomm_Requirements_Applications.jsp" > <span>Decomm Requirements</span></a></li>
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
                            <h2 class="title">Decomm Requirements</h2>
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
                                        <h4 class="panel-title"> <a  data-parent="#panels1" > Contact Info  </a> </h4>
                                    </div>
                                    <br>
                                    <div align="center">



                                        <div class="row">
                                            <div class="col-sm-4 form-group" align="right">
                                                <label><font size="4"><b> USER </b> </font><span
                                                        class="glyphicon glyphicon-asterisk"></span></label></div>
                                                <div class="col-sm-4">
                                                    <select id="dates-field2"
                                                            class="selectpicker multiselect-ui form-control"
                                                            multiple="multiple"
                                                            data-show-subtext="true"
                                                            data-live-search="true"
                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>

                                                        <option>
                                                            Cross-Application Team Project Manager
                                                        </option>
                                                        <option id ="Service_Level">
                                                            Service Level Owner
                                                        </option>
                                                        <option>
                                                            Application Contact/SME
                                                        </option>
                                                        <option>
                                                            IT/Application Owner
                                                        </option>
                                                        <option>
                                                            Application Business Owner
                                                        </option>
                                                        <option>
                                                            IT Legacy Application Owner
                                                        </option>
                                                        <option>
                                                            Enterprise Technology Project Manager
                                                        </option>
                                                        <option>
                                                            Enterprise Technology System Engineer
                                                        </option>

                                                    </select>
                                                </div>
                                            </div>



                                        <div id="collapse2" class="panel-collapse">
                                            <div class="panel-body text-left">
                                                <!-- Table Info -->
                                               <form name="TableSubmitForm" action="/action_page.php">
                                                <div class="form-group">
                                                    <label class="control-label hidetable CrossApplicationTeamProjectManagerClass" for="formInput198"><div class="required_fie"> Cross-Application Team Project Manager</div></label>
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered hidetable CrossApplicationTeamProjectManagerClass" id="mytable">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">User Name</th>
                                                                <th scope="col" style="color:white;">Email</th>
                                                                <th scope="col" style="color:white;">User Id</th>
                                                                <th scope="col" style="color:white;">Contact Number</th>
                                                                <th scope="col" style="color:white;"></th>
                                                            </tr>
                                                            </thead >
                                                            <tbody id="CrossApplicationTeamProjectManager">
                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary hidetable CrossApplicationTeamProjectManagerClass" id = "CrossApplicationTeamProjectManagerAdd" onclick="addrow(this.id);">Add</button>
                                                    </div>
                                                </div>

                                                <!--End of Table Info -->

                                                <!-- Table Info -->

                                                <div class="form-group">
                                                    <label class="control-label hidetable ServiceLevelOwnerClass" for="formInput198">Service Level Owner</label>
                                                    <div class="table-responsive ">

                                                        <table class="table table-bordered hidetable ServiceLevelOwnerClass">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">User Name</th>
                                                                <th scope="col" style="color:white;" >Email</th>
                                                                <th scope="col" style="color:white;">User Id</th>
                                                                <th scope="col" style="color:white;">Contact Number</th>
                                                                <th scope="col" style="color:white;"></th>

                                                            </tr>
                                                            </thead>
                                                            <tbody id="ServiceLevelOwner">



                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary hidetable ServiceLevelOwnerClass" id = "ServiceLevelOwnerAdd" onclick="addrow(this.id);">Add</button>
                                                    </div>
                                                </div>

                                                <!--End of Table Info -->

                                                <div class="form-group">
                                                    <label class="control-label hidetable ApplicationContactSMEClass" for="formInput198"><div class="required_fie"> Application Contact/SME</div></label>
                                                    <div class="table-responsive">

                                                        <table class="table table-bordered hidetable ApplicationContactSMEClass">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">User Name</th>
                                                                <th scope="col" style="color:white;">Email</th>
                                                                <th scope="col" style="color:white;">User Id</th>
                                                                <th scope="col" style="color:white;">Contact Number</th>
                                                                <th scope="col" style="color:white;"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="ApplicationContactSME">


                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary hidetable ApplicationContactSMEClass" id = "ApplicationContactSMEAdd" onclick="addrow(this.id);">Add</button>
                                                    </div>
                                                </div>



                                                <div class="form-group">
                                                    <label class="control-label hidetable ITApplicationOwnerClass" for="formInput198"> IT/Application Owner</label>
                                                    <div class="table-responsive">

                                                        <table class="table table-bordered hidetable ITApplicationOwnerClass">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">User Name</th>
                                                                <th scope="col" style="color:white;">Email</th>
                                                                <th scope="col" style="color:white;">User Id</th>
                                                                <th scope="col" style="color:white;">Contact Number</th>
                                                                <th scope="col" style="color:white;"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="ITApplicationOwner">

                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary hidetable ITApplicationOwnerClass" id = "ITApplicationOwnerAdd" onclick="addrow(this.id);">Add</button>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label hidetable ApplicationBusinessOwnerClass" for="formInput198"> Application Business Owner</label>
                                                    <div class="table-responsive">

                                                        <table class="table table-bordered hidetable ApplicationBusinessOwnerClass">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">User Name</th>
                                                                <th scope="col" style="color:white;">Email</th>
                                                                <th scope="col" style="color:white;">User Id</th>
                                                                <th scope="col" style="color:white;">Contact Number</th>
                                                                <th scope="col" style="color:white;"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="ApplicationBusinessOwner">



                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary hidetable ApplicationBusinessOwnerClass" id = "ApplicationBusinessOwnerAdd" onclick="addrow(this.id);">Add</button>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label hidetable ITLegacyApplicationOwnerClass" for="formInput198"><div class="required_fie"> IT Legacy Application Owner</div></label>
                                                    <div class="table-responsive">

                                                        <table class="table table-bordered hidetable ITLegacyApplicationOwnerClass">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">User Name</th>
                                                                <th scope="col" style="color:white;">Email</th>
                                                                <th scope="col" style="color:white;">User Id</th>
                                                                <th scope="col" style="color:white;">Contact Number</th>
                                                                <th scope="col" style="color:white;"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="ITLegacyApplicationOwner">


                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary hidetable ITLegacyApplicationOwnerClass" id = "ITLegacyApplicationOwnerAdd" onclick="addrow(this.id);">Add</button>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label hidetable EnterpriseTechnologyProjectManagerClass" for="formInput198"> Enterprise Technology Project Manager</label>
                                                    <div class="table-responsive">

                                                        <table class="table table-bordered hidetable EnterpriseTechnologyProjectManagerClass">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">User Name</th>
                                                                <th scope="col" style="color:white;">Email</th>
                                                                <th scope="col" style="color:white;">User Id</th>
                                                                <th scope="col" style="color:white;">Contact Number</th>
                                                                <th scope="col" style="color:white;"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="EnterpriseTechnologyProjectManager">

                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary hidetable EnterpriseTechnologyProjectManagerClass" id = "EnterpriseTechnologyProjectManagerAdd" onclick="addrow(this.id);">Add</button>
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label hidetable EnterpriseTechnologySystemEngineerClass" for="formInput198"> Enterprise Technology System Engineer</label>
                                                    <div class="table-responsive">
                                                        <table class="table table-bordered hidetable EnterpriseTechnologySystemEngineerClass">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">User Name</th>
                                                                <th scope="col" style="color:white;">Email</th>
                                                                <th scope="col" style="color:white;">User Id</th>
                                                                <th scope="col" style="color:white;">Contact Number</th>
                                                                <th scope="col" style="color:white;"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id="EnterpriseTechnologySystemEngineer">
                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary hidetable EnterpriseTechnologySystemEngineerClass" id ="EnterpriseTechnologySystemEngineerAdd" onclick="addrow(this.id);">Add</button>
                                                    </div>
                                                </div>
                                                <button type="button" class="btn btn-primary" onclick="addothers();">Add</button>
                                                <%--<button type="button" class="btn btn-warning">Modify</button>
                                                <button type="button" class="btn btn-danger">Delete</button>--%>
                                            </div>
                                        </div>
                                        </form>
                                            <button type="button" class="btn btn-default" onclick="location.href='AppDecommInfo.jsp';">Back</button>
                                            <button type="button" class="btn btn-primary pull-right" onclick="SaveTable();">Save & Continue</button>
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
    <script>
        if(document.getElementById('Role_info').value=="R")
            checkk();
 </script>
    <script>
        var url_string=window.location.href;
        var url = new URL(url_string);
        var appname = url.searchParams.get("appname");
        var projname=url.searchParams.get("prjname");
        console.log("application name",appname,"project name ",projname);

        $('#dates-field2').on('change',function(){
            var ans=$('#dates-field2').val();
            //alert("ans-> "+ans);
            if(ans==null)
            {
                ans=[];
            }
            var roles = "";
            for(var i=0; i<ans.length; i++)
            {
                roles += ans[i]+",";
            }
            console.log(ans);
            $.ajax({
                url: "ContactInfoTableDataRetrieveServlet",
                type: 'POST',
                data: {ApplicationName:appname,ProjectName: projname,Roles:roles},
                dataType: "json",
                success: function (data)
                {
                    console.log("data--->",data);
                    var arr=['CrossApplicationTeamProjectManager','ServiceLevelOwner','ApplicationContactSME','ITApplicationOwner','ApplicationBusinessOwner','ITLegacyApplicationOwner','EnterpriseTechnologyProjectManager','EnterpriseTechnologySystemEngineer'];
                    var roles=[];
                    console.log("data length--->",data.length);
                    //$('.hidetable').hide();
                        for (var i = 1; i < data.length; i++) {
                            var table_row="";
                            var rolenames = ((data[i][0].name).replace(/-|\s/g,"")).replace(/\//g,'');
                            console.log("role names--->",rolenames,"data[i].length-->",data[i].length);
                            roles.push(rolenames);
                            var length=0;
                            if(data[i][0].CheckExistance==true)
                            {
                                length=1;
                            }
                            var a=$('.'+rolenames+'Class').is(':hidden');
                            console.log('Check visible',a);
                            for (var j = length; j <data[i].length; j++) {
                                if(a) {
                                    $('.' + rolenames + 'Class').show();
                                }
                                console.log('j check existance',data[i][0].CheckExistance," j ",j);
                                if (data[i][0].CheckExistance == false&&a) {
                                    table_row = "<tr id = '"+rolenames+"row_id0' class = '"+rolenames+"ClassName"+"'>" +
                                        "<td><input type='text' id ='UserName"+rolenames+"0"+"' class='"+rolenames+"RowClass"+"' name='"+rolenames+"UserName"+"0"+"' value=''></td>\n" +
                                        "<td><input type='email' id ='Email"+rolenames+"0"+"' class='"+rolenames+"RowClass"+"' name='"+rolenames+"Email"+"0"+"' value='' pattern=\"[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}$\"></td>\n" +
                                        "<td><input type='text' id ='Userid"+rolenames+"0"+"' class='"+rolenames+"RowClass"+"' name='"+rolenames+"UserId"+"0"+"' value=''></td>\n" +
                                        "<td><input type='text' id ='ContactNumber"+rolenames+"0"+"' class='"+rolenames+"RowClass"+"' name='"+rolenames+"ContactNumber"+"0"+"' value=''></td>\n" +
                                        "<td><img src='images/Delete.png' id='"+rolenames+"Delete"+"0"+"' class='"+rolenames+"RowClass"+"' onclick='SomeDeleteRowFunctionContactInfo(this.id);' style='width:30px; height:30px;'> </td>\n" +
                                        "</tr>";
                                } else if(a){
                                    table_row += "<tr id = '"+rolenames+"row_id"+(j-1)+"' class = '"+rolenames+"ClassName"+"'>" +
                                        "<td><input type='text' id ='UserName"+rolenames+(j-1)+"' class='"+rolenames+"RowClass"+"' name='"+rolenames+"UserName"+(j-1)+"' value='"+data[i][j].Uname+"'></td>\n"+
                                        "<td><input type='email' id ='Email"+rolenames+(j-1)+"' class='"+rolenames+"RowClass"+"' name='"+rolenames+"Email"+(j-1)+"' value='"+data[i][j].Email+"' pattern=\"[a-z0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,3}$\"></td>\n" +
                                        "<td><input type='text' id ='Userid"+rolenames+(j-1)+"' class='"+rolenames+"RowClass"+"' name='"+rolenames+"UserId"+(j-1)+"' value='"+data[i][j].user_id+"'></td>\n" +
                                        "<td><input type='text' id ='ContactNumber"+rolenames+(j-1)+"' class='"+rolenames+"RowClass"+"' name='"+rolenames+"ContactNumber"+(j-1)+"' value='"+data[i][j].contact_no+"'></td>\n" +
                                        "<td><img src='images/Delete.png' id='"+rolenames+"Delete"+(j-1)+"' onclick='SomeDeleteRowFunctionContactInfo(this.id);' style='width:30px; height:30px;'> </td>\n"+
                                        "</tr>";
                                }
                                if(a) {
                                    $('#' + rolenames).html(table_row);
                                }
                            }

                        }
                        for(var n=0;n<roles.length;n++)
                        {
                            var index = arr.indexOf(roles[n]);

                            if (index > -1) {
                                arr.splice(index, 1);
                            }
                        }
                        console.log('removed array--->',arr);
                        for(var m=0;m<arr.length;m++)
                        {
                            $('.'+arr[m]+'Class').hide();
                        }
                    /*for(var i=0;i<data.length;i++) {

                        var check=false;
                        var table_row = "";
                        for(var j=1;j<data[i].length;j++)
                        {
                            var table="";
                            var tablelast="";

                            console.log("checkexistance :",data[i][0].CheckExistance)
                            if(data[i][0].CheckExistance==false)
                            {

                                table_row="<tr>" +
                                    "<td><input type='text' id ='username_1' value=''></td>\n" +
                                    "<td><input type='text' id ='email_1' value=''></td>\n" +
                                    "<td><input type='text' id ='userid_1' value=''></td>\n" +
                                    "<td><input type='text' id ='contactnumber_1' value=''></td>\n" +
                                    "<td><img src='images/Delete.png' id='delete1' onclick='SomeDeleteRowFunction(this);' style='width:30px; height:30px;'> </td>\n" +
                                    "</tr>";
                            }
                            else {
                                table = "<div class='form-group'>\n" +
                                    "<label class='control-label hidetable' for='formInput198'> "+data[i][0].name+"</label>\n" +
                                    " <div class='table-responsive' id='table-scroll'>\n" +
                                    "<table class='table table-bordered hidetable'>\n" +
                                    "<thead style='color:white;background-color:DodgerBlue;'>\n" +
                                    "<tr >\n" +
                                    "<th scope='col' style='color:black;'>User Name</th>\n" +
                                    "<th scope='col' style='color:black;'>Email</th>\n" +
                                    "<th scope='col' style='color:black;'>User Id</th>\n" +
                                    "<th scope='col' style='color:black;'>Contact Number</th>\n" +
                                    "<th scope='col' style='color:black;'></th>\n" +
                                    "</tr>\n" +
                                    "</thead>\n" +
                                    "<tbody id='tableenterprise_PM'>\n";
                                table_row +="<tr>" +
                                    "<td><input type='text' id ='username_"+j+"' value='"+data[i][j].Uname+"'></td>\n" +
                                    "<td><input type='text' id ='email_1' value='"+data[i][j].Email+"'></td>\n" +
                                    "<td><input type='text' id ='userid_1' value='"+data[i][j].user_id+"'></td>\n" +
                                    "<td><input type='text' id ='contactnumber_1' value='"+data[i][j].contact_no+"'></td>\n" +
                                    "<td><img src='images/Delete.png' id='delete1' onclick='SomeDeleteRowFunction(this);' style='width:30px; height:30px;'> </td>\n" +
                                    "</tr>";
                                console.log("table_row--->"+table_row);
                                check=true;
                            }
                        }

                        if(check)
                        {
                            tablelast="</tbody>\n" +
                                "</table><button type='button' class='btn btn-primary hidetable' onclick='addrow_enterprise();'>Add</button>\n" +
                                "</div>\n" +
                                "</div>";
                        }
                        var Table=table+table_row+tablelast;
                        $('#entiretableother').html(Table);
                    }*/
                },
                error: function (e)
                {
                    console.log(e);
                }
            });
        });
    </script>
<script>
    function SaveTable()
    {
        $('.hidetable').is(':hidden');
        var arr=['Cross-Application Team Project Manager','Service Level Owner','Application Contact/SME','IT/Application Owner','Application Business Owner','IT Legacy Application Owner','Enterprise Technology Project Manager','Enterprise Technology Project Manager'];
        var check1=[];
        var rolename="";
        for(var i=0;i<arr.length;i++)
        {
            var rolenames = ((arr[i]).replace(/-|\s/g,"")).replace(/\//g,'');
            if(!$('.'+rolenames+'Class').is(':hidden'))
            {
                check1[i]=arr[i];
                rolename+= arr[i]+",";
            }
        }
        rolename=rolename.substring(0,rolename.length-1);
        var array_row = [];
        var rowlength=[];
        for(var j=0; j<check1.length; j++){
            var rolenames = ((check1[j]).replace(/-|\s/g,"")).replace(/\//g,'');
            var row_length=$('.'+rolenames+'ClassName').length;
            rowlength[j]=row_length;
        }
        var f=document.TableSubmitForm;
        f.method="post";
        f.action="ContactInfoDbUpdateServlet?ProjectName="+projname+"&ApplicationName="+appname+"&RoleName="+check1+"&RowLength="+rowlength;
        f.submit();

    }
    $(document).ready(function(){
        $('.hidetable').hide();
    });
</script>
    <script>

        function addrow(id)
        {
           //alert(id);
            var classname=id.substring(0,id.lastIndexOf('A'));
            //alert("classname--->"+classname);
            var rowlength=$('.'+classname+"ClassName").length;
            //alert("hi"+rowlength);
            //var i=rowlength+1;
            var table_row = "<tr class = '"+classname+"ClassName"+"'>" +
                "<td><input type='text' id ='UserName"+classname+rowlength+"' class='"+classname+"RowClass"+"' name='"+classname+"UserName"+rowlength+"' value=''></td>\n" +
                "<td><input type='text' id ='Email"+classname+rowlength+"' class='"+classname+"RowClass"+"' name='"+classname+"Email"+rowlength+"' value=''></td>\n" +
                "<td><input type='text' id ='Userid"+classname+rowlength+"' class='"+classname+"RowClass"+"' name='"+classname+"UserId"+rowlength+"' value=''></td>\n" +
                "<td><input type='text' id ='ContactNumber"+classname+rowlength+"' class='"+classname+"RowClass"+"' name='"+classname+"ContactNumber"+rowlength+"' value=''></td>\n" +
                "<td><img src='images/Delete.png' id='Delete"+classname+rowlength+"' class='"+classname+"RowClass"+"' onclick='SomeDeleteRowFunction(this);' style='width:30px; height:30px;'> </td>\n" +
                "</tr>";
            $('#'+classname).append(table_row);

            }

    </script>
            <script>
            function SomeDeleteRowFunction(o) {


                var p=o.parentNode.parentNode;
                p.parentNode.removeChild(p);
            }
        </script>
<script>
    function SomeDeleteRowFunctionContactInfo(o) {

        var role_sub = (o.substring(0,(o.lastIndexOf('D'))));
        var id = parseInt(o.substring(o.lastIndexOf('e')+1,o.length));
        var classlength = $('.'+role_sub+"ClassName").length;
        var id = parseInt(o.substring(o.lastIndexOf('e')+1,o.length));
        $('#'+role_sub+'row_id'+id).remove();
        for(var i=id+1;i<classlength;i++)
        {
            $('#UserName'+role_sub+i).removeAttr("name");
            $('#UserName'+role_sub+i).attr('name',role_sub+"UserName"+(i-1));
            $('input[name='+role_sub+"UserName"+(i-1)+']').removeAttr("id");
            $('input[name='+role_sub+"UserName"+(i-1)+']').attr('id','UserName'+role_sub+(i-1));
            $('#Email'+role_sub+i).removeAttr("name");
            $('#Email'+role_sub+i).attr('name',role_sub+"Email"+(i-1));
            $('input[name='+role_sub+"Email"+(i-1)+']').removeAttr("id");
            $('input[name='+role_sub+"Email"+(i-1)+']').attr('id','Email'+role_sub+(i-1));
            $('#Userid'+role_sub+i).removeAttr("name");
            $('#Userid'+role_sub+i).attr('name',role_sub+"UserId"+(i-1));
            $('input[name='+role_sub+"UserId"+(i-1)+']').removeAttr("id");
            $('input[name='+role_sub+"UserId"+(i-1)+']').attr('id','Userid'+role_sub+(i-1));
            $('#ContactNumber'+role_sub+i).removeAttr("name");
            $('#ContactNumber'+role_sub+i).attr('name',role_sub+"ContactNumber"+(i-1));
            $('input[name='+role_sub+"ContactNumber"+(i-1)+']').removeAttr("id");
            $('input[name='+role_sub+"ContactNumber"+(i-1)+']').attr('id','ContactNumber'+role_sub+(i-1));
            $('#'+role_sub+'Delete'+i).removeAttr("name");
            $('#'+role_sub+'Delete'+i).attr('name',role_sub+"Delete"+(i-1));
            $('img[name='+role_sub+"Delete"+(i-1)+']').removeAttr("id");
            $('img[name='+role_sub+"Delete"+(i-1)+']').attr('id','Delete'+role_sub+(i-1));
            $('#'+role_sub+'row_id'+i).removeAttr("name");
            $('#'+role_sub+'row_id'+i).attr('name',role_sub+"row_id"+(i-1));
            $('tr[name='+role_sub+"row_id"+(i-1)+']').removeAttr("id");
            $('tr[name='+role_sub+"row_id"+(i-1)+']').attr('id','row_id'+role_sub+(i-1));

        }
    }
</script>

</div>
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

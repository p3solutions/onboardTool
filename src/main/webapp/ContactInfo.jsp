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
                            <h2 class="title">Decomm Intake Requirements</h2>
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
                                            <div class="col-sm-4 form-group">
                                                <label><font size="4"><b> USER </b> </font><span
                                                        class="glyphicon glyphicon-asterisk"></span></label>
                                                <div class="col-lg-12">
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
                                        </div>


                                        <div id="collapse2" class="panel-collapse">
                                            <div class="panel-body text-left">
                                                <div class="form-group" id="entiretableother">


                                                </div>
                                                <button type="button" class="btn btn-primary" onclick="addothers();">Add</button>
                                                <button type="button" class="btn btn-warning">Modify</button>
                                                <button type="button" class="btn btn-danger">Delete</button>
                                            </div>

                                            <br>
                                            <br>
                                            <button type="button" class="btn btn-default" onclick="location.href='AppDecommInfo.jsp';">Back</button>
                                            <button type="button" class="btn btn-primary pull-right" onclick="#';">save and continue</button>
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


    <!-- <script>
        if(document.getElementById('Role_info').value=="R")
            checkk();
 </script> -->


    <script>

        function addrow()
        {

            var rowlength=$('.cross').length;
            //alert("hi"+rowlength);
            var i=rowlength+1;
            var element='<tr class="cross">'+
                '<td><input type="text" id ="username_'+i+'" value=""></td>'+
                '<td><input type="text" id ="email_'+i+'" value=""></td>'+
                '<td><input type="text" id ="userid_'+i+'" value=""></td>'+
                '<td><input type="text" id ="contactnumber_'+i+'" value=""></td>'+
                '<td><img src="images/delete.png" id="delete'+i+'" onclick="SomeDeleteRowFunction(this)" style="width:30px; height:30px;"> </td>'+
                '</tr>';
            $('#tablebody').append(element);

            }


            function addrow_service()
            {

            var rowlength=$('.service').length;
            //alert("hi"+rowlength);
            var i=rowlength+1;
            var element='<tr class="service">'+
                '<td><input type="text" id ="username_'+i+'" value=""></td>'+
                '<td><input type="text" id ="email_'+i+'" value=""></td>'+
                '<td><input type="text" id ="userid_'+i+'" value=""></td>'+
                '<td><input type="text" id ="contactnumber_'+i+'" value=""></td>'+
                '<td><img src="images/delete.png" id="delete'+i+'" onclick="SomeDeleteRowFunction(this)" style="width:30px; height:30px;"> </td>'+
                '</tr>';
            $('#tableservice').append(element);

            }

            function addrow_application()
            {

            var rowlength=$('.application').length;
            //alert("hi"+rowlength);
            var i=rowlength+1;
            var element='<tr class="application">'+
                '<td><input type="text" id ="username_'+i+'" value=""></td>'+
                '<td><input type="text" id ="email_'+i+'" value=""></td>'+
                '<td><input type="text" id ="userid_'+i+'" value=""></td>'+
                '<td><input type="text" id ="contactnumber_'+i+'" value=""></td>'+
                '<td><img src="images/delete.png" id="delete'+i+'" onclick="SomeDeleteRowFunction(this)" style="width:30px; height:30px;"> </td>'+
                '</tr>';
            $('#tableapplication').append(element);

        }

        function addrow_owner()
        {

            var rowlength=$('.owner').length;
            //alert("hi"+rowlength);
            var i=rowlength+1;
            var element='<tr class="owner">'+
                '<td><input type="text" id ="username_'+i+'" value=""></td>'+
                '<td><input type="text" id ="email_'+i+'" value=""></td>'+
                '<td><input type="text" id ="userid_'+i+'" value=""></td>'+
                '<td><input type="text" id ="contactnumber_'+i+'" value=""></td>'+
                '<td><img src="images/delete.png" id="delete'+i+'" onclick="SomeDeleteRowFunction(this)" style="width:30px; height:30px;"> </td>'+
                '</tr>';
            $('#tableowner').append(element);

        }

        function addrow_bussinessowner()
        {

            var rowlength=$('.bussinessowner').length;
            //alert("hi"+rowlength);
            var i=rowlength+1;
            var element='<tr class="bussinessowner">'+
                '<td><input type="text" id ="username_'+i+'" value=""></td>'+
                '<td><input type="text" id ="email_'+i+'" value=""></td>'+
                '<td><input type="text" id ="userid_'+i+'" value=""></td>'+
                '<td><input type="text" id ="contactnumber_'+i+'" value=""></td>'+
                '<td><img src="images/delete.png" id="delete'+i+'" onclick="SomeDeleteRowFunction(this)" style="width:30px; height:30px;"> </td>'+
                '</tr>';
            $('#tablebussinessowner').append(element);

        }

        function addrow_legancy()
        {

            var rowlength=$('.legancy').length;
            //alert("hi"+rowlength);
            var i=rowlength+1;
            var element='<tr class="legancy">'+
                '<td><input type="text" id ="username_'+i+'" value=""></td>'+
                '<td><input type="text" id ="email_'+i+'" value=""></td>'+
                '<td><input type="text" id ="userid_'+i+'" value=""></td>'+
                '<td><input type="text" id ="contactnumber_'+i+'" value=""></td>'+
                '<td><img src="images/delete.png" id="delete'+i+'" onclick="SomeDeleteRowFunction(this)" style="width:30px; height:30px;"> </td>'+
                '</tr>';
            $('#tablelegancy').append(element);

        }

        function addrow_enterprise()
        {

            var rowlength=$('.enterprise').length;
            //alert("hi"+rowlength);
            var i=rowlength+1;
            var element='<tr class="enterprise">'+
                '<td><input type="text" id ="username_'+i+'" value=""></td>'+
                '<td><input type="text" id ="email_'+i+'" value=""></td>'+
                '<td><input type="text" id ="userid_'+i+'" value=""></td>'+
                '<td><input type="text" id ="contactnumber_'+i+'" value=""></td>'+
                '<td><img src="images/delete.png" id="delete'+i+'" onclick="SomeDeleteRowFunction(this)" style="width:30px; height:30px;"> </td>'+
                '</tr>';
            $('#tableenterprise_PM').append(element);

        }

        function addrow_enterpriseSE()
        {

            var rowlength=$('.enterpriseSE').length;
            //alert("hi"+rowlength);
            var i=rowlength+1;
            var element='<tr class="enterpriseSE">'+
                '<td><input type="text" id ="username_'+i+'" value=""></td>'+
                '<td><input type="text" id ="email_'+i+'" value=""></td>'+
                '<td><input type="text" id ="userid_'+i+'" value=""></td>'+
                '<td><input type="text" id ="contactnumber_'+i+'" value=""></td>'+
                '<td><img src="images/delete.png" id="delete'+i+'" onclick="SomeDeleteRowFunction(this)" style="width:30px; height:30px;"> </td>'+
                '</tr>';
            $('#tableenterpriseSE').append(element);

        }

        function addrow_entiretable()
        {

            var rowlength=$('.others').length;
            var i=rowlength+1;
            var element= '<tr class="others">'+
                '<td><input type="text" id ="username_2" value=""></td>'+
                '<td><input type="text" id ="email_2" value=""></td>'+
                '<td><input type="text" id ="userid_2" value=""></td>'+
                '<td><input type="text" id ="contactnumber_2" value=""></td>'+
                '<td><img src="images/delete.png" id="delete2" onclick="SomeDeleteRowFunction(this)" style="width:30px; height:30px;"> </td>'+
                '</tr>';
            $('#tableothers').append(element);
        }


    </script>


        <script>
            function SomeDeleteRowFunction(o) {


                var p=o.parentNode.parentNode;
                p.parentNode.removeChild(p);
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
<script src="js/main.js">ContactInfoTableDataRetrieveServlet</script>
<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<script src="js/admin_module/admin_module_send_invites.js"></script>


</body>
</html>

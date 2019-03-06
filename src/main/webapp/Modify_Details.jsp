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
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet"
          type="text/css"/>
    <script type="text/javascript"
            src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
          rel="stylesheet" type="text/css"/>
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
            type="text/javascript"></script>
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
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css"
          rel="stylesheet"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
    <script type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
    <link rel="stylesheet" href="css/admin_module/admin_module_send_invites.css" media="screen">
</head>
<body class="top-navbar-fixed">
<input type="hidden" name="userId" id="userId"/>
<input type="hidden" name="userProject" id="userProject"/>
<input type="hidden" name="application" id="application"/>
<%
    HttpSession details = request.getSession();
    String project_name = (String) details.getAttribute("nameofproject");
    String info = (String) details.getAttribute("admin");
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
                <!-- /.navbar-header -->
                <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%= project_name %>
                </a>

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


    <form class="form-signin" name="loginForm" method="post">

        <div class="content-wrapper">
            <div class="content-container">

                <!-- ========== LEFT SIDEBAR for UserConfiguration ========== -->
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
                                    <a><span class="">User Module</span></a>
                                </li>
                                <li>
                                    <a href="Admin_UserConfiguration.jsp"><i class="fa fa-file-text"></i> <span>User Configuration</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="Admin_Userslist.jsp"><i class="fa fa-paint-brush"></i>
                                        <span>Users List</span> </a>
                                </li>

                                <li>
                                    <a href="Admin_Role_Details.jsp"><i class="fa fa-map-signs"></i>
                                        <span>Authorization </span> </a>
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

                                <div id="config" class="tabcontent">
                                    <div class="container-fluid">
                                        <br/>
                                        <div class="col-sm-12">
                                            <br/>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="col-sm-6 form-group">

                                                        <label for="comment">User Name</label>
                                                        <input type="text" class="form-control" id="uname">
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label><b> First Name</b></label>
                                                            <input type="text" id="fname" name="fname"
                                                                   class="form-control"/>
                                                        </div>

                                                    </div>

                                                        <div class="col-sm-6 form-group">
                                                            <label>Last Name</label>
                                                            <input type="text" class="form-control" id="lname">
                                                        </div>

                                                        <div class="col-sm-6 form-group">
                                                            <label>Email</label>
                                                            <input type="email" class="form-control" id="email_val">
                                                        </div>


                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">

                                                            <label>&nbsp;&nbsp;Project</label>
                                                            <div class="col-lg-12" id="project_id">
                                                                <select class="selectpicker multiselect-ui form-control"
                                                                        id="project_id_Select" name="project_id_Select"
                                                                        data-live-search="true" multiple="multiple">
                                                                </select>
                                                            </div>
                                                        </div>


                                                        <div class="col-sm-6 form-group">
                                                            <label>Applications</label>
                                                            <div class="col-lg-12">
                                                                <select class="selectpicker multiselect-ui form-control"
                                                                        id="projapp"
                                                                        name="projapp" data-live-search="true"
                                                                        multiple="multiple">
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <br/>
                                                    <input type="hidden" id="send_invites_id" value="<%= info %>"
                                                           hidden>
                                                    <button type="button" class="btn btn-primary" id="send_btn">Submit
                                                    </button>
                                                    <br/>
                                                    <hr/>

                                                </div>

                                            </div>

                                        </div>
                                    </div>

                                </div>


                            </div>
                            <!-- /.col-md-6 -->

                        </div>
                        <!-- /.row -->

                    </section>
                    <!-- /.section -->

                </div>
                <!-- /.main-page -->

                <!-- Project List End -->

            </div>
            <!-- /.content-container -->
        </div>
        <!-- /.content-wrapper -->
    </form>
</div>
<!-- /.main-wrapper -->
<script>


    $(document).ready(function () {
        $('#userId').val(<%= request.getParameter("id") %>);
        $('#userProject').val('<%= request.getParameter("project") %>');
        $('#application').val('<%= request.getParameter("application") %>');
        var id = $('#userId').val();
        $.ajax({
            url: 'ModifyDataRetrieve',
            type: 'post',
            data: {id: id},
            dataType: 'json',
            success: function (data) {
                console.log("data=----->", data);
                var array = [];
                $.each(data, function (key, value) {
                    console.log("key", key);
                    console.log("value", value);
                    $('#uname').val(value["uname"]);
                    $('#fname').val(value["fname"]);
                    $('#lname').val(value["lname"]);
                    $('#email_val').val(value["email"]);
                });

            }
        });
        getProjectName(id);
    });



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
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<script src="js/admin_modify_module/admin_module_modify.js"></script>

</body>
</html>
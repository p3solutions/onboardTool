<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <title>List Page</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>

    <link rel="stylesheet" href="styles/styles.css" type="text/css"/>
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
    <link rel="stylesheet" href="css/icheck/skins/line/red.css">
    <link rel="stylesheet" href="css/icheck/skins/line/green.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <style>

        body {


            background: #F6F8FA;
        }


        .partition {
            height: 133px;
        }

        .separation {
            height: 200px;


        }


        .fontawesome-icon-list {
            text-align: center;
        }

        .icon {
            background-color: #fff;
            border: 1px solid #eee;
            text-align: center;
            width: 200px;
            height: 200px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin: 10px;
            transition: all .2s;
            font-size: 50px;
        }

        .icon:hover {
            box-shadow: 0px 0px 11px rgba(0, 0, 0, 0.15);
        }

        .icon1 {
            background-color: #fff;
            border: 1px solid #eee;
            text-align: center;
            width: 200px;
            height: 200px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin: 10px;
            transition: all .2s;
            font-size: 50px;
        }

        .icon1:hover {
            box-shadow: 0px 0px 11px rgba(0, 0, 0, 0.15);
            color: blue;
        }

        #fa {
            font-size: 80px;
            color: #9c47fc;
            display: block;
            background: -webkit-linear-gradient(DodgerBlue,DodgerBlue);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }


    </style>

</head>
<body class="top-navbar-fixed">


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
                <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
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
                                    <a href="User_Configuration.jsp"><i class="fa fa-file-text"></i> <span>User Configuration</span>
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
                <div class="container-fluid">

                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h2 class="title">User Configuration</h2>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-6">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i>Home</a></li>
                                <li class="active">Admin</li>

                            </ul>
                        </div>


                    </div>
                    <!-- /.row -->


                    <section id="new">
                        <h2 class="page-header"></h2>
                        <div class="row fontawesome-icon-list">

                            <a href="Admin_Module_Send_Invites.jsp">
                                <div class="icon"><i class="fa fa-envelope" id="fa"><h5>Send Invites</h5></i></div>
                            </a>
                            <a href="Modify_Admin_Users_list.jsp">
                                <div class="icon1"><i class="fa fa-edit" id="fa"><h5 id="text">Modify</h5></i></div>
                            </a>


                        </div>

                    </section>

                    <!-- /.section -->


                </div>


            </div>
        </div>
    </form>
</div>
<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>

</body>
</html>

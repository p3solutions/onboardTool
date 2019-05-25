<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


    <meta charset="utf-8" />
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <title>List Page</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />

    <link rel="stylesheet" href="styles/styles.css" type="text/css" />
    <script src="js/jquery/jquery-2.2.4.min.js"></script>

    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
<style>
    .partition
    {
height: 250px;
    }
    .separation{
        height: 200px;

        padding-right: 40px;

        padding-left: 190px;
    }
</style>

</head>
<body>

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
                                <a href="User_Configuration.jsp"><i class="fa fa-file-text"></i> <span>User Configuration</span> </a>
                            </li>

                            <li>
                                <a href="Admin_Userslist.jsp"><i class="fa fa-paint-brush"></i> <span>Users List</span> </a>
                            </li>

                            <li>
                                <a href="Admin_Role_Details.jsp"><i class="fa fa-map-signs"></i> <span>Authorization </span> </a>
                            </li>
                        </ul>

                    </div>
                    <!-- /.sidebar-nav -->
                </div>
                <!-- /.sidebar-content -->
            </div>
            <!-- /.left-sidebar -->




            <div class="container">
                <%--<div class="col-xs-4">
                    <img src="images/Project.png" class="img-rounded" height="100" width="100" >
                  <img src="/images/admin_userconfiguration/Test.png" class="img-rounded" height="100" width="100" >

    <button type="button" class="btn btn-primary">SEND INVITES</button>
                </div>--%>
                <div class="partition"></div>
                <div class="separation">
                    <div class="col-md-3 col-sm-3">
                        <a href="<%--Admin_UserConfiguration.jsp--%>">
                            <center>

                               <a href="Admin_Module_Send_Invites.jsp">
                                   <img src="images/admin_userconfiguration/send_invite.jpg" class="img-rounded" data-toggle="tooltip"  title="SEND INVITES" id="invite" height="100" width="100" data-color="#494949">
                                <%--<button type="button" class="btn btn-primary">SEND INVITES</button>--%>
                               </a>
                                <%--<h6 class="mt-5">Send Invites</h6>--%>
                            </center>
                        </a>
                     </div>

                    <div class="col-md-3 col-sm-3">
                        <a href="Modify_Admin_Users_list.jsp">
                            <center>
                                <img src="images/admin_userconfiguration/Modification.png" class="img-rounded" data-toggle="tooltip"  title="MODIFY" id="modify" height="100" width="100" data-color="#494949">
                                <%--<div>
                                    <button type="button" class="btn btn-primary">MODIFICATION</button>
                                </div>--%>

                                <%--<h6 class="mt-5">Send Invites</h6>--%>
                            </center>
                        </a>
                    </div>
                    <%--<div class="col-md-3 col-sm-3">
                        <a href="&lt;%&ndash;Admin_UserConfiguration.jsp&ndash;%&gt;">
                            <center>
                                <img src="images/admin_userconfiguration/Deletion.png" class="img-rounded" data-toggle="tooltip"  title="DELETION" id="delete" height="100" width="100" data-color="#494949">
                               &lt;%&ndash;<div>
                                   <button type="button" class="btn btn-primary">DELETION</button>
                               </div>&ndash;%&gt;

                                &lt;%&ndash;<h6 class="mt-5">Send Invites</h6>&ndash;%&gt;
                            </center>
                        </a>
                    </div>--%>
                </div>
                <div class="partition"></div>


</div>
</div>
    </div>
</form>
</body>
</html>

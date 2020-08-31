<!DOCTYPE html>

<html lang="en">
<head>
    <title>Decom3Sixty Modules List</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

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
    <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script src="js/multiplepages.js"></script>
    <style>
    #sitetitle1{

        color:DodgerBlue;
        text-align:center;
        float:right;

    }
    
    
        .left-sidebar {
            position: relative;
            height: 100%;
        }

                div div #testDecom
        {
            pointer-events: none;
            /* for "disabled" effect */
            opacity: 0.5;

        }
        
        .fa {
        display: inline;
        }
    </style>
</head>
<body class="top-navbar-fixed">
<script>
    $(document).ready(function() {

        $('#testDecom').attr('disabled', true);
    });
</script>
<div class="main-wrapper">
    <%@ page import="java.text.SimpleDateFormat"%>
    <%@ page import="java.util.Date"%>
    <%
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Grid JSP PAGE-----[INFO]");  %>
    <%@page language="java"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.text.DateFormat" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.util.Calendar" %>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.

        if (session.getAttribute("username")==null)
        {
            response.sendRedirect("Login.jsp");

        }
        else{
            String name=(String)session.getAttribute("ID");
            HttpSession details=request.getSession();
            Connection con = null;
            String url = "jdbc:mysql://localhost:3306/";
            String db = "Onboarding";
            String driver = "com.mysql.jdbc.Driver";
            String userName ="root";
            String password="password123";
            session.setAttribute("theName", name);
            String roles=(String)details.getAttribute("role");
            int sumcount=0;
            Statement st,st2;
            try{
                Class.forName(driver).newInstance();
                con = DriverManager.getConnection(url+db,userName,password);
                Statement st1;


                String query1 = "select * from AppEmphazize_ProjectDetails where id = "+name;
                st1 = con.createStatement();
                ResultSet rs = st1.executeQuery(query1);
                if(rs.next())
                {

    %>

    <!-- ========== TOP NAVBAR ========== -->
    <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <%
                    details.setAttribute("nameofproject",rs.getString("projectname"));
                %>
                <div class="navbar-header no-padding">
                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
                        <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                    </a>

                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-ellipsis-v"></i>
                    </button>
                    <button type="button" class="navbar-toggle mobile-nav-toggle" >
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <!-- /.navbar-header -->
               
                <div class="collapse navbar-collapse" id="navbar-collapse-1">

                    <!-- /.nav navbar-nav -->
                    <ul class="nav navbar-nav navbar-right">
                     <a class="navbar-brand" href="Project_List.jsp" id="sitetitle1">PROJECT NAME -<%=rs.getString("projectname") %></a>
                        <%
                            String uname=(String)details.getAttribute("username");
                            String role=(String)details.getAttribute("role");%>
                        <li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
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
            <div class="main-page">
                <div class="container-fluid">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h2 class="title">Modules List</h2>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-6">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>

                            </ul>
                        </div>



                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->


                <%
                    if(roles.equals("admin")){
                %>
                <!--  admin Role -->
                <section>

                    <div class="row mt-50 grid1">
                        <div class="container">

                            <div class="col-md-12" id="box">
                                <div class="container-fluid" >
                                    <div class="row">
                                        <div class="col-md-4 col-sm-4">
                                        </div>

                                        <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                        </div>


                                    </div>

                                </div>
                                <div class="col-md-2 col-sm-2">

                                    <a href="AppEmphasize_EditProject.jsp">
                                        <center>
                                            <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Plan and Pirority</h6>
                                        </center>

                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>

                                <div class="col-md-2 col-sm-2">

                                    <a href="ArchiveDecommPage.jsp">
                                        <center>
                                            <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Intake</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="Archive_Execution.jsp">
                                        <center>
                                            <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Archival Execution</h6>
                                        </center> </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="DecommManageApplication.jsp">
                                        <center>
                                            <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Decommission Execution</h6>
                                        </center>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-5"></div>
                    <div class="col-md-2 col-sm-2" id="varrow">
                        <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                    </div>
                    <div class="col-md-5 col-sm-5">

                    </div>

                    <div class="row mt-50 grid2">
                        <div class="container">
                            <div class="col-md-12" id="box1">

                                <div class="col-md-2 col-sm-2">
                                    <a href="User_Configuration.jsp">
                                        <center>
                                            <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Admin</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>

                                <div class="col-md-2 col-sm-2">
                                    <a href="RoleUIDashboard.jsp">
                                        <center>
                                            <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Reports and Governance</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <%--<div class="col-md-2 col-sm-2">
                                  <a href="#">
                                 <center>
                                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                   <h6 class="mt-5">Reports Governance</h6>
                                 </center>
                                  </a>
                                </div>--%>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Finance & Contract Management</h6>
                                        </center>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.section -->


                <%
                }
                else if(roles.equals("TestLead"))
                {
                %>
                <!-- Test Lead -->
                <section>

                    <div class="row mt-50 grid1">
                        <div class="container">
                            <div class="col-md-12" id="box">

                                <div class="container-fluid" >
                                    <div class="row">
                                        <div class="col-md-4 col-sm-4">
                                        </div>

                                        <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                        </div>


                                    </div>

                                </div>

                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="AppEmphasize_EditProject.jsp">
                                        <center>
                                            <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Plan and Pirority</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="Applications.jsp" >
                                        <center>
                                            <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Intake</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="Archive_Execution.jsp">
                                        <center>
                                            <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Archival Execution</h6>
                                        </center> </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Decommission Execution</h6>
                                        </center>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-5"></div>
                    <div class="col-md-2 col-sm-2" id="varrow">
                        <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                    </div>
                    <div class="col-md-5 col-sm-5">

                    </div>
                    <div class="row mt-50 grid2">
                        <div class="container">
                            <div class="col-md-12" id="box1">
                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="User_Configuration.jsp">
                                        <center>
                                            <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Admin</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>


                                <div class="col-md-2 col-sm-2" >
                                    <a href="RoleUIDashboard.jsp">
                                        <center>
                                            <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Reports and Governance</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <%--<div class="col-md-2 col-sm-2" id="testDecom">
                                  <a href="#">
                                 <center>
                                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                   <h6 class="mt-5">Reports Governance</h6>
                                 </center>
                                  </a>
                                </div>--%>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Finance & Contract Management</h6>
                                        </center>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </section>
                <!-- /.section -->

                <%
                }
                else if(roles.equals("ArchivalAdmin"))
                {
                %>
                <!-- Archival Admin -->
                <section>

                    <div class="row mt-50 grid1">
                        <div class="container">
                            <div class="col-md-12" id="box">
                                <div class="container-fluid" >
                                    <div class="row">
                                        <div class="col-md-4 col-sm-4">
                                        </div>

                                        <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                        </div>


                                    </div>

                                </div>

                                <div class="col-md-2 col-sm-2">
                                    <a href="AppEmphasize_EditProject.jsp">
                                        <center>
                                            <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Plan and Pirority</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="Applications.jsp" >
                                        <center>
                                            <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Intake</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="Archive_Execution.jsp">
                                        <center>
                                            <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Archival Execution</h6>
                                        </center> </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Decommission Execution</h6>
                                        </center>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-5"></div>
                    <div class="col-md-2 col-sm-2" id="varrow">
                        <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                    </div>
                    <div class="col-md-5 col-sm-5">

                    </div>

                    <div class="row mt-50 grid2">
                        <div class="container">
                            <div class="col-md-12" id="box1">


                                <div class="col-md-2 col-sm-2" >
                                    <a href="User_Configuration.jsp">
                                        <center>
                                            <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Admin</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <div class="col-md-2 col-sm-2" >
                                    <a href="RoleUIDashboard.jsp">
                                        <center>
                                            <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Reports and Governance</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <%--<div class="col-md-2 col-sm-2">
                                  <a href="#">
                                 <center>
                                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                   <h6 class="mt-5">Reports Governance</h6>
                                 </center>
                                  </a>
                                </div>--%>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <div class="col-md-2 col-sm-2" >
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Finance & Contract Management</h6>
                                        </center>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </section>
                <%}

                else if(roles.equals("ArchivalProgramManager"))
                {
                %>
                <!-- Archival Program Manager -->
                <section>

                    <div class="row mt-50 grid1">
                        <div class="container">
                            <div class="col-md-12" id="box">

                                <div class="container-fluid" >
                                    <div class="row">
                                        <div class="col-md-4 col-sm-4">
                                        </div>

                                        <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                        </div>


                                    </div>

                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="AppEmphasize_EditProject.jsp">
                                        <center>
                                            <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Plan and Pirority</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="Applications.jsp" >
                                        <center>
                                            <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Intake</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="Archive_Execution.jsp">
                                        <center>
                                            <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Archival Execution</h6>
                                        </center> </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Decommission Execution</h6>
                                        </center>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5 col-sm-5"></div>
                    <div class="col-md-2 col-sm-2" id="varrow">
                        <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                    </div>
                    <div class="col-md-5 col-sm-5">

                    </div>

                    <div class="row mt-50 grid2">
                        <div class="container">
                            <div class="col-md-12" id="box1">
                                <div class="col-md-2 col-sm-2" >
                                    <a href="User_Configuration.jsp">
                                        <center>
                                            <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Admin</h6>
                                        </center>
                                    </a>
                                </div>

                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>

                                <div class="col-md-2 col-sm-2" >
                                    <a href="ProjectManager_dashboard.jsp">
                                        <center>
                                            <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Reports and Governance</h6>
                                        </center>
                                    </a>
                                </div>

                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>

                                <%--<div class="col-md-2 col-sm-2">
                                  <a href="#">
                                 <center>
                                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                   <h6 class="mt-5">Reports Governance</h6>
                                 </center>
                                  </a>
                                </div>
                 --%>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>

                                <div class="col-md-2 col-sm-2" >
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Finance & Contract Management</h6>
                                        </center>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </section>
                <%
                }
                else if(roles.equals("LegacyBusinessSME"))
                {
                %>
                <!-- Technical BUsiness SME -->

                <section>

                    <div class="row mt-50 grid1">
                        <div class="container">
                            <div class="col-md-12" id="box">
                                <div class="container-fluid" >
                                    <div class="row">
                                        <div class="col-md-4 col-sm-4">
                                        </div>

                                        <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                        </div>


                                    </div>

                                </div>


                                <div class="col-md-2 col-sm-2">
                                    <a href="AppEmphasize_EditProject.jsp">
                                        <center>
                                            <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Plan and Pirority</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="Applications.jsp" >
                                        <center>
                                            <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Intake</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a href="Archive_Execution.jsp">
                                        <center>
                                            <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Archival Execution</h6>
                                        </center> </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>
                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Decommission Execution</h6>
                                        </center>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5 col-sm-5"></div>
                    <div class="col-md-2 col-sm-2" id="varrow">
                        <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                    </div>
                    <div class="col-md-5 col-sm-5">

                    </div>


                    <div class="row mt-50 grid2">
                        <div class="container">
                            <div class="col-md-12" id="box1">
                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="User_Configuration.jsp">
                                        <center>
                                            <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Admin</h6>
                                        </center>
                                    </a>
                                </div>

                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <div class="col-md-2 col-sm-2" >
                                    <a href="RoleUIDashboard.jsp">
                                        <center>
                                            <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Reports and Governance</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <%--<div class="col-md-2 col-sm-2" id="testDecom">
                                  <a href="#">
                                 <center>
                                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                   <h6 class="mt-5">Reports Governance</h6>
                                 </center>
                                  </a>
                                </div>--%>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Finance & Contract Management</h6>
                                        </center>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </section>


                <%
                }
                else if(roles.equals("LegacyTechnicalSME"))
                {
                %>
                <!-- Legacy Technical SME -->
                <section>

                    <div class="row mt-50 grid1">
                        <div class="container">
                            <div class="col-md-12" id="box">

                                <div class="container-fluid" >
                                    <div class="row">
                                        <div class="col-md-4 col-sm-4">
                                        </div>

                                        <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                        </div>


                                    </div>

                                </div>

                                <div class="col-md-2 col-sm-2">
                                    <a href="AppEmphasize_EditProject.jsp">
                                        <center>
                                            <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Plan and Pirority</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>

                                <div class="col-md-2 col-sm-2">
                                    <a href="Applications.jsp" >
                                        <center>
                                            <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Intake</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>


                                <div class="col-md-2 col-sm-2">
                                    <a href="Archive_Execution.jsp">
                                        <center>
                                            <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Archival Execution</h6>
                                        </center> </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>




                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Decommission Execution</h6>
                                        </center>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-5 col-sm-5"></div>
                    <div class="col-md-2 col-sm-2" id="varrow">
                        <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                    </div>
                    <div class="col-md-5 col-sm-5">

                    </div>
                    <div class="row mt-50 grid2">
                        <div class="container">
                            <div class="col-md-12" id="box1">
                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="User_Configuration.jsp">
                                        <center>
                                            <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Admin</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>

                                <div class="col-md-2 col-sm-2" >
                                    <a href="RoleUIDashboard.jsp">
                                        <center>
                                            <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Reports and Governance</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <%--<div class="col-md-2 col-sm-2" id="testDecom">
                                  <a href="#">
                                 <center>
                                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                   <h6 class="mt-5">Reports Governance</h6>
                                 </center>
                                  </a>
                                </div>--%>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <div class="col-md-3 col-sm-3" id="testDecom">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Finance & Contract Management</h6>
                                        </center>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- /.row -->
                </section>
                <%}
                else if(roles.equals("LegacyProgramManager"))
                {
                %>
                <!-- LegacyProgramManager -->
                <section>

                    <div class="row mt-50 grid1">
                        <div class="container">
                            <div class="col-md-12" id="box">
                                <div class="container-fluid" >
                                    <div class="row">
                                        <div class="col-md-4 col-sm-4">
                                        </div>

                                        <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                        </div>


                                    </div>

                                </div>

                                <div class="col-md-2 col-sm-2">
                                    <a href="AppEmphasize_EditProject.jsp">
                                        <center>
                                            <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Plan and Pirority</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>

                                <div class="col-md-2 col-sm-2">
                                    <a href="Applications.jsp" >
                                        <center>
                                            <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Intake</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>

                                <div class="col-md-2 col-sm-2">
                                    <a href="Archive_Execution.jsp">
                                        <center>
                                            <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Archival Execution</h6>
                                        </center> </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">
                                    <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                </div>

                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Decommission Execution</h6>
                                        </center>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>


                    <div class="col-md-5 col-sm-5"></div>
                    <div class="col-md-2 col-sm-2" id="varrow">
                        <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                    </div>
                    <div class="col-md-5 col-sm-5">

                    </div>

                    <div class="row mt-50 grid2">
                        <div class="container">
                            <div class="col-md-12" id="box1">
                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="User_Configuration.jsp">
                                        <center>
                                            <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Admin</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>

                                <div class="col-md-2 col-sm-2" >
                                    <a href="ProjectManager_dashboard.jsp">
                                        <center>
                                            <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Reports and Governance</h6>
                                        </center>
                                    </a>
                                </div>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <%--<div class="col-md-2 col-sm-2" id="testDecom">
                                  <a href="#">
                                 <center>
                                   <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                   <h6 class="mt-5">Reports Governance</h6>
                                 </center>
                                  </a>
                                </div>--%>
                                <div class="col-md-1 col-sm-1" id="arrow">

                                </div>
                                <div class="col-md-2 col-sm-2" id="testDecom">
                                    <a href="#">
                                        <center>
                                            <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                            <h6 class="mt-5">Finance & Contract Management</h6>
                                        </center>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>


                        <%
  
         }
else if(roles.equals("ArchivalBusinessAnalyst"))
{
         %>

                    <!-- Archival Business Analyst -->
                    <section>

                        <div class="row mt-50 grid1">
                            <div class="container">
                                <div class="col-md-12" id="box">

                                    <div class="container-fluid" >
                                        <div class="row">
                                            <div class="col-md-4 col-sm-4">
                                            </div>

                                            <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                            </div>


                                        </div>

                                    </div>

                                    <div class="col-md-2 col-sm-2">
                                        <a href="AppEmphasize_EditProject.jsp">
                                            <center>
                                                <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Plan and Pirority</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>
                                    <div class="col-md-2 col-sm-2">
                                        <a href="Applications.jsp" >
                                            <center>
                                                <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Intake</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>
                                    <div class="col-md-2 col-sm-2">
                                        <a href="Archive_Execution.jsp">
                                            <center>
                                                <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Archival Execution</h6>
                                            </center> </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>
                                    <div class="col-md-2 col-sm-2" id="testDecom">
                                        <a href="#">
                                            <center>
                                                <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Decommission Execution</h6>
                                            </center>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-5 col-sm-5"></div>
                        <div class="col-md-2 col-sm-2" id="varrow">
                            <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                        </div>
                        <div class="col-md-5 col-sm-5">

                        </div>

                        <div class="row mt-50 grid2">
                            <div class="container">
                                <div class="col-md-12" id="box1">


                                    <div class="col-md-2 col-sm-2" id="testDecom">
                                        <a href="User_Configuration.jsp">
                                            <center>
                                                <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Admin</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>
                                    <div class="col-md-2 col-sm-2" >
                                        <a href="RoleUIDashboard.jsp">
                                            <center>
                                                <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Reports and Governance</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>
                                    <%--<div class="col-md-2 col-sm-2" id="testDecom">
                                      <a href="#">
                                     <center>
                                       <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                       <h6 class="mt-5">Reports Governance</h6>
                                     </center>
                                      </a>
                                    </div>--%>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>
                                    <div class="col-md-2 col-sm-2" id="testDecom">
                                        <a href="#">
                                            <center>
                                                <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Finance & Contract Management</h6>
                                            </center>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </section>
                        <%
}
else if(roles.equals("ArchivalTechnicalLead"))
{
%>
                    <section>

                        <div class="row mt-50 grid1">
                            <div class="container">
                                <div class="col-md-12" id="box">

                                    <div class="container-fluid" >
                                        <div class="row">
                                            <div class="col-md-4 col-sm-4">
                                            </div>

                                            <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                            </div>


                                        </div>

                                    </div>
                                    <div class="col-md-2 col-sm-2">
                                        <a href="AppEmphasize_EditProject.jsp">
                                            <center>
                                                <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Plan and Pirority</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>
                                    <div class="col-md-2 col-sm-2">
                                        <a href="Applications.jsp">
                                            <center>
                                                <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Intake</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>
                                    <div class="col-md-2 col-sm-2">
                                        <a href="Archive_Execution.jsp">
                                            <center>
                                                <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Archival Execution</h6>
                                            </center> </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>
                                    <div class="col-md-2 col-sm-2" id="testDecom">
                                        <a href="#">
                                            <center>
                                                <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Decommission Execution</h6>
                                            </center>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-5 col-sm-5"></div>
                        <div class="col-md-2 col-sm-2" id="varrow">
                            <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                        </div>
                        <div class="col-md-5 col-sm-5">

                        </div>





                        <div class="row mt-50 grid2">
                            <div class="container">
                                <div class="col-md-12" id="box1">
                                    <div class="col-md-2 col-sm-2" id="testDecom">
                                        <a href="User_Configuration.jsp">
                                            <center>
                                                <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Admin</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>



                                    <div class="col-md-2 col-sm-2" >
                                        <a href="RoleUIDashboard.jsp">
                                            <center>
                                                <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Reports and Governance</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>

                                    <%--<div class="col-md-2 col-sm-2" id="testDecom">
                                      <a href="#">
                                     <center>
                                       <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                       <h6 class="mt-5">Reports Governance</h6>
                                     </center>
                                      </a>
                                    </div>--%>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>

                                    <div class="col-md-2 col-sm-2" id="testDecom">
                                        <a href="#">
                                            <center>
                                                <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Finance & Contract Management</h6>
                                            </center>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </section>
                        <%
}
else if(roles.equals("ArchivalProjectManager"))
{
	%>
                    <!-- Archival Program Manager -->
                    <section>

                        <div class="row mt-50 grid1">
                            <div class="container">
                                <div class="col-md-12" id="box">

                                    <div class="container-fluid" >
                                        <div class="row">
                                            <div class="col-md-4 col-sm-4">
                                            </div>

                                            <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                            </div>


                                        </div>

                                    </div>

                                    <div class="col-md-2 col-sm-2">
                                        <a href="AppEmphasize_EditProject.jsp">
                                            <center>
                                                <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Plan and Pirority</h6>
                                            </center>
                                        </a>
                                    </div>

                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>
                                    <div class="col-md-2 col-sm-2">
                                        <a href="ArchiveDecommPage.jsp" >
                                            <center>
                                                <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Intake</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>
                                    <div class="col-md-2 col-sm-2">
                                        <a href="Archive_Execution.jsp">
                                            <center>
                                                <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Archival Execution</h6>
                                            </center> </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>
                                    <div class="col-md-2 col-sm-2">
                                        <a href="#">
                                            <center>
                                                <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Decommission Execution</h6>
                                            </center>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-5 col-sm-5"></div>
                        <div class="col-md-2 col-sm-2" id="varrow">
                            <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                        </div>
                        <div class="col-md-5 col-sm-5">

                        </div>



                        <div class="row mt-50 grid2">
                            <div class="container">
                                <div class="col-md-12" id="box1">
                                    <div class="col-md-2 col-sm-2" >
                                        <a href="User_Configuration.jsp">
                                            <center>
                                                <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Admin</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>

                                    <div class="col-md-2 col-sm-2" >
                                        <a href="ProjectManager_dashboard.jsp">
                                            <center>
                                                <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Reports and Governance</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>
                                    <%--<div class="col-md-2 col-sm-2">
                                      <a href="#">
                                     <center>
                                       <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                       <h6 class="mt-5">Reports Governance</h6>
                                     </center>
                                      </a>
                                    </div>
                    --%>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>
                                    <div class="col-md-2 col-sm-2">
                                        <a href="#">
                                            <center>
                                                <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Finance & Contract Management</h6>
                                            </center>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </section>

                        <%
}
else if(roles.equals("ArchivalDeveloper"))
{
%>
                    <section>

                        <div class="row mt-50 grid1">
                            <div class="container">
                                <div class="col-md-12" id="box">

                                    <div class="container-fluid" >
                                        <div class="row">
                                            <div class="col-md-4 col-sm-4">
                                            </div>

                                            <div class="col-md-6 col-sm-6">
<span>

<div></i><span><hr class="hr-primary" /></i></span></div>
<div><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-25px 6px"><i class="fa fa-arrow-down" style="font-size:24px;color:rgba(66,133,244,.8); margin:-10px 378px"></i></i></div>
<span>

                                            </div>


                                        </div>

                                    </div>
                                    <div class="col-md-2 col-sm-2" >
                                        <a href="AppEmphasize_EditProject.jsp">
                                            <center>
                                                <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Plan and Pirority</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>

                                    <div class="col-md-2 col-sm-2">
                                        <a href="Applications.jsp" >
                                            <center>
                                                <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Intake</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>

                                    <div class="col-md-2 col-sm-2">
                                        <a href="Archive_Execution.jsp">
                                            <center>
                                                <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Archival Execution</h6>
                                            </center> </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">
                                        <i class="fa fa-arrows-h" style="font-size:48px;color:#3D7DDE"></i>
                                    </div>

                                    <div class="col-md-2 col-sm-2" id="testDecom">
                                        <a href="#">
                                            <center>
                                                <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Decommission Execution</h6>
                                            </center>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 col-sm-5"></div>
                        <div class="col-md-2 col-sm-2" id="varrow">
                            <i class="fa fa-arrows-v" style="font-size:48px;color:#3D7DDE"></i>
                        </div>
                        <div class="col-md-5 col-sm-5">

                        </div>

                        <div class="row mt-50 grid2">
                            <div class="container">
                                <div class="col-md-12" id="box1">


                                    <div class="col-md-2 col-sm-2"  id="testDecom" >
                                        <a href="User_Configuration.jsp">
                                            <center>
                                                <img src="images/grid/admin.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Admin</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>
                                    <div class="col-md-2 col-sm-2" >
                                        <a href="RoleUIDashboard.jsp">
                                            <center>
                                                <img src="images/grid/reporting.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Reports and Governance</h6>
                                            </center>
                                        </a>
                                    </div>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>
                                    <%--<div class="col-md-2 col-sm-2" id="testDecom">
                                      <a href="#">
                                     <center>
                                       <img src="images/grid/program-governance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                       <h6 class="mt-5">Reports Governance</h6>
                                     </center>
                                      </a>
                                    </div>--%>
                                    <div class="col-md-1 col-sm-1" id="arrow">

                                    </div>
                                    <div class="col-md-2 col-sm-2" id="testDecom">
                                        <a href="#">
                                            <center>
                                                <img src="images/grid/finance.png" class="img-rounded" height="100" width="100" alt="Avatar">
                                                <h6 class="mt-5">Finance & Contract Management</h6>
                                            </center>
                                        </a>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </section>

                        <%} %>


            </div>

        </div>





        </br>
    </div>
    <!-- /.main-page -->

    <!-- Project List End -->

</div>
<!-- /.content-container -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->

<%

    }
%>

<%
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
%>

<script>
    $(document).ready(function() {

        $('#testDecom').attr('disabled', true);
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
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all" />
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



</body>
</html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projects</title>
    <meta name="description" content="Blueprint: View Mode Switch"/>
    <meta name="keywords" content="view mode, switch, css, style, grid, list, template"/>
    <meta name="author" content="Codrops"/>
    <!-- <link rel="stylesheet" type="text/css" href="css/default.css" />
    <link rel="stylesheet" type="text/css" href="css/component.css" />
    <script src="js/modernizr.custom.js"></script> -->

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

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script type="text/javascript" src="js_in_pages/firstinsert.js"></script>
    <script type="text/javascript" src="js_in_pages/tree.js"></script>
    <link rel="stylesheet" href="js_in_pages/firstinsert.css" type="text/css"/>

    <style>
        #nav_userid {
            color: green;
        }

        #nav_role {
            color: blue;
        }
        .btn {
            border: none;
            outline: none;
            padding: 3px 14px;
            background-color: #3697e8;
            cursor: pointer;

        }
        .activ-pro{font-size: 16px;
            margin-left: -13px;
            margin-right: 147px;}
        .active, .btn:hover {
            color: white;
        }
    </style>

</head>

<!--from  w  w w  . ja  va 2 s.co  m-->
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    System.out.println("[INFO]-----" + formatter.format(date1) + "-----Accessed Applications JSP PAGE-----[INFO]"); %>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="onboard.DBconnection" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.

    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<%

    String ID = (String) session.getAttribute("theName");

    try {
        String query3 = "";
        HttpSession details = request.getSession();
        DBconnection d = new DBconnection();
        Connection con = (Connection) d.getConnection();
        String Project_name = (String) details.getAttribute("projects");
        String Applications = (String) details.getAttribute("applications");
        String username = (String) details.getAttribute("u_Name");
        String visit_query = "select * from visits";
        Statement visit_st = con.createStatement();
        ResultSet visit_rs = visit_st.executeQuery(visit_query);
        int flag = 1;

        Date date = new Date();
        SimpleDateFormat ft, ft1;
        ft = new SimpleDateFormat("yyyy-MM-dd");
        ft1 = new SimpleDateFormat("hh:mm:ss");
        String strDate = ft.format(date);
        String strTime = ft1.format(date);
        System.out.println("project_name-------------applications------" + Project_name + "   " + Applications);
        /*String[] apparr = Applications.split(",");*/
        /* System.out.println("proarr-------"+proarr[1]);*/
        if (Project_name.equals("all"))
            query3 = "select * from AppEmphazize_ProjectDetails where id=" + ID;
        else
            query3 = "select * from AppEmphazize_ProjectDetails where projectname='" + Project_name + "'";
        Statement st3 = con.createStatement();
        ResultSet rs3 = st3.executeQuery(query3);

%>

<form method="post" name="form" action="Appin">

    <div class="main-wrapper">

        <!-- ========== TOP NAVBAR ========== -->
        <nav class="navbar top-navbar bg-white box-shadow">
            <div class="container-fluid">
                <div class="row">

                    <%--<%
                        if (rs3.next()) {
                            String Project_Name = rs3.getString("projectname");
                            System.out.println("the projectname is " + Project_Name);
                            String query = "";
                            String applications = "";
                            String[] apparr2;
                            if (Project_name.equals("all")) {
                                query = "select * from AppEmphazize_ApplicationInfo where prjname = '" + Project_Name + "'";
                            } else {
                                for (int i = 0; i < apparr.length; i++) {
                                    apparr2 = apparr[i].split("-");
                                    System.out.println("arr----------" + apparr[i] + "apparr2---------" + apparr2[1] + "apparr2---------" + apparr2[0]);
                                    if (apparr2[0].equals(selprj)) {
                                        applications += "OR appname='" + apparr2[1] + "' ";
                                    }
                                }
                                System.out.println("applications test----------" + applications);
                                String applications1 = applications.substring(3, applications.length());
                                System.out.println("applications1------------" + applications1 + "selprj-----" + selprj);
                                query = "select * from AppEmphazize_ApplicationInfo where prjname = '" + selprj + "' and " + applications1;
                            }
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(query);

                    %>--%>
                    <%
                        if (rs3.next()) {
                            String Project_Name = rs3.getString("projectname");
                            //System.out.println("the projectname is "+Project_Name);
                            String query = "";
                            if (Project_name.equals("all"))
                                query = "select * from AppEmphazize_ApplicationInfo where prjname = '" + Project_Name + "'";
                            else
                                query = "select * from AppEmphazize_ApplicationInfo where prjname = '" + Project_Name + "' and appname='" + Applications + "'";
                            Statement st = con.createStatement();
                            ResultSet rs = st.executeQuery(query);

                    %>

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
                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding
                        Tool-<%=rs3.getString("projectname") %>
                    </a>

                    <div class="collapse navbar-collapse" id="navbar-collapse-1">

                        <!-- /.nav navbar-nav -->
                        <ul class="nav navbar-nav navbar-right">

                            <li><%
                         String uname=(String)details.getAttribute("username");
                         String roles=(String)details.getAttribute("role");%>
                            <li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span
                                    id='nav_role'><%=roles%></span></a></li>

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
                                <li class="has-children">
                                    <a href=""><i class="fa fa-archive"></i> <span>Plan and pirority</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="AppEmphasize_EditProject.jsp" > <span>Project Information</span></a></li>
                                        <li><a href="AppEmphasize_Application.jsp" > <span>Application Information</span></a></li>
                                        <li><a href="AppEmphasize_CostCalculation.jsp" > <span>Application Complexity</span></a></li>
                                        <li><a href="AppEmphasize_PrioritizedApplications.jsp"> <span>Prioritized Applications</span></a></li>
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
                                <li class="has-children" id="myDIV">
                                    <a href=""><i class="fa fa-file-text"></i> <span>Intake Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li class="btn"><a href="Applications.jsp" > <span class="activ-pro">Archive Intake</span></a></li>
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

                <!-- Projects List Start -->

                <div class="main-page">
                    <div class="container-fluid">
                        <div class="row page-title-div">
                            <div class="col-sm-6">
                                <h2 class="title">Applications</h2>
                                <p class="sub-title">One stop solution for perfect admin!</p>
                            </div>

                        </div>
                        <!-- /.row -->
                        <div class="row breadcrumb-div">
                            <div class="col-sm-6">
                                <ul class="breadcrumb">
                                    <li><a href="index.php"><i class="fa fa-home"></i> Home</a></li>
                                    <li class="active">Applications</li>
                                </ul>
                            </div>
                            <!-- /.col-sm-6 -->
                            <%--<div class="col-sm-6 text-right hidden-xs">
                                <a href="#" class="pl-20"><i class="fa fa-cog"></i> Settings</a>
                            </div>--%>
                            <!-- /.col-sm-6 -->
                        </div>
                        <!-- /.row -->
                    </div>
                    <!-- /.container-fluid -->

                    <section>

                        <div class="row">
                            <div class="col-md-12">


                                <div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">

                                    <div class="cbp-vm-options">


                                        <%--<button type="button" class="btn btn-primary pull-right" name="newpr"
                                                onClick="editRecord();"><span class="glyphicon glyphicon-plus"
                                                                              aria-hidden="true"></span>
                                            New Application
                                        </button>

                                        <a href="#" class="cbp-vm-icon cbp-vm-grid cbp-vm-selected"
                                           data-view="cbp-vm-view-grid">Grid View</a>
                                        <a href="#" class="cbp-vm-icon cbp-vm-list" data-view="cbp-vm-view-list">List
                                            View</a>--%>
                                    </div>

                                    <ul id="ApplicationGrid">
                                        <%--<%
                                            String sequnce = "";
                                            while (rs.next()) {
                                        %>
                                        <li>
                                            <h3 class="cbp-vm-title left-col primary"
                                                name="name"><%= rs.getString("appname")%>
                                            </h3>
                                            <%
                                                String detail = "";
                                                String q3 = "select seq_num from ArchiveExecution_Details where projects='" + Project_Name + "' and name='" + rs.getString("appname") + "'";
                                                Statement stt = con.createStatement();
                                                ResultSet rst = stt.executeQuery(q3);
                                                if (rst.next())
                                                    detail = rst.getString(1);

                                                String q1 = "select * from ArchiveExecution_Details where projects='" + Project_Name + "' and seq_num>" + detail + " and seq_num<" + (detail + 70) + " and level=3";
                                                Statement st2 = con.createStatement();
                                                ResultSet rs2 = st2.executeQuery(q1);
                                                int l = -1;
                                                while (rs2.next()) {
                                                    l++;
                                                    if (rs2.getString(15).equals("100") || Integer.parseInt(rs2.getString(15)) >= 100)
                                                        continue;
                                                    else {
                                            %>
                                            <center>
                                                <div class="progress center-col cbp-vm-detail">
                                                    <div class="progress-bar progress-bar-success" id="prog_bar<%=l %>"
                                                         role="progressbar" aria-valuenow="<%=rs2.getString(15) %>"
                                                         aria-valuemin="0" aria-valuemax="100"
                                                         style="width:<%=rs2.getString(15) %>%">
                                                        <%=rs2.getString(15) %>%
                                                    </div>


                                                </div>
                                            </center>
                                            <%
                                                if (Integer.parseInt(rs2.getString(15)) < 35) {
                                            %>
                                            <script>document.getElementById('prog_bar<%=l %>').className = 'progress-bar progress-bar-danger progress-bar-striped';</script>

                                            <%
                                            } else if (Integer.parseInt(rs2.getString(15)) < 65) {
                                            %>
                                            <script>document.getElementById('prog_bar<%=l %>').className = 'progress-bar progress-bar-warning progress-bar-striped';</script>
                                            <%} %>
                                            <% if (l == 1) {%>
                                            <%
                                                if (Integer.parseInt(rs2.getString(15)) < 35) {
                                            %>
                                            <script>document.getElementById('prog_bar<%=l %>').className = 'progress-bar progress-bar-danger progress-bar-striped';</script>
                                            <%
                                            } else if (Integer.parseInt(rs2.getString(15)) < 65) {
                                            %>
                                            <script>document.getElementById('prog_bar<%=l %>').className = 'progress-bar progress-bar-warning progress-bar-striped';</script>
                                            <%} %>
                                            <h5 class="cbp-vm-title right-col primary">Development</h5>
                                            <%} else if (l == 2) { %>
                                            <%
                                                if (Integer.parseInt(rs2.getString(15)) < 35) {
                                            %>
                                            <script>document.getElementById('prog_bar<%=l %>').className = 'progress-bar progress-bar-danger progress-bar-striped';</script>
                                            <%
                                            } else if (Integer.parseInt(rs2.getString(15)) < 65) {
                                            %>
                                            <script>document.getElementById('prog_bar<%=l %>').className = 'progress-bar progress-bar-warning progress-bar-striped';</script>
                                            <%} %>
                                            <h5 class="cbp-vm-title right-col primary"><!-- Testing --></h5>
                                            <%} %>
                                            <h5 class="cbp-vm-title right-col primary"><%=rs2.getString(3) %>
                                            </h5>
                                            <%
                                                        break;
                                                    }
                                                } %>


                                            <button type="button" class="btn btn-primary"
                                                    onClick="edit('<%= rs.getString("appname")%>');">
                                                View/Update
                                            </button>
                                        </li>

                                        <%
                                            }
                                        %>--%>

                                    </ul>
                                    <%
                                            }
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>
                                </div>
                            </div>

                        </div>

                </div>


                <!-- Project List End -->

            </div>
            <!-- /.content-container -->
        </div>
        <!-- /.content-wrapper -->

    </div>
    <!-- /.main-wrapper -->

</form>

<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        $(".lis").click(function () {
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
        });
        $(".gr").click(function () {
            $(".cbp-vm-switcher").addClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-list");
        });
    });
</script>


<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script src="js/waypoint/waypoints.min.js"></script>
<script src="js/counterUp/jquery.counterup.min.js"></script>
<script src="js/amcharts/amcharts.js"></script>
<script src="js/amcharts/serial.js"></script>
<script src="js/amcharts/plugins/export/export.min.js"></script>
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


<!-- ========== THEME JS ========== -->

<script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>


<!-- ========== THEME JS ========== -->
<script>
    $(document).ready(function () {
        $.ajax({
            url: 'Archive_Intake_Servlet',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                console.log("data=----->", data);
                var ulid=$('#ApplicationGrid');
                var l=-1;
                for(var i=0;i<data.length;i++) {
                    l++;
                    var li="<li>\n" +
                        "<h3 class='cbp-vm-title left-col primary'\n" +
                        "\nname='name'>\n"+data[i].applicationname+
                        "</h3>"+
                        "<center>\n" +
                        "<div class='progress center-col cbp-vm-detail'>\n" +
                        "<div class='progress-bar progress-bar-success' id='prog_bar"+l+"'\n" +
                        "role='progressbar' aria-valuenow=' "+data[i].applicationpercentage+"'\n" +
                        "aria-valuemin='0' aria-valuemax='100'\n" +
                        "style='width:"+data[i].applicationpercentage+"%'>\n"+
                        +data[i].applicationpercentage+"%\n" +
                        "</div>\n" +
                        "</div>\n" +
                        "</center>"+
                        //ulid.append(center);
                        "<h5 class='cbp-vm-title right-col primary'>"+data[i].applicationstate+"\n" +
                        "</h5>"+
                        "<script>if("+data[i].applicationpercentage+"<35){document.getElementById('prog_bar"+i+"').className = 'progress-bar progress-bar-danger progress-bar-striped';}else if("+data[i].applicationpercentage+"<65)" +
                        "{document.getElementById('prog_bar"+i+"').className = 'progress-bar progress-bar-warning progress-bar-striped';}<\/script>"+
                        "<button type='button' class='btn btn-primary'\n" +
                        "onClick=\"edit('"+data[i].applicationname+"');\">\n" +
                        "View/Update\n"+
                        "</button></li>";
                    ulid.append(li);
                }
            }
        });
    });
    $(function ($) {

        // 1st  datepicker
        $('#basicExample .time').timepicker({
            'showDuration': true,
            'timeFormat': 'g:ia'
        });

        $('#basicExample .date').datepicker({
            'format': 'm/d/yyyy',
            'autoclose': true
        });

        var basicExampleEl = document.getElementById('basicExample');
        var datepair = new Datepair(basicExampleEl);

        // 2nd  datepicker
        $('#datetimepicker1').datetimepicker({
            debug: true
        });

        // 3rd  datepicker
        $('#datetimepicker9').datetimepicker({
            viewMode: 'years'
        });

        // 4th  datepicker
        $('#datetimepicker10').datetimepicker({
            viewMode: 'years',
            format: 'MM/YYYY'
        });

        // 5th  datepicker
        $('#datetimepicker11').datetimepicker({
            daysOfWeekDisabled: [0, 6]
        });

        // 6th  datepicker
        $('#datetimepicker12').datetimepicker({
            inline: true,
            sideBySide: true
        });
    });
</script>
<script>
    // Add active class to the current button (highlight it)
    var header = document.getElementById("myDIV");
    var btns = header.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function() {
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
</script>

</body>
</html>

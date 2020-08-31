<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Onboard</title>

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
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script type="text/javascript" src="js_in_pages/business.js"></script>
    <script type="text/javascript" src="js_in_pages/tree.js"></script>
    <link rel="stylesheet" href="js_in_pages/business.css" type="text/css"/>


</head><!--from  w  w w  . ja  va 2 s.co  m-->
<style>
    body {
        font-family: Arial, sans-serif;

        background-size: cover;
        height: 100vh;
    }

    h1 {
        text-align: center;
        font-family: Tahoma, Arial, sans-serif;
        color: #06D85F;
        margin: 80px 0;
    }

    .box {
        width: 40%;
        margin: 0 auto;
        background: rgba(255, 255, 255, 0.2);
        padding: 50px;
        border: 2px solid #fff;
        border-radius: 20px/50px;
        background-clip: padding-box;
        text-align: center;
    }

    .overlay {
        position: fixed;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        background: rgba(0, 0, 0, 0.7);
        transition: opacity 500ms;
        visibility: hidden;
    }

    .overlay:target {
        visibility: visible;
        opacity: 1;
    }

    .popup {
        margin: 210px auto;
        padding: 20px;
        background: #fff;
        border-radius: 5px;
        width: 40%;
        position: relative;

    }

    .popup h2 {
        margin-top: 0;
        color: #333;
        font-family: Tahoma, Arial, sans-serif;
    }

    .popup .close {
        position: absolute;
        top: 20px;
        right: 30px;
        transition: all 200ms;
        font-size: 30px;
        font-weight: bold;
        text-decoration: none;
        color: black;
    }

    .popup .close:hover {
        color: black;
    }

    .popup .content {
        max-height: 30%;
        overflow: auto;
    }

    .button {
        color: white;
    }

    @media screen and (max-width: 700px) {
        .box {
            width: 70%;
        }

        .popup {
            width: 70%;
        }

    }

    #nav_userid {
        color: green;
    }

    #nav_role {
        color: blue;
    }

    .ScrollStyle {
        max-height: 350px;
        overflow-y: scroll;
    }

    /*END Form Wizard*/


</style>


<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    System.out.println("[INFO]-----" + formatter.format(date1) + "-----Accessed Intake_Business JSP PAGE-----[INFO]"); %>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="onboard.DBconnection" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@ page import="java.util.*" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.html");
    }
%>


<%
    try {
        HttpSession details = request.getSession();
        String role_info = (String) details.getAttribute("intake");
        String roles = (String) details.getAttribute("role");
        String ID = (String) session.getAttribute("theName");
        String app_Name = request.getParameter("appname");
        if (app_Name != null && !app_Name.isEmpty()) {
            session.setAttribute("appidd", app_Name);
        }
        app_Name = (String) session.getAttribute("appidd");
        DBconnection d = new DBconnection();
        Connection conn = (Connection) d.getConnection();
        String Projects = (String) details.getAttribute("projects");
        String Applications = (String) details.getAttribute("applications");
        String username = (String) details.getAttribute("u_Name");
        String Project_Name = (String) details.getAttribute("nameofproject");
        String visit_query = "select * from visits";
        Statement visit_st = conn.createStatement();
        ResultSet visit_rs = visit_st.executeQuery(visit_query);
        int flag = 1;

        Date date = new Date();
        SimpleDateFormat ft, ft1;
        ft = new SimpleDateFormat("yyyy-MM-dd");
        ft1 = new SimpleDateFormat("hh:mm:ss");
        String strDate = ft.format(date);
        String strTime = ft1.format(date);


        String query3 = "select * from AppEmphazize_ProjectDetails where id = " + ID;
        Statement st3 = conn.createStatement();
        ResultSet rs3 = st3.executeQuery(query3);
        String query4 = "select * from AppEmphazize_ApplicationInfo where appname ='" + app_Name + "'";
        Statement st4 = conn.createStatement();
        ResultSet rs4 = st4.executeQuery(query4);

        String query5 = "select read_date from AppEmphazize_ApplicationPrioritization where prj_name ='" + Project_Name + "' and proj_name = '" + app_Name + "'";
        Statement st5 = conn.createStatement();
        ResultSet rs5 = st5.executeQuery(query5);
        String imp_id = "";
        String sequenceNumber = "", pan_ID = "";
        int actualHours = 0, plannedHours = 0, actualHours1 = 0, plannedHours1 = 0;
        ArrayList<String> list = new ArrayList<String>();
        if (rs3.next()) {
            String project_NAME = rs3.getString("projectname");
            {
%>

<form class="form-signin" name="loginForm" method="post">

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

                    <% if (rs4.next()) {
                        String rowCount = "";
                        String query11 = "select * from Intake_BuisnessDetails where appname='" + rs4.getString("appname") + "' and projectname='" + rs3.getString("projectname") + "' and id=(select max(id) from Intake_BuisnessDetails where appname='" + rs4.getString("appname") + "' and projectname='" + rs3.getString("projectname") + "')";
                        Statement st11 = conn.createStatement();
                        ResultSet rs11 = st11.executeQuery(query11);
                        String query12 = "select count(*) from Intake_BuisnessDetails where appname='" + rs4.getString("appname") + "' and projectname='" + rs3.getString("projectname") + "'";
                        Statement st12 = conn.createStatement();
                        ResultSet rs12 = st12.executeQuery(query12);
                        if (rs12.next())
                            rowCount = rs12.getString(1);


                    %>
                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding
                        Tool-<%=rs3.getString("projectname") %>-<%=rs4.getString("appname") %>
                    </a>
                    <input type="text" id="project_name" name="project_name" value="<%=rs3.getString("projectname")%>"
                           style="display:none;">
                    <input type="text" id="appln_name" name="appln_name" value="<%= app_Name%>" style="display:none;">

                    <%

                        while (visit_rs.next()) {
                            if (visit_rs.getString(1) != null) {
                                if (visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Intake Module") && visit_rs.getString(6).equals(Project_Name) && visit_rs.getString(7).equals(rs4.getString("appname"))) {
                                    Statement stmtt = conn.createStatement();
                                    String queryy = "update visits set count=count+1,time='" + strTime + "' where uname='" + username + "' and module='Intake Module' and Projects='" + Project_Name + "' and Applications='" + rs4.getString("appname") + "'";
                                    int count = stmtt.executeUpdate(queryy);
                                    flag = 0;
                                }
                            }
                        }

                        if (flag == 1) {

                            String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
                                    + " values (?, ?, ?, ?, ?, ?, ?)";

                            PreparedStatement preparedStmt = conn.prepareStatement(ins_query);
                            preparedStmt.setString(1, username);
                            preparedStmt.setString(2, strDate);
                            preparedStmt.setString(3, "Intake Module");
                            preparedStmt.setString(4, "1");
                            preparedStmt.setString(5, strTime);
                            preparedStmt.setString(6, Project_Name);
                            preparedStmt.setString(7, app_Name);

                            // execute the preparedstatement
                            preparedStmt.execute();
                        }


                        String quer2 = "select * from ArchiveExecution_Details where level=1 and projects='" + rs3.getString("projectname") + "'order by seq_num";
                        Statement s2 = conn.createStatement();
                        ResultSet rss = s2.executeQuery(quer2);
                        while (rss.next())
                            session.setAttribute(rss.getString(3), rss.getString(15));

                        String quer3 = "select id from ArchiveExecution_Details where name='" + rs4.getString("appname") + "' and projects='" + rs3.getString("projectname") + "'order by seq_num";
                        Statement s3 = conn.createStatement();
                        ResultSet rss1 = s3.executeQuery(quer3);
                        while (rss1.next())
                            imp_id = rss1.getString(1);

                        String quer4 = "select * from ArchiveExecution_Details where ref_id='" + imp_id + "' and projects='" + rs3.getString("projectname") + "'order by seq_num";
                        Statement s4 = conn.createStatement();
                        ResultSet rss2 = s4.executeQuery(quer4);

                        while (rss2.next()) {
                            session.setAttribute(rss2.getString(3), rss2.getString(15));

                        }

                        String quer5 = "select seq_num from ArchiveExecution_Details where name='Build and Test'";
                        Statement s5 = conn.createStatement();
                        ResultSet rss3 = s5.executeQuery(quer5);
                        if (rss3.next())
                            sequenceNumber = rss3.getString(1);

                        String quer6 = "select * from ArchiveExecution_Details where projects='" + rs3.getString("projectname") + "' and seq_num>" + sequenceNumber + " and seq_num<" + (sequenceNumber + 33) + " and level=4";
                        Statement s6 = conn.createStatement();
                        ResultSet rss4 = s6.executeQuery(quer6);
                        int knt = 0;

                        while (rss4.next()) {
                            if (knt > 2) {
                                if (rss4.getString(9).equals(""))
                                    actualHours1 += 0;
                                else
                                    actualHours1 += Integer.parseInt(rss4.getString(9));
                                if (rss4.getString(13).equals(""))
                                    plannedHours1 += 0;
                                else
                                    plannedHours1 += Integer.parseInt(rss4.getString(13));
                            } else {
                                if (rss4.getString(9).equals(""))
                                    actualHours += 0;
                                else
                                    actualHours += Integer.parseInt(rss4.getString(9));
                                if (rss4.getString(13).equals(""))
                                    plannedHours += 0;
                                else
                                    plannedHours += Integer.parseInt(rss4.getString(13));

                            }
                            knt++;
                        }
                    %>


                    <div class="collapse navbar-collapse" id="navbar-collapse-1">

                        <!-- /.nav navbar-nav -->
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="#"><span id="nav_userid"><%=username%>&nbsp;</span>logged in as &nbsp;<span
                                    id='nav_role'><%=roles%></span></a></li>

                            <li><a href="logout.jsp" class=" text-center"><i class="fa fa-sign-out"></i> Logout</a>
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
                                        <li><a href="AppEmphasize_EditProject.jsp" class="active-menu"> <span>Project Information</span></a></li>
                                        <li><a href="AppEmphasize_Application.jsp" class="active-menu"> <span>Application Information</span></a></li>
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
                                <li class="has-children">
                                    <a href=""><i class="fa fa-file-text"></i> <span>Intake Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Applications.jsp" class="active-menu"> <span>Application Details</span></a></li>
                                        <li><a href="Intake_Business.jsp" > <span>Business Details</span></a></li>
                                        <li><a href="Intake_TechnicalDetails.jsp"> <span>Technical Details</span></a></li>
                                        <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a></li>
                                        <li><a href="Intake_ReviewPage.jsp"> <span>Review Page</span></a></li>
                                    </ul>
                                </li>
                                <%--<li class="nav-header">
                                    <a href='Archive_Execution.jsp'><span class="">Archive Execution Module</span></a>
                                </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="Archive_Execution.jsp" class="active-menu"> <span>Archive Execution</span></a></li>
                                        <li><a href="archivesummary.jsp" > <span>Archive summary</span></a></li>

                                    </ul>
                                </li>
                                <%--   <li class="nav-header">
                                       <a href='RoleUIDashboard.jsp'><span class="">Report Module</span></a>
                                   </li>--%>
                                <li class="has-children">
                                    <a href=""><i class="fa fa-paint-brush"></i> <span>Report Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav">
                                        <li><a href="RoleUIDashboard.jsp" class="active-menu"> <span>Reports Dashboard</span></a></li>
                                        <li><a href="RoleDashboard.jsp" class="active-menu"> <span>Role Dashboard</span></a></li>
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


                <script>
                    $(function () {
                        // 6 create an instance when the DOM is ready
                        $('#jstree').jstree();
                        // 7 bind to events triggered on the tree
                        $('#jstree').on("changed.jstree", function (e, data) {
                            console.log(data.selected);
                        });
                        // 8 interact with the tree - either way is OK
                        $('button').on('click', function () {
                            $('#jstree').jstree(true).select_node('child_node_1');
                            $('#jstree').jstree('select_node', 'child_node_1');
                            $.jstree.reference('#jstree').select_node('child_node_1');
                        });
                    });
                </script>


                <!-- Projects List Start -->


                <section>

                    <div class="row">
                        <div class="container">

                            <div class="main">
                                <br>
                                <%
                                    String initiate = (String) session.getAttribute("Ideation and Initiate");
                                    String plan = (String) session.getAttribute("Plan");
                                    String execute = (String) session.getAttribute("Execute");
                                    String hypercare = (String) session.getAttribute("Closure");
                                    if (initiate == null)
                                        initiate = "0";
                                    if (plan == null)
                                        plan = "0";
                                    if (execute == null)
                                        execute = "0";
                                    if (hypercare == null)
                                        hypercare = "0";
                                %>


                                <div class="row">

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Initiate</label></center>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success progress-bar-striped"
                                                     role="progressbar" id="prog_bar" style="width: <%=initiate%>%"
                                                     aria-valuenow="<%=initiate %>" aria-valuemin="0"
                                                     aria-valuemax="100"><span
                                                        style="color:black;"><%=initiate %>%</span></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Plan</label></center>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success progress-bar-striped"
                                                     role="progressbar" id="prog_bar1" style="width: <%=plan%>%"
                                                     aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100">
                                                    <span style="color:black;"><%=plan %>%</span></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Execute</label></center>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success progress-bar-striped"
                                                     role="progressbar" id="prog_bar2" style="width: <%=execute %>%"
                                                     aria-valuenow="<%=execute %>" aria-valuemin="0"
                                                     aria-valuemax="100"><span
                                                        style="color:black;"><%=execute %>%</span></div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Closure</label></center>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success progress-bar-stripedss-bar"
                                                     role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%"
                                                     aria-valuenow="<%=hypercare %>" aria-valuemin="0"
                                                     aria-valuemax="100"><span
                                                        style="color:black;"><%=hypercare %>%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <br>
                                <div class="row">
                                    <%
                                        int dev = 0, test = 0;
                                        String requirements = (String) session.getAttribute("Requirements");
                                        String implement = (String) session.getAttribute("Implement");
                                        if (plannedHours != 0)
                                            dev = (actualHours * 100) / plannedHours;
                                        if (plannedHours1 != 0)
                                            test = (actualHours1 * 100) / plannedHours1;
                                        String development = String.valueOf(dev);
                                        String testing = String.valueOf(test);
                                        if (requirements == null)
                                            requirements = "0";
                                        if (implement == null)
                                            implement = "0";
                                    %>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Requirements</label></center>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" id="prog_bar4"
                                                     style="width: <%=requirements%>%"
                                                     aria-valuenow="<%=requirements %>" aria-valuemin="0"
                                                     aria-valuemax="100"><span
                                                        style="color:black;"><%=requirements %>%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Development</label></center>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" id="prog_bar5"
                                                     style="width: <%=development%>%" aria-valuenow="<%=development %>"
                                                     aria-valuemin="0" aria-valuemax="100"><span
                                                        style="color:black;"><%=development %>%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Testing</label></center>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" id="prog_bar6"
                                                     style="width: <%=testing%>%" aria-valuenow="<%=testing %>"
                                                     aria-valuemin="0" aria-valuemax="100"><span
                                                        style="color:black;"><%=testing %>%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <center><label>Deployment</label></center>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" id="prog_bar7"
                                                     style="width: <%=implement%>%" aria-valuenow="<%=implement%>"
                                                     aria-valuemin="0" aria-valuemax="100"><span
                                                        style="color:black;"><%=implement %>%</span></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <jsp:include page="progress_details1.jsp">
                                    <jsp:param name="Initiate" value="<%=initiate %>"/>
                                    <jsp:param name="Plan" value="<%=plan %>"/>
                                    <jsp:param name="Execute" value="<%=execute %>"/>
                                    <jsp:param name="Hypercare" value="<%=hypercare %>"/>
                                    <jsp:param name="Requirements" value="<%=requirements %>"/>
                                    <jsp:param name="Development" value="<%=development %>"/>
                                    <jsp:param name="Testing" value="<%=testing %>"/>
                                    <jsp:param name="Deployment" value="<%=implement %>"/>
                                </jsp:include>

                                <br/>

                                <div class="row m0a">

                                    <div class="row bs-wizard" style="border-bottom:0;">


                                        <div class="col-xs-2 bs-wizard-step active">
                                            <div class="text-center bs-wizard-stepnum">Intake Information</div>
                                            <div class="progress">
                                                <div class="progress-bar"></div>
                                            </div>
                                            <a href="#" class="bs-wizard-dot" style="color:white">1</a>
                                        </div>

                                        <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                                            <div class="text-center bs-wizard-stepnum">Summary</div>
                                            <div class="progress">
                                                <div class="progress-bar"></div>
                                            </div>
                                            <a href="#" class="bs-wizard-dot">2</a>
                                        </div>

                                        <div class="col-xs-2 bs-wizard-step disabled"><!-- complete -->
                                            <div class="text-center bs-wizard-stepnum">Review</div>
                                            <div class="progress">
                                                <div class="progress-bar"></div>
                                            </div>
                                            <a href="#" class="bs-wizard-dot">3</a>
                                        </div>

                                        <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                            <div class="text-center bs-wizard-stepnum">Approval</div>
                                            <div class="progress">
                                                <div class="progress-bar"></div>
                                            </div>
                                            <a href="#" class="bs-wizard-dot">4</a>
                                        </div>

                                        <div class="col-xs-2 bs-wizard-step disabled"><!-- active -->
                                            <div class="text-center bs-wizard-stepnum">Final</div>
                                            <div class="progress">
                                                <div class="progress-bar"></div>
                                            </div>
                                            <a href="#" class="bs-wizard-dot">5</a>
                                        </div>
                                    </div>

                                </div>
                                <%
                                    String query22 = "SELECT * from Intake_BuisnessCustomization";
                                    Statement st22 = conn.createStatement();
                                    ResultSet rs22 = st22.executeQuery(query22);
                                    while (rs22.next())
                                        list.add(rs22.getString("idname"));
                                    ArrayList<String> list2 = new ArrayList<String>();
                                    String query20 = "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA. COLUMNS WHERE TABLE_NAME = 'Intake_BuisnessDetails' ORDER BY ORDINAL_POSITION";
                                    Statement st20 = conn.createStatement();
                                    ResultSet rs20 = st20.executeQuery(query20);
                                    while (rs20.next()) {
                                        list2.add(rs20.getString(1));
                                    }
                                    Iterator itr = list.iterator();
                                    while (itr.hasNext()) {
                                        String value = (String) itr.next();
                                        boolean retval = list2.contains(value);

                                        if (retval == false) {
                                            Statement st21 = conn.createStatement();
                                            st21.executeUpdate("alter table Intake_BuisnessDetails add column " + value + " varchar(255) DEFAULT ''");

                                        }
                                    }

                                    if (rs11.next() || rowCount.equals("0")) {
                                        String qury = "select * from Intake_BuisnessCustomization where panels='P1' and appname='" + rs4.getString("appname") + "' and projectname='" + rs3.getString("projectname") + "'";
                                        Statement stm = conn.createStatement();
                                        ResultSet Rs = stm.executeQuery(qury);
                                %>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a class="collapsed" data-toggle="collapse"
                                                                   data-parent="#panels1" href="#collapse1">Application
                                            Information</a></h4>
                                    </div>
                                    <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                        <div class="panel-body">
                                            <%
                                                int k = 0, Count = 0, Count_1 = 0, Del_count = 1;
                                                while (Rs.next()) {

                                            %>
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198">

                                                    <%if (Rs.getString(3).equals("Yes") && !Rs.getString(1).equals("")) {%>
                                                    <div class="required"><%=Rs.getString(1) %>&nbsp; <input
                                                            type="checkbox" id="c1<%= Count_1 %>"
                                                            name="<%= Rs.getString("idname") %>1"
                                                            style="float:right;display:none" value="yes"><span
                                                            class="glyphicon glyphicon-pencil"
                                                            style="float:right;display:none;" id="d1<%= Count_1 %>"
                                                            onclick="edit_page('<%= Rs.getString(1) %>','<%= Rs.getString("idname") %>');"></span>
                                                    </div>
                                                    <%} else if (!Rs.getString(1).equals("")) { %>
                                                    <div><%=Rs.getString(1) %>&nbsp;<input type="checkbox"
                                                                                           id="c1<%= Count_1 %>"
                                                                                           name="<%= Rs.getString("idname")%>1"
                                                                                           style="float:right;display:none;"
                                                                                           value="yes"></div>
                                                    <span class="glyphicon glyphicon-pencil"
                                                          style="float:right;display:none;" id="d1<%= Count_1 %>"
                                                          onclick="edit_page('<%= Rs.getString(1) %>','<%= Rs.getString("idname") %>');"></span>
                                                    <%
                                                        }
                                                    %>

                                                </label>
                                                <%
                                                    if (Rs.getString(2).equals("Text box")) {
                                                        if (Rs.getString("idname").equals("legappname")) {
                                                %>
                                                <input type="text" class="form-control" id="legappname"
                                                       name="<%= Rs.getString("idname") %>"
                                                       <% if(rowCount.equals("0")) {%>value="<%= rs4.getString("appname") %>"
                                                       <%} else {if(rs11.getString(Rs.getString("idname"))==null){ %>value="<%= rs4.getString("appname") %>"<%} else { %>
                                                       value="<%=  rs11.getString(Rs.getString("idname"))%>" <%
                                                        }
                                                    }
                                                %>/>
                                                <%} else { %>
                                                <input type="text" class="form-control" id="legappname"
                                                       name="<%= Rs.getString("idname") %>"
                                                       <% if(rowCount.equals("0")) {%>value=""
                                                       <%} else {if(rs11.getString(Rs.getString("idname"))==null){ %>value=""<%} else { %>
                                                       value="<%=  rs11.getString(Rs.getString("idname"))%>" <%
                                                        }
                                                    }
                                                %>/>
                                                <%} %>

                                                <%
                                                } else if (Rs.getString(2).equals("Dropdown")) {
                                                    String box[] = Rs.getString(9).split("/");
                                                    int number_of_boxes = Integer.parseInt(Rs.getString(8));
                                                %>
                                                <select id="type" class="form-control"
                                                        name="<%= Rs.getString("idname") %>" required>
                                                    <%
                                                        for (int i = 0; i < number_of_boxes; i++) {
                                                    %>
                                                    <option value="<%=box[i] %>"><%=box[i] %>
                                                    </option>
                                                    <%}%></select><%
                                            } else if (Rs.getString(2).equals("Radio box")) {
                                                String box[] = Rs.getString(7).split("/");
                                                int number_of_boxes = Integer.parseInt(Rs.getString(6));
                                            %>
                                                <div class="radio"><%
                                                    for (int i = 0; i < number_of_boxes; i++) {
                                                %>
                                                    <input type="radio" style="margin-left:20px;"
                                                           name="<%= Rs.getString("idname") %>" <% if(rs11.getString(Rs.getString("idname")).equals("Yes")){ %>
                                                           value="Yes" checked <%} else{%>value="Yes"<%} %> ><span
                                                            style="margin-left:35px;"><%=box[i] %></span><br/>

                                                    <%}%></div>
                                                <%
                                                } else if (Rs.getString(2).equals("Datepicker")) {
                                                    if (Rs.getString("idname").equals("rod")) {
                                                        String date_query = "select read_date from AppEmphazize_ApplicationPrioritization where prj_name='" + project_NAME + "' and proj_name='" + rs4.getString("appname") + "'";
                                                        Statement dt_st = conn.createStatement();
                                                        ResultSet rslt_dt = dt_st.executeQuery(date_query);
                                                        String result_date = "0";
                                                        if (rslt_dt.next()) {
                                                            if (rslt_dt.getString(1) != null)
                                                                result_date = rslt_dt.getString(1);

                                                %>
                                                <input type="text" class="form-control" id="legappname"
                                                       name="<%= Rs.getString("idname") %>"
                                                       <% if(rowCount.equals("0")) {%>value="<%= result_date %>"
                                                       <%} else {if(rs11.getString(Rs.getString("idname"))==null){ %>value="<%= result_date %>"<%} else { %>
                                                       value="<%=  rs11.getString(Rs.getString("idname"))%>" <%
                                                        }
                                                    }
                                                %>/>
                                                <%
                                                    }
                                                } else {
                                                %>

                                                <input placeholder="mm/dd/yyyy" id="rod<%=k %>"
                                                       name="<%= Rs.getString("idname") %>"
                                                       class="form-control ember-text-field zf-date-picker date-picker ember-view"
                                                       <% if(rowCount.equals("0")) {%>value=""
                                                       <%} else {if(rs11.getString(Rs.getString("idname"))==null){ %>value=""<%} else { %>
                                                       value="<%=  rs11.getString(Rs.getString("idname"))%>" <%}} %>>

                                                <%
                                                    }
                                                    k++;
                                                } else if (Rs.getString(2).equals("Check box")) {
                                                    String box[] = Rs.getString(5).split("/");
                                                    int number_of_boxes = Integer.parseInt(Rs.getString(4));
                                                %>
                                                <div class="checkbox"><%
                                                    for (int i = 0; i < number_of_boxes; i++) {
                                                %>
                                                    <input type="checkbox" style="margin-left:20px;"
                                                           name="<%= Rs.getString("idname") %>" <% if(!rowCount.equals("0") && rs11.getString(Rs.getString("idname")).equals("Yes")){ %>
                                                           value="Yes" checked <%} else{%>value="Yes"<%} %> ><span
                                                            style="margin-left:35px;"><%=box[i] %></span>

                                                    <% } %></div>
                                                <% } %></div>

                                            <%
                                                    Count_1++;
                                                } %>


                                            <button type="button" class="btn btn-success  pull-left"><a class="button"
                                                                                                        href="#popup1"
                                                                                                        id="P1">Add</a>
                                            </button> &nbsp;
                                            <button type="button" class="btn btn-danger  pull-left" id="Del1"
                                                    onclick="deletee('c1',<%=Count_1%>,'Del1','Del2')">Delete
                                            </button>&nbsp;
                                            <button type="button" class="btn btn-danger  pull-left" id="Del2"
                                                    style='display:none;' onclick="validateform9();">Delete
                                            </button>&nbsp;
                                            <button type="button" class="btn btn-primary  pull-left" id="Ed1"
                                                    onclick="edit_form('d1',<%=Count_1%>);">Edit
                                            </button>
                                            <button type="button" class="btn btn-primary  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btt"
                                                    onclick=" validateform()"> Next<span
                                                    class="glyphicon glyphicon-chevron-right"></span></button>
                                            <br/><br/>
                                        </div>
                                    </div>
                                </div>
                                <script>
                                    function deletee(id, Count_1, Del1, Del2) {
                                        var x = Count_1;
                                        for (var i = 0; i < x; i++) {
                                            document.getElementById(id + i).style.display = 'block';
                                        }
                                        document.getElementById(Del1).style.display = 'none';
                                        document.getElementById(Del2).style.display = 'block';

                                    }

                                    function edit_page(x, y) {
                                        var f = document.loginForm;
                                        f.method = "post";
                                        f.action = "Edit_Pages.jsp?label=" + x + "&idname=" + y + "&name=Business";
                                        f.submit();
                                    }

                                    function edit_form(d1, Count_1) {
                                        var x = Count_1;
                                        for (var i = 0; i < x; i++) {
                                            document.getElementById(d1 + i).style.display = 'block';
                                        }

                                    }


                                </script>

                                <script>

                                    function validateform() {
                                        var count = 0, mandtry, Idss;
                                        <%
                                        String q1="select * from Intake_BuisnessCustomization where panels='P1' and appname='"+rs4.getString("appname")+"' and projectname='"+rs3.getString("projectname")+"'";
                                        Statement stq = conn.createStatement();
                                        ResultSet rsq = stq.executeQuery(q1);
                                        while(rsq.next())
                                        {
                                        %>
                                        if ('<%=rsq.getString("mandatory") %>' == "Yes") {
                                            if (document.getElementsByName('<%=rsq.getString("idname") %>')[0].value == "") {
                                                count++;
                                            }
                                        }
                                        <%}%>
                                        if (count > 0)
                                            alert("fill the mandatory fields");
                                        else
                                            toggle();
                                    }

                                </script>


                                <%
                                    String qury1 = "select * from Intake_BuisnessCustomization where panels='P2' and appname='" + rs4.getString("appname") + "' and projectname='" + rs3.getString("projectname") + "'";
                                    Statement stm1 = conn.createStatement();
                                    ResultSet Rs1 = stm1.executeQuery(qury1);
                                %>

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a class="collapsed" data-toggle="collapse"
                                                                   data-parent="#panels1" href="#collapse2"
                                                                   onclick="switchColors();">Legacy Retention
                                            Information</a></h4>
                                    </div>
                                    <div id="collapse2" class="panel-collapse collapse">
                                        <div class="panel-body">

                                            <%
                                                k = 0;
                                                int Count_2 = 0;
                                                while (Rs1.next()) {


                                            %>
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198">
                                                    <%if (Rs1.getString(3).equals("Yes") && !Rs1.getString(1).equals("")) {%>
                                                    <div class="required"><%=Rs1.getString(1) %>&nbsp; <input
                                                            type="checkbox" id="c2<%= Count_2 %>"
                                                            name="<%= Rs1.getString("idname") %>1"
                                                            style="float:right;display:none" value="yes"><span
                                                            class="glyphicon glyphicon-pencil"
                                                            style="float:right;display:none;" id="d2<%= Count_2 %>"
                                                            onclick="edit_page('<%= Rs1.getString(1) %>','<%= Rs1.getString("idname") %>');"></span>
                                                    </div>
                                                    <%} else if (!Rs1.getString(1).equals("")) { %>
                                                    <div><%=Rs1.getString(1) %>&nbsp;<input type="checkbox"
                                                                                            id="c2<%= Count_2 %>"
                                                                                            name="<%= Rs1.getString("idname")%>1"
                                                                                            style="float:right;display:none;"
                                                                                            value="yes"></div>
                                                    <span class="glyphicon glyphicon-pencil"
                                                          style="float:right;display:none;" id="d2<%= Count_2 %>"
                                                          onclick="edit_page('<%= Rs1.getString(1) %>','<%= Rs1.getString("idname") %>');"></span>

                                                    <%} %>

                                                </label>

                                                <%if (Rs1.getString(2).equals("Text box")) { %>
                                                <input type="text" class="form-control" id="legappname"
                                                       name="<%= Rs1.getString("idname") %>"
                                                       <% if(rowCount.equals("0")) {%>value=""
                                                       <%} else {if(rs11.getString(Rs1.getString("idname"))==null){ %>value=""<%} else { %>
                                                       value="<%=  rs11.getString(Rs1.getString("idname"))%>" <%
                                                        }
                                                    }
                                                %>/>
                                                <%
                                                } else if (Rs1.getString(2).equals("Dropdown")) {
                                                    String box[] = Rs1.getString(9).split("/");
                                                    int number_of_boxes = Integer.parseInt(Rs1.getString(8));
                                                %>
                                                <select id="type" class="form-control"
                                                        name="<%= Rs1.getString("idname") %>" required>
                                                    <%
                                                        for (int i = 0; i < number_of_boxes; i++) {
                                                    %>
                                                    <option value="<%=box[i] %>"><%=box[i] %>
                                                    </option>
                                                    <%}%></select><%
                                            } else if (Rs1.getString(2).equals("Radio box")) {
                                                String box[] = Rs1.getString(7).split("/");
                                                int number_of_boxes = Integer.parseInt(Rs1.getString(6));
                                            %>
                                                <div class="radio"><%
                                                    for (int i = 0; i < number_of_boxes; i++) {
                                                %>
                                                    <input type="radio" style="margin-left:20px;"
                                                           name="<%= Rs1.getString("idname") %>" <% if(rs11.getString(Rs1.getString("idname")).equals("Yes")){ %>
                                                           value="Yes" checked <%} else{%>value="Yes"<%} %> ><span
                                                            style="margin-left:35px;"><%=box[i] %></span><br/>

                                                    <%}%></div>
                                                <%} else if (Rs1.getString(2).equals("Datepicker")) {%>

                                                <input placeholder="mm/dd/yyyy" id="rod1<%=k %>"
                                                       name="<%= Rs1.getString("idname") %>"
                                                       class="form-control ember-text-field zf-date-picker date-picker ember-view"
                                                       <% if(rowCount.equals("0")) {%>value=""
                                                       <%} else {if(rs11.getString(Rs1.getString("idname"))==null){ %>value=""<%} else { %>
                                                       value="<%=  rs11.getString(Rs1.getString("idname"))%>" <%}} %>>
                                                <%
                                                    k++;
                                                } else if (Rs1.getString(2).equals("file")) {
                                                %>
                                                <input type="file" name="file" id="file" size="60" value=""/>
                                                <%
                                                } else if (Rs1.getString(2).equals("Check box")) {

                                                    String box[] = Rs1.getString(5).split("/");
                                                    int number_of_boxes = Integer.parseInt(Rs1.getString(4));
                                                %>
                                                <div class="checkbox"><%
                                                    for (int i = 0; i < number_of_boxes; i++) {
                                                %>
                                                    <input type="checkbox" style="margin-left:20px;"
                                                           name="<%= Rs1.getString("idname") %>" <% if(!rowCount.equals("0") && rs11.getString(Rs1.getString("idname")).equals("Yes")){ %>
                                                           value="Yes" checked <%} else{%>value="Yes"<%} %> ><span
                                                            style="margin-left:35px;"><%=box[i] %></span>

                                                    <% } %></div>
                                                <% } %></div>
                                            <%
                                                    Count_2++;
                                                } %>

                                            <button type="button" class="btn btn-success  pull-left"><a class="button"
                                                                                                        href="#popup2">Add</a>
                                            </button>
                                            <button type="button" class="btn btn-danger  pull-left" id="Del11"
                                                    onclick="deletee('c2',<%=Count_2%>,'Del11','Del21')">Delete
                                            </button>&nbsp;
                                            <button type="button" class="btn btn-danger  pull-left" id="Del21"
                                                    style='display:none;' onclick="validateform9();">Delete
                                            </button>&nbsp;
                                            <button type="button" class="btn btn-primary  pull-left" id="Ed1"
                                                    onclick="edit_form('d2',<%=Count_2%>);">Edit
                                            </button>

                                            <button type="button" class="btn btn-primary  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btt1"
                                                    onclick="validateform1()"> Next<span
                                                    class="glyphicon glyphicon-chevron-right"></span></button>
                                            <button type="button" class="btn btn-default  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btn_new"
                                                    onclick="switchColors0();"><a class="collapsed"
                                                                                  data-toggle="collapse"
                                                                                  data-parent="#panels1"
                                                                                  href="#collapse1"><span
                                                    class="glyphicon glyphicon-chevron-left"></span> Previous</a>
                                            </button>

                                        </div>
                                    </div>
                                </div>

                                <script>

                                    function validateform1() {
                                        var count1 = 0;
                                        <%
                                        String q2="select * from Intake_BuisnessCustomization where panels='P2' and appname='"+rs4.getString("appname")+"' and projectname='"+rs3.getString("projectname")+"'";
                                        Statement stq2 = conn.createStatement();
                                        ResultSet rsq2 = stq2.executeQuery(q2);
                                        while(rsq2.next())
                                        {
                                        %>
                                        if ('<%=rsq2.getString("mandatory") %>' == "Yes" && '<%=rsq2.getString(2) %>' != "file") {
                                            if (document.getElementsByName('<%=rsq2.getString("idname") %>')[0].value == "") {
                                                count1++;
                                            }
                                        }
                                        <%}%>
                                        if (count1 > 0)
                                            alert("fill the mandatory fields");
                                        else
                                            toggle1();
                                    }

                                </script>
                                <%
                                    String qury2 = "select * from Intake_BuisnessCustomization where panels='P3' and appname='" + rs4.getString("appname") + "' and projectname='" + rs3.getString("projectname") + "'";
                                    Statement stm2 = conn.createStatement();
                                    ResultSet Rs2 = stm2.executeQuery(qury2);
                                %>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a class="collapsed" data-toggle="collapse"
                                                                   data-parent="#panels1" href="#collapse3"
                                                                   onclick="switchColors1();">Archive Data
                                            Management</a></h4>
                                    </div>
                                    <div id="collapse3" class="panel-collapse collapse">
                                        <div class="panel-body">

                                            <%
                                                k = 0;
                                                int Count_3 = 0;
                                                while (Rs2.next()) {

                                            %>
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198">
                                                    <%if (Rs2.getString(3).equals("Yes") && !Rs2.getString(1).equals("")) {%>
                                                    <div class="required"><%=Rs2.getString(1) %>&nbsp; <input
                                                            type="checkbox" id="c3<%= Count_3 %>"
                                                            name="<%= Rs2.getString("idname") %>1"
                                                            style="float:right;display:none" value="yes"><span
                                                            class="glyphicon glyphicon-pencil"
                                                            style="float:right;display:none;" id="d3<%= Count_3 %>"
                                                            onclick="edit_page('<%= Rs2.getString(1) %>','<%= Rs2.getString("idname") %>');"></span>
                                                    </div>
                                                    <%} else if (!Rs2.getString(1).equals("")) { %>
                                                    <div><%=Rs2.getString(1) %>&nbsp;<input type="checkbox"
                                                                                            id="c3<%= Count_3 %>"
                                                                                            name="<%= Rs2.getString("idname")%>1"
                                                                                            style="float:right;display:none;"
                                                                                            value="yes"></div>
                                                    <span class="glyphicon glyphicon-pencil"
                                                          style="float:right;display:none;" id="d3<%= Count_3 %>"
                                                          onclick="edit_page('<%= Rs2.getString(1) %>','<%= Rs2.getString("idname") %>');"></span>

                                                    <%} %>
                                                </label>
                                                <%if (Rs2.getString(2).equals("Text box")) { %>
                                                <input type="text" class="form-control" id="legappname"
                                                       name="<%= Rs2.getString("idname") %>"
                                                       <% if(rowCount.equals("0")) {%>value=""
                                                       <%} else {if(rs11.getString(Rs2.getString("idname"))==null){ %>value=""<%} else { %>
                                                       value="<%=  rs11.getString(Rs2.getString("idname"))%>" <%
                                                        }
                                                    }
                                                %>/>
                                                <%
                                                } else if (Rs2.getString(2).equals("Dropdown")) {
                                                    String box[] = Rs2.getString(9).split("/");
                                                    int number_of_boxes = Integer.parseInt(Rs2.getString(8));
                                                %>
                                                <select id="type" class="form-control"
                                                        name="<%= Rs2.getString("idname") %>" required>
                                                    <%
                                                        for (int i = 0; i < number_of_boxes; i++) {
                                                    %>
                                                    <option value="<%=box[i] %>"><%=box[i] %>
                                                    </option>
                                                    <%}%></select><%
                                            } else if (Rs2.getString(2).equals("Radio box")) {
                                                String box[] = Rs2.getString(7).split("/");
                                                int number_of_boxes = Integer.parseInt(Rs2.getString(6));
                                            %>
                                                <div class="radio"><%
                                                    for (int i = 0; i < number_of_boxes; i++) {
                                                %>
                                                    <input type="radio" style="margin-left:20px;"
                                                           name="<%= Rs2.getString("idname") %>" <% if(rs11.getString(Rs2.getString("idname")).equals("Yes")){ %>
                                                           value="Yes" checked <%} else{%>value="Yes"<%} %> ><span
                                                            style="margin-left:35px;"><%=box[i] %></span><br/>

                                                    <%}%></div>
                                                <%} else if (Rs2.getString(2).equals("Datepicker")) {%>

                                                <input placeholder="mm/dd/yyyy" id="rod2<%=k %>"
                                                       name="<%= Rs2.getString("idname") %>"
                                                       class="form-control ember-text-field zf-date-picker date-picker ember-view"
                                                       value="<%= rs11.getString(Rs2.getString("idname")) %>">
                                                <%
                                                    k++;
                                                } else if (Rs2.getString(2).equals("file")) {
                                                %>
                                                <input type="file" name="<%= Rs2.getString("idname") %>"
                                                       id="<%= Rs2.getString("idname") %>" size="60"/>
                                                <%
                                                } else if (Rs2.getString(2).equals("Check box")) {

                                                    String box[] = Rs2.getString(5).split("/");
                                                    int number_of_boxes = Integer.parseInt(Rs2.getString(4));
                                                %>
                                                <div class="checkbox"><%
                                                    for (int i = 0; i < number_of_boxes; i++) {
                                                %>
                                                    <input type="checkbox" style="margin-left:20px;"
                                                           name="<%= Rs2.getString("idname") %>" <% if(!rowCount.equals("0") && rs11.getString(Rs2.getString("idname")).equals("Yes")){ %>
                                                           value="Yes" checked <%} else{%>value="Yes"<%} %> ><span
                                                            style="margin-left:35px;"><%=box[i] %></span>

                                                    <% } %></div>
                                                <% } %></div>
                                            <%
                                                    Count_3++;
                                                } %>
                                            <button type="button" class="btn btn-success  pull-left"><a class="button"
                                                                                                        href="#popup3">Add</a>
                                            </button>
                                            <button type="button" class="btn btn-danger  pull-left" id="Del12"
                                                    onclick="deletee('c3',<%=Count_3%>,'Del12','Del22')">Delete
                                            </button>&nbsp;
                                            <button type="button" class="btn btn-danger  pull-left" id="Del22"
                                                    style='display:none;' onclick="validateform9();">Delete
                                            </button>&nbsp;
                                            <button type="button" class="btn btn-primary  pull-left" id="Ed1"
                                                    onclick="edit_form('d3',<%=Count_3%>);">Edit
                                            </button>


                                            <button type="button" class="btn btn-primary  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btt2"
                                                    onclick="validateform3()"> Next<span
                                                    class="glyphicon glyphicon-chevron-right"></span></button>
                                            <button type="button" class="btn btn-default  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btn_new2"
                                                    onclick="switchColors();"><a class="collapsed"
                                                                                 data-toggle="collapse"
                                                                                 data-parent="#panels1"
                                                                                 href="#collapse2"
                                                                                 style="color:black"><span
                                                    class="glyphicon glyphicon-chevron-left"></span> Previous</a>
                                            </button>

                                        </div>
                                    </div>
                                </div>

                                <script>
                                    function validateform3() {
                                        var count = 0;
                                        <%
                                        String q3="select * from Intake_BuisnessCustomization where panels='P3' and appname='"+rs4.getString("appname")+"' and projectname='"+rs3.getString("projectname")+"'";
                                        Statement stq3 = conn.createStatement();
                                        ResultSet rsq3 = stq3.executeQuery(q3);
                                        while(rsq3.next())
                                        {
                                        %>
                                        if ('<%=rsq3.getString("mandatory") %>' == "Yes") {
                                            if (document.getElementsByName('<%=rsq3.getString("idname") %>')[0].value == "") {
                                                count++;
                                            }
                                        }
                                        <%}%>
                                        if (count > 0)
                                            alert("fill the mandatory fields");
                                        else
                                            toggle3();
                                    }

                                </script>
                                <%
                                    String qury3 = "select * from Intake_BuisnessCustomization where panels='P4' and appname='" + rs4.getString("appname") + "' and projectname='" + rs3.getString("projectname") + "'";
                                    Statement stm3 = conn.createStatement();
                                    ResultSet Rs3 = stm3.executeQuery(qury3);
                                %>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"><a class="collapsed" data-toggle="collapse"
                                                                   data-parent="#panels1" href="#collapse4"
                                                                   onclick="switchColors2();">Privacy Classification</a>
                                        </h4>
                                    </div>
                                    <div id="collapse4" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <%
                                                k = 0;
                                                int Count_4 = 0;
                                                while (Rs3.next()) {

                                            %>
                                            <div class="form-group">
                                                <label class="control-label" for="formInput198">
                                                    <%if (Rs3.getString(3).equals("Yes") && !Rs3.getString(1).equals("")) {%>
                                                    <div class="required"><%=Rs3.getString(1) %>&nbsp; <input
                                                            type="checkbox" id="c4<%= Count_4 %>"
                                                            name="<%= Rs3.getString("idname") %>1"
                                                            style="float:right;display:none" value="yes"><span
                                                            class="glyphicon glyphicon-pencil"
                                                            style="float:right;display:none;" id="d4<%= Count_4 %>"
                                                            onclick="edit_page('<%= Rs3.getString(1) %>','<%= Rs3.getString("idname") %>');"></span>
                                                    </div>
                                                    <%} else if (!Rs3.getString(1).equals("")) { %>
                                                    <div><%=Rs3.getString(1) %>&nbsp;<input type="checkbox"
                                                                                            id="c4<%= Count_4 %>"
                                                                                            name="<%= Rs3.getString("idname")%>1"
                                                                                            style="float:right;display:none;"
                                                                                            value="yes"></div>
                                                    <span class="glyphicon glyphicon-pencil"
                                                          style="float:right;display:none;" id="d4<%= Count_4 %>"
                                                          onclick="edit_page('<%= Rs3.getString(1) %>','<%= Rs3.getString("idname") %>');"></span>

                                                    <%} %>
                                                </label>
                                                <%if (Rs3.getString(2).equals("Text box")) { %>
                                                <input type="text" class="form-control" id="legappname"
                                                       name="<%= Rs3.getString("idname") %>"
                                                       <% if(rowCount.equals("0")) {%>value=""
                                                       <%} else {if(rs11.getString(Rs3.getString("idname"))==null){ %>value=""<%} else { %>
                                                       value="<%=  rs11.getString(Rs3.getString("idname"))%>" <%
                                                        }
                                                    }
                                                %>/>
                                                <%
                                                } else if (Rs3.getString(2).equals("Dropdown")) {
                                                    String box[] = Rs3.getString(9).split("/");
                                                    int number_of_boxes = Integer.parseInt(Rs3.getString(8));
                                                %>
                                                <select id="type" class="form-control"
                                                        name="<%= Rs3.getString("idname") %>" required>
                                                    <%
                                                        for (int i = 0; i < number_of_boxes; i++) {
                                                    %>
                                                    <option value="<%=box[i] %>"><%=box[i] %>
                                                    </option>
                                                    <%}%></select><%
                                            } else if (Rs3.getString(2).equals("Radio box")) {
                                                String box[] = Rs3.getString(7).split("/");
                                                int number_of_boxes = Integer.parseInt(Rs3.getString(6));
                                            %>
                                                <div class="radio"><%
                                                    for (int i = 0; i < number_of_boxes; i++) {
                                                %>
                                                    <input type="radio" style="margin-left:20px;"
                                                           name="<%= Rs3.getString("idname") %>" <% if(rs11.getString(Rs3.getString("idname")).equals("Yes")){ %>
                                                           value="Yes" checked <%} else{%>value="Yes"<%} %> ><span
                                                            style="margin-left:35px;"><%=box[i] %></span><br/>

                                                    <%}%></div>
                                                <%} else if (Rs3.getString(2).equals("Datepicker")) {%>

                                                <input placeholder="mm/dd/yyyy" id="rod3<%=k %>"
                                                       name="<%= Rs3.getString("idname") %>"
                                                       class="form-control ember-text-field zf-date-picker date-picker ember-view"
                                                       value="<%= rs11.getString(Rs3.getString("idname")) %>">
                                                <%
                                                    k++;
                                                } else if (Rs3.getString(2).equals("file")) {
                                                %>
                                                <input type="file" name="<%= Rs1.getString("idname") %>" id="file"
                                                       size="60"/>
                                                <%
                                                } else if (Rs3.getString(2).equals("Check box")) {

                                                    String box[] = Rs3.getString(5).split("/");
                                                    int number_of_boxes = Integer.parseInt(Rs3.getString(4));
                                                %>
                                                <div class="checkbox"><%
                                                    for (int i = 0; i < number_of_boxes; i++) {
                                                %>
                                                    <input type="checkbox" style="margin-left:20px;"
                                                           name="<%= Rs3.getString("idname") %>" <% if(!rowCount.equals("0") && rs11.getString(Rs3.getString("idname")).equals("Yes")){ %>
                                                           value="Yes" checked <%} else{%>value="Yes"<%} %>><span
                                                            style="margin-left:35px;"><%=box[i] %></span>

                                                    <% } %></div>
                                                <% } %></div>
                                            <%
                                                    Count_4++;
                                                } %>
                                            <button type="button" class="btn btn-success  pull-left"><a class="button"
                                                                                                        href="#popup4">Add</a>
                                            </button>
                                            <button type="button" class="btn btn-danger  pull-left" id="Del13"
                                                    onclick="alert('<%=Count_4%>');deletee('c4',<%=Count_4%>,'Del13','Del23')">
                                                Delete
                                            </button>&nbsp;
                                            <button type="button" class="btn btn-danger  pull-left" id="Del23"
                                                    style='display:none;' onclick="validateform9();">Delete
                                            </button>&nbsp;
                                            <button type="button" class="btn btn-primary  pull-left" id="Ed1"
                                                    onclick="edit_form('d4',<%=Count_4%>);">Edit
                                            </button>

                                            <button type="button" class="btn btn-default  pull-right"
                                                    data-toggle="modal" data-target="#myModal" id="btn_new3"
                                                    onclick="validateform3()"><a class="collapsed"
                                                                                 data-toggle="collapse"
                                                                                 data-parent="#panels1"
                                                                                 href="#collapse3"
                                                                                 style="color:black"><span
                                                    class="glyphicon glyphicon-chevron-left"></span> Previous</a>
                                            </button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="text" id="role_info" value="<%= role_info %>" style="display:none">

                            <button type="button" class="btn btn-primary btn pull-right" onclick="validateform2();">Save
                                & Continue...
                            </button>&nbsp;

                            <button type="button" class="btn btn-default" onclick="location.href = 'grid.jsp';">Cancel
                            </button>

                        </div>

                    </div>

                    <script>
                        function validateform2() {
                            var count = 0;
                            <%
                            String q4="select * from Intake_BuisnessCustomization where panels='P4' and appname='"+rs4.getString("appname")+"' and projectname='"+rs3.getString("projectname")+"'";
                            Statement stq4 = conn.createStatement();
                            ResultSet rsq4 = stq3.executeQuery(q4);
                            while(rsq4.next())
                            {
                            %>
                            if ('<%=rsq4.getString("mandatory") %>' == "Yes" && '<%=rsq4.getString("idname") %>' != "retentiontable") {
                                if (document.getElementsByName('<%=rsq4.getString("idname") %>')[0].value == "") {
                                    count++;
                                }
                            }
                            <%}%>
                            if (count > 0)
                                alert("fill the mandatory fields");
                            else
                                validateform9();
                        }

                    </script>
                    <script>
                        function validateform9() {
                            var f = document.loginForm;
                            f.method = "post";
                            f.action = "Business_sam"
                            f.submit();
                        }
                    </script>

                        <%
        
   
 }
                    }
                     %>
</form>
<jsp:include page="samp_forms.jsp">
    <jsp:param name="ProjectName" value="<%=project_NAME %>"/>
    <jsp:param name="AppName" value="<%=app_Name %>"/>
    <jsp:param name="number" value="4"/>
    <jsp:param name="servlet" value="Business"/>
</jsp:include>
<%
            }
        }
    } catch (Exception e) {
    }
%>

<!-- /.row -->
</section>
<!-- /.section -->

</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->


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


<!-- ========== THEME JS ========== -->
<script>

    $(function () {
        for (var i = 0; i < 10; i++) {
            $("#rod" + i).datepicker({
                format: "dd/mm/yyyy",
                autoclose: true
            });
        }
    });
    $(function () {
        for (var i = 0; i < 10; i++) {
            $("#rod1" + i).datepicker({
                format: "dd/mm/yyyy",
                autoclose: true
            });
        }
    });
    $(function () {
        for (var i = 0; i < 10; i++) {
            $("#rod2" + i).datepicker({
                format: "dd/mm/yyyy",
                autoclose: true
            });
        }
    });
    $(function () {
        for (var i = 0; i < 10; i++) {
            $("#rod3" + i).datepicker({
                format: "dd/mm/yyyy",
                autoclose: true
            });
        }
    });
</script>
<!-- ========== THEME JS ========== -->


</body>
</html>

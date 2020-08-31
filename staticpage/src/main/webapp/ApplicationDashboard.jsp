<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<html lang="en">
<head>
    <title>ApplicationDashboard</title>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">



    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
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
    <link rel="stylesheet" href="css/RoleDashboard/RoleDashboard.css">


    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/paging.js"></script>



    <script type="text/javascript" src="js_in_pages/tree.js"></script>
    <!-- graph -->
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
</head>
<style>
    /* =================piechart pop-up table row line================= */
    .border-bottom {
        border-bottom: solid 1px lightgrey;
    }
    /* The Modal (background) */
    .modal {
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
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        width: 50%; /* Full width */
        height: 70%; /* Full height */
        padding: 20px;
        border: 1px solid #888;
        width: 46%;
    }
    /* Modal Header */
    .modal-header
    {
        height:50px;
    }
    /* Modal Body */
    #modalpopup
    {
        overflow-y:scroll;
        overflow-x:hidden;
        height:80%;
        width:100%;
    }
    /* The Close Button */
    .close {
        height:5px;
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
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
        margin-right: 129px;}
    .active, .btn:hover {
        color: white;
    }
    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }
</style>
<style>

</style>
<style>
    .breadcrumb-div {
        background-color: #e7e7e7;
        color: #010101;
    }

    #nav_userid {
        color: green;
    }

    .pg-normal {
        color: white;
        font-size: 15px;
        cursor: pointer;
        background: #269af8;
        padding: 2px 4px 2px 4px;
    }

    .pg-selected {
        color: #fff;
        font-size: 15px;
        background: #269af8;
        padding: 2px 4px 2px 4px;
    }


</style>

<body class="top-navbar-fixed" onload="drawChart1();">
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed ProjectManagaer_Dashboard JSP PAGE-----[INFO]"); %>
<%@page language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.sql.*" %>
<%@ page import="onboard.DBconnection" %>
<%@ page import="onboard.daterange" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@page import="onboard.Application_dashboard_pie_chart" %>
<%
    //daterange dt = new daterange();
//dt.range_calc("5/1/2018","5/30/2018");
%>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.

    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
    }
%>


<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>


<%
    DBconnection d = new DBconnection();
    Connection con = (Connection) d.getConnection();
    Statement st_distinct = con.createStatement();
    HttpSession details = request.getSession();
    String roles = (String) details.getAttribute("role");
    String uname = (String) details.getAttribute("username");
    String Projets = (String) details.getAttribute("projects");
    String info = (String) details.getAttribute("app_emp");
    String proname = (String) details.getAttribute("nameofproject");

    try {
        String det = (String) session.getAttribute("theName");
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool", "root", "password123");
        String query = "select * from AppEmphazize_ProjectDetails";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        String query3 = "select * from AppEmphazize_ProjectDetails where id = " + det;
        Statement st3 = conn.createStatement();
        ResultSet rs3 = st3.executeQuery(query3);
        String query2 = "select * from logs where USER_ID='" + uname + "'";
        Statement st2 = conn.createStatement();
        ResultSet rs2 = st2.executeQuery(query2);
        String query1 = "SELECT role FROM Role_Details";
        Statement st1 = conn.createStatement();
        ResultSet rs1 = st1.executeQuery(query1);
        String query4 = "select count(*) from AppEmphazize_ProjectDetails";
        Statement st4 = conn.createStatement();
        ResultSet rs4 = st4.executeQuery(query4);
        String query5 = "select count(mem_ass) from ArchiveExecution_Details where mem_ass!=''";
        Statement st5 = conn.createStatement();
        ResultSet rs5 = st5.executeQuery(query5);
        String query6 = "select count(roles) from logs";
        Statement st6 = conn.createStatement();
        ResultSet rs6 = st6.executeQuery(query6);
        String query7 = "select count(*) from AppEmphazize_ApplicationInfo";
        Statement st7 = conn.createStatement();
        ResultSet rs7 = st6.executeQuery(query7);

        if (rs.next()) {
%>

<div class="main-wrapper">
    <!-- ========== hi ========== -->
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

                <% if (rs3.next()) {
                    details.setAttribute("appno", rs3.getString("appno"));
                    details.setAttribute("projectname", rs3.getString("projectname"));
                %>
                <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding
                    Tool-<%=rs3.getString("projectname") %>
                </a>


                <%
                        String q2 = "select * from ArchiveExecution_Details where level=1 and projects='" + rs3.getString("projectname") + "'order by seq_num";
                        Statement s2 = conn.createStatement();
                        ResultSet rss = s2.executeQuery(q2);
                        while (rss.next()) {
                            session.setAttribute(rss.getString(3), rss.getString(15));
                        }
                        //  System.out.println("aaaaaaaaaaa");
                    } %>


                <div class="collapse navbar-collapse" id="navbar-collapse-1">

                    <!-- /.nav navbar-nav -->
                    <ul class="nav navbar-nav navbar-right">
                        <%

                            String role = (String) details.getAttribute("role");%>
                        <li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span
                                id='nav_role'><%=role%></span></a></li>
                        <li><a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a></li>
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
                            <li class="has-children">
                                <a href=""><i class="fa fa-file-text"></i> <span>Intake Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav">
                                    <li><a href="Applications.jsp" > <span>Archive Intake</span></a></li>
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
                                    <li><a href="RoleUIDashboard.jsp"> <span>Reports Dashboard</span></a></li>
                                    <li><a href="RoleDashboard.jsp" > <span>Role Dashboard</span></a></li>
                                    <li><a href="ProjectDashboard.jsp" > <span>Project Dashboard</span></a></li>
                                    <li class="btn"><a href="ApplicationDashboard.jsp"> <span class="activ-pro">Application Dashboard</span></a></li>
                                </ul>
                            </li>
                        </ul>

                    </div>
                    <!-- /.sidebar-nav -->
                </div>
                <!-- /.sidebar-content -->
            </div>
            <!-- /.left-sidebar -->
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
            <script>
                function javascript_conv() {
                    var initiate =<%= initiate %>;
                    var plan = <%= plan %>;
                    var execute = <%= execute %>;
                    var hypercare = <%= hypercare %>;

                }
            </script>

            <div class="main-page">
                <div class="container-fluid">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h2 class="title">Dashboard</h2>

                        </div>

                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-6">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                <li class="active">Application Dashboard</li>
                            </ul>
                        </div>
                        <!-- /.col-sm-6 -->
                        <div class="col-sm-6 text-right hidden-xs">
                            <a href="#" class="pl-20"><i class="fa fa-cog"></i> Settings</a>
                        </div>
                        <!-- /.col-sm-6 -->
                    </div>
                    <!-- /.row -->
                </div>
                <!-- /.container-fluid -->

                <section>
                    <br>
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-4 col-md-4">
                                <div class="cardo card-primary">
                                    <div class="card-body">

                                        <div class="ui-widgetf">
                                            <h1 class="ui-valuef"><% while (rs4.next()) { %>

                                                <%= rs4.getString(1) %>

                                                <%}%></h1>
                                            <span class="ui-label">No of Projects</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- col -->

                            <div class="col-lg-4 col-md-4">
                                <div class="cardo card-second">
                                    <div class="card-body">
                                        <div class="ui-widgets">
                                            <h1 class="ui-values"><% while (rs7.next()) { %><%= rs7.getString(1) %><%}%></h1>
                                            <span class="ui-label">No of Applications</span>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-4 col-md-4">

                                <div class="cardo card-orange">

                                    <div class="card-body">

                                        <div class="ui-widgett">

                                            <h1 class="ui-valuet"><% while (rs5.next()) { %><%= rs5.getString(1) %><%}%></h1>
                                            <span class="ui-label">No of Resource Assigned</span>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- table -->
                    <br>

                    <br>

                    <!-- graph -->
                    <div class="container-fluid">

                        <div class="row">
                            <!-- Column -->
                            <div class="col-lg-7 col-md-7">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-lg-8 col-md-5">
                                                <h3 class="title">&nbsp;&nbsp;Overview of Applications</h3>
                                            </div>
                                            <!-- dropdown -->
                                            <div class="col-lg-12 col-md-12">
                                                <div class="col-lg-4 col-md-4">

   <span>
      <select id='linedrop' onchange="linechartvalues(this.value)">
      <option value="none" disabled selected>Select any option </option>
      <option value="daily"> Daily &nbsp;&nbsp; </option>
      <option value="weekly"> Weekly &nbsp;&nbsp; </option>
       <option value="monthly"> Monthly</option>
        <option value="yearly"> Yearly</option>
      </select>
    </span>

                                                </div>
                                                <div class="col-lg-4 col-md-4">

    <span>
     <select id='month' onchange="val(this.value)" hidden>
      <option disabled>-- Select --</option>
      <option value="January"> Jan </option>
       <option value="February"> Feb </option>
        <option value="March"> Mar </option>
         <option value="April" selected> Apr</option>
          <option value="May"> May </option>
           <option value="June"> June </option>
            <option value="July"> July </option>
             <option value="August"> Aug </option>
              <option value="September"> Sep </option>
               <option value="October"> Oct </option>
                <option value="November"> Nov </option>
                 <option value="December"> Dec </option>

      </select>


     <select id="year1" onchange="weeklyline_chart(this.value)" hidden>
      <option disabled> -- Select --  </option>
      <option value="2015">2015</option>
      <option value="2016">2016</option>
      <option value="2017">2017</option>
      <option value="2018" selected>2018</option>
      <option value="2019">2019</option>
      <option value="2020">2020</option>
      <option value="2021">2021</option>


      </select>
    </span>
                                                </div>
                                                <div class="col-lg-4 col-md-4">

    <span>
     <select id="year" onchange="line_chart(this.value)" hidden>
      <option disabled> -- Select --  </option>
      <option value="2015">2015</option>
      <option value="2016">2016</option>
      <option value="2017">2017</option>
      <option value="2018" selected>2018</option>
      <option value="2019">2019</option>
      <option value="2020">2020</option>
      <option value="2021">2021</option>


      </select>
    </span>


                                                </div>
                                                <div>
                                                </div>
                                            </div>
                                            <div id="bar_chart" style="height:384px; width:800px;"></div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- pie chart -->


                            <!-- piechart -->
                            <div class="col-lg-5 col-md-5">

                                <div class="card">
                                    <div class="card-body">

                                        <div class="row">

                                            <div class="col-lg-6 col-md-6">
                                                <h3>Percentage (%)</i></h3>

                                            </div>

                                            <br>
                                            <div id="container11" style="width: 550px; height: 400px; margin: 0 auto">
                                            </div>
                                            <div id="myModal" class="modal">

                                                <!-- Modal content -->
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                        <h4 class="modal-title"><b>Application Details</b></h4>
                                                    </div>
                                                    <div class="modal-body" id="modalpopup">
                                                    </div>
                                                    <div class="modal-footer" style="height:20px;">

                                                    </div>
                                                </div>

                                            </div>

                                            <script language="JavaScript">
                                                google.charts.load('current', {'packages':['corechart']});
                                                google.charts.setOnLoadCallback(drawChart1);
                                                function drawChart1() {

                                                    // Define the chart to be drawn.
                                                    var data = new google.visualization.DataTable();
                                                    data.addColumn('string', 'applications');

                                                    data.addColumn('number', 'percentage');
                                                    data.addColumn({type: 'string', role: 'tooltip'});
                                                    data.addRows([
                                                        <%
                                                        String selprj=rs3.getString("projectname");
                                                        //String uname=(String)details.getAttribute("username");
                                                        System.out.println("uname-----------"+uname);
                                                        String query8;
                                                        System.out.println("projets--------------- "+Projets);
                                                        Application_dashboard_pie_chart appobj=new Application_dashboard_pie_chart();
                                                        String apps=appobj.applications(Projets,selprj,uname);
                                                        //Application name for admin
                                                        System.out.println("apps-------------------"+apps);
                                                        String[] app=apps.substring(0,apps.length()-1).split(",");



                                                        //System.out.println("sel prj----------"+selprj+" ljhfvlhwdvjwdvlvkjbwwdkjbc "+rs8.getString("appname"));
                                                        //String query9="select progressbar from archiveexecution_details where projectS='"+selprj+"' and name ='"''"';";
                                                        /* String query9="select * from admin_userdetails;";
                                                        Statement st9 = conn.createStatement();
                                                        ResultSet rs9 = st9.executeQuery(query9); */
                                                        //System.out.println("user------ "+rs9.getString("projects"));
                                                        /*  String query10="select appname from AppEmphazize_ApplicationInfo where prjname='"+selprj+"'; ";
                                                        Statement st10 = conn.createStatement();
                                                            ResultSet rs10= st10.executeQuery(query10);
                                                            String user=""; */
                                                            //System.out.println("bala "+user);

                                                              //String[] user2=new String[app.length];
                                                          /*  while(rs10.next())
                                                            {
                                                            String query11="SELECT * FROM admin_userdetails WHERE application LIKE '%"+rs10.getString(1)+"%'; ";
                                                            Statement st11 = conn.createStatement();
                                                                ResultSet rs11= st11.executeQuery(query11);
                                                                int index3=0;
                                                              while(rs11.next())
                                                              {
                                                            if(!user.contains(rs11.getString("uname")))
                                                            {
                                                            user+=rs11.getString("uname")+",";
                                                            user2[index3]=rs11.getString("uname");
                                                            index3++;
                                                              }
                                                            else
                                                            {
                                                            String[] user1=user.substring(0,user.length()-1).split(",");
                                                            for(int index1=0;index1<user1.length;index1++)
                                                            {
                                                            for(int index2=0;index2<app.length;index2++)
                                                            {
                                                            if(app[index2].equals(user1[index1]))
                                                            {
                                                            user1[index1]+="-"+app[index2];
                                                            user2[index1]+="-"+app[index2];
                                                            }
                                                            }
                                                            }
                                                            }
                                                              } */
                                                            //System.out.println("user-------"+user);hi
                                                            //String[] users=user.substring(0,user.length()-1).split(",");


                                                       String[] ans=appobj.progressbar_and_state(selprj).split(",");
                                                       String progbar=ans[0];
                                                       String stats1=ans[1];
                                                       String cstartdate=ans[2];
                                                       String cenddate=ans[3];
                                                       System.out.println("progressbar------"+progbar+"stats----------"+stats1);




                                                            /* appprgbar=appprgbar.substring(0,appprgbar.length()-1);
                                                            String appprgbar1[]=appprgbar.split(",");
                                                            System.out.println("appprgbar-------------"+appprgbar);
                                                            System.out.println(""); */
                                                            //application stages
                                                            String[] stages={"Requirements","Build and Test","Gate 3 Approval to Deploy"};
                                                          /*  String query13="select appname from AppEmphazize_ApplicationInfo where prjname='"+selprj+"';";
                                                           Statement st13 = conn.createStatement();
                                                      ResultSet rs13= st13.executeQuery(query13);
                                                      String apps="";
                                                      while(rs13.next())
                                                      {
                                                      apps+=rs13.getString("appname")+",";
                                                      } */
                                                      //System.out.println("appname--------"+apps);


                                                      String query14="select * from archiveexecution_details where name= 'Execute' and projects='"+selprj+"';";
                                                        Statement st14 = conn.createStatement();
                                                    ResultSet rs14= st14.executeQuery(query14);
                                                    String startseqnum="";
                                                    while(rs14.next())
                                                    {
                                                    startseqnum+=rs14.getString(1)+",";
                                                    }
                                                    String[] startseq=startseqnum.substring(0,startseqnum.length()-1).split(",");
                                                    String query15="select * from archiveexecution_details where name= 'Closure' and projects='"+selprj+"';";
                                                    Statement st15 = conn.createStatement();
                                                ResultSet rs15= st15.executeQuery(query15);
                                                String endseqnum="";
                                                while(rs15.next())
                                              {
                                              endseqnum+=rs15.getString(1)+",";
                                              }
                                              String[] endseq=endseqnum.substring(0,endseqnum.length()-1).split(",");
                                                    System.out.println("startseqnum--------------"+startseqnum+"endseqnum---------------"+endseqnum);
                                                    int start=Integer.parseInt(startseq[0])+1;
                                                    int end=Integer.parseInt(endseq[0]);
                                                    System.out.println("startseqnumint --------------"+start+"endseqnumint ---------------"+end);
                                                    int in=start;
                                                    String percent="";
                                                    int k;
                                                    int ind=start;
                                                      int ai=0;
                                                       //String[] stagesdt={"Configuration","Cycle 1 (Dev)","Cycle 2 (Stage)","UAT setup (Stage)","UAT"};
                                                /* String query17="select count(appname) from AppEmphazize_ApplicationInfo where prjname='"+selprj+"'";
                                                            Statement st17 = conn.createStatement();
                                                        ResultSet rs17= st17.executeQuery(query17);
                                                      String countapp="";
                                                        while(rs17.next())
                                                        {
                                                        countapp=rs17.getString(1);
                                                        } */
                                                        //System.out.println("countapp------ "+countapp);
                                                      String query18="select * from archiveexecution_details where name='Build and Test' and projects='"+selprj+"'";;
                                                      Statement st18 = conn.createStatement();
                                                      ResultSet rs18= st18.executeQuery(query18);
                                                      String btseq="";
                                                      while(rs18.next())
                                                      {
                                                      btseq+=rs18.getString(1)+",";
                                                      }
                                                      String[] btseqn=btseq.substring(0,btseq.length()-1).split(",");
                                                      String g3seq="";
                                                   String query19="select * from archiveexecution_details where name='Gate 3 Approval to Deploy' and projects='"+selprj+"';";
                                                    Statement st19 = conn.createStatement();
                                                    ResultSet rs19= st19.executeQuery(query19);
                                                    while(rs19.next())
                                                    {
                                                  g3seq+=rs19.getString(1)+",";
                                                    }
                                                    String query22="select * from appemphazize_applicationinfo where prjname='"+selprj+"'";
                                                    Statement st22 = conn.createStatement();
                                                    ResultSet rs22= st22.executeQuery(query22);
                                                    String app2="";
                                                    while(rs22.next())
                                                    {
                                                app2+=rs22.getString("appname")+",";
                                                    }
                                                      System.out.println("btseq---------- "+btseq+"g3seq------------- "+g3seq+"appname--------"+app2);
                                                      int seqind=0;
                                                      String check="";
                                                         while(ind<end)
                                                         {
                                                        String query16="select * from archiveexecution_details where seq_num="+ind+" and projects='"+selprj+"'";
                                                            Statement st16 = conn.createStatement();
                                                        ResultSet rs16= st16.executeQuery(query16);
                                                        while(rs16.next())
                                                        {

                                                        String word=rs16.getString("name");
                                                        if(app2.contains(word))
                                                        {
                                                        check=word;
                                                        }
														//System.out.println("app2----------"+app2);
                                                        if(apps.contains(check))
                                                        {
                                                           //System.out.println("checking in.........."+word);
                                                        if(rs16.getString("name").equals("Build and Test"))//caculating percentage only for build and test
                                                {
                                                String devtes="";
                                                int dev=0;
                                                        int tes=0;
                                                    int[] array={ind+1,ind+11,ind+16,ind+21,ind+26};
                                                for(int n=0;n<array.length-2;n++)
                                                {
                                                String query20="select * from archiveexecution_details where seq_num="+array[n]+" and projects='"+selprj+"'";
                                                            Statement st20 = conn.createStatement();
                                                        ResultSet rs20= st20.executeQuery(query20);
                                                        while(rs20.next())
                                                        {
                                                        if(Integer.parseInt(rs20.getString("progressbar"))<100)
                                                        {
                                                        dev+=Integer.parseInt(rs20.getString("progressbar"));
                                                        }
                                                        }
                                                }
                                                        for(int n1=2;n1<array.length;n1++)
                                                        {
                                                        String query21="select * from archiveexecution_details where seq_num="+array[n1]+" and projects='"+selprj+"'";
                                                        Statement st21 = conn.createStatement();
                                                    ResultSet rs21= st21.executeQuery(query21);
                                                        while(rs21.next())
                                                        {
                                                        if(Integer.parseInt(rs21.getString("progressbar"))<100)
                                                        {
                                                        tes+=Integer.parseInt(rs21.getString("progressbar"));
                                                        }
                                                        }
                                                        }
                                                      devtes+=dev/3+"!"+tes/2;//calculating the development and testing percentage
                                                      percent+=devtes+",";
                                                      System.out.println("devtest--------------------- "+devtes);
                                                }
                                                else
                                                {
                                                        for(int i=0;i<stages.length;i++)
                                                        {
                                                           if(rs16.getString("name").equals(stages[i]))
                                                        {
                                                        percent+=rs16.getString("progressbar")+",";
                                                          if(rs16.getString("name").equals("Gate 3 Approval to Deploy"))
                                                        {
                                                        percent=percent.substring(0,percent.length()-1)+"-";
                                                        }
                                                        }
                                                        }
                                                         }
                                                        }
                                                        }
                                                       ind++;
                                                    }
                                                         System.out.println("percent--------------- "+percent.substring(0,percent.length()-1));
                                                        String[] percentage=percent.substring(0,percent.length()-1).split("-");
                                                        //System.out.println("testing..."+percentage[0]);
                                                        String percentage1="";
                                                        String prg="";
                                                        String stage="";
                                                        String[] stages1={"Requirements","Development","Testing","Gate 3 Approval to Deploy"};
                                                        for(int pi=0;pi<percentage.length;pi++)
                                                        {
                                                        String[] ina=percentage[pi].split(",");
                                                        for(int innp=0;innp<ina.length;innp++)
                                                        {
                                                        String prg1=ina[innp];
                                                       /*  if(stages1[innp].equals("Development")||stages1[innp].equals("Testing")) */
                                                        if(stages1[innp].contains("Development")||stages1[innp].contains("Testing"))
                                                        {
                                                    	   System.out.println("development testing----------"+prg1);
                                                          String[] prg2=prg1.split("!");
                                                          if(Integer.parseInt(prg2[0])<100&&stages1[innp].contains("Development"))
                                                          {
                                                        	  System.out.println("prg2------------"+prg2[0]);
                                                        	  prg+=prg2[0]+",";
                                                        	  stage+=stages1[innp]+",";
                                                        	  break;
                                                          }
                                                          else if(Integer.parseInt(prg2[1])<100&&stages1[innp].contains("Testing"))
                                                          {
                                                        	  System.out.println("prg2------------"+prg2[1]);
                                                        	  prg+=prg2[1]+",";
                                                        	  stage+=stages1[innp]+",";
                                                        	  break;
                                                          }
                                                        }
                                                        else {

                                                     if(Integer.parseInt(prg1)<100)
                                                        {
                                                        prg+=ina[innp]+",";
                                                        stage+=stages1[innp]+",";
                                                        break;
                                                        }
                                                        }
                                                        }
                                                        }
                                                        /* prg=prg.substring(0,prg.length()-1); */
                                                        System.out.println("percentage app-------------- "+prg+"stages---------------"+stage);
                                                        String[] prgb=prg.substring(0,prg.length()-1).split(",");
                                                        String[] stg=stage.substring(0,stage.length()-1).split(",");
                                                        System.out.println("prgb--------------"+prgb[prgb.length-1]+"stages----------------"+stg[stg.length-1]);
                                                        int i=0;
                                                        int len=0;
                                                        int applen=prgb.length;
                                                       System.out.println("checking--------"+applen+" app"+app.length);
                                                       int appindex=0;
                                                       String application_percentage="";
                                                       application_percentage=appobj.Applicationpercentage(app,selprj);
                                                       String pieperc=appobj.percentage_conversion(apps,selprj);
                                                       String[] pie_perc=pieperc.substring(0,pieperc.length()-1).split(",");
                                                       String[] respercentage=application_percentage.substring(0,application_percentage.length()-1).split("_");
                                                       String currentmaintask="";
                                                       currentmaintask=appobj.currentmain_task(app,selprj);
                                                       System.out.println("res---------------- "+currentmaintask);
                                                       String[] main_task=currentmaintask.substring(0,currentmaintask.length()-1).split(",");
                                                       String subtask="";
                                                       subtask=appobj.current_subtask(app,selprj,main_task);
                                                       System.out.println("subtask------------"+subtask);
                                                       String completedmaintask=appobj.completedmain_task(app,selprj);
                                                       String[] sub_task=subtask.substring(0,subtask.length()-1).split(",");
                                                       while(appindex<app.length)
                                                              {
                                                          System.out.println("testing............ "+"app-------- "+app[appindex]+" progbar----------- "+progbar+" statement------ "+stats1+" current start date and end date----------- "+cstartdate+" "+cenddate+" application percentage--------- "+respercentage[appindex]);
                                                              %>
                                                        ['<%=app[appindex]%>',<%=pie_perc[appindex]%>,"Application:<%=app[appindex]%>,\nProject Completion:<%=progbar%>%,\nState:<%=stats1%>,\nTask Startdate:<%=cstartdate%>,\nTask Enddate:<%=cenddate%>,\nApplication%:<%=respercentage[appindex]%>"],
                                                        <%
                                                        //System.out.println("user----------"+users[i]);
                                                        appindex++;
                                                              }
                                                              %>

                                                    ]);
                                                    var options = {
                                                        'title': 'Applications',
                                                        'width': 550,
                                                        'height': 400,
                                                        is3D: true
                                                    };

                                                    // Load the Visualization API and the piechart package.
                                                    //google.charts.load('current', {'packages':['corechart']});

                                                    // Instantiate and draw the chart.
                                                    var chart = new google.visualization.PieChart(document.getElementById('container11'));
                                                    function selectHandler() {
                                                        var selectedItem = chart.getSelection()[0];

                                                        // console.log(selectedItem.row);
                                                        if (selectedItem) {

                                                            var value = data.getValue(selectedItem.row,0);
                                                            //console.log(selectedItem);
                                                            //console.log(value);
                                                            popuphandler(value);
                                                            var modal = document.getElementById('myModal');
                                                            var span = document.getElementsByClassName("close")[0];
                                                            modal.style.display = "block";
                                                            span.onclick = function() {
                                                                modal.style.display = "none";
                                                            }
                                                            window.onclick = function(event) {

                                                                if (event.target == modal) {
                                                                    modal.style.display = "none";
                                                                }
                                                            }
                                                        }
                                                    }
                                                    google.visualization.events.addListener(chart, 'select', selectHandler);

                                                    chart.draw(data, options);

                                                }
                                                function popuphandler(app)
                                                {
                                                    var app1="";

                                                    <%
                                                    String[] words=apps.substring(0,apps.length()-1).split(",");
                                                         int indexx=0;
                                                         System.out.println("words length--------------"+words.length);
                                                         while(indexx<words.length)
                                                         {%>

                                                    app1+="<%=words[indexx]%>"+",";

                                                    <%
                                                    indexx++;
                                                    }%>
                                                    //alert("Resulstring-----------"+app1.substring(-1,app1.length-1));
                                                    var apparray=app1.substring(-1,app1.length-1).split(",");
                                                    var selecetedapp="";
                                                    var selindex1=0;
                                                    //alert("length---------"+apparray.length+"apppppppppp--------"+apparray[0]);
                                                    //alert(apparray.length);
                                                    for(var index=0;index<apparray.length;index++)
                                                    {
                                                        if(apparray[index]==app)
                                                        {
                                                            selectedapp=apparray[index];
                                                            selindex1=index;
                                                        }
                                                    }
                                                    // alert(selectedapp);
                                                    var progbar1="<%=progbar%>";
                                                    var application_percent="<%=application_percentage%>";
                                                    //alert("appperc   "+application_percent)
                                                    var app_perc_arr=application_percent.substring(-1,application_percent.length-1).split("_");
                                                    var sub_app_perc=app_perc_arr[selindex1].split(",");
                                                    var startdate="<%=cstartdate%>";
                                                    var enddate="<%=cenddate%>";
                                                    var currentproject="<%=selprj%>";
                                                    var project_stat="<%=stats1%>";
                                                    var currentmain="<%=currentmaintask%>";
                                                    console.log(currentmain);
                                                    var currentsub="<%=subtask%>";
                                                    var completed_main="<%=completedmaintask%>";

                                                    console.log(currentsub);
                                                    //alert("current main "+currentmain+"current subtask"+currentsub);
                                                    $('#modalpopup').html('');
                                                    $('#modalpopup').append(popup_content(selectedapp,app_perc_arr,currentproject,project_stat,progbar1,startdate,enddate,selindex1,completed_main,currentmain,currentsub));
                                                    //alert("selected app:"+selectedapp+"selected index"+selindex1);
                                                }
                                                /* ======popup_content(Application name,Application percentage,ProjectName,Project state,Project percentage,start date,end date,selected index)====== */
                                                function popup_content(selectedapp,app_perc_arr,currentproject,project_stat,progbar1,startdate,enddate,selindex1,completed_main,currentmain,currentsub)
                                                {
                                                    var sub_app_perc=app_perc_arr[selindex1].split(",");
                                                    var currentmain_arr=currentmain.substring(-1,currentmain.length-1).split("_");
                                                    var currentsub_arr=currentsub.substring(-1,currentsub.length-1).split("_");
                                                    var completedmain_arr=completed_main.substring(-1,completed_main.length-1).split("_");
                                                    var popup_content1="<table ><thead><tr class='border-bottom'><th>Name</th><th>Value</th></tr></thead><tbody>"+
                                                        "<tr class='border-bottom'><td><b>Application Name:</b></td><td>"+selectedapp+"</td></tr>"+
                                                        "<tr class='border-bottom'><td><b>Application Percentage:</b></td><td>"+sub_app_perc[0]+"</td></tr>"+
                                                        "<tr class='border-bottom'><td><b>Application State:</b></td><td>"+sub_app_perc[1]+"</td></tr>"+
                                                        "<tr class='border-bottom'><td><b>Project Name:</b></td><td>"+currentproject+"</td></tr>"+
                                                        "<tr class='border-bottom'><td><b>Project State:</b></td><td>"+project_stat+"</td></tr>"+
                                                        "<tr class='border-bottom'><td><b>Project Percentage:</b></td><td>"+progbar1+"%</td></tr>"+
                                                        "<tr class='border-bottom'><td><b>Start Date:</b></td><td>"+startdate+"</td></tr>"+
                                                        "<tr class='border-bottom'><td><b>End Date:</b></td><td>"+enddate+"</td></tr>"+
                                                        "<tr class='border-bottom'><td valign='top'><b>Completed Main Task:</b></td><td><ul>"+completedmain_arr[selindex1]+"</ul></td></tr>"+
                                                        "<tr class='border-bottom'><td valign='top'><b>Current Main Task:</b></td><td><ul>"+currentmain_arr[selindex1]+"</ul></td></tr>"+
                                                        //"<tr class='border-bottom'><td valign='top'><b>Current Sub-Task:</b></td><td><ul>"+currentsub_arr[selindex1]+"</ul></td></tr>"+
                                                        "</tbody></table>";
                                                    console.log(popup_content1);
                                                    return popup_content1;
                                                }
                                                // google.charts.setOnLoadCallback(drawChart);
                                                /* function reload() {
                                                location.reload();
                                                } */
                                            </script>
                                            <!-- ===============Line-Chart=================== -->
                                            <%int last_10 = 10, last_30 = 20, last_50 = 50, last_20 = 20;%>
                                            <script type="text/javascript">
                                                google.charts.load('current', {'packages': ['corechart']});
                                                google.charts.setOnLoadCallback(drawChart);

                                                function drawChart() {

                                                    var data = google.visualization.arrayToDataTable([

                                                        ['day', 'Applications'],
                                                        ['Last 10 days', <%= last_10 %>],
                                                        ['Last 20 days', <%= last_20 %>],
                                                        ['Last 30 days', <%= last_30 %>],
                                                        ['Last 50 days', <%= last_50 %>]
                                                    ]);

                                                    var options = {
                                                        title: '',
                                                        curveType: 'function',
                                                        legend: {position: 'bottom'}
                                                    };

                                                    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

                                                    chart.draw(data, options);
                                                }
                                            </script>
                                            <!-- ====================Bar-Chart======================= -->
                                            <script type="text/javascript">
                                                google.charts.load("current", {packages:['corechart']});
                                                google.charts.setOnLoadCallback(drawChart);
                                                function drawChart() {
                                                    var data = google.visualization.arrayToDataTable([
                                                        ["Application", "percentage", { role: "style" } ],
                                                        <%
                                                        for(int barindex=0;barindex<app.length;barindex++)
                                                        {
                                                         int barperc=Integer.parseInt(respercentage[barindex].substring(0,2));
                                                        %>
                                                        ["<%=app[barindex]%>",<%=barperc%>, "blue"],
                                                        <%
                                                        }
                                                        %>
                                                    ]);

                                                    var view = new google.visualization.DataView(data);
                                                    view.setColumns([0, 1,
                                                        { calc: "stringify",
                                                            sourceColumn: 1,
                                                            type: "string",
                                                            role: "annotation" },
                                                        2]);

                                                    var options = {
                                                        title: "Application completion in percentage",
                                                        bar: {groupWidth: "44%"},
                                                        vAxis: { gridlines: { count: 4 } },
                                                        legend: { position: "none" },
                                                    };

                                                    var chart = new google.visualization.ColumnChart(document.getElementById("bar_chart"));
                                                    function selectHandler(e) {
                                                        var selectedItem = chart.getSelection()[0];

                                                        // console.log(selectedItem.row);
                                                        if (selectedItem) {

                                                            var value = data.getValue(selectedItem.row,0);
                                                            //console.log(selectedItem);
                                                            //console.log(value);
                                                            popuphandler(value);
                                                            var modal = document.getElementById('myModal');
                                                            var span = document.getElementsByClassName("close")[0];
                                                            modal.style.display = "block";
                                                            span.onclick = function() {
                                                                modal.style.display = "none";
                                                            }
                                                            window.onclick = function(event) {

                                                                if (event.target == modal) {
                                                                    modal.style.display = "none";
                                                                }
                                                            }
                                                        }
                                                    }
                                                    google.visualization.events.addListener(chart, 'select', selectHandler);
                                                    chart.draw(view, options);


                                                }
                                            </script>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>


                    </div>



                    <%
                            }
                        } catch (Exception e) {
                        }
                    %>


                </section>
                <!-- /.section -->

            </div>
            <!-- /.main-page -->

            <!-- Project List End -->

        </div>
        <!-- /.content-container -->
    </div>
    <!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->

</div>

<script>
    // Add active class to the current button (highlight it)
    var header = document.getElementById("myDIV");
    var btns = header.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {f/hea
        btns[i].addEventListener("click", function() {
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
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
<script src="js/main.js"></script>
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== PAGE JS FILES ========== -->

<script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
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

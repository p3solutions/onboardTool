<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Onboard - Archive Executive Sample</title>

    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

    <a href="https://icons8.com/icon/103369/add-row"></a>
    <a href="https://icons8.com/icon/14320/delete-row"></a>

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

    <link rel="stylesheet" type="text/css" href="css/date-picker/jquery.timepicker.css" />
    <link rel="stylesheet" type="text/css" href="css/date-picker/bootstrap-datepicker.css" />
    <script type="text/javascript" src="js/archivesummary/jqueryprogressbar.js"></script>
    <link rel="stylesheet" type="text/css" href="old/css/loading-bar.css"/>
    <script type="text/javascript" src="js/archivesummary/loading-bar.js"></script>

    <script type="text/javascript" src="js/archivesummary/main.js"></script>
    <script src="https://docraptor.com/docraptor-1.0.0.js"></script>

    <script src="js/archivesummary/treeTable.js"></script>

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" type="text/css" href="css/date-picker/jquery.timepicker.css" />
    <link rel="stylesheet" type="text/css" href="css/date-picker/bootstrap-datepicker.css" />

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script type="text/javascript" src="js_in_pages/archive_exec.js"></script>
    <script type="text/javascript" src="js_in_pages/tree.js"></script>
    <link rel="stylesheet" href="js_in_pages/archive_exec.css" type="text/css" />
    <link rel="stylesheet" href="old/css0/progressbar.css" type="text/css" />


    <script src="js/archivesummary/jstree.min.js"></script>
    <style>
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
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            height:55%;
        }
        .modal-content1 {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            height:46%;
        }
        .modal-content2 {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 30%;
            height:47%;
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
        /*popup input text field taskname style*/
        #taskname
        {
            width:300px;
            height:50px;
            border: 2px ridge black;
            border-radius: 4px;
        }
        #modifytaskname
        {
            width:300px;
            height:50px;
            border: 2px ridge black;
            border-radius: 4px;
        }
        .node { /* Change width and height */
            width:1em;
            height:1em;
        }
        .button {
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }

        .button2 {background-color: rgb(52, 152, 219);border-radius: 12px;} /* Blue */
        .mem_ass{ height:30px;}
    </style>

</head>

<body class="top-navbar-fixed" onload="UserList();">
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    String projectname="";
    System.out.println("[INFO]-----"+formatter.format(date1)+"-----Accessed Archive_Execution JSP PAGE-----[INFO]");  %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>

<form class="form-signin" name="loginForm" method="post" action="archive_exec">
    <%


        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.

        if (session.getAttribute("username")==null)
        {
            response.sendRedirect("Login.jsp");
        }
    %>
    <%
        HttpSession details=request.getSession();
        String roles=(String)details.getAttribute("role");
        String info=(String)details.getAttribute("archive_exec");
        String det=(String)session.getAttribute("theName");
        System.out.println("detttttttttttttttttt"+det);
        String username=(String)details.getAttribute("u_Name");
        String Project_Name=(String)details.getAttribute("nameofproject");
        DBconnection d=new DBconnection();
        Connection conn = (Connection)d.getConnection();
        String visit_query="select * from visits";
        Statement visit_st = conn.createStatement();
        ResultSet visit_rs = visit_st.executeQuery(visit_query);
        int flag=1;

        Date date = new Date();
        SimpleDateFormat ft,ft1;
        ft=new SimpleDateFormat ("yyyy-MM-dd");
        ft1=new SimpleDateFormat ("hh:mm:ss");
        String strDate=ft.format(date);
        String strTime=ft1.format(date);

        while(visit_rs.next())
        {
            if(visit_rs.getString(6)!=null || visit_rs.getString(1)!=null)
            {
                if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Archive Execution Module") && visit_rs.getString(6).equals(Project_Name) )
                {
                    Statement stmtt = conn.createStatement();
                    String queryy = "update visits set count=count+1,time='"+strTime+"' where uname='"+username+"' and module='Archive Execution Module' and Projects='"+Project_Name+"'";
                    int count = stmtt.executeUpdate(queryy);
                    flag=0;
                    break;
                }
            }
        }
        if(flag==1)
        {
            String ins_query = " insert into visits (uname, date, module, count, time, Projects)"
                    + " values (?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = conn.prepareStatement(ins_query);
            preparedStmt.setString (1, username);
            preparedStmt.setString (2, strDate);
            preparedStmt.setString(3, "Archive Execution Module");
            preparedStmt.setString(4, "1");
            preparedStmt.setString(5, strTime);
            preparedStmt.setString(6, Project_Name);

            // execute the preparedstatement
            preparedStmt.execute();
        }
        String query = "select * from AppEmphazize_ProjectDetails where id = "+det+";";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        String query9 = "select * from AppEmphazize_ProjectDetails where id = "+det;
        Statement st9 = conn.createStatement();
        ResultSet rs9 = st9.executeQuery(query9);
        String query4 = "select * from dummy";
        Statement st4 = conn.createStatement();
        ResultSet rs4 = st4.executeQuery(query4);
        if(rs9.next()){
        }
        String query3 = "select * from ArchiveExecution_Details where projects='"+rs9.getString("projectname")+"' order by seq_num";
        Statement st3 = conn.createStatement();
        ResultSet rs3 = st3.executeQuery(query3);
        String query5 = "select * from ArchiveExecution_Details where projects='"+rs9.getString("projectname")+"' order by seq_num";
        Statement st5 = conn.createStatement();
        ResultSet rs5 = st5.executeQuery(query5);

        String query7 = "select * from AppEmphazize_ProjectDetails where id = "+det;
        Statement st7 = conn.createStatement();
        ResultSet rs7 = st7.executeQuery(query7);

        if(rs4.next()){
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

                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <i class="fa fa-ellipsis-v"></i>
                        </button>
                        <button type="button" class="navbar-toggle mobile-nav-toggle" >
                            <i class="fa fa-bars"></i>
                        </button>
                    </div>
                    <% if(rs.next()){ %>
                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=rs.getString("projectname") %></a>
                    <input type="text" id="project_name" name="project_name" value="<%=rs.getString("projectname")%>" style="display:none;">
                    <%
                        projectname=rs.getString("projectname");
                        String q2="select * from ArchiveExecution_Details where level=1 and projects='"+rs.getString("projectname")+"'order by seq_num";
                        Statement s2 = conn.createStatement();
                        ResultSet rss = s2.executeQuery(q2);
                        while(rss.next())
                        {
                            session.setAttribute(rss.getString(3),rss.getString(15));
                            session.setAttribute((rss.getString(3)+"1"),rss.getString(1));
                        }

                    %>

                    <!-- /.navbar-header -->

                    <div class="collapse navbar-collapse" id="navbar-collapse-1">

                        <!-- /.nav navbar-nav -->
                        <ul class="nav navbar-nav navbar-right">

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

                <!-- Projects List Start -->

                <div class="main-page">

                    <section>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="container-fluid">
                                    <h1 class="page-header">Projects</h1>

                                    <%
                                        String initiate=(String)session.getAttribute("Ideation and Initiate");
                                        String plan=(String)session.getAttribute("Plan");
                                        String execute=(String)session.getAttribute("Execute");
                                        String hypercare=(String)session.getAttribute("Closure");
                                        String initiate_seqno=(String)session.getAttribute("Ideation and Initiate1");
                                        String plan_seqno=(String)session.getAttribute("Plan1");
                                        String execute_seqno=(String)session.getAttribute("Execute1");
                                        String hypercare_seqno=(String)session.getAttribute("Closure1");
                                        if(initiate == null)
                                            initiate="0";
                                        if(Integer.parseInt(initiate)>100)
                                            initiate="100";

                                        if(plan == null)
                                            plan="0";

                                        if(Integer.parseInt(plan) > 100)
                                            plan="100";

                                        if(execute == null)
                                            execute="0";

                                        if(Integer.parseInt(execute) > 100)
                                            execute="100";

                                        if(hypercare == null)
                                            hypercare="0";

                                        if(Integer.parseInt(hypercare) > 100)
                                            hypercare="100";
//System.out.println(plan);
                                    %>

                                    <div class="row">

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <center><label >Initiate</label></center>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar" style="width: <%=initiate%>%" aria-valuenow="<%=initiate %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=initiate %>%</span></div>
                                                </div></div></div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <center><label >Plan</label></center>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar1" style="width: <%=plan%>%" aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=plan %>%</span></div>
                                                </div></div></div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <center><label >Execute</label></center>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar2" style="width: <%=execute %>%" aria-valuenow="<%=execute %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=execute %>%</span></div>
                                                </div></div></div>

                                        <div class="col-md-3">
                                            <div class="form-group">
                                                <center><label >Closure</label></center>
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-success progress-bar-stripedss-bar" role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
                                                </div></div></div>
                                    </div>
                                    <jsp:include page="progress_details.jsp" >
                                        <jsp:param name="Initiate" value="<%=initiate %>"/>
                                        <jsp:param name="Plan" value="<%=plan %>"/>
                                        <jsp:param name="Execute" value="<%=execute %>"/>
                                        <jsp:param name="Hypercare" value="<%=hypercare %>"/>
                                    </jsp:include>

                                    <script>
                                        $(function(){
                                            $.contextMenu({
                                                selector: '.context-menu-one',
                                                items: $.contextMenu.fromMenu($('#html5menu'))
                                            });
                                        });
                                    </script>

                                    <div class="table-responsive">

                                        <table class="table table-bordered" style="align:center" id="table">
                                            <thead style="background-color: #5D8896">
                                            <tr>
                                                <th style="width:70%;">Tasks </th>
                                                <th>Resource Assigned</th>
                                                <th>Plan start date</th>
                                                <th>Plan End date</th>
                                                <th>Actual start date</th>
                                                <th>Actual End date</th>
                                                <th>Planned Hours</th>
                                                <th>Actual Hours</th>
                                                <th>Progress %</th>
                                                <th style="width:20%;">Status</th>
                                                <th>Comments</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>

                                            <tbody >
                                            <%
                                                int i=0,count=0,pp=0;
                                                String no="";
                                                while(rs3.next()){
                                                    /* if part is executed when archival execution details level==1 */
                                                    if(Integer.parseInt(rs3.getString(2))==1)
                                                    {
                                                        pp++;
                                            %>
                                            <tr style="text-align:center;" data-tt-id="<%=rs3.getString(10) %>">
                                                <td style="width:200px;">
                                                    <b>
		                                            <span style="color:#3071a9;font-size:150%; position:relative; left:5px;">
		                                            <input  type="text" placeholder="enter" class="maintask" id="task" name="name<%=i %>" value="<%=rs3.getString(3) %>" readonly /></span>
                                                        <span style="float:right;cursor:pointer;" onclick="sub('<%=rs3.getString(1) %>','<%= (Integer.parseInt(rs3.getString(2))+1) %>','<%=rs4.getString(1) %>','<%=rs3.getString(10) %>')"></span>
                                                    </b>
                                                </td>

                                                <td style="display:none"><input type="text" id="seqnum<%=i %>" name="seqnum<%=i %>" value="<%=rs3.getInt(1) %>" hidden /></td>
                                                <td style="display:none"><input type="text" id="level<%=i %>" name="level<%=i %>" value="<%=rs3.getInt(2) %>" hidden /></td>
                                                <td><input  type="text" class="in"   placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(4) %>" /></td>
                                                <td id="basicExample"><input  type="text" class="in date start" id="pln_srt_date<%=i %>" name="pln_srt_date<%=i %>" value="<%=rs3.getString(7) %>" readonly/></td>
                                                <td id="basicExample"><input  type="text" class="in date start" id="pln_end_date<%=i %>" name="pln_end_date<%=i %>" value="<%=rs3.getString(8) %>" /></td>
                                                <td id="basicExample"><input type="text" class="in date start" id="act_srt_date<%=i %>" name="act_srt_date<%=i %>" value="<%=rs3.getString(5) %>" /></td>
                                                <td id="basicExample"><input  type="text" class="in date start" id="act_end_date<%=i %>" name="act_end_date<%=i %>" value="<%=rs3.getString(6) %>"  /></td>
                                                <td><input  type="text" class="in"  id="phours<%=i %>" name="phrs<%=i %>" value="<%=rs3.getString(13) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)" /></td>
                                                <td><input  type="text" class="in"  id="hours<%=i %>" name="hrs<%=i %>" value="<%=rs3.getString(9) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)"/></td>
                                                <td ><div class="progressbar" id="myItem<%=i%>"></div></td>
                                                <td ><input type="text" style="background-color:transparent;width:20%;" id="status<%=i%>"  /></td>
                                                <td></td>
                                                <td>
                                                    <i class="fa fa-plus" aria-hidden="true" id="myBtn<%=i%>" onclick="popup(this.id);"></i>
                                                    <i class="fa fa-trash-o" aria-hidden="true" id="delete<%=i%>" onclick="delete_popup(this.id);"></i>
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true" id="modify<%=i%>" onclick="modify_popup(this.id);"></i>
                                                </td>

                                                <script>
                                                    getDetID(document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('status<%=i %>'),document.getElementById('act_end_date<%=i %>').value,'<%= rs3.getString(17)%>',<%=i%>,'<%=projectname%>');
                                                </script>
                                                <%
                                                    int progress=0;
                                                %>
                                            </tr>
                                            <%}
                                            /* else part get executed other than level==1 in archival execution details */
                                            else
                                            {

                                            %>
                                            <tr style="text-align:center;" data-tt-id="<%=rs3.getString(10) %>" data-tt-parent-id="<%=rs3.getString(11) %>">
                                                &nbsp;&nbsp;
                                                <td style="width:230px;">
		<span style="color:#00BFFF;font-size:100%; position:relative; left:5px;">
		<input  type="text" style="width:270px" placeholder="enter" id="name<%=i %>" name="name<%=i %>" value="<%=rs3.getString(3) %>" readonly/></span>
                                                    <span style="float:right;cursor:pointer;" onclick="sub('<%=rs3.getString(1) %>','<%= (Integer.parseInt(rs3.getString(2))+1) %>','<%=rs4.getString(1) %>','<%=rs3.getString(10) %>')"></span>
                                                </td>

                                                <td style="display:none"><input type="text" id="seqnum<%=i %>" name="seqnum<%=i %>" value="<%=rs3.getInt(1) %>" hidden /></td>
                                                <td style="display:none"><input type="text" id="level<%=i %>" name="level<%=i %>" value="<%=rs3.getInt(2) %>" hidden /></td>
                                                <td><input  list="userlist" class="in mem_ass"  id="mem_ass<%=i %>" placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(4) %>" style="text-align:center;"/></td>
                                                <td id="basicExample"><input  type="text" class="in date start" id="pln_srt_date<%=i %>" name="pln_srt_date<%=i %>" value="<%=rs3.getString(7) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',1);"  /></td>
                                                <td id="basicExample"><input  type="text" class="in date start" id="pln_end_date<%=i %>" name="pln_end_date<%=i %>" value="<%=rs3.getString(8) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',2);"  /></td>
                                                <td id="basicExample"><input type="text" class="in date start" id="act_srt_date<%=i %>" name="act_srt_date<%=i %>" value="<%=rs3.getString(5) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',3);"  /></td>
                                                <td id="basicExample"><input  type="text" class="in date start" id="act_end_date<%=i %>" name="act_end_date<%=i %>" value="<%=rs3.getString(6) %>" onClick="check_previous('<%=rs3.getInt(1) %>','<%=rs3.getInt(2) %>',document.getElementById('level<%=i-1 %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>',4);"  /></td>
                                                <td id="basicExample"><input  type="text" class="in date start"  id="phours<%=i %>" name="phrs<%=i %>" value="<%=rs3.getString(13)%>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)"/></td>
                                                <td id="basicExample"><input  type="text" class="in date start" id="hours<%=i %>" name="hrs<%=i %>" value="<%=rs3.getString(9) %>" onclick="call_fun(document.getElementById('mem_ass<%=i %>').value,document.getElementById('name<%=i %>').value,document.getElementById('seqnum<%=i %>').value,document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('phours<%=i %>').value,document.getElementById('hours<%=i %>').value,document.getElementById('act_end_date<%=i %>').value,'<%=initiate_seqno %>','<%=plan_seqno %>','<%=execute_seqno %>','<%=hypercare_seqno %>');" /></td>
                                                <td><div class="progressbar" id="myItem<%=i%>"></div></td>
                                                <td><input type="text" style="background-color:transparent;display:none;width:20%;" id="status<%=i%>"/></td>
                                                <td><input type="text" id="cmnts<%=i %>" name="cmnts<%=i %>" value="<%=rs3.getString(17) %>" /></td>
                                                <td>

                                                    <i class="fa fa-plus" aria-hidden="true" id="myBtn<%=i%>" onclick="popup(this.id);"></i>
                                                    <i class="fa fa-trash-o" aria-hidden="true" id="delete<%=i%>" onclick="delete_popup(this.id);"></i>
                                                    <i class="fa fa-pencil-square-o" aria-hidden="true" id="modify<%=i%>" onclick="modify_popup(this.id);"></i>
                                                </td>

                                                <% if((rs3.getString(3).equals("Requirements"))||(rs3.getString(3).equals("Build and Test"))){%>

                                                <script>
                                                    getDetID(document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('status<%=i %>'),document.getElementById('act_end_date<%=i %>').value,'<%= rs3.getString(17)%>',<%=i%>,'<%=projectname%>');
                                                </script>
                                                <%} %>

                                            </tr>
                                            <%
                                                    }
                                                    i++;
                                                }
                                            %>




                                            </tbody>

                                        </table>
                                    </div>
                                    <input type="hidden" id="pwqej" value="<%= info %>" hidden>
                                    <script>
                                        if(document.getElementById('pwqej').value=="R")
                                            checkk();
                                    </script>
                                    <script type="text/javascript">
                                        com_github_culmat_jsTreeTable.register(this)

                                        treeTable($('#table'))
                                    </script>
                                    <div>
                                        <%if(rs7.next()){ %>
                                        <input type="hidden" class="form-control" id="formInput198" placeholder="Application Name" name="prjname" value="<%=rs7.getString("projectname") %>" >
                                        <%} %>
                                        <input type="button" name="addbtn" class="btn btn-primary" onclick="sub(<%=i+1%>,1,'<%=rs4.getString(1) %>','<%=rs4.getString(1) %>');" value="Add" >
                                        <input type="button" name="subbtn" class="btn btn-primary" value="Submit" onclick="update()" >
                                    </div>
                                </div>

                            </div>
                        </div>

                            <%

}
%>
</form>
</div>
<!-- /.row -->
</section>
<!-- /.section -->

</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->
<!-- ADD popup -->
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content" >
        <span class="close" style="color:white;">&times;</span>
        <div class="modal-header" style="background-color:rgb(52, 152, 219);">
            <h1 style="color:white;">Create Task</h1>
        </div>
        <div class="modal-body" >
            <table>
                <tr>
                    <b style="font-size:16px;">Task Name:</b>
                    <input type="text" id="taskname" name="firstname" autocomplete="off" required>
                </tr>
                <tr>
                    <label class="container">
                        <input type="radio" class="node" id="node1" name="radio" checked="checked" required="required"><b>Similar Node</b></input>
                    </label>
                </tr>
                <tr>
                    <label class="container">
                        <input type="radio" class="node" id="node2" name="radio" required="required"><b>Child Node</b></input>
                        <span class="checkmark"></span>
                    </label>
                </tr>
            </table>
            <input type="hidden" id="sequence"/>
        </div>
        <div class="modal-footer" >
            <button class="button button2" onclick="createnode(document.getElementById('sequence').value,document.getElementById('taskname').value,'<%=projectname%>',$('#node2').prop('checked'));">Create Node</button>
            <button class="button button2" id="cancelbtn">cancel</button>
        </div>
    </div>

</div>

<!-- Delete pop-up -->
<div id="myModal1" class="modal">

    <!-- Modal content -->
    <div class="modal-content1" >
        <span class="close" style="color:white;">&times;</span>
        <div class="modal-header" style="background-color:rgb(52, 152, 219);">
            <h1 style="color:white;">Delete Task</h1>
        </div>
        <div class="modal-body" >
            <p style="font-size:24px;">Are you sure, you want to delete this <span id="taskdelete" style="font-size:24px;"></span><p style="font-size:24px;"> task and all relevant task permenantly?</p>
            <input type="hidden" id="sequence1"/>
        </div>
        <div class="modal-footer" >
            <button class="button button2" onclick="deletenode(document.getElementById('sequence1').value,'<%=projectname%>');"><u>Y</u>es</button>
            <button class="button button2" id="cancelbtn1"><u>N</u>o</button>
        </div>
    </div>

</div>
<!--Modify pop-up -->
<div id="myModal2" class="modal">

    <!-- Modal content -->
    <div class="modal-content2" >
        <span class="close" style="color:white;">&times;</span>
        <div class="modal-header" style="background-color:rgb(52, 152, 219);">
            <h1 style="color:white;">Edit Task</h1>
        </div>
        <div class="modal-body" >
            <table>
                <tr>
                    <b style="font-size:16px;">Task Name:</b>
                    <input type="text" id="modifytaskname" name="firstname" autocomplete="off" required>
                </tr>
                <tr>
                </tr>
            </table>
            <input type="hidden" id="sequence2"/>
        </div>
        <div class="modal-footer" >
            <button class="button button2" onclick="editnode(document.getElementById('sequence2').value,'<%=projectname%>',document.getElementById('modifytaskname').value);">Apply</button>
            <button class="button button2" id="cancelbtn2">cancel</button>
        </div>
    </div>
</div>
<datalist id="userlist">
</datalist>

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
<!-- ========== THEME JS ========== -->
<script src="js/jquery.doubleScroll.js"></script>
<script>
    $(document).ready(function(){
        $('.table-responsive').doubleScroll();
    });
</script>
<%} %>
</body>

</html>

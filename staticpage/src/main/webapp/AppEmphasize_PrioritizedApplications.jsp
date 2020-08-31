<!DOCTYPE html>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="bean.*" %>
<html lang="en">
<head>


    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projects</title>
    <meta name="description" content="Blueprint: View Mode Switch" />
    <meta name="keywords" content="view mode, switch, css, style, grid, list, template" />
    <script type="text/javascript" src="js_in_pages/applnprior1.js"></script>
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
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>


</head>
<style type="text/css">

    body{

        background:#f2f2f2;

    }
    #sitetitle1{

        color:DodgerBlue;
        text-align:center;
        float:right;

    }

    .category{
        margin-top:13px;
    }
    .buttongroup{

        margin-top:100px;

    }

    .act{

        text-align:center;

    }
    .priority{

        text-align:center;

    }

    .bs-wizard {margin-top: 40px;}

    /*Form Wizard*/
    .bs-wizard {border-bottom: solid 1px #e0e0e0; padding: 0 0 10px 0;}
    .bs-wizard > .bs-wizard-step {padding: 0; position: relative;}
    .bs-wizard > .bs-wizard-step + .bs-wizard-step {}
    .bs-wizard > .bs-wizard-step .bs-wizard-stepnum {color: #595959; font-size: 16px; margin-bottom: 5px;}
    .bs-wizard > .bs-wizard-step .bs-wizard-info {color: #999; font-size: 14px;}
    .bs-wizard > .bs-wizard-step > .bs-wizard-dot {position: absolute; width: 30px; height: 30px; display: block; background: #6dccff; top: 45px; left: 50%; margin-top: -15px; margin-left: -15px; border-radius: 50%;}
    .bs-wizard > .bs-wizard-step > .bs-wizard-dot:after {content: ' '; width: 14px; height: 14px; background: 	#1E90FF; border-radius: 50px; position: absolute; top: 8px; left: 8px; }
    .bs-wizard > .bs-wizard-step > .progress {position: relative; border-radius: 0px; height: 8px; box-shadow: none; margin: 20px 0;}
    .bs-wizard > .bs-wizard-step > .progress > .progress-bar {width:0px; box-shadow: none; background:  #6dccff;}
    .bs-wizard > .bs-wizard-step.complete > .progress > .progress-bar {width:100%;}
    .bs-wizard > .bs-wizard-step.active > .progress > .progress-bar {width:50%;}
    .bs-wizard > .bs-wizard-step:first-child.active > .progress > .progress-bar {width:0%;}
    .bs-wizard > .bs-wizard-step:last-child.active > .progress > .progress-bar {width: 100%;}
    .bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot {background-color: #f5f5f5;}
    .bs-wizard > .bs-wizard-step.disabled > .bs-wizard-dot:after {opacity: 0;}
    .bs-wizard > .bs-wizard-step:first-child  > .progress {left: 50%; width: 50%;}
    .bs-wizard > .bs-wizard-step:last-child  > .progress {width: 50%;}
    .bs-wizard > .bs-wizard-step.disabled a.bs-wizard-dot{ pointer-events: none; }
    /*END Form Wizard*/

    .row {
        margin-right: -15px;
        margin-left: -15px;
    }
    .card {
        border-radius: 6px;
        box-shadow: 0 2px 2px rgba(204, 197, 185, 0.5);
        background-color: #FFFFFF;
        color: #252422;
        margin-bottom: 20px;
        position: relative;
        z-index: 1;
    }
    .card .header {
        padding: 20px 20px 0;
    }
    .card .title {
        margin: 0;
        color: #252422;
        font-weight: 300;
    }
    h4, .h4 {
        font-size: 1.5em;
        font-weight: 600;
        line-height: 1.2em;
    }

    .card .content {
        padding: 15px 15px 10px 15px;
    }
    @media (min-width: 992px)
        .table-responsive {
            overflow: visible;
        }
        @media (min-width: 992px)
            .table-full-width {
                margin-left: -15px;
                margin-right: -15px;
            }
            input[type=text] {
                background-color: transparent;
                border: 0px solid;
                height: 20px;
                width: 150%;
                color: black;

            }
            input.break {
                word-wrap: break-word;
                word-break: break-all;
                height: 80px;
            }

            .table-striped tbody > tr:nth-of-type(n) .slider {

            }
            .table-striped tbody > tr:nth-of-type(2n) .slider  .slider.round  {
                background-color: #f2f2f2;
            }
            input.act:focus {
                outline-width: 0;
            }

            /* Style the buttons */
            .btn {
                border: none;
                outline: none;
                padding: 3px 14px;
                background-color: #3697e8;
                cursor: pointer;

            }
            .activ-pro{font-size: 16px;
                margin-left: -13px;
                margin-right: 99px;}
            .active, .btn:hover {
                color: white;
            }
            
            .example-two {
            
       		 border-radius: 10px;
        	border: 3px solid #e3e3e3;
    		}


    /* Style the active class, and buttons on mouse-over */

</style>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed AppEmphazize_Prioriized JSP PAGE-----[INFO]");  %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="onboard.DBconnection" %>
<%@ page import="java.util.*" %>
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
    double ans=0.0;
    try {
        int  App_Priorities;
        HttpSession details=request.getSession();
        String ID=(String)session.getAttribute("theName");
        String Application_Name=(String)details.getAttribute("applications");
        String Project_Name=(String)details.getAttribute("projects");
        DBconnection d=new DBconnection();
        Connection conn = (Connection)d.getConnection();
        String query3 = "select * from AppEmphazize_ProjectDetails where id = "+ID;

        String Project_name="";

        Statement st1 = conn.createStatement();
        Statement st2 = conn.createStatement();
        Statement st3 = conn.createStatement();
        ResultSet rs3 = st3.executeQuery(query3);
        if(rs3.next())
            Project_name=rs3.getString("projectname");
        session.setAttribute("newname",Project_name);
        String query1="";
        if(Project_Name.equals("all"))
            query1 = "select * from AppEmphazize_ApplicationInfo where prjname = '"+Project_name+"' and complexity is not null";
        else
            query1 = "select * from AppEmphazize_ApplicationInfo where prjname = '"+Project_Name+"' and appname='"+Application_Name+"' and complexity is not null";
        ResultSet rs1 = st1.executeQuery(query1);
        ArrayList projectPriorities = new ArrayList();
        projectPriorities = (ArrayList)session.getAttribute("proj_priorities");
        
        String query2= "select count(prjname) As total from AppEmphazize_ApplicationInfo where prjname='"+Project_name+"' and complexity is not null";
        ResultSet rs2 = st2.executeQuery(query2);
        {
%>

<%if(rs2.next())
{
    App_Priorities=rs2.getInt("total");
//System.out.println(App_Priorities);
//System.out.println(rs2.getString(2));


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
                            <a class="navbar-brand" href="Project_List.jsp" id="sitetitle1">PROJECT NAME-<%= Project_name %></a>
                            <%
                                String uname=(String)details.getAttribute("username");
                                String role=(String)details.getAttribute("role");%>
                            <li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
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
                                    <ul class="child-nav" id="myDIV">
                                        <li><a href="AppEmphasize_EditProject.jsp" > <span>Project Information</span></a></li>
                                        <li><a href="AppEmphasize_Application.jsp" > <span>Application Information</span></a></li>
                                        <li><a href="AppEmphasize_CostCalculation.jsp" > <span>Application Complexity</span></a></li>
                                        <li class="btn"><a href="AppEmphasize_PrioritizedApplications.jsp"> <span  class="activ-pro">Prioritized Applications</span></a></li>
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

 <div class="container-fluid">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h2 class="title">Application Prioritized</h2>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-6">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                 <li><a href="AppEmphasize_EditProject.jsp">Project Info</a></li>
                                   <li><a href="AppEmphasize_Application.jsp">Application Info</a></li>
                                   <li><a href="AppEmphasize_CostCalculation.jsp">Application Complexity</a></li>
                                    <li><a href="AppEmphasize_PrioritizedApplications.jsp">Application Prioritized</a></li>

                            </ul>
                        </div>



                    </div>
                    <!-- /.row -->
                </div>

                <section class="section">

                    <div class="row">
                        <div class="container">

                            <div class="main">

                                <%
                                    List<String> records=new ArrayList<String>();
                                    String initiate=(String)session.getAttribute("Ideation and Initiate");
                                    String plan=(String)session.getAttribute("Plan");
                                    String execute=(String)session.getAttribute("Execute");
                                    String hypercare=(String)session.getAttribute("HyperCare");
                                    if(initiate == null)
                                        initiate="0";
                                    if(plan == null)
                                        plan="0";
                                    if(execute == null)
                                        execute="0";
                                    if(hypercare == null)
                                        hypercare="0";
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
                                                <div  class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar1" style="width: <%=plan%>%" aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=plan %>%</span></div>
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
                                                <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
                                            </div></div></div>
                                </div>
                                <jsp:include page="progress_details.jsp" >
                                    <jsp:param name="Initiate" value="<%=initiate %>"/>
                                    <jsp:param name="Plan" value="<%=plan %>"/>
                                    <jsp:param name="Execute" value="<%=execute %>"/>
                                    <jsp:param name="Hypercare" value="<%=hypercare %>"/>
                                </jsp:include>

                                <div class="container">


                                    <div class="row bs-wizard" style="border-bottom:0;">

                                        <div class="col-xs-3 bs-wizard-step complete">
                                            <div class="text-center bs-wizard-stepnum">Project Information</div>
                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot"></a>
                                            <div class="bs-wizard-info text-center"></div>
                                        </div>

                                        <div class="col-xs-3 bs-wizard-step complete"><!-- active -->
                                            <div class="text-center bs-wizard-stepnum">Cost Complexity Calculation</div>
                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot"></a>
                                            <div class="bs-wizard-info text-center"></div>
                                        </div>

                                        <div class="col-xs-3 bs-wizard-step active"><!-- active -->
                                            <div class="text-center bs-wizard-stepnum">Prioritized Applications</div>
                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot"></a>
                                            <div class="bs-wizard-info text-center"></div>
                                        </div>

                                        <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                                            <div class="text-center bs-wizard-stepnum">Final</div>
                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot example-two"></a>
                                            <div class="bs-wizard-info text-center"> </div>
                                        </div>
                                    </div>





                                </div>



























                                <!-- Tables information -->

                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="card">

                                                <div class="header">
                                                    <h4 class="title"><b>View Priorities</b></h4>

                                                    <p class="category">The table below shows the priorities used for application in order from high to low.</p>


                                                </div>

                                                <div class="content table-responsive table-full-width">
                                                    <table class="table table-striped">
                                                        <thead>

                                                        <th><center>Application Name</center></th>
                                                        <th><center>Complexity</center></th>
                                                        <th><center>Estimated Number of Screens</center></th>
                                                        <th><center>Priorities</center></th>

                                                        </thead>

                                                        <tbody>



                                                        <%!int i=0; 
                                                    		LinkedHashMap<Integer,String> SettingPriority(ArrayList<String> complexity){

                                                            ArrayList<String> indexes=new ArrayList<String>();
                                                            ArrayList<String> priorities=new ArrayList<String>();
                                                            priorities.add("Low");
                                                            priorities.add("Low to Medium");
                                                            priorities.add("Medium");
                                                            priorities.add("Medium to High");
                                                            priorities.add("High");


                                                            LinkedHashMap<Integer,String> map=new LinkedHashMap<Integer,String>();
                                                            for(int i=0;i<complexity.size();i++)
                                                            {
                                                                map.put(i, "P"+(i+1));
                                                            }



                                                            filter(complexity, priorities, indexes);
                                                            //System.out.println("c "+indexes);
                                                            int size=0;
                                                            for(Object obj:indexes)
                                                            {
                                                                ArrayList a1=(ArrayList) obj;
                                                                size=size+a1.size();
                                                            }
                                                            int i=1;
                                                            for(Object ob:indexes)
                                                            {

                                                                ArrayList a=(ArrayList) ob;
                                                                if(a.size()==0)
                                                                {
                                                                    i=i-1;
                                                                }
                                                                for(Object str:a)
                                                                {


                                                                    map.put(Integer.parseInt(str.toString()),"P"+i);



                                                                }
                                                                i++;

                                                            }


                                                            return map;
                                                        } %>


                                                        <%!
                                                            public static void filter(List<String> category,ArrayList priorities,ArrayList indexes){
                                                                for(Object ob:priorities)
                                                                {
                                                                    ArrayList rindex=new ArrayList();
                                                                    for(int i=0; i<category.size(); i++){
                                                                        if(category.get(i).equalsIgnoreCase(ob.toString()))
                                                                        {
                                                                            String id = Integer.toString(i);
                                                                            rindex.add(id);
                                                                        }
                                                                    }
                                                                    indexes.add(rindex);
                                                                }
                                                            }


                                                        %>

                                                        <%
                                                            ArrayList appname=new ArrayList();
                                                            ArrayList complexity=new ArrayList();
                                                            ArrayList screen=new ArrayList();
                                                            ArrayList priority=new ArrayList();
                                                            while(rs1.next()){
                                                                appname.add(rs1.getString("appname"));
                                                                complexity.add(rs1.getString("complexity"));
                                                                screen.add(rs1.getString("est_scrn"));

                                                                i++;
                                                            }

                                                            LinkedHashMap priorityMap= SettingPriority(complexity);

                                                            String x[]=new String[appname.size()];
                                                            for(int j=0;j<appname.size();j++){
                                                                x[j]=(String)priorityMap.get(j);
                                                            }
                                                            Arrays.sort(x);
                                                            System.out.println("the elements are");
                                                            Iterator itr=projectPriorities.iterator();
                                                            int j=0;
                                                    		while(itr.hasNext()){ 
                                                    			ProjectComplexity c = (ProjectComplexity)itr.next();
                                                    			
                                                            //  System.out.println("appname.size  "+appname.size());
                                                            
                                                        %>
                                                        <tr>

                                                            <td class="edit_row" style="cursor:pointer" id="11">
           <span class="test">
           <input type="text" class="act" id="project_name<%=j%>" name="project_name<%=j%>" value="<%=c.getAppName() %>" readonly="readonly"></span>
                                                            </td>
                                                            <td class="row_s" style="cursor:pointer" id="22"><span class="test"><input type="text" class="act" id="complexity<%=j%>" name="complexity<%=j%>" value="<%=c.getComplexity() %>" readonly="readonly"></span></td>
                                                            <td class="row_s" style="cursor:pointer" id="22"><span class="test"><input type="text" class="act" id="est_scrn<%=j%>" name="est_scrn<%=j%>" value="<%=c.getEst() %>" readonly="readonly"></span></td>
                                                            <td class="row_d" id="55">

                                                                <span class="test"><input type="text"   class="priority"  name="priority<%=j %>" id="priority<%=j %>" value="<%=c.getPtext() %>"></span>
                                                            </td>

                                                            <%
                                                            		j++;
                                                                        }
                                                            %>
                                                            <input type="text" id="appname_size" name="appname_size" style="display:none" value="<%=appname.size() %>"/>


                                                        </tr>


                                                        </tbody>

                                                    </table>

                                                    <script>
                                                        // JavaScript script from: http://coursesweb.net/javascript/

                                                        // gets all the .edit_row cells, registers click to each one
                                                        var edit_row = document.querySelectorAll('#myTable .edit_row');
                                                        for(var i=0; i<edit_row.length; i++) {
                                                            edit_row[i].addEventListener('click', function(e){
                                                                // get parent row, add data from its cells in form fields
                                                                var tr_parent = this.parentNode;
                                                                document.getElementById('proj_name').value = tr_parent.querySelector('.edit_row').innerHTML;
                                                                document.getElementById('complexity').value = tr_parent.querySelector('.row_s').innerHTML;
                                                                document.getElementById('est_scrn').value = tr_parent.querySelector('.row_t').innerHTML;
                                                                //document.getElementById('est_cst').value = tr_parent.querySelector('.row_d').innerHTML;
                                                            }, false);
                                                        }

                                                    </script>

                                                    <div class="buttongroup">
                                                        <button type="submit" class="btn btn-primary pull-right" onclick="call()">Save & Review</button>

                                                        <a href="AppEmphasize_CostCalculation.jsp" class="btn btn-default" class="btn pull-right">Back & Edit</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>




                                    </div>
                                </div>














                                <% }

                                %>

                            </div>
                        </div>
                            <%

}}
catch(Exception e){}
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
            $(document).ready(function() {
                $(".lis").click(function() {
                    $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
                    $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
                });
                $(".gr").click(function() {
                    $(".cbp-vm-switcher").addClass("cbp-vm-view-grid");
                    $(".cbp-vm-switcher").removeClass("cbp-vm-view-list");
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

<!DOCTYPE html>
<%@page import="java.util.*" %>
<%@page import="bean.*" %>
<html lang="en">
<head>
    <title>AppEmphasize Preview</title>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <meta name="keywords" content="jQuery Tree, Tree Widget, TreeView"/>
    <meta name="description" content="The jqxTree displays a hierarchical collection of items. You
        can populate it from 'UL' or by using its 'source' property."/>

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

    <!-- ========== jspdf pdf ========== -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>
    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>


    <script src="js/multiplepages.js"></script>

    <style type="text/css">

        body{



            background:#f5f5f5;
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

        footer{

            margin:20px;



        }

        #container{

            border:1px solid black;
            height:900px;
            margin:0 auto;

            background-color:#fff;
        }


        #Projectheader{
            font-size:25px;
            text-align:center;
            color:DodgerBlue;
        }


        .table {
            width: 100%;
            max-width: 100%;
            margin-bottom: 270px;
        }

        .button{

            margin-bottom:10px;
            margin-left: 125px;
            margin-right: 132px;

        }

        .btn {
            display: inline-block;
            margin-left:10px;
            font-weight: 400;
            text-align: center;

        }

        button.close {
            padding: 0;
            cursor: pointer;
            background: transparent;
            border: 0;
            -webkit-appearance: none;
        }

        #panels1{

            padding:20px;


        }

    </style>









    <script>
        function call() {
            var f = document.loginForm;
            f.method = "post";
            f.action = "AppEmphasize_PrioritizedApplications.jsp";
            f.submit();
        }
    </script>


</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed AppEmphazize Preview JSP PAGE-----[INFO]"); %>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%@ page import="java.text.NumberFormat" %>

<%
    double ans = 0.0;
    try {
        int total;
        HttpSession details = request.getSession();
        String roles = (String) details.getAttribute("role");
        String det = (String) session.getAttribute("theName");
        Class.forName("org.gjt.mm.mysql.Driver").newInstance();
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool", "root", "password123");

        String query3 = "select * from AppEmphazize_ProjectDetails where id = " + det;
        String name = (String) session.getAttribute("newname");

        System.out.println("testinpreview" + name);
        Statement st1 = conn.createStatement();
        Statement st2 = conn.createStatement();
        Statement st3 = conn.createStatement();
        ResultSet rs3 = st3.executeQuery(query3);
        String query1 = "SELECT * from AppEmphazize_ApplicationInfo where prjname='" + name + "' and complexity is not null";
        ResultSet rs1 = st1.executeQuery(query1);
        
        //Order Prjects based on Priority
        	String appName = "";
			String priorty = "";
			String est = "";
			String complex = "";
			String ptext ="";
			int pr=0;
			ArrayList projectPriorities = new ArrayList();
			while(rs1.next()) {
				appName = rs1.getString("appname");
				complex = rs1.getString("complexity");
				est = rs1.getString("est_scrn");
				if(complex.equals("High")) {
					priorty="P1";
					pr =1;
				}
				if(complex.equals("Medium to High")) {
					priorty="P2";
					pr =2;
				}
				if(complex.equals("Medium")) {
					priorty="P3";
					pr =3;
				}
				if(complex.equals("Low to Medium")) {
					priorty="P4";
					pr=4;
				}
				if(complex.equals("Low")) {
					priorty="P5";
					pr =5;
				}
				projectPriorities.add(new ProjectComplexity(appName, complex, est, pr, priorty));
			}
			Collections.sort(projectPriorities, new PriorityComparator());

        String query2 = "select count(prjname) As total from AppEmphazize_ApplicationInfo where prjname='" + name + "'";
        ResultSet rs2 = st2.executeQuery(query2);
        {
%>

<%
    if (rs2.next()) {
        total = rs2.getInt("total");
%>
<form class="form-signin" name="loginForm" id="loginForm" method="post">

    <div class="main-wrapper">

        <!-- ========== TOP NAVBAR ========== -->
        <nav class="navbar top-navbar bg-white box-shadow">
            <div class="container-fluid">
                <%if (rs3.next()) {%>


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

                            <li><a href="#"><span id="nav_userid">&nbsp;</span>logged in as &nbsp;<span
                                    id='nav_role'></span></a></li>
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
                                <li class="has-children ">
                                    <a href=""><i class="fa fa-archive"></i> <span>Plan and pirority</span> <i class="fa fa-angle-right arrow"></i></a>
                                    <ul class="child-nav"  id="myDIV">
                                        <li class="btn"><a href="AppEmphasize_EditProject.jsp" > <span  class="activ-pro">Project Information</span></a></li>
                                        <li ><a href="AppEmphasize_Application.jsp" > <span>Application Information</span></a></li>
                                        <li ><a href="AppEmphasize_CostCalculation.jsp" > <span>Application Complexity</span></a></li>
                                        <li ><a href="AppEmphasize_PrioritizedApplications.jsp"> <span>Prioritized Applications</span></a></li>
                                        <li ><a href="AppEmphasize_Preview.jsp"> <span>Review Page</span></a></li>
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
                                        <li><a href="Applications.jsp" > <span>Archive Requirements</span></a></li>
                                        <li><a href="Decomm_Requirements_Applications.jsp" > <span>Decomm Requirements</span></a></li>
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
                            <h2 class="title">Final & Review</h2>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-8">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                 <li><a href="AppEmphasize_EditProject.jsp">Project Info</a></li>
                                   <li><a href="AppEmphasize_Application.jsp">Application Info</a></li>
                                   <li><a href="AppEmphasize_CostCalculation.jsp">Application Complexity</a></li>
                                    <li><a href="AppEmphasize_PrioritizedApplications.jsp">Application Prioritized</a></li>
                                    <li><a href="AppEmphasize_PrioritizedApplications.jsp">Final & Review Page</a></li>
                            </ul>
                        </div>



                    </div>
                    <!-- /.row -->
                </div>


                <section class="section">

                    <div class="main">
                        <div class="row">
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

                                    <div class="col-xs-3 bs-wizard-step complete"><!-- active -->
                                        <div class="text-center bs-wizard-stepnum">Prioritized Applications</div>
                                        <div class="progress"><div class="progress-bar"></div></div>
                                        <a href="#" class="bs-wizard-dot"></a>
                                        <div class="bs-wizard-info text-center"></div>
                                    </div>

                                    <div class="col-xs-3 bs-wizard-step active"><!-- active -->
                                        <div class="text-center bs-wizard-stepnum">Final</div>
                                        <div class="progress"><div class="progress-bar"></div></div>
                                        <a href="#" class="bs-wizard-dot"></a>
                                        <div class="bs-wizard-info text-center"> </div>
                                    </div>
                                </div>


                            </div>
                        </div>

                        <div class="button">
                            <tr>
                                <button  type="button" id="exportview" class="btn btn-primary pull-right" ><span
                                        class="glyphicon glyphicon-download-alt "></span> Export PDF
                                </button>
                                <button type="button" id="button_id" name="button_id"
                                        class="btn btn-primary  pull-right">
                                    Request Sign
                                </button><a href="AppEmphasize_PrioritizedApplications.jsp" class="btn btn-primary"
                                            class="btn pull-right"><span
                                    class="glyphicon glyphicon-download-edit"></span>Edit</a>
                            </tr>


                        </div>
                        <div class="container" id="container">
                            <h4 id="Projectheader">Project Plan</h4>
                            <br>
                            <div class="pdf" id="pdf">
                                <h4>Project Information</h4>
                                <br>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Project Name </label>
                                            <div class="col-sm-9">
                                                <p>CGEN1</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">No of Application </label>
                                            <div class="col-sm-9">
                                                <p>3</p>
                                            </div>
                                        </div>

                                    </div>
                                </div>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Project Start Date </label>
                                            <div class="col-sm-9">
                                                <p>5/1/2019</p>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="col-md-6">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Project End Date </label>
                                            <div class="col-sm-9">
                                                <p>5/31/2019</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>


                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group row">
                                            <label class="col-sm-3 col-form-label">Description </label>
                                            <div class="col-sm-9">
                                                <p>Archive Application</p>
                                            </div>
                                        </div>
                                    </div>



                                </div>
                            </div>

                            <br>
                            <h4>Application Information</h4>
                            <br>
                            <div class="row" id="panels1">

                                <div class="panel panel-default">

                                    <div class="table-responsive"  id="table-scroll">


                                        <table class=" table table-striped" id="myTable">





                                            <thead>

                                            <tr>
                                                <th>Application Name</th>
                                                <th>Complexity</th>
                                                <th>Estimated Number of Screens</th>
                                                <th>Priorities</th>

                                            </tr>


                                            </thead>

                                            <tbody>
                                            <%int i = 0; %>

                                            <%! LinkedHashMap<Integer, String> SettingPriority(ArrayList<String> complexity) {

                                                ArrayList<String> indexes = new ArrayList<String>();
                                                ArrayList<String> priorities = new ArrayList<String>();
                                                priorities.add("Low");
                                                priorities.add("Low to Medium");
                                                priorities.add("Medium");
                                                priorities.add("Medium to High");
                                                priorities.add("High");


                                                LinkedHashMap<Integer, String> map = new LinkedHashMap<Integer, String>();
                                                for (int i = 0; i < complexity.size(); i++) {
                                                    map.put(i, "P" + (i + 1));
                                                }


                                                filter(complexity, priorities, indexes);
                                                System.out.println("c" + indexes);
                                                int size = 0;
                                                for (Object obj : indexes) {
                                                    ArrayList a1 = (ArrayList) obj;
                                                    size = size + a1.size();
                                                }
                                                int i = 1;
                                                for (Object ob : indexes) {

                                                    ArrayList a = (ArrayList) ob;
                                                    if (a.size() == 0) {
                                                        i = i - 1;
                                                    }
                                                    for (Object str : a) {


                                                        map.put(Integer.parseInt(str.toString()), "P" + i);


                                                    }
                                                    i++;

                                                }


                                                return map;
                                            } %>


                                            <%!
                                                public static void filter(List<String> category, ArrayList priorities, ArrayList indexes) {
                                                    for (Object ob : priorities) {
                                                        ArrayList rindex = new ArrayList();
                                                        for (int i = 0; i < category.size(); i++) {
                                                            if (category.get(i).equalsIgnoreCase(ob.toString())) {
                                                                String id = Integer.toString(i);
                                                                rindex.add(id);
                                                            }
                                                        }
                                                        indexes.add(rindex);
                                                    }
                                                }


                                            %>

                                            <%
                                                ArrayList appname = new ArrayList();
                                                ArrayList complexity = new ArrayList();
                                                ArrayList screen = new ArrayList();
                                                ArrayList priority = new ArrayList();
                                                while (rs1.next()) {
                                                    appname.add(rs1.getString("appname"));
                                                    complexity.add(rs1.getString("complexity"));
                                                    screen.add(rs1.getString("est_scrn"));

                                                    i++;
                                                }

                                                LinkedHashMap priorityMap = SettingPriority(complexity);
                                                String x[] = new String[appname.size()];
                                                for (int j = 0; j < appname.size(); j++) {
                                                    x[j] = (String) priorityMap.get(j);
                                                }
                                                Arrays.sort(x);

                                                Iterator itr=projectPriorities.iterator();
                                                int j=0;
                                        		while(itr.hasNext()){ 
                                        			ProjectComplexity c = (ProjectComplexity)itr.next();
                                            %>
                                            <tr>

                                                <td class="edit_row" style="cursor:pointer" id="11"><span
                                                        class="test"><%=c.getAppName() %></span></td>
                                                <td class="row_s" style="cursor:pointer" id="22"><span
                                                        class="test"><%=c.getComplexity() %></span></td>
                                                <td class="row_s" style="cursor:pointer" id="22"><span
                                                        class="test"><%=c.getEst() %></span></td>
                                                <td class="row_d" id="55">

                                                    <span class="test"><%=c.getPtext() %></span>
                                                </td>

                                                <%

                                                    } %>


                                            </tr>


                                            </tbody>

                                        </table>



                                    </div>
                                </div>



                                <% }
                                }
                                %>

                            </div>





                        </div>







                        <%
                                }
                            } catch (Exception e) {
                            }
                        %>





                        <div class="container">

                            <!-- Button trigger modal -->
                            <!-- Modal bootstrap -->

                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"  aria-labelledby="myModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">Users List</h5>
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                <span aria-hidden="true">&times;</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="modal-body mx-3">
                                                <span><input type="checkbox" name="signorder" id="signorder" />&nbsp;Set signing order</span>
                                            </div>
                                            <div class="modal-body mx-3">
                                                <div class="md-form mb-5">

                                                    <input  id="search_bar" type="text"
                                                            placeholder="Search User"
                                                            name="search" class="form-control"/>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                            </button>
                                            <button type="button" class="btn btn-primary" name="email_id" id="email_id"
                                                    data-dismiss="modal">Send Email
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!-- End Modal bootstrap -->
                            <!-- Modal -->
                            <!-- div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                      aria-labelledby="myModalLabel"
                                      aria-hidden="true">
                                     <div class="modal-dialog" style="width:1000px">
                                         <div class="modal-content">
                                             <div class="modal-header">
                                                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                                         aria-hidden="true">&times;</span></button>
                                                 <h4 class="modal-title" id="myModalLabel" style="text-align: center"><b>List
                                                     of
                                                     Users</b></h4>
                                                 <input type="checkbox" name="signorder" id="signorder" >
                                                 <p class="ex1"><b>Set signing order</b></p>
                                                 <div class="searchbox">
                                                 <input class="searchbox" id="search_bar" type="text"
                                                        placeholder="Search User"
                                                        name="search"/>
                                                 </div>
                                             </div>
                                             <div class="modal-body" style="width: 500px" id="user_list_div_id_name">

                                             </div>
                                             <div class="modal-footer" style="height: 80px;padding: 20px">
                                                 <button type="button" class="btn btn-default" data-dismiss="modal">Close
                                                 </button>
                                                 <button type="button" class="btn btn-primary" name="email_id" id="email_id"
                                                         data-dismiss="modal">Send Email
                                                 </button>
                                             </div>
                                         </div>
                                     </div>

                                 </div -->


                        </div>


                    </div>

                </section>

</form>






</div>
<!-- /.content-container -->
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
<script src="//cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>




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

<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>


<!-- ========== THEME JS ========== -->




<!-- ========== THEME JS ========== -->

<script type="application/javascript">
    $(document).ready(function () {
        $.ajax({
            url: "Intake_Review_Data",
            type: 'post',
            dataType: 'json',
            success: function (data) {

                var userlistdiv = $('#table1')
                console.log("Request:", data);
                userlistdiv.empty();
                var Application = '';
                var Retention = '';
                var Data_Management = '';
                var Requirements = '';
                var Technical_Application = '';
                var Technical_Retention = '';
                var Technical_Classification = '';
                var screen_requirements = '';
                var archive_requirements = '';

                $.each(data, function (key, value) {
                    var array = value.split("/");

                    var category = array[1];
                    if (category == 'P1') {
                        Application = Application + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P2') {
                        Retention = Retention + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P3') {
                        Data_Management = Data_Management + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P4') {
                        Requirements = Requirements + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P5') {
                        Technical_Application = Technical_Application + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P6') {
                        Technical_Retention = Technical_Retention + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P7') {
                        Technical_Classification = Technical_Classification + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }

                    if (category == 'P8') {
                        screen_requirements = screen_requirements + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                    if (category == 'P9') {
                        archive_requirements = archive_requirements + '<tr class="edit_row">\n' +
                            '<pre style="font-family:verdana;font-size:100%;">' + key + ' : &nbsp;' + '&nbsp;' + array[0] +
                            '</pre>\n' +
                            '</tr>'
                    }
                });
                $('#Intake_Business_Application').append(createTable(Application));
                $('#Intake_Business_Legal').append(createTable(Retention));
                $('#Intake_Business_Archive').append(createTable(Data_Management));
                $('#System_Requirements').append(createTable(Requirements));

                $('#Intake_Technical_Application').append(createTable(Technical_Application));
                $('#Intake_Technical_Legal').append(createTable(Technical_Retention));
                $('#Intake_Technical_Privacy').append(createTable(Technical_Classification));

                $('#Screen_Requirements').append(createTable(screen_requirements));
                $('#Archive_Requirements').append(createTable(archive_requirements));
            },
            error: function (error) {
                alert('error');
            }
        });
    });


    function createTable(rows) {
        return '<table width=\'0\' border=\'0\' align=\'left\'\n' +
            'cellpadding=\'0\'\n' +
            'cellspacing=\'0\'>\n' +
            '\n' +
            '<tbody> ' + rows + '  </tbody>\n' +
            '</table>';
    }


    $(document).ready(function () {
        var value;
        $('#button_id').click(function () {
            $('#myModal').modal('show');
            $.ajax({
                url: 'List_Users',
                type: 'post',
                dataType: 'json',
                success: function (response) {
                    var userlistdiv = $('#user_list_div_id_name')
                    console.log("Request:", response);
                    userlistdiv.empty();
                    var usersList = '<div class="checkbox"> <ul id="sortable" style="cursor: pointer">';
                    console.log('1->', usersList)
                    $.each(response, function (key, value) {
                        //userlistdiv.append('<input  type="checkbox"   value="' + key + '">' + value)
                        usersList += '<li><input type="checkbox" style="margin-left: -353px" value="' + key + '" >' + value + '</li>';
                    });
                    usersList += '</ul>' + '</div>';
                    console.log('->', usersList)
                    userlistdiv.append(usersList)
                    userlistdiv.append('')
                    $("#sortable").sortable({

                    });
                    $("#sortable").sortable("disable");
                }
            });


        });
    });
    $(document).ready(function () {

        $('#email_id').click(function () {
            var selectedEmail = [];
            $('#user_list_div_id_name input:checked').each(function () {
                selectedEmail.push($(this).attr('value'));
            });
            console.log("hm", selectedEmail);
            if (selectedEmail.length == 0) {
                BootstrapDialog.show({
                    title: 'INFORMATION',
                    message: 'Please Select any User',
                    buttons: [{
                        id: 'btn-ok',
                        icon: 'glyphicon glyphicon-check',
                        label: 'OK',
                        cssClass: 'btn-primary',
                        data: {
                            js: 'btn-confirm',
                            'user-id': '3'
                        },
                        autospin: false,
                        action: function (dialogRef) {
                            dialogRef.close();
                        }
                    }]


                });
                return false;
            }
            else {
                BootstrapDialog.alert(selectedEmail.length + " User selected");
            }

            console.log("emails", selectedEmail);
            var heads = [];
            var data = [];
            $("#myTable").find("th").each(function () {
                heads.push($(this).text().trim());
            });
            var $headers = $("#myTable").find("th");
            $("#myTable").find("tbody tr").each(function (index) {
                $cells = $(this).find("td");
                data[index] = {};
                $cells.each(function (cellIndex) {
                    data[index][$($headers[cellIndex]).html()] = $(this).text().trim();
                });
            });
            var table_data={"mydata":{header: heads, data: data},"selectedEmail":selectedEmail};
            $.ajax({
                url: 'Priority_Review_Email',
                type: 'post',
                contentType: 'application/json; charset=utf-8',
                headers: {"signorder": $('#signorder').is(':checked')},
                dataType: 'json',
                data: JSON.stringify(table_data),
                success: function (data) {

                }
            });


        });
    });
    $(document).ready(function () {

        $('#signorder').click(function () {
            var flag = $('#signorder').is(':checked');
            if (flag)
            {
                $("#sortable").sortable("enable");
            }
            else {
                $("#sortable").sortable("disable");

            }
        })
    });
    /* function disableDraggable(elements){
         for (var i = 0; i < elements.length; i++) {
             $("#" + elements[i]).addClass("disable-sort");
             $("#" + elements[i]).fadeTo("fast", 0.5);
         }
     }*/
    $(document).ready(function () {
        $('#search_bar').keyup(function () {
            filter(this);
        });
    });

    function filter(element) {
        var value = $(element).val();
        $("#sortable > li").each(function () {
            if ($(this).text().indexOf(value) > -1) {
                $(this).show();
            } else {
                $(this).hide();
            }
        });
    }
</script>
<script>

    function ggg(id) {
        for (i = 0; i < 4; i++) {
            alert(id);


        }
        document.getElementById("5").disabled = false;
    }
</script>
<script>
    // JavaScript script from: http://coursesweb.net/javascript/
    // gets all the .edit_row cells, registers click to each one
    var edit_row = document.querySelectorAll('#myTable .edit_row');
    for (var i = 0; i < edit_row.length; i++) {
        edit_row[i].addEventListener('click', function (e) {
            // get parent row, add data from its cells in form fields
            var tr_parent = this.parentNode;
            document.getElementById('proj_name').value = tr_parent.querySelector('.edit_row').innerHTML;
            document.getElementById('complexity').value = tr_parent.querySelector('.row_s').innerHTML;
            document.getElementById('est_db_size').value = tr_parent.querySelector('.row_t').innerHTML;
            document.getElementById('est_cst').value = tr_parent.querySelector('.row_d').innerHTML;
        }, false);
    }
</script>
<script>
    var pdf = new jsPDF('p', 'pt', 'a4', true);
    pdf.setFontSize(20);
    pdf.setFontType("italic");

    pdf.text(100, 200, 'Application Based On Priority:');

    var header = function (doc, pageCount, options,align) {
        pdf.setFontSize(20);
        pdf.text(intestazione, options.margins.horizontal, 50,'center');
        pdf.setFontSize(options.fontSize);
    };


    var imgData = 'data:image/png;base64,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';

    pdf.setFontSize(20);
    pdf.addImage(imgData, 'JPEG', 680, 20, 150, 50);
    var specialElementHandlers = {
        '#editor': function (element, renderer) {
            return true;
        }
    };
    var margins = {
        top: 100,
        bottom: 20,
        right: 20,
        left: 80,
        width: 100
    };


    $('#exportview').click(function () {
        var heads = [];
        var data = [];
        $("#myTable").find("th").each(function () {
            heads.push($(this).text().trim());
        });
        var $headers = $("#myTable").find("th");
        $("#myTable").find("tbody tr").each(function (index) {
            $cells = $(this).find("td");
            data[index] = {};
            $cells.each(function (cellIndex) {
                data[index][$($headers[cellIndex]).html()] = $(this).text().trim();
            });
        });


        var input = $("<input>")
            .attr("type", "hidden")
            .attr("name", "mydata").val(JSON.stringify({header: heads, data: data}));
        $('#loginForm').append(input);
        $("#loginForm").attr('action', './priorityreview');
        $("#loginForm").attr('target', '_blank');
        $("#loginForm").submit();
        /*pdf.fromHTML($('#table-scroll').get(0),margins.left,margins.top, {
        'width': margins.width,                                                  'elementHandlers': specialElementHandlers
        });var d = new Date().toISOString().slice(0, 19);
        filename = 'ApplicationPriority' +"_"+ d + '.pdf';
        pdf.save(filename);*/
    });
</script>


</form>
</body>
</html>

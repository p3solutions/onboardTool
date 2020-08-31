<html lang="en">
<head>
    <title>Project Information</title>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


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
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script type="text/javascript" src="js_in_pages/edit_project.js"></script>
    <script type="text/javascript" src="js_in_pages/tree.js"></script>
    <link rel="stylesheet" href="js_in_pages/edit_project.css" type="text/css" />


</head>
<style>

    body{

        background:#F6F8FA;

    }

    #sitetitle1{

        color:DodgerBlue;
        text-align:center;
        float:right;

    }


    #return-to-top {
        position: fixed;
        bottom: 20px;
        right: 20px;
         display: block;
        text-decoration: none;
        display: none;
        outline: none;
        background: rgb(0, 0, 0);
        background: rgba(0, 0, 0, 0.7);
          }
    #return-to-top i {
        color: #fff;
        margin: 0px;
        position: relative;
        left: -10px;
         top: -4px;
        font-size: 25px;
        -webkit-transition: all 0.3s ease;
        -moz-transition: all 0.3s ease;
        -ms-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
        border: none;
    }
    
    #return-to-top:hover i {
        color: #fff;
        top: 2px;
        position: relative;
        border: none;
    }
    #top{
       position: fixed;
        bottom: 20px;
        right: 20px;
        background: #000;
        width: 50px;
        height: 50px;
        display: block;
        text-decoration: none;
        -webkit-border-radius: 35px;
        -moz-border-radius: 35px;
        border-radius: 40px;
        outline: none;
}
    }
    top:hover i {
        color: #fff;
        top: 10px;
        position: relative;
        border-radius: 35px;
    }
    .example-two {
        border-radius: 10px;
        border: 3px solid #e3e3e3;
    }
    /*left_side_bar_css*/
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
    /*left_side_bar_css*/


    /* Style the active class, and buttons on mouse-over */




</style>

<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    System.out.println("[INFO]-----"+formatter.format(date1)+"-----Accessed AppEmphazize_EditProject JSP PAGE-----[INFO]");  %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
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
%>
<%

    HttpSession details=request.getSession();
    String roles=(String)details.getAttribute("role");
    String info=(String)details.getAttribute("app_emp");
    String username=(String)details.getAttribute("u_Name");
    String Project_Name=(String)details.getAttribute("nameofproject");
//System.out.println("the prjname is "+Project_Name);

    try {
        String det=(String)session.getAttribute("theName");
        DBconnection d=new DBconnection();
        Connection conn = (Connection)d.getConnection();
        String visit_query="select * from visits";
        Statement visit_st = conn.createStatement();
        ResultSet visit_rs = visit_st.executeQuery(visit_query);
        int flag=1,knt=0;
        Date date = new Date();
        SimpleDateFormat ft,ft1;
        ft=new SimpleDateFormat ("yyyy-MM-dd");
        ft1=new SimpleDateFormat ("hh:mm:ss");
        String strDate=ft.format(date);
        String strTime=ft1.format(date);
        while(visit_rs.next())
        {
            if(visit_rs.getString(6)!=null)
            {
                if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("App Emphasize Module") && visit_rs.getString(6).equals(Project_Name) )
                {
                    Statement stmtt = conn.createStatement();
                    String queryy = "update visits set count=count+1,time='"+strTime+"' where uname='"+username+"' and module='App Emphasize Module' and Projects='"+Project_Name+"' and date ='"+strDate+"'";
                    int count = stmtt.executeUpdate(queryy);
                    flag=0;
                    break;
                }
            }

        }
//System.out.println("the flag value is "+flag);
        if(flag==1)
        {
            String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
                    + " values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = conn.prepareStatement(ins_query);
            preparedStmt.setString (1, username);
            preparedStmt.setString (2, strDate);
            preparedStmt.setString(3, "App Emphasize Module");
            preparedStmt.setString(4, "1");
            preparedStmt.setString(5, strTime);
            preparedStmt.setString(6, Project_Name);
            preparedStmt.setString(7, "");

            // execute the preparedstatement
            preparedStmt.execute();
        }
        String query = "select * from AppEmphazize_ProjectDetails";
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery(query);
        String query3 = "select * from AppEmphazize_ProjectDetails where id = "+det;
        Statement st3 = conn.createStatement();
        ResultSet rs3 = st3.executeQuery(query3);
        if(rs.next()){
%>


<form class="form-signin" name="loginForm">

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

                    <% if(rs3.next()){
                        details.setAttribute("appno",rs3.getString("appno"));
                        details.setAttribute("projectname",rs3.getString("projectname"));
                    %>



                    <%
                            String q2="select * from ArchiveExecution_Details where level=1 and projects='"+rs3.getString("projectname")+"'order by seq_num";
                            Statement s2 = conn.createStatement();
                            ResultSet rss = s2.executeQuery(q2);
                            while(rss.next())
                            {
                                session.setAttribute(rss.getString(3),rss.getString(15));
                            }

                        } %>


                    <div class="collapse navbar-collapse" id="navbar-collapse-1">

                        <!-- /.nav navbar-nav -->
                        <ul class="nav navbar-nav navbar-right">
                            <a class="navbar-brand" href="Project_List.jsp" id="sitetitle1">PROJECT NAME -<%=rs3.getString("projectname") %></a>
                            <%
                                String uname=(String)details.getAttribute("username");
                                String role=(String)details.getAttribute("role");%>
                            <li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
                            <li> <a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a> </li>
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

                <div class="main-page">
 <div class="container-fluid">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h2 class="title">Project Information</h2>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-6">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                 <li><a href="AppEmphasize_EditProject.jsp">Project Info</a></li>

                            </ul>
                        </div>



                    </div>
                    <!-- /.row -->
                </div>
                    <section class="design-process-section" id="process-tab">

                        <div class="row">
                            <div class="container">
                                <a href="javascript:" id="return-to-top"><button id="top" onclick="scroll()"><i class="fa fa-chevron-circle-up" aria-hidden="true"></i></button></a>
								

                                <%
                                    String initiate=(String)session.getAttribute("Ideation and Initiate");
                                    String plan=(String)session.getAttribute("Plan");
                                    String execute=(String)session.getAttribute("Execute");
                                    String hypercare=(String)session.getAttribute("Closure");
                                    if(initiate == null)
                                        initiate="0";
                                    if(plan == null)
                                        plan="0";
                                    if(execute == null)
                                        execute="0";
                                    if(hypercare == null)
                                        hypercare="0";
                                %>
                                <br>

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
                                </div><jsp:include page="progress_details.jsp" >
                                <jsp:param name="Initiate" value="<%=initiate %>"/>
                                <jsp:param name="Plan" value="<%=plan %>"/>
                                <jsp:param name="Execute" value="<%=execute %>"/>
                                <jsp:param name="Hypercare" value="<%=hypercare %>"/>
                            </jsp:include>

                                <div class="container">


                                    <div class="row bs-wizard" style="border-bottom:0;">

                                        <div class="col-xs-3 bs-wizard-step active">
                                            <div class="text-center bs-wizard-stepnum">Project Information</div>
                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot example-two "></a>
                                            <div class="bs-wizard-info text-center"></div>
                                        </div>


                                        <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                                            <div class="text-center bs-wizard-stepnum">Cost Complexity Calculation</div>

                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot example-two"></a>
                                            <div class="bs-wizard-info text-center"></div>
                                        </div>


                                        <div class="col-xs-3 bs-wizard-step disabled"><!-- active -->
                                            <div class="text-center bs-wizard-stepnum">Prioritized Applications</div>
                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot example-two"></a>
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
                            </div>

                            <div class="row">

                                <div class="container">


                                    <div class="panel-group" id="panels1">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title"> <a  data-parent="#panels1" > Project Information  </a> </h4>
                                            </div>

                                            <div id="collapse2" class="panel-collapse">
                                                <div class="panel-body text-left">

                                                    <div class="form-group">
                                                        <label control-label" for="pid" hidden>Project ID&nbsp;</label>
                                                        <input type="hidden"  class="form-control" id="pid"  placeholder="Project ID" name="pid" value="<%=rs3.getString("id")%>" >
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label" for="projectname"><div class="required"> Project Name </div></label>
                                                        <input type="text" class="form-control" size="35" id="projectname" placeholder="Project Name" name="projectname" value="<%=rs3.getString("projectname")%>" required>
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label" for="descr"> <div class="required">Description</div></label>
                                                        <input type="text" class="form-control" id="descr" placeholder="Description" name="descr"  value="<%=rs3.getString("descr")%>" required>


                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label ">No of Applications</label>
                                                        <input placeholder="No of Applications" id="appno" name="appno" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="number" value="<%=rs3.getString("appno")%>">
                                                    </div>

                                                    <div class="form-group">

                                                        <label class="control-label "> Initiate Start Date<span class="text-danger">*</span></label>
                                                        <input placeholder="mm/dd/yyyy" id="Intdate" name="Intdate" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" type="text" value="<%=rs3.getString("Intdate")%>"required>

                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label ">Plan Start Date</label>
                                                        <input placeholder="mm/dd/yyyy" id="Plandate" name="Plandate" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" type="text" value="<%=rs3.getString("Plandate")%>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label ">Execution Start Date</label>
                                                        <input placeholder="mm/dd/yyyy" id="Execdate" name="Execdate" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" type="text" value="<%=rs3.getString("Execdate")%>">
                                                    </div>

                                                    <div class="form-group">
                                                        <label class="control-label ">Hypercare Start Date</label>
                                                        <input placeholder="mm/dd/yyyy" id="Hyperdate" name="Hyperdate" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" type="text" value="<%=rs3.getString("Hyperdate")%>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label "><div class="required">Project End Date</div></label>
                                                        <input placeholder="mm/dd/yyyy" id="Enddate" name="Enddate" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" type="text" value="<%=rs3.getString("Enddate")%>" required>
                                                    </div>
                                                    <input type="hidden" id="pwqej" value="<%= info %>" hidden>
                                                    <br>
                                                    <button type="button" class="btn btn-primary pull-right" id="SaveContinue">Save & Continue</button>&nbsp;

                                                </div>
                                            </div>





                                        </div>
                                    </div>


                                    <div class="row">
                                        <div class="modal" tabindex="-1" role="dialog">
                                            <div class="modal-dialog" role="document">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Modal title</h5>
                                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                                            <span aria-hidden="true">&times;</span>
                                                        </button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Modal body text goes here.</p>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-primary">Save changes</button>
                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>









                                <%
}
}
catch(Exception e){}
%>

</form>
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

</div>
<!-- /.main-wrapper -->

</div>
</div>
</div>
<script>


    $(window).scroll(function() {
        if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
            $('#return-to-top').fadeIn(200);    // Fade in the arrow
        } else {
            $('#return-to-top').fadeOut(200);   // Else fade out the arrow
        }
    });
function scroll() { 
    $(window).scroll(0); 
} 


</script>
<script>
    if(document.getElementById('pwqej').value=="R")
        checkk();
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
<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
<script>
    $('#SaveContinue').click(function(){
        var int_date =$('#Intdate').val();
        var end_date =$('#Enddate').val();
        var intdate = new Date(int_date);
        var enddate = new Date(end_date);

        if(intdate.getTime() <= enddate.getTime()){
            var f = document.loginForm;
            f.method = "post";
            f.action ="EditProject";
            f.submit();
        }
            else {
            alert("Initiate Date should be lesser than Project End date");
        }
    });
    $(function($) {

        // 1st  datepicker
        $('#basicExample .time').timepicker({
            'showDuration': true,
            'timeFormat': 'g:ia'
        });

        $('#basicExample .date').datepicker({
            'format': 'd/m/yyyy',
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
</body>
</html>

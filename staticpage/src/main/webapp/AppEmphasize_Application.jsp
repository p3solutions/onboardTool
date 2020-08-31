
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Projects</title>
    <meta name="description" content="Blueprint: View Mode Switch" />
    <meta name="keywords" content="view mode, switch, css, style, grid, list, template" />
    <script type="text/javascript" src="js_in_pages/application.js"></script>

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
    <link rel="stylesheet" href="js_in_pages/application.css" type="text/css" />
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

</head>

<style>


    #sitetitle1{

        color:DodgerBlue;
        text-align:center;
        float:right;

    }

    .example-two {
        border-radius: 10px;
        border: 3px solid #e3e3e3;
    }

         /* Style the buttons */
     .btn {
         border: none;
         outline: none;
         padding: 3px 14px;
         background-color: #3697e8;
         cursor: pointer;

     }
    .activ-pro{    font-size: 16px;
        margin-left: -13px;
        margin-right: 93px;}
    .active, .btn:hover {

        color: white;
    }

    /* Style the active class, and buttons on mouse-over */



</style>

<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed AppEmphazize_Application JSP PAGE-----[INFO]");  %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%@ page import="java.util.ArrayList" %>
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
    int sumcount=0;
    Statement st1;
    try {
        HttpSession details=request.getSession();
        String Role_info=(String)details.getAttribute("app_emp");
        String Project_Id=(String)session.getAttribute("theName");
        String Project_name="";
        String Application=(String)details.getAttribute("applications");
        String Project_Name=(String)details.getAttribute("projects");
        DBconnection d=new DBconnection();
        Connection con = (Connection)d.getConnection();

        String query3 = "select * from AppEmphazize_ProjectDetails where id = "+Project_Id;
        Statement st3 = con.createStatement();
        ResultSet rs3 = st3.executeQuery(query3);
        if(rs3.next())
            Project_name=rs3.getString("projectname");

//System.out.println("Project_name of the project is "+Project_name);
        String query1="";
        if(Project_Name.equals("all"))
            query1 = "select * from AppEmphazize_ApplicationInfo where prjname = '"+Project_name+"'";
        else
            query1 = "select * from AppEmphazize_ApplicationInfo where prjname = '"+Project_Name+"' and appname='"+Application+"'";
        st1 = con.createStatement();
        ResultSet rs1 = st1.executeQuery(query1);


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


                    <div class="collapse navbar-collapse" id="navbar-collapse-1">

                        <!-- /.nav navbar-nav -->
                        <ul class="nav navbar-nav navbar-right">
                            <a class="navbar-brand" href="Project_List.jsp" id="sitetitle1">PROJECT NAME -<%= Project_name %></a>
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
                                        <li class="btn"><a href="AppEmphasize_Application.jsp" > <span class="activ-pro">Application Information</span></a></li>
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
                                        <li><a href="Intake_Business.jsp" > <span>Archive Requirements</span></a></li>
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

                <div class="main-page">
         <div class="container-fluid">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h2 class="title">Application Information</h2>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-6">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                 <li><a href="AppEmphasize_EditProject.jsp">Project Info</a></li>
                                   <li><a href="AppEmphasize_Application.jsp">Application Info</a></li>
                                   

                            </ul>
                        </div>



                    </div>
                    <!-- /.row -->
                </div>

                    <section>

                        <div class="row">
                            <div class="container">



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

                                        <div class="col-xs-3 bs-wizard-step active">
                                            <div class="text-center bs-wizard-stepnum">Project Information</div>
                                            <div class="progress"><div class="progress-bar"></div></div>
                                            <a href="#" class="bs-wizard-dot example-two"></a>
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





                                <div class="panel-group" id="panels1">


                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" > Application Information  </a> </h4>
                                        </div>

                                        <div id="collapse2" class="panel-collapse">
                                            <div class="panel-body text-left">


                                                <div class="table-responsive" id="table-scroll">

                                                    <table class="js-dynamitable     table table-bordered" id="myTable">

                                                        <thead>

                                                        <tr>
                                                            <th> List Of Application Name  </th>

                                                        </tr>


                                                        </thead>

                                                        <tbody>
                                                        <%
                                                            while(rs1.next()){
                                                        %>
                                                        <tr>

                                                            <td class="edit_row" style="cursor:pointer"><%=rs1.getString("appname") %></td>


                                                        </tr>
                                                        <%
                                                            }
                                                        %>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <br />
                                                </form>
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group row">
                                                            <label class="col-sm-6 col-form-label">Application Name</label>
                                                            <div class="col-sm-8">
                                                                <input type="text" class="form-control" id="app_name" placeholder="Application Name" name="appname" >
                                                                <input type="hidden" class="form-control" id="formInput198" placeholder="Application Name" name="prjname" value="<%=rs3.getString("projectname") %>" >
                                                            </div>
                                                            <div class="col-sm-2">
                                                                <input type="button" id="bttn"  class="btn btn-primary btn pull-left" name ="p1" value="Add">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>

                                                <button type="button" class="btn btn-default" onclick="location.href='AppEmphasize_EditProject.jsp';">Back</button>
                                                <button type="button" class="btn btn-primary pull-right" onclick="location.href='AppEmphasize_CostCalculation.jsp';">Save & Continue...</button>



                                                <input type="text" id="role_info" value="<%= Role_info %>" style="display:none">
                                            </div>
                                        </div>
                                    </div>






<!-- /.row -->
</section>
<!-- /.section -->

</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->

<script>
    if(document.getElementById('Role_info').value=="R")
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

<%

    }
    catch(Exception e){
        e.printStackTrace();
    }
%>


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
    $('#bttn').click(function()
    {
        var app_name=$('#app_name').val();
        var check=false;
        <%try
        {
            DBconnection d=new DBconnection();
            Connection con = (Connection)d.getConnection();
            HttpSession details=request.getSession();
            String Project_Id=(String)session.getAttribute("theName");
            String query3 = "select * from AppEmphazize_ProjectDetails where id = "+Project_Id;
            String Project_name="";
        Statement st3 = con.createStatement();
        ResultSet rs3 = st3.executeQuery(query3);
        if(rs3.next())
            Project_name=rs3.getString("projectname");

            String AppnameQuery="select * from appemphazize_applicationinfo where prjname='"+Project_name+"';";
            Statement statement=con.createStatement();
            ResultSet resultSet=statement.executeQuery(AppnameQuery);
            ArrayList<String> appname = new ArrayList<String>();
            while(resultSet.next())
                {
                    appname.add(resultSet.getString("appname"));
                }
               for(int i=0;i<appname.size();i++)
                   {%>
                     if(app_name=="<%=appname.get(i)%>")
                     {
                         check=true;
                     }
                   <%}

        }
        catch(Exception e)
        {
         System.out.println("Exception------------[info]----------"+e);
        }%>
        
        if (app_name=="")        	
	alert("Application name should not be blank");
        
        else if(check==true)
        {
            alert("Application name already taken.");
        }
        else {
            var f = document.loginForm;
            f.method = "post";
            f.action = "IntsantApp?";
            f.submit();
        }
    });
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


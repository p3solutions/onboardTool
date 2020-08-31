<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>List Page</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
   
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
   
    <style type="text/css">
            .breadcrumb-div {
                background-color: #e7e7e7;
                color: #010101; }
       
			.glyphicon.glyphicon-asterisk
			{
			color:red;
			font-size:6px;
			}
 	</style>
 	
      <script>
	function calls()
	{
		    var x = document.getElementById('myDiv1');
		    if (x.style.display === 'none') {
		        x.style.display = 'block';
		    } 
		    else {
		        x.style.display = 'none';
		    }
		
	}
	</script>
	<script>
	function edit_serv()
	{
		 var f=document.loginForm;
		    f.method="post";
		    f.action='Role_details';
		    f.submit(); 
	}
	
	</script>
	<script>
function checkk()
{
	document.getElementById('sub_btn').disabled = true;
	}
</script>  

<style>
input[type="text"] { width:90px; }
</style>

</head>

<body class="top-navbar-fixed">

<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Roledetails JSP PAGE-----[INFO]");  %>
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
String info=(String)details.getAttribute("admin");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding","root","password123"); 
String query="select * from Role_Details";
String query1="select * from Admin_UserDetails";
Statement s=conn.createStatement();
Statement s1=conn.createStatement();
ResultSet rs=s.executeQuery(query);
ResultSet rs1=s1.executeQuery(query1);
int count=0;
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
                        <!-- /.navbar-header -->

                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
 <ul class="nav navbar-nav navbar-right">
      
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


<form class="form-signin" name="loginForm" method="post" action="Role_details">

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
                                        <a href="Registration.jsp"><i class="fa fa-file-text"></i> <span>User Configuration</span> </a>
                                    </li>

                                    <li>
                                        <a href="userslist.jsp"><i class="fa fa-paint-brush"></i> <span>Users List</span> </a>
                                    </li>

                                    <li>
                                        <a href="roledetails.jsp"><i class="fa fa-map-signs"></i> <span>Authorization </span> </a>
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
          
        <div class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="header">
                                <h4 class="title">Authorization List</h4>
                            </div>
                            <div class="content table-full-width table-responsive">
                                <table class="table table-hover table-striped">
                                    <thead>
  <th>Role</th>
  <th>Admin</th>
  <th>AppEmphasize</th>
  <th>Intake</th>
  <th>Archival Execution</th>
  <th>Decommision</th>
  <th>Program governance</th>
  <th>Reporting</th>
  <th>Finance</th>
                                    </thead>
                                    <tbody>
                                      <%
                                  
                                      int i=0;
                                      while(rs.next()){ 
                                      %>
                                      <tr>
                                      <td><input class="act" style="width:200px;" type="text" name="role<%=i %>" value="<%= rs.getString(1) %>"></td>
                                      <td><input class="act" type="text" name="admin<%=i %>" value="<%= rs.getString(2) %>"></td>
                                      <td><input class="act" type="text" name="app_emp<%=i %>" value="<%= rs.getString(3) %>"></td>
                                      <td><input class="act" type="text" name="intake<%=i %>" value="<%= rs.getString(4) %>"></td>
                                      <td><input class="act" type="text" name="arch_exe<%=i %>" value="<%= rs.getString(5) %>"></td>
                                      <td><input class="act" type="text" name="decomm<%=i %>" value="<%= rs.getString(6) %>"></td>
                                      <td><input class="act" type="text" name="prgm_gov<%=i %>" value="<%= rs.getString(7) %>"></td>
                                      <td><input class="act" type="text" name="report<%=i %>" value="<%= rs.getString(8) %>"></td>
                                      <td><input class="act" type="text" name="finance<%=i %>" value="<%= rs.getString(9) %>"></td>
                                      </tr> 
                                      <%
                                      }
                                 
%>  
                                                                           </tbody>
                                </table>
 <input type="hidden" id="pwqej" value="<%= info %>" hidden>
 &nbsp;&nbsp;&nbsp;
 <button type="button" id="sub_btn" class="btn btn-primary" onclick="edit_serv()">Submit</button>                           </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

    </div>
</div>
  <script>
 if(document.getElementById('pwqej').value=="R")
	 checkk();
 </script>   
</form>

				    </div>
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


        <!-- ========== THEME JS ========== -->
        
<script type="text/javascript">
    $('.datepicker').datepicker({
    format: 'mm/dd/yyyy',
    startDate: '-3d'
});
</script>


        <!-- ========== THEME JS ========== -->
        <script>
            $(function($) {

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
       

	</body>
</html>



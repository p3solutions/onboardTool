<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

	<title>List Page</title>

	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
    <meta name="viewport" content="width=device-width" />
   
 <link rel="stylesheet" href="styles/styles.css" type="text/css" />
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
                
                
                #nav_userid{
             color:green;
             }
               
              #nav_role{
              color:blue;
              }  
        </style>

    	<script>
	var har=[];
	var his=[];
	function selectCheck(name)
	{
		
		if(har.indexOf(name)>=0)
			{
			var i = har.indexOf(name);
			if(i != -1) {
				har.splice(i, 1);
			}
			}
		else
			har.push(name);
	}
	function selectCheckDeac(name)
	{
		
		if(his.indexOf(name)>=0)
			{
			var i = his.indexOf(name);
			if(i != -1) {
				his.splice(i, 1);
			}
			}
		else
			his.push(name);
	}
	
	
	function servlet_call()
	{
		var f=document.loginForm;
	    f.method="post";
	    f.action='deactivate?values='+har+'&values2='+his;
	    f.submit(); 
	}
	</script>
	<script>
	var arr="";
	function ooo()
	{
		var e=document.getElementById("dates-field2");
	for(i=0;i<9;i++)
		{
		if(e[i].selected==true){
			arr=arr+(e[i].value);
		}
		}
	
		}
	function qq()
	{				 var f=document.loginForm;
				    f.method="post";
				    f.action="Admin_Module_Send_Invites_Mail?roless="+arr+"&mailid="+email;
				    f.submit();
			
	}
	</script>
	<script>
	var populate="";
	function del(cnt)
	{
	for(var i=0;i<cnt;i++){
		if(document.getElementsByName('delete_check')[i].checked){
			var name=document.getElementsByName('name_user'+i)[0].value;
			populate=populate+name+",";	
				
		}
	}
	}
	function deluser()
	{
		
		var f=document.loginForm;
	    f.method="post";
	    f.action='delete_users?array='+populate;
	    f.submit(); 
		
	}
	
	</script>
	<script>
function checkk()
{
	
	document.getElementById('add_btn').disabled = true;
	document.getElementById('del_btn').disabled = true;
	document.getElementById('sub_btn').disabled = true;
	for(i=0;i<50;i++){
	document.getElementsByName('delete_check')[i].disabled = true;
	document.getElementsByName('chek')[i].disabled = true;
	}
	}
</script>
  
</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Admin_UsersList JSP PAGE-----[INFO]");  %>


<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
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
String prjname=(String)details.getAttribute("nameofproject");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding","root","password123"); 
String query="select * from Admin_UserDetails";
Statement s=conn.createStatement();
ResultSet rs=s.executeQuery(query);

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
                         <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=prjname %></a>

                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
 <ul class="nav navbar-nav navbar-right">
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

<form class="form-signin" name="loginForm" method="post">

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
                                        <a href="User_Configuration.jsp"><i class="fa fa-file-text"></i> <span>User Configuration</span> </a>
                                    </li>

                                    <li>
                                        <a href="Admin_Userslist.jsp"><i class="fa fa-paint-brush"></i> <span>Users List</span> </a>
                                    </li>

                                    <li>
                                        <a href="Admin_Role_Details.jsp"><i class="fa fa-map-signs"></i> <span>Authorization </span> </a>
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
                                <h4 class="title">List Of Users</h4>
                            </div>
                            <div class="content table-responsive table-full-width">
                                <table class="table table-hover table-striped">
                                    <thead>
                                        <th></th>
  <th >UserName</th>
  <th>FirstName</th>
  <th>LastName</th>
  <th>Email</th>
  <th>Role</th>
  <th>Status</th>
  <th>Deactivate</th>
                                    </thead>
                                    <tbody>
                                      <%
                                      int count=0;
  while(rs.next()){ 
	  if(rs.getString(8).equals("active")){
		  %>
<tr style="background-color:white;">
  <td><input type="checkbox" name="delete_check" id="delete_check" ></td>
  <td><%= rs.getString(1) %></td>
  <td><%= rs.getString(2) %></td>
  <td><%= rs.getString(3) %></td>
  <td><%= rs.getString(4) %></td>
  <td><%= rs.getString(7) %></td>
  <td style="background-color:lightgreen"><%=rs.getString(8) %></td>
  <td style="text-align:center;"><input type="checkbox" name="chek" onChange="selectCheck('<%=rs.getString(1) %>');"></td>
  <td style="display:none;"><input type="text" name="name_user<%=count%>" value="<%= rs.getString(1) %>"></td>
  </tr> 
  <%
  count++;
  } else{
		  %>
		  <tr style="background-color:#ccc;cursor:not-allowed;">
		  <td><input type="checkbox" name="delete_check" id="delete_check" ></td>
		  <td><%= rs.getString(1) %></td>
		  <td><%= rs.getString(2) %></td>
		  <td><%= rs.getString(3) %></td>
		  <td><%= rs.getString(4) %></td>
		  <td><%= rs.getString(7) %></td>
		<td> <%=rs.getString(8) %></td>
    <td style="text-align:center;background-color:white;"><input type="checkbox" name="chek" id="chek" onChange="selectCheckDeac('<%=rs.getString(1) %>')" checked></td>
		  <td style="display:none;"><input type="text" name="name_user<%=count%>" value="<%= rs.getString(1) %>"></td>
		  </tr> 
 <%  
 count++;
 }
  }
%>  
                                                                           </tbody>
                                </table>
                                <div class="col-md-12">
 <input type="hidden" id="role_conf" value="<%= info %>" hidden>
 &nbsp;&nbsp;
 <button type="button" id="add_btn" class="btn btn-primary" onclick="window.location.href='Registration.jsp'">Add User</button>
 &nbsp;&nbsp;
 <input type="button" id="del_btn" class="btn btn-primary" onclick="del(<%=count %>);deluser();" value="DeleteUser">
 &nbsp;&nbsp;
 <button type="button" id="sub_btn" class="btn btn-primary" onclick="servlet_call();">Submit</button>
                           
                           </div>
                           
                            </div>
                        </div>
                    </div>


                </div>
            </div>
        </div>

     


    </div>
</div>
 <script>
 if(document.getElementById('role_conf').value=="R")
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



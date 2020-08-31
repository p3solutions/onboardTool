<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Decomm Manager - Role</title>

        <!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel.min.css" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
      

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >
         <style type="text/css">
            .breadcrumb-div {
                background-color: #e7e7e7;
                color: #0000B2; }
            h6 { line-height: 1.5em; }
            
            body{
            background:white;
            }
             body{
                 url(images/Role2.jpg);
                 colour: #0000FF;
             }

        </style>
        
        <!-- ========== COMMON JS FILES ========== -->
        
</head>
<body class="top-navbar-fixed">
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed RoleUIDashboard JSP PAGE-----[INFO]");  %>
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
  HttpSession role_ses=request.getSession(); 
  String frole=(String)role_ses.getAttribute("role");
 // System.out.println("Selected User Name :" +frole );
  HttpSession details=request.getSession();
  try{
  %>
 <div class="main-wrapper">
   <nav class="navbar top-navbar bg-white box-shadow">
   <div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
                <a class="navbar-brand" href="index.php">
                    <img src="images/logo1.png" alt="Options - Admin Template" class="logo">
                </a>
                   </div>
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
                </div>
   </div>
   </nav>
   
   <div class="content-wrapper">
                <div class="content-container">
                    <div class="main-page">
                    <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-sm-6">
                                    <h2 class="title">Dashboards</h2>
                                    <p class="sub-title">One stop solution for perfect admin!</p>
                                </div>
                                <!-- /.col-sm-6 -->
                                
                                <!-- /.col-sm-6 text-right -->
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-sm-6">
                                    <ul class="breadcrumb">
                                        <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                        <li class="active">Dashboard</li>
                                    </ul>
                                </div>
                                <!-- /.col-sm-6 -->
                               
                                <!-- /.col-sm-6 -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <section>

    <div class="row mt-50 grid1">
        <div class="container">
            <div class="col-md-12">

                <div class="col-md-3 col-sm-3">
                  <a href="RoleDashboard.jsp">
                   <center>
                   <img src="images/Role2.jpg" class="img-rounded" id="image" height="100" width="100" alt="Role" data-color="#494949">
                   <h6 class="mt-5">Roles</h6>
                   </center>
                  </a>
                </div>
                <div class="col-md-3 col-sm-3">
                  <a href="ProjectDashboard.jsp">
                 <center>
                   <img src="images/Project.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Project</h6>
               </center>
                  </a>
                </div>
              <div class="col-md-3 col-sm-3">
                  <a href="ApplicationDashboard.jsp">
                   <center>
                   <img src="images/Application.png" class="img-rounded" height="100" width="100" alt="Avatar">
                   <h6 class="mt-5">Application</h6>
                   </center>
                  </a>
                </div>

                
            </div>
        </div>
    </div>


                                <!-- /.row -->
</section>
                        <!-- /.section -->
   
                    </div>
     
                    </div>
                    
                    
   </div>
   </div>
    
   <%
   }
   
catch(Exception e){
e.printStackTrace();
}
%>
 </div>
</body>
</html>
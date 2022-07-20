<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Archive-Decomm Requirements</title>

<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
	media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
	media="screen">

<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">

<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">

<!-- ========== Header Icon ========== -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">

<!-- ========== MODERNIZR ========== -->
<script type="text/javascript" src="js_in_pages/project.js"></script>
<script src="js/modernizr/modernizr.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="js/Requirements/RequestType/ToBeRetire.js"></script>
<style type="text/css">
body {
	background: #f8f9fc;
}

/*  .active{
        background:#1565c0;
         } */
.page-title-div {
	background: #1565c0;
	padding: 15px;
}

#module_header {
	margin-top: 75px;
}

.ptitle {
	margin-right: -182px;
	margin-top: 65px;
	font-size: 24px;
}

.sub-ptitle {
	margin-right: -336px;
	margin-top: 95px;
	font-size: 14px;
}

.fixed-top {
	width: 100%;
	padding-left: 0px;
	padding-right: 0px;
}

a {
	font-size: 14px;
}

.container {
	width: 100%;
	height: 100%;
	display: flex;
	flex-wrap: wrap;
	align-items: center;
	justify-content: center;
}

h3 {
	color: #262626;
	font-size: 17px;
	line-height: 24px;
	font-weight: 700;
	margin-bottom: 4px;
}

p {
	font-size: 17px;
	font-weight: 400;
	line-height: 20px;
	color: #666666;
	margin: auto 10px;
	&.
	small
	{
	font-size
	:
	14px;
}

}
.card1 {
	display: block;
	top: 120px;
	position: relative;
	max-width: 500px;
	background-color: #fff;
	border-radius: 20px;
	padding: 32px 7px;
	margin: 12px;
	text-decoration: none;
	overflow: hidden;
	border: 1px solid dodgerblue;
	box-shadow: 1px 1px 5px 5px #dbdbdb;
}

.card1:hover {
	border: 3px solid #228B22;
}

h3 {
	margin-top: 8px;
}

}
.card2 {
	display: block;
	top: 100px;
	position: relative;
	max-width: 490px;
	background-color: #ffffff;
	border-radius: 20px;
	padding: 32px 7px;
	margin: 12px;
	text-decoration: none;
	overflow: hidden;
	border: 1px solid dodgerblue;
}

.card2:hover {
	border: 3px solid #CD3D73;
}

a.disabled:hover {
	cursor: not-allowed
}
</style>
</head>
<body class="top-navbar-fixed">

	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Grid JSP PAGE-----[INFO]"); %>
	<%@page language="java"%>
	<%@page import="java.sql.*"%>
	<%@page import="java.text.DateFormat"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.Date"%>
	<%@page import="onboard.DBconnection"%>
	<%@page import="java.util.Calendar"%>
	<%@page import="org.owasp.encoder.Encode"%>
	<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
DBconnection dBconnection = new DBconnection();



if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.jsp");



}
else{
String name=(String)session.getAttribute("ID");
HttpSession details=request.getSession();
Connection con = null;
session.setAttribute("theName", name);
String roles=(String)details.getAttribute("role");
String OpportunityName = (String)details.getAttribute("SelectedOpportunity");
String s=OpportunityName;
System.out.println("Welcome"+OpportunityName);

int sumcount=0;
Statement st,st2;
try{

con=dBconnection.getConnection();
Statement st1;

%>

	<%@include file="Nav-Bar.jspf"%>
	<nav class="nav nav-height nav-font" id="bg-color">
	<div class="container-fluid" id="container-fluid-margin">
		<div class="row" id="d3s-mt-10">
			<div class="col-lg-12 col-md-12">
				<h5 id="title">Requirements</h5>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="sub-title" style="color: #fff">
					<a href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><span
						class="glyphicon glyphicon-home"></span> Home</a> >> <a
						href="OpportunityGrid.jsp" id="sitetitle1" style="color: #fff"><%=Encode.forHtml(OpportunityName)%></a>>>

					<a id="sitetitle1" style="color: #fff">Requirements</a>
				</div>
			</div>
		</div>
	</div>
	</nav>

	<%
}
catch(Exception e){
e.printStackTrace();
}



} %>

	<div class="main-wrapper">
		<!-- ========== TOP NAVBAR ========== -->
		<!--  <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding" style = "height : 100px;">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/Decom3Sixty_logo.png" alt="Decom3Sxity" class="logo" style = "margin-top : 50px;">
                    </a>
                </div>
                /.navbar-header
                <div class="tabs-content">
                  <ul class="nav navbar-nav navAlign">
		    		  <li class="active"><a href="#" style="color:#fff"><i class="fad fa-folders fa-2x iconAlign activeIcon"></i>Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp"><i class="fad fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a></li>
		              <li><a href="PhaseList.jsp"><i class="fad fa-desktop iconAlign iconColor fa-2x"></i>Governance</a></li>
		              <li><a href="#"><i class="fad fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
		              <li><a href="DashBoard.jsp"><i class="fad fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a></li>
		              <li><a href="#"><i class="fad fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a></li>
		    </ul>
		         <ul class="nav navbar-nav navbar-right" style = "margin-top:45px;">
                      
                        <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin </span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
                
           
                
            </div>
            /.row
            <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                             <h5 class="title" style="color:#fff">Requirements</h5>
                              <p class="sub-title">Create and manage your Opportunities here</p>
                               <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff">
                               <span class="glyphicon glyphicon-home"></span> Home</a> >> 
                               <a  href="OpportunityGrid.jsp" id="sitetitle1" style="color:#fff"> Modules</a> >>
                                <a  href="ArchiveDecommPage.jsp" id="sitetitle1" style="color:#fff"> Requirements</a> </p>
                        </div>
                    
                       
                      

                    </div>

                </div>
			</nav>
        </div>
        /.container-fluid
    </nav > -->

		<div class="content-wrapper">
			<div class="content-container">
				<div class="main-page">

					<div class="container">

						<p class="ptitle">Requirements</p>
						<p class="sub-ptitle">Select the option to update the
							information</p>

						<a class="card1" href="ArchiveRequirementsIntroDetails.jsp"
							id="archiveReq"> <img src="images/grid/Archivereq.png"
							class="img-rounded filtered" height="100" width="100"
							alt="Avatar">
							<h3>Archive Requirements</h3>
							<p class="small">Archive data consists of older data that
								remains important to the organization or must be retained for
								future reference or regulatory compliance reasons.</p>


						</a> <a class="card1" href="AppDecommInfo.jsp" id="decomReq"> <img
							src="images/grid/decomm.png" class="img-rounded filtered"
							height="100" width="100" alt="Avatar">





							<h3>Decommision Requirements</h3>
							<p class="small">
								Decommissioning is a general term for a formal process to remove
								something from an active status. <br>
							</p> <br>

							<div class="row"></div>

						</a>
					</div>
				</div>

			</div>


		</div>
	</div>
	</div>

	<!-- ========== COMMON JS FILES ========== -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script src="js/jquery-ui/jquery-ui.min.js"></script>
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<script src="js/pace/pace.min.js"></script>
	<script src="js/lobipanel/lobipanel.min.js"></script>
	<script src="js/iscroll/iscroll.js"></script>
	<script src="js/navigation/navigation.js"></script>
</body>
</html>

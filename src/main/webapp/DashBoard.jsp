<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Dashboard</title>
<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
	media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
	media="screen">

<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/icheck/skins/line/red.css">
<link rel="stylesheet" href="css/icheck/skins/line/green.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<link rel="stylesheet" href="css/UserInfo/userinfo.css">
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<script type="text/javascript" src="js_in_pages/project.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />

<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">
<!-- ========== Pagination ========== -->
<script src="js/paging/pagination.js"></script>

<style type="text/css">
body {
	background: #fff;
	font-family: 'Poppins', sans-serif;
}
/*  .active{
        background:#1565c0;
         } */
.page-title-div {
	background: #1565c0;
	padding: 15px;
}
.fixed-top {
	width: 100%;
	padding-left: 0px;
	padding-right: 0px;
}
h1 {
	color: green;
}
/* toggle in label designing */
.toggle {
	position: absolute;
	display: inline-block;
	width: 85px;
	margin-top: 115px;
	margin-left: 1205px;
	height: 36px;
	background-color: #ffffff;
	border-radius: 30px;
	border: 2px solid #1287ea;
}
/* After slide changes */
.toggle:after {
	content: '';
	position: absolute;
	width: 31px;
	height: 30px;
	border-radius: 50%;
	background-color: #1389eb;
	top: 1px;
	left: 1px;
	transition: all 0.5s;
}
/* Toggle text */
p {
	font-family: Arial, Helvetica, sans-serif;
	font-weight: bold;
}
/* Checkbox cheked effect */
.checkbox:checked+.toggle::after {
	left: 49px;
}
/* Checkbox cheked toggle label bg color */
.checkbox:checked+.toggle {
	background-color: #ffffff;
}
/* Checkbox vanished */
.checkbox {
	display: none;
}
hr {
	border-top: 3px solid #dce8f1;
}
input[type=search] {
	outline: 0;
	border-width: 0 0 3px 0;
	border-color: #d2d2d2;
}
input[type=search]:focus {
	border-color: #1565c0;
}
.cbp-vm-switcher {
	padding: 42px;
}
.cbp-vm-options {
	text-align: right;
	padding-bottom: 10px;
}
.cbp-vm-options a {
	display: inline-block;
	width: 30px;
	height: 30px;
	overflow: hidden;
	white-space: nowrap;
	color: #d0d0d0;
	margin: 2px;
}
/* .cbp-vm-options a:hover,
.cbp-vm-options a.cbp-vm-selected {
	color: #47a3da;
} */
.cbp-vm-options a:before {
	width: 20px;
	height: 20px;
	line-height: 40px;
	font-size: 20px;
	text-align: center;
	display: inline-block;
}
/* General style of switch items' list */
.cbp-vm-switcher ul {
	list-style: none;
	padding: 0;
	margin: 0;
}
/* Clear eventual floats */
.cbp-vm-switcher ul:before, .cbp-vm-switcher ul:after {
	content: " ";
	display: table;
}
.cbp-vm-switcher ul:after {
	clear: both;
}
.cbp-vm-switcher ul li {
	display: block;
	position: relative;
}
.cbp-vm-image {
	display: block;
	margin: 0 auto;
}
.cbp-vm-image img {
	display: inline-block;
	max-width: 100%;
}
.cbp-vm-title {
	margin: 0;
	padding: 0;
}
.cbp-vm-price {
	color: #c0c0c0;
}
.cbp-vm-add {
	color: #fff;
	background: #47a3da;
	padding: 10px 20px;
	border-radius: 2px;
	margin: 20px 0 0;
	display: inline-block;
	transition: background 0.2s;
}

.cbp-vm-add:hover {
	color: #fff;
	background: #02639d;
}
.cbp-vm-add:before {
	margin-right: 5px;
}
/* Common icon styles */
.cbp-vm-icon:before {
	font-family: 'fontawesome';
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
}
/* Individual view mode styles */
/* Large grid view */
.cbp-vm-view-grid ul {
	text-align: center;
}
.cbp-vm-view-grid ul li {
	width: 20%;
	text-align: center;
	box-shadow: 5px 5px 5px 5px #dbdbdb;
	display: inline-block;
	vertical-align: top;
}
.cbp-vm-view-grid .cbp-vm-title {
	font-size: 21px;
}
.cbp-vm-view-grid .cbp-vm-details {
	max-width: 300px;
	min-height: 70px;
	margin: 0 auto;
}
.cbp-vm-view-grid .cbp-vm-price {
	margin: 10px 0;
	font-size: 1.5em;
}
.cbp-vm-view-list .right-col {
	float: left;
	width: 25%;
}
.cbp-vm-view-list .cbp-vm-title {
	font-size: 1.3em;
	padding: 0 30px;
	white-space: normal;
	width: 25%;
}
.cbp-vm-view-list .center-col {
	float: left;
	width: 20%;
	margin-right: 51px;
}
.cbp-vm-view-list .center-col {
	float: left;
	width: 20%;
	margin-right: 51px;
}
.cbp-vm-view-list li {
	padding: 12px 0;
	white-space: nowrap;
	background-color: #fff;
	box-shadow: 5px 5px 5px 5px #dbdbdb;
	margin: 13px;
	padding-top: 10px;
}
.cbp-vm-view-list li:focus {
	display: block;
	border: 2px solid red;
}
@media screen and (max-width: 66.7em) {
	.cbp-vm-view-list .cbp-vm-details {
		width: 30%;
	}
}
@media screen and (max-width: 57em) {
	.cbp-vm-view-grid ul li {
		width: 49%;
	}
}
@media screen and (max-width: 47.375em) {
	.cbp-vm-view-list .cbp-vm-image {
		width: 20%;
	}
	.cbp-vm-view-list .cbp-vm-title {
		width: auto;
	}
	.cbp-vm-view-list .cbp-vm-details {
		display: block;
		width: 100%;
		margin: 10px 0;
	}
	.cbp-vm-view-list .cbp-vm-add {
		margin: 10px;
	}
}
@media screen and (max-width: 40.125em) {
	.cbp-vm-view-grid ul li {
		width: 100%;
	}
}
/* .grid{
  margin-top:10%;
  
  } */
.cbp-vm-view-list li:focus {
	display: block;
	border: 2px solid red;
}
.progress {
	margin-top: 5px;
}
.cologen {
	color: #1c95f8 !important;
}
.right-side {
	position: absolute;
	right: 10%;
	top: 80px;
	z-index: 1;
}
#button {
	height: 50px;
	width: 50px;
	border-radius: 50%;
	border: 1px solid #dd6a2c;
	background-color: #dd6a2c;
	color: #fff;
	outline-width: 0;
	font-size: 20px;
	padding: 12px;
	text-align: center;
}
.form-row {
	display: flex;
	flex-wrap: wrap;
	margin-right: -5px;
	margin-left: -5px;
}
.search-input {
	min-width: 150px;
	max-width: 290px;
	flex: 1;
	position: relative;
}
#myInput {
	border: none;
	border-bottom: 1px solid #959595;
	-o-border-image: initial;
	border-image: initial;
	border-radius: 0;
	color: #fff !important;
	font-size: .875rem;
	text-indent: 12px;
	background-color: transparent !important;
	box-shadow: none;
	height: 25px;
	margin-top: 5px;
	padding-bottom: 3px;
}
.fa-search {
	color: #fff;
}
/* toggle */
/* toggle */
#apptype {
	font-size: .875rem;
	color: #fff;
}
.paneldashboard {
	box-shadow: 0 1px 7px rgb(76, 89, 103);
	margin-top: 14px;
}
.font_icon {
	font-size: 20px;
}
.totcounter {
	font-size: 43px;
	margin-bottom: 14px;
	text-align: center;
}
.headercharts {
	margin-left: 22px;
	margin-bottom: 21px;
}
#card-header {
	background-color: #fff;
	font-weight: 600;
    font-size: 16px;
    color: #141515;
}
focus {
background-color: #ff00ff;
color: #fff;
cursor: pointer;
font-weight: bold;
}
#dropDownMenu
{
margin: 0;
width: 1%;
padding: 0;
left: -20px;
}
.dropdown-menu>li>a {
line-height: 1.128571489;
}
h6 {
	padding-left: 55%;
    font-size: 16px;
}
#overlay{
position: fixed;
top: 0;
z-index: 100;
width:1400px;
height:100%;
display: none;
background: rgb(0,0,0,0.6);
}
.cv-spinner {
height: 70%;
display: flex;
justify-content: center;
align-items: center;
}
.spinner {
width: 80px;
height: 80px;
border: 8px #ddd solid;
border-top: 8px #2e93e6 solid;
border-radius: 50%;
animation: sp-anime 0.8s infinite linear;
}
@keyframes sp-anime {
100% {
transform: rotate(360deg);
}
}
.is-hide{
display:none;
}


</style>

</head>
<body class="top-navbar-fixed">
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    System.out.println("[INFO]-----"+formatter.format(date1)+"-----Accessed OpportunityList JSP PAGE-----[INFO]"); %>
	<%@page language="java"%>
	<%@page import="java.text.DateFormat"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.Date"%>
	<%@page import="java.sql.*"%>
	<%@ page import="onboard.DBconnection"%>
	<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("username")==null){
        response.sendRedirect("Login.jsp");
    }
%>
	<%
	PreparedStatement visit_st=null;
	ResultSet visit_rs=null;
    HttpSession role_ses=request.getSession();
    String frole=(String)role_ses.getAttribute("role");
    int sumcount=0;
    Statement st,st1;
    try{
        String query;
        HttpSession details=request.getSession();
        String Projets=(String)details.getAttribute("projects");
        System.out.println("projects-------------"+Projets);
        String roles=(String)details.getAttribute("role");
        DBconnection d=new DBconnection();
        Connection con = (Connection)d.getConnection();
        String visit_query="select * from visits";
        visit_st = con.prepareStatement(visit_query);
        visit_rs = visit_st.executeQuery();
        int flag=1,knt=0;
        Date date = new Date();
        SimpleDateFormat ft,ft1;
        String username=(String)details.getAttribute("username");
        ft=new SimpleDateFormat ("yyyy-MM-dd");
        ft1=new SimpleDateFormat ("hh:mm:ss");
        String strDate=ft.format(date);
        String strTime=ft1.format(date);
        while(visit_rs.next())
        {
            if(visit_rs.getString(6)!=null)
            {
                if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Logged in"))
                {
                	String queryy = "update visits set count=count+1,time=? where uname=? and module='Logged in' and date =?";
                	PreparedStatement stmtt = con.prepareStatement(queryy);
                	stmtt.setString(1, strTime);
                	stmtt.setString(2, username);
                	stmtt.setString(3, strDate);
                	int count = stmtt.executeUpdate();
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
            PreparedStatement preparedStmt = con.prepareStatement(ins_query);
            preparedStmt.setString (1, username);
            preparedStmt.setString (2, strDate);
            preparedStmt.setString(3, "Logged in");
            preparedStmt.setString(4, "1");
            preparedStmt.setString(5, strTime);
            preparedStmt.setString(6, "None");
            preparedStmt.setString(7, "");
            // execute the preparedstatement
            preparedStmt.execute();
        }%>

	<%@include file="Nav-Bar.jspf"%>
	<nav class="nav nav-height nav-font" id="bg-color">
		<div class="container-fluid" id="container-fluid-margin">
			<div class="row" id="d3s-mt-10">
				<div class="col-lg-12 col-md-12">
					<h5 id="title">Dashboard</h5>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="sub-title" style="color: #fff">
						<a href="OpportunityList.jsp" id="sitetitle1" style="color: #fff"><span
							class="glyphicon glyphicon-home"></span> Home</a> >> Dashboard
					</div>
				</div>
			</div>
		</div>
	</nav>
	
	<!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->

	<div class="content-wrapper">

		<div class="content-container">

			<div class="main-page">
				<div class="col-md-12 col-sm-12 col-lg-12">

					<!-- <div class="card mt-5"> -->

					<div class="card-grid mt-5">
						<div class="main">

							<!-- <div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid"> -->
							<div id="cbp-vm" class="cbp-vm-view-grid">

								<div class="col-sm-3 col-md-3 col-lg-3"
									style="font-size: 13.6px; height: 123px !important;">
									<a class="dashboard-stat col-md-12 col-sm-12 col-lg-12"
										style="background: linear-gradient(to left, rgb(96, 130, 182, 0.2) 70%, #6495ED 30%);"
										href="OpportunityList.jsp?category=Intake">
										<div class="col-sm-4 col-md-4 col-lg-4"
											style="height: 100%; margin-left: -17px;">
											<p class="totcounter"
												style="height: 80%; color: white; padding-right: 10px;"></p>
											<span class="font_icon text-align" style="height: 20%; color: white;">Intake</span>
										</div>
										<div class="col-sm-8 col-md-8 col-lg-8">Intake is the initiation of the
                                            product.Number of opportunity or application in intake step that are yet to be approved.</div>
									</a>
								</div>


								<card class="col-sm-3 col-md-3 col-lg-3"
									style="font-size:13.6px; height: 123px !important;"> <a
									class="dashboard-stat col-md-12 col-sm-12 col-lg-12"
									style="background: linear-gradient(to left, rgba(22, 101, 192, 0.2) 70%, #1565c0 30%);"
									href="PhaseList.jsp">
									<div class="col-sm-4 col-md-4 col-lg-4" style="height: 100%; margin-left: -17px;">
										<p class="totcounter" style="height: 80%; color: white;"></p>
										<span class="font_icon text-align" style="height: 20%; color: white;">Phases</span>
									</div>
									<div class="col-sm-8 col-md-8 col-lg-8">Phases can be described as a
										project that is scheduled over a period of time Which consists
										of multiple waves.</div>
								</a> </card>

								<div class="col-md-3 col-sm-3 col-lg-3 "
									style="font-size: 13.6px; height: 123px !important;">
									<a class="dashboard-stat col-md-12 col-sm-12 col-lg-12"
										style="background: linear-gradient(to left, rgba(32, 51, 110, 0.2) 70%, #20336e 30%);"
										href="waveList.jsp?waves=all">
										<div class="col-sm-4 col-md-4 col-lg-4"
											style="height: 100%; margin-left: -17px;">
											<p class="totcounter" style="height: 80%; color: white;"></p>
											<span class="font_icon text-align" style="height: 20%; color: white;">Waves</span>
										</div>
										<div class="col-sm-8 col-md-8 col-lg-8">Waves can be comprised of set of
											applications that are ready for implementation over a period
											of time.</div>
									</a>

								</div>

								<div class="col-sm-3 col-md-3 col-lg-3"
									style="font-size: 13.6px; height: 123px !important;">
									<a class="dashboard-stat col-md-12 col-sm-12 col-lg-12"
										style="background: linear-gradient(to left, rgba(134, 221, 212, 0.2) 70%, #439f95 30%);"
										href="OpportunityList.jsp?category=Apps">
										<div class="col-sm-4 col-md-4 col-lg-4"
											style="height: 100%; margin-left: -17px;">
											<p class="totcounter"
												style="height: 80%; color: white; padding-right: 10px;"></p>
											<span class="font_icon text-align" style="height: 20%; color: white;">Apps</span>
										</div> <!-- <div class="col-md-8">Applications are opportunities provided within the organisation
											for Archival or Decommission or Retiring purpose.</div> -->
										<div class="col-sm-8 col-md-8 col-lg-8">Applications are opportunities
											provided within the organisation for Archival or Decommission
											or for both Archival and Decommission purpose.</div>
									</a>

								</div>


							</div>
						</div>

					</div>
					<%
												visit_st.close();
												visit_rs.close();
                                                con.close();
                                                
    }
                                            catch(Exception e){
                                                e.printStackTrace();
                                            }
                                        %>


					</ul>

					<div>
						<div class="col-md-12 mt-3">
							<div class="row">
								<div class="col-md-8">
									<div class="card ht-290">
										<div class="card-header" id="card-header">
											<div class="row">
												<div class="col-md-6">Overall progress for phases and
													waves</div>
												<!-- <div class="col-md-2 ms-auto">
													<select class="form-select" id="phId"
														aria-label="Default select example" style="padding: 0 0 0 0.75rem;">
														<option selected>Select</option>
														<option value="Phase" selected>Phase</option>
														<option value="Wave">Wave</option>
													</select>
												</div> -->

												<div class="col-md-3">
													<div class="row align-items-center">
														<!--<div class="ms-auto">
                                                            <label class="col-form-label" id="title">Phase</label>
                                                        </div>-->
														<div class="ms-auto">
															<select class="form-select"
																aria-label="Default select example" id="phase" name="phase" style="padding: 0 0 0 0.75rem;">
																<!-- <option class='options' value='All'>All</option> -->
															</select>
														</div>
													</div>
												</div>
												<div class="col-md-3">
													<div class="row align-items-center">
														<!--<div class="ms-auto">
                                                            <label class="col-form-label" id="title">Wave</label>
                                                        </div>-->
														<div class="ms-auto">
															<select class="form-select"
																aria-label="Default select example" id="wave" style="padding: 0 0 0 0.75rem;">
																<!-- <option class='options' value='All'>All</option> -->
															</select>
														</div>
													</div>
												</div>
											</div>

										</div>
										<div class="card-body align" style="width: fit-content;">

											<div class="col-md-4.5">

												<h6 class="d-flex justify-content-left"
													style="margin-left: -40%;">
													<b>Intake</b>
												</h6>
												<canvas id="mycanvas" width="200" height="200"
													style="margin-left: 0%;"></canvas>
												<div id="legend"
													style="margin-top: -34%; margin-left: 37%; font-size: 11px; font-weight: 600;">
												</div>
											</div>
											<div class="col-md-4.5" id="canvas2"
												style="padding-left: 318px; margin-top: -34%; margin-right: 12%;">
												<h6 class="d-flex justify-content-left"
													style="margin-left: 95%;">
													<b style="margin-top: -8px;">Waves</b>
												</h6>
												<canvas id="mycanvas1" width="200" height="200"
													style="margin-left: 95%;"></canvas>
											</div>
											<div id="legend2"
												style="float: right; margin-right: -63%; margin-top: -33%; font-size: 11px; font-weight: 600;"></div>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card ht-290">
										<div class="card-header" id="card-header">Application
											Categories</div>
										<div class="card-body mt-3">
											<div class="align1">
												<div id="pieChartId" width="250" height="250"></div>
											</div>
										
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-12 mt-3">
							<div class="row">
								<div class="col-md-8">
									<div class="card ht-233">
										<div class="card-header" id="card-header">Intake Status
											<button type="button" class="btn btn-primary pull-right" id="exportButton" onclick="dashboardExportToCSV('Intake Status','example');">Export CSV</button>
										</div>
										<div class="card-body" style="padding: 0px;">
											<div id="ApplicationStatusDash">
												<table id="example" class="table">
													<thead>

														<tr>
															<th scope="col">App Name</th>
															<th scope="col">Submitted Date</th>
															<th scope="col">Assigned to</th>
															<th scope="col">Targeted Phase</th>
															<th scope="col">Archive Required</th>
															<th scope="col">Archival Completion Target</th>
														</tr>
													</thead>
													<tbody id="dataTableId">
													</tbody>
												</table>
												<div class="col-md-12 text-center" id="pg1">
													<ul class="pagination pagination-lg pager pagination-align"
														id="developer_page"></ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card ht-233">
										<div class="card-header" id="card-header">Risk, Issues
											and Deadlines</div>
										<div class="card-body justify-content-center">
											<div id="dataCountIssue"></div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-12 mt-3">
							<div class="row">
								<div class="col-md-8">
									<div class="card ht-270">
										<div class="card-header" id="card-header">Archive Requirements
											<button type="button" class="btn btn-primary pull-right" onclick="dashboardExportToCSV('Archive Requirements','example1');">Export CSV</button>
										</div>
										<div class="card-body" style="padding: 0px;">
											<div id="AppAchiveReqDash">
												<table id="example1" class="table">
													<thead>
														<tr>
															<th scope="col">App Name</th>
															<th scope="col">Start Date</th>
															<th scope="col">Status</th>
															<th scope="col">Target Completion Date</th>
															<th scope="col">Phase</th>
															<th scope="col">Wave</th>
															<th scope="col">Design Approval</th>
														</tr>
													</thead>
													<tbody id="dataTableId1">
													</tbody>
												</table>
												<div class="col-md-12 text-center" id="pg2">
													<ul class="pagination pagination-lg pager pagination-align"
														id="developer_page_1"></ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card ht-270">
										<div class="card-header" id="card-header">Data
											Characteristic</div>
										<div class="card-body">
											<div class="overflow-hidden">
												<div id="chart">
													<ul id="numbers" class="numbers-align">
													</ul>
													<ul id="bars" class="bars-align">
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-md-12 mt-3">
							<div class="row">
								<div class="col-md-8">
									<div class="card ht-270">
										<div class="card-header" id="card-header">Archive Execution
											<button type="button" class="btn btn-primary pull-right" onclick="dashboardExportToCSV('Archive Execution','example2');">Export CSV</button>
										</div>
										<div class="card-body" style="padding: 0px;">
											<div id="AppArchiveExeDash">
												<table id="example2" class="table">
													<thead>
														<tr>
															<th scope="col">App Name</th>
															<th scope="col">Start Date</th>
															<th scope="col">Status</th>
														</tr>
													</thead>
													<tbody id="dataTableId2">
													</tbody>
												</table>
												<div class="col-md-12 text-center" id="pg3">
													<ul class="pagination pagination-lg pager pagination-align"
														id="developer_page_2"></ul>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-md-4">
									<div class="card ht-270">
										<div class="card-header" id="card-header">Cost Benefit
											Analysis</div>

										<div class="card-body align2" style="width: fit-content;">
											<div class="col-md-4 mt-3">
												<canvas id="canvasCBA" width="175" height="175"
													style="margin-left: -10%;"></canvas>
												<div id="legend1"
													style="margin-top: -170%; margin-left: 132%; float: left; font-size: 70%; font-weight: 600;"></div>
											</div>
										</div>


									</div>
								</div>
							</div>
						</div>

					</div>

				</div>



			</div>
			</div>




		</div>
	</div>






	<!-- /.content-wrapper -->

	</div>
	<!-- end of main wrapper -->
	
	<%@include file="Footer.jspf"%>

	<!-- ========== COMMON JS FILES ========== -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script src="js/jquery-ui/jquery-ui.min.js"></script>
	<script src="js/bootstrap/bootstrap.min.js"></script>
	<script src="js/pace/pace.min.js"></script>
	<script src="js/lobipanel/lobipanel.min.js"></script>
	<script src="js/iscroll/iscroll.js"></script>


	<script type="text/javascript">
		$('#list').click(function() {
			$('#grid').removeClass('cologen');
			$('#list').addClass('cologen');
		});
		$('#grid').click(function() {
			$('#list').removeClass('cologen');
			$('#grid').addClass('cologen');
		});
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
	<link rel="stylesheet" href="js/amcharts/plugins/export/export.css"
		type="text/css" media="all" />
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
	<script type="text/javascript"
		src="js/date-picker/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="js/date-picker/jquery.timepicker.js"></script>
	<script type="text/javascript" src="js/date-picker/datepair.js"></script>
	<script type="text/javascript" src="js/date-picker/moment.js"></script>
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

	<script src="js/dashboard/dashboardGanttChartAjaxCall.js"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
	<!-- Active Icon Color changes  -->
	<script>
$(document).ready(function() {
    $('.searchbox-input').keyup(function(){
        search_text($(this).val());
    });
    function search_text(value){
        $('#ul_id .cbp-vm-title').each(function(){
            var found = 'false';
            $(this).each(function(){
                if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)
                {
                    found = 'true';
                }
            });
            if(found == 'true'){
                $(this).parent().css('display','');
            }
            else {
                $(this).parent().css('display','none');
            }
        })
    }
});
</script>
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
    	var data = google.visualization.arrayToDataTable([
            ['State', '$', { role: 'style' }],
            ['Sum of Realized',      110000.00, 'blue'],     
            ['Sum of in Process',  365000, 'blue'],          
            ['Sum of Intake/Opportunity', 192000.00, 'blue']
         ]);
      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
      var options = {
        title: "Total",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.BarChart(document.getElementById("barChartId"));
      chart.draw(view, options);
  }
  </script>
	<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["State", "$", { role: "style" } ],
        ['Sum of Realized',      110000.00, 'blue'],     
        ['Sum of in Process',  365000, 'blue'],          
        ['Sum of Intake/Opportunity', 192000.00, 'blue'] ]);
      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);
      var options = {
        title: "Total",
        width: 400,
        height: 250,
        bar: {groupWidth: "25%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnChartId"));
      chart.draw(view, options);
  }
    
  </script>
	<script src="js/navigation/navigation.js"></script>
	<script type="text/javascript" src="js/chartjs/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="js/chartjs/Chart.js"></script>
	<script src="js/dashboard/dashboardAjaxCall.js"></script>
	<script src = "js/reportJs/ExportToCSV.js"></script>
	
<!-- 	<script type="text/javascript"  src=" https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script> -->
	<!-- <script src="https://cdnjs.com/libraries/Chart.js"></script> -->
	<!-- <script src="https://cdn.jsdelivr.net/npm/chart.js"></script> -->
	
</body>
</html>

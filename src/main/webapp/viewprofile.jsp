<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users List</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="js/jquery/jquery-2.2.4.min.js"></script>

<!-- ========== COMMON STYLES ========== -->
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
<link rel="stylesheet" href="css/icheck/skins/line/red.css">
<link rel="stylesheet" href="css/icheck/skins/line/green.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<link rel="icon" type="image/png" href="assets/img/favicon.ico">

<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/UserInfo/userinfo.css">

<!-- ========== Header Icon ========== -->
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">

<link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">
	<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
<script type="text/javascript" src="js_in_pages/project.js"></script>

<link rel="stylesheet" href="css/headerIconnectCon/headerIcon.css"
	media="screen">

<link rel="stylesheet" href="css/threeDots/threeDots.css" media="screen">
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />

<!-- ========== BootstrapV5 ========== -->
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
	rel="stylesheet">
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>

<script src="js/multiplepages.js"></script>

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

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<style>
.icon:hover
{
cursor:pointer;

}
#new_pwd_togglePassword
{
position: absolute; 
margin-top: 22px;
margin-left: 308px;
}
#conf_new_pwd_togglePassword
{
position: absolute; 
margin-top: 22px;
margin-left: 249px;
}
#prev_pwd_togglePassword{
position: absolute;
margin-top: 22px;
margin-left: 247px;
}
#overlay {
	position: fixed;
	top: 0;
	z-index: 100;
	width: 1400px;
	height: 100%;
	display: none;
}

.cv-spinner {
	height: 62rem;
	display: flex;
	justify-content: center;
	align-items: center;
}

.pagination li:hover {
	cursor: pointer;
}

.pagination1 li:hover {
	cursor: pointer;
}

.spinner {
	width: 60px;
	height: 60px;
	margin-right: 15rem;
	margin-left: -3.5rem;
	border: 8px #ddd solid;
	border-top: 8px #2e93e6 solid;
	border-radius: 50%;
	animation: sp-anime 0.8s infinite linear;
}

@
-webkit-keyframes sp-anime { 0% {
	-webkit-transform: rotate(0deg);
}

100




%
{
-webkit-transform




:




rotate


(




360deg




)


;
}
}
@
keyframes sp-anime { 0% {
	transform: rotate(0deg);
}

100




%
{
transform




:




rotate


(




360deg




)


;
}
}
}
.is-hide {
	display: none;
}

#overlay1 {
	position: fixed;
	top: 0;
	z-index: 100;
	width: 1400px;
	height: 100%;
	display: none;
}

.cv-spinner1 {
	height: 62rem;
	display: flex;
	justify-content: center;
	align-items: center;
}

.spinner1 {
	width: 60px;
	height: 60px;
	margin-right: 15rem;
	margin-left: -3.5rem;
	border: 8px #ddd solid;
	border-top: 8px #2e93e6 solid;
	border-radius: 50%;
	animation: sp-anime1 0.8s infinite linear;
}

@
-webkit-keyframes sp-anime1 { 0% {
	-webkit-transform: rotate(0deg);
}

100




%
{
-webkit-transform




:




rotate


(




360deg




)


;
}
}
@
keyframes sp-anime1 { 0% {
	transform: rotate(0deg);
}

100




%
{
transform




:




rotate


(




360deg




)


;
}
}
}
.is-hide1 {
	display: none;
}

#u_pwd_togglePassword {
	position: absolute;
	margin-top: 22px;
	margin-left: 348px;
}

#conf_u_pwd_togglePassword {
	position: absolute;
	margin-top: 22px;
	margin-left: 289px;
}

@media all and (max-width:30em){
 .changepwd{
  display:block;
  margin:0.4em auto;
 }
}
</style>
<body>

	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%
	SimpleDateFormat formatter1 = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date newDate1 = new Date();
	System.out.println("[INFO]-----" + formatter1.format(newDate1) + "-----Accessed OpportunityList JSP PAGE-----[INFO]");
	%>
	<%@page language="java"%>
	<%@page import="java.text.DateFormat"%>
	<%@page import="java.text.SimpleDateFormat"%>
	<%@page import="java.util.Date"%>
	<%@page import="java.sql.*"%>
	<%@ page import="onboard.DBconnection"%>
	<%@ page import="common.constant.COMMON_CONSTANTS"%>
	<%@page import="org.owasp.encoder.Encode"%>
	<%@ page import="java.util.ResourceBundle"%>
	<%@ page import="java.util.Properties" %>
	<%@ page import="java.io.FileInputStream" %>
	<%@ page import="java.io.File" %>
	<%@ page import="java.io.FileReader" %>
	<%@ page import="java.io.InputStreamReader" %>
	<%@ page import="java.io.IOException" %>
	<%@ page import="java.io.InputStream" %>
	<%
    Properties prop = new Properties();
    String workingDir = System.getProperty(COMMON_CONSTANTS.CATALINA_BASE) + File.separator + COMMON_CONSTANTS.D3SIXTY_CONF;
    File configFile = new File(workingDir, COMMON_CONSTANTS.CONFIG_PROPS);
    File versionFile = new File(workingDir, COMMON_CONSTANTS.VERSION_INFO_PROPS);
    String authType="";
    String ssoLoginUrl="";
    String versionInfo="";
    try {
        // Load Configuration.properties
        if (configFile.exists()) {
            prop.load(new FileReader(configFile));
        } else {
            // Load from resources folder using class loader
            InputStream resourceStream = Thread.currentThread().getContextClassLoader().getResourceAsStream(COMMON_CONSTANTS.CONFIG_PROPS);
            if (resourceStream != null) {
                prop.load(new InputStreamReader(resourceStream));
            } else {
                throw new IOException("Configuration.properties file not found.");
            }
        }

        authType = prop.getProperty(COMMON_CONSTANTS.AUTHTYPE);
        ssoLoginUrl=prop.getProperty(COMMON_CONSTANTS.SSOLOGINURL);
        System.out.println("AUTHTYPE :: " + authType);
        System.out.println("SSO LOGIN URL :: " + ssoLoginUrl);
        // Load VersionInfo.properties
        prop.clear(); // Clear the properties for reuse
        if (versionFile.exists()) {
            prop.load(new FileReader(versionFile));
        } else {
            // Load from resources folder using class loader
            InputStream resourceStream = Thread.currentThread().getContextClassLoader().getResourceAsStream(COMMON_CONSTANTS.VERSION_INFO_PROPS);
            if (resourceStream != null) {
                prop.load(new InputStreamReader(resourceStream));
            } else {
                throw new IOException("VersionInfo.properties file not found.");
            }
        }
        versionInfo = prop.getProperty(COMMON_CONSTANTS.VERSION);
        System.out.println("Version Info :: " + versionInfo);
    } catch (IOException e) {
        System.out.println(e.getMessage());
    }    
%>
	<%-- <%
	ResourceBundle resource1 = ResourceBundle.getBundle("VersionInfo");
	String versioninfo1 = resource1.getString("VERSION");
	ResourceBundle resource8 = ResourceBundle.getBundle("Configuration");
	String authtype8 = resource8.getString("AUTHTYPE");
	System.out.println("Version" + versioninfo1);
	%> --%>
	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	response.setHeader("Pragma", "no-cache");
	response.setHeader("Expires", "0");
	if (session.getAttribute("username") == null) {
		response.sendRedirect("Login.jsp");
	}
	%>
	<%
	HttpSession role_session = request.getSession();
	String frole1 = (String) role_session.getAttribute("role");
	//int sumcount1=0;
	Statement sDate, sTime;
	try {
		//String query;
		PreparedStatement visit_start = null;
		ResultSet visit_reset = null;
		HttpSession sessionDetails = request.getSession();
		String Projects = (String) sessionDetails.getAttribute("projects");
		System.out.println("projects-------------" + Projects);
		String rolesList = (String) sessionDetails.getAttribute("role");
		DBconnection db = new DBconnection();
		Connection connectCon = (Connection) db.getConnection();
		String visit_query1 = "select * from visits";
		visit_start = connectCon.prepareStatement(visit_query1);
		visit_reset = visit_start.executeQuery();
		int flag1 = 1, knt1 = 0;
		Date newDate = new Date();
		SimpleDateFormat fDate, fTime;
		String userName = (String) sessionDetails.getAttribute("username");

		fDate = new SimpleDateFormat("yyyy-MM-dd");
		fTime = new SimpleDateFormat("hh:mm:ss");
		String startDate = fDate.format(newDate);
		String startTime = fTime.format(newDate);
		while (visit_reset.next()) {
			if (visit_reset.getString(6) != null) {
		if (visit_reset.getString(1).equals(userName) && visit_reset.getString(2).equals(startDate)
				&& visit_reset.getString(3).equals("Logged in")) {
			String queryy = "update visits set count=count+1,time=? where uname=? and module='Logged in'  and date =?";
			PreparedStatement stmtt = connectCon.prepareStatement(queryy);
			stmtt.setString(1, startTime);
			stmtt.setString(2, userName);
			stmtt.setString(3, startDate);
			int count = stmtt.executeUpdate();
			flag1 = 0;
			break;
		}
			}

		}
		//System.out.println("the flag value is "+flag);
		if (flag1 == 1) {
			String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
			+ " values (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement preparedStmt = connectCon.prepareStatement(ins_query);
			preparedStmt.setString(1, userName);
			preparedStmt.setString(2, startDate);
			preparedStmt.setString(3, "Logged in");
			preparedStmt.setString(4, "1");
			preparedStmt.setString(5, startTime);
			preparedStmt.setString(6, "None");
			preparedStmt.setString(7, "");

			// execute the preparedstatement
			preparedStmt.execute();
		}
	%>

	<script>
		let tooltipTriggerList = [].slice.call(document
				.querySelectorAll('[data-bs-toggle="tooltip"]'))
		var tooltipList = tooltipTriggerList.map(function(tooltipTriggerEl) {
			return new bootstrap.Tooltip(tooltipTriggerEl, {
				container : 'body',
				trigger : 'onClick'
			});

		});
	</script>
	<nav
		class="navbar navbar-expand-lg navbar-expand-lg navbar-light bg-white nav-height nav-font">
		<div class="container-fluid col-sm-12 col-md-12 col-lg-12">
			<div class="col-sm-2 col-md-2 col-lg-2">
				<a class="navbar-brand" href="OpportunityList.jsp"> <img
					src="images/D3Sixty-logo.png" class="d3s-logo" alt="D3Sixty">
				</a>
			</div>
			<div class="col-md-8 col-lg-8 col-sm-8">
				<div class="collapse navbar-collapse">
					<ul class="navbar-nav mr-auto d3s-ml-80" id="nav-res-align">
						<li class="nav-item moduleIcon"><a class="nav-link active"
							aria-current="page" href="OpportunityList.jsp"><i
								class="fas fa-folders fa-2x iconAlign iconColor"></i>Applications</a>
						</li>
						<li class="nav-item moduleIcon"><a class="nav-link active"
							aria-current="page" href="Admin_Userslist.jsp"><i
								class="fas fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a>
						</li>
						<li class="nav-item moduleIcon"><a class="nav-link active"
							aria-current="page" href="Governance_Home.jsp"><i
								class="fas fa-desktop iconAlign iconColor fa-2x"></i>Governance</a></li>
						<li class="nav-item moduleIcon" id="myElementwithTooltip"
							data-bs-toggle="tooltip" data-bs-placement="bottom"
							title="For Future Enhancement"><a class="nav-link active"
							aria-current="page" href="#"><i
								class="fas fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
						<li class="nav-item moduleIcon"><a class="nav-link active"
							aria-current="page" href="DashBoard.jsp"><i
								class="fas fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboard</a>
						</li>
						<li class="nav-item moduleIcon" id="myElementwithTooltip"
							data-bs-toggle="tooltip" data-bs-placement="bottom"
							title="For Future Enhancement"><a class="nav-link active"
							aria-current="page" href="#"><i
								class="fas fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a>
						</li>

					</ul>

				</div>
			</div>

			<div class="col-sm-2 col-md-2 col-lg-2">
				<div class="dropdown d3s-ml-70" align="end" id="user-icon-lign">
					<a class="dropdown-toggle" href="#" role="button"
						id="dropdownMenuLink" data-bs-toggle="dropdown"
						aria-expanded="false"><i
						class="fas fa-user-circle iconAlign iconColor fa-3x"></i> </a>
					<ul class="dropdown-menu" id="dropDownMenu"
						aria-labelledby="dropdownMenuLink"
						style="width: 165px; margin-left: -15px;">
						<li><a class="dropdown-item" href="#" id="textAlign"><i
								class="fas fa-user-circle iconAlign iconColor fa-3x"></i><br />Signed
								in as <br /> <b class="user-ellipsis"><%=Encode.forHtml(userName)%></b></a></li>

						<li class="mt-5"><a class="dropdown-item li-align"
							href="#" id="textAlign"onclick="location.href='viewprofile.jsp';" 
							data-target="#viewprofile" data-toggle="modal"
							style="border-top: 1px solid #d3d7e2; padding: 11px 0px 11px;">View Profile</a>
							<a class="dropdown-item li-align changepwwd"
							href="" id="textAlign" data-target="#changepwd"
							data-toggle="modal"
							style="border-top: 1px solid #d3d7e2; padding: 11px 0px 11px;">Change
								Password</a> <a class="dropdown-item li-align" href=""
							id="textAlign" data-target="#verModal1" data-toggle="modal"
							style="border-top: 1px solid #d3d7e2; padding: 11px 0px 11px;">About
								D3Sixty</a> <a class="dropdown-item li-align" href="#"
							id="textAlign" onclick="location.href='logout.jsp';"
							style="border-top: 1px solid #d3d7e2;"><i
								class="fa fa-sign-out iconColor fa-1x"></i>Logout</a></li>
					</ul>

				</div>


			</div>
		</div>

	</nav>
	<div class="modal" id="verModal1" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #1565c0;">
					<h4 class="modal-title" id="exampleModalLabel"
						style="color: white;">About</h4>
					<button type="button" class="btn-close" data-dismiss="modal"
						style="color: white;" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form name="PopUpform">
						<div class="row">
							<div class="form-group">
								<div class="col-lg-12">
									<center>
										<img src="images/D3Sixty_logo.png" style="width: 60%;">
									</center>
									<div class="col-lg-12">
										<center>
											<label class="versioninfo">Version : <%=versionInfo%></label>
										</center>
										<center>
											<label class="versioninfo">Copyright &copy; 2022 <a
												href="https://platform3solutions.com/">Platform 3
													Solutions.</a> All Rights Reserved.
											</label>
										</center>
										<center>
											<label class="versioninfo" for="formInput526">Trademarks
												owned by Platform 3 Solutions </label>
										</center>
									</div>

								</div>
							</div>
						</div>

					</form>
				</div>

			</div>
		</div>
	</div>

	<div class="modal" id="changepwd" tabindex="-1"
		aria-labelledby="exampleModalLabel1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #1565c0;">
					<h5 class="modal-title" id="exampleModalLabel1"
						style="color: white;">Change Password</h5>
					<button type="button" class="btn-close" data-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form name="PopUpform">
						<div class="row">
							<div class="form-group">
								<div class="col-lg-12">
									<label class="control-label" for="formInput526">Enter
										Current Password:</label> <i class="fa fa-eye-slash icon"
										aria-hidden="true" id="prev_pwd_togglePassword"
										></i>
									<input type="password" class="form-control" id="prev_pwd"
										name="prev_pwd" required />
								</div>
								<div class="col-lg-12">
									<label class="control-label" for="formInput526">New
										Password:</label> <i class="fa fa-eye-slash icon" aria-hidden="true"
										id="new_pwd_togglePassword"
										></i>
									<input type="password" class="form-control" id="new_pwd"
										name="new_pwd" required>
								</div>
								<div class="col-lg-12">
									<label class="control-label" for="formInput526">Confirm
										New Password:</label><i class="fa fa-eye-slash icon" aria-hidden="true"
										id="conf_new_pwd_togglePassword"
										></i>
									<input type="password" class="form-control" id="conf_new_pwd"
										name="conf_new_pwd" required>
								</div>
								<div class="col-lg-12" style="display: none;">
									<label class="control-label" for="formInput526">Username:</label>
									<input type="text" class="form-control" id="user_Name"
										name="user_Name"
										value="<%=Encode.forHtmlAttribute(userName)%>" required>
								</div>

								<div class="col-lg-12" style="display: none;">
									<label class="control-label" for="formInput526">Auth
										Type:</label> <input type="text" class="form-control" id="auth_type"
										name="auth_type"
										value="<%=Encode.forHtmlAttribute(authType)%>" required>
								</div>

							</div>
						</div>


					</form>
				</div>
				<div class="modal-footer">

					<button type="button" class="btn btn-primary" id="change_PWD"
						 style="font-size: 12px;">Change
						Password</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" style="font-size: 12px;">Close</button>
				</div>
			</div>
		</div>
	</div>
<div class="modal" id="EditPopUp" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: #1565c0;">
					<h5 class="modal-title" id="exampleModalLabel"
						style="color: white;">Update User Details</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form name="PopUpform">
						<div class="row">
							<div class="form-group">
								<div class="col-lg-12">
									<label class="control-label" for="formInput526">Username:</label>
									<input type="text" class="form-control" id="uname_modify"
										name="uname" required> <label class="control-label"
										for="formInput526">Firstname:</label> <input type="text"
										class="form-control" id="ufname_modify" name="ufname" required>
									<label class="control-label" for="formInput526">Lastname:</label>
									<input type="text" class="form-control" id="ulname_modify"
										name="ulname" required> <label class="control-label"
										for="formInput526">User E-Mail:</label> <input type="text"
										class="form-control" id="u_email_modify" name="u_email"
										required> <label class="control-label"
										for="formInput526">User Role:</label> <select
										class="form-select form-select-lg mb-3"
										aria-label=".form-select-lg example" id="u_role_modify"
										name="u_role" style="font-size: 14px;" required>
										<option>Select</option>
										<option>D3SIXTY_SUPER_ADMIN</option>
										<option>D3SIXTY_ADMIN</option>
										<option>D3SIXTY_TECHNICAL_CONTRIBUTOR</option>
										<option>D3SIXTY_ARCHIVE_CONTRIBUTOR</option>
										<option>D3SIXTY_DECOMMISSION_CONTRIBUTOR</option>
										<option>D3SIXTY_FINANCE</option>
									</select>



								</div>
							</div>
						</div>
						<input type="text" id="random_id_modify" name="random_id" value=""
							style="display: none;">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" id="update_submit"
						data-bs-dismiss="modal">Update</button>
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>

				</div>
			</div>
		</div>
	</div>






	<%
	visit_start.close();
	visit_reset.close();
	connectCon.close();

	}

	catch (Exception e) {
	e.printStackTrace();
	}
	%>
</body>
<script>
$(document).ready(function() {
 console.log($('#auth_type').val());
 if($('#auth_type').val()=="SSO")
	 {
	 $('.changepwwd').hide();
	 }
});
</script>

<script>
        const togglePassword = document
            .querySelector('#new_pwd_togglePassword');
  
        const password = document.querySelector('#new_pwd');
  
        togglePassword.addEventListener('click', () => {
            const type = password
                .getAttribute('type') === 'password' ?
                'text' : 'password';
                  
            password.setAttribute('type', type);
            if(type=="password")
            	{
            	togglePassword.classList.remove("fa-eye");
                togglePassword.classList.add("fa-eye-slash");
   	            }
            if(type=="text")
        	{
            	togglePassword.classList.remove("fa-eye-slash");
                togglePassword.classList.add("fa-eye");

        	}
           
        });
    </script>
<script>
        const togglePassword1 = document
            .querySelector('#prev_pwd_togglePassword');
  
        const password1 = document.querySelector('#prev_pwd');
  
        togglePassword1.addEventListener('click', () => {
            const type = password1
                .getAttribute('type') === 'password' ?
                'text' : 'password';
                  
            password1.setAttribute('type', type);
            if(type=="password")
            	{
            	togglePassword1.classList.remove("fa-eye");
                togglePassword1.classList.add("fa-eye-slash");
   	            }
            if(type=="text")
        	{
            	togglePassword1.classList.remove("fa-eye-slash");
                togglePassword1.classList.add("fa-eye");

        	}
           
        });
    </script>
<script>
        const togglePassword2 = document
            .querySelector('#conf_new_pwd_togglePassword');
  
        const password2 = document.querySelector('#conf_new_pwd');
  
        togglePassword2.addEventListener('click', () => {
            const type = password2
                .getAttribute('type') === 'password' ?
                'text' : 'password';
                  
            password2.setAttribute('type', type);
            if(type=="password")
            	{
            	togglePassword2.classList.remove("fa-eye");
                togglePassword2.classList.add("fa-eye-slash");
   	            }
            if(type=="text")
        	{
            	togglePassword2.classList.remove("fa-eye-slash");
                togglePassword2.classList.add("fa-eye");

        	}
           
        });
    </script>
<script src="js/admin_modify_module/admin_role.js"></script>

	<nav class="nav nav-height-70 nav-font" id="bg-color"
		style="margin-top: -10px; height: 120px;">
		<div class="container-fluid">
			<div class="col-sm-12" id="d3s-mt-20">
				<ul class="nav navbar-nav-1 mt-3">
					<li class="nav-link-2 active-2" id="nav-link"
						style="margin-left: 1%;"><a
						class="link" href=""
						style="color: #fff; padding: 7px 7px; margin-top: -10px;margin-left: -12px;font-size: large; height: 35px;">User Profile</a></li>
						
						<!-- <li  class="nav navbar-nav-1" id="nav-link"
						style="border-bottom: 4px solid rgba(255, 255, 255, .5) !important;margin-left: 15px;"> -->
						<!-- <a class="dropdown-item li-align changepwwd"
							href="" id="textAlign" data-target="#changepwd"
							data-toggle="modal"
							style="border-top: 1px solid #d3d7e2; padding: 11px 0px 11px;">Change
								Password</a> </li> -->
						</ul>
				<div class="row">
				   <div class="row">
				
					   <div class="col-lg-12 col-md-12">
						<div class="sub-title" style="color: #fff">
							<a href="DashBoard.jsp" id="sitetitle1" style="color: #fff"><span
								class="glyphicon glyphicon-home"style="margin-left: 12px;margin-top: 15px;"></span> Home</a> >> View Profile
						</div>
					</div>
				</div>
				</div>
			</div>
		</div>
	</nav>

	<br />
	<div class="col-lg-6 right-side phase-btn" align="end" style="margin-top: 36px;">
		      <input type="button"class="btn btn-primary" data-target="#changepwd"
							data-toggle="modal" value="Change Password">
		</div>
	<div class="card-container-5 card d3s-mt-50" >
		
		<div class="card-header d3s-pl-15" id="cd-header">Profile Details</div>
		

		<div class="withoutPhase display" id="admin_userslist_div">
			<center><table class="table table-bordered table-responsive"
				id="admin_userslist" style="width: 80%; margin:20px 20px;font-size: 12px;" > </center> 										
      												<tr>
             <th  style='text-align:left;vertical-align: middle;'>UserName</th> 
    												<td id ="uname"style="text-align: left; font-weight:500;">   											
      												</td>
      												</tr>
  													
  													
      												<tr>
             <th class="form-control-label" style='text-align:left;vertical-align: middle;'>Email Address</th> 
    												<td id ="u_email"style="text-align: left;"> 
      												</td>
      												</tr>
  													
  													
      												<tr>
             <th class="form-control-label" style='text-align:left;vertical-align: middle;'>First Name</th> 
    												<td id ="ufname"style="text-align: left;"> 
      												</td>
      												</tr>
  													
  													
      												<tr>
             <th class="form-control-label" style='text-align:left;vertical-align: middle;'>Last Name</th> 
    												<td id ="ulname"style="text-align: left;"> 
      												</td>
      												</tr>
  													
  													
      												<tr>
             <th class="form-control-label" style='text-align:left;vertical-align: middle;'>Role</th> 
    												<td id ="u_role"style="text-align: left;"> 
      												</td>
      												</tr>
  													</table>
  													

                   <div class="row">
                    
                  <!--   <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group focused">
                      <input type="button"class="btn btn-primary" data-target="#EditPopUp"
							data-toggle="modal" value="Edit Fields">
                       </div>
                    </div>
                     </div> -->
                  </div>
                </div>
               </form>
            </div>
          </div>


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

	<script src="js/navigation/navigation.js"></script>
<!--     <script src="js/admin_modify_module/admin_retrieve_users.js"></script>
 --> 	<script src="js/admin_modify_module/admin_add_user.js"></script>
	<script src="js/admin_modify_module/DeleteAjaxCall.js"></script>
	<script src="js/admin_modify_module/EditAjaxCall.js"></script>
	<script src="js/admin_modify_module/admin_users_pagination.js"></script>
	<!-- ========== Pagination ========== -->
 	<script src="js/admin_modify_module/view_profile.js"></script> 


	<!-- ========== BootstrapV5 ========== -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>

	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>
	<link rel="stylesheet"
		href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css" />
	<!-- ========== Toastr ========== -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link
		href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
		rel="stylesheet">
	<script src="js/notification/notification.js"></script>
<script src="js/admin_modify_module/admin_role.js"></script>
<script src="js/admin_modify_module/changepwd.js"></script>
<script src="js/notification/notification.js"></script>
<script src="js/BindWave.js"></script>
</body>
</html>
<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8"/>
	<link rel="icon" type="image/png" href="assets/img/favicon.ico">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<title>UserConfiguration Page</title>
	<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
	<meta name="viewport" content="width=device-width"/>
	<link rel="stylesheet" href="styles/styles.css" type="text/css"/>
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet"
		  type="text/css"/>
	<script type="text/javascript"
			src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css"
		  rel="stylesheet" type="text/css"/>
	<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js"
			type="text/javascript"></script>
	<!-- ========== COMMON STYLES ========== -->
	<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
	<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
	<link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
	<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">
	<!-- ========== PAGE STYLES ========== -->

	<!-- ========== THEME CSS ========== -->
	<link rel="stylesheet" href="css/main.css" media="screen">

	<!-- ========== MODERNIZR ========== -->
	<script src="js/modernizr/modernizr.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet"/>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css"
		  rel="stylesheet"/>
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
	<script type="text/javascript"
			src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>


</head>
<style>
	.btn {

		margin-left: 50px;

	}

	body {
		font-size: 14px;;
		font-family: "pt-sans-regular", sans-serif;
		font-weight: initial;
		background: #F6F8FA;

	}

	.card .card-body {
		padding: 1.88rem 1.81rem;
	}

	img {
		background: -webkit-linear-gradient(DodgerBlue, lightblue);
		border-radius: 60%;
		z-index: -1;
		opacity: 5px;
		width: 100%;
		height: 255px;
		margin-top: 200px;
	}

	.grid-margin {
		margin-bottom: 1.875rem;
	}

	.col-12 {
		flex: 0 0 100%;
		max-width: 100%;
	}

	.card {
		position: relative;
		display: flex;
		flex-direction: column;
		min-width: 0;
		word-wrap: break-word;
		background-color: #fff;
		background-clip: border-box;
		border: 1px solid rgba(0, 0, 0, 0.125);
		border-radius: 0.3125rem;
	}

	.card-body {
		flex: 1 1 auto;
		padding: 1.25rem;
	}

	.card-title {
		margin-bottom: 0.75rem;
		color: DodgerBlue;
	}

	form {
		display: block;
		margin-top: 0em;
	}


	#container {

		animation: rotateStuff 1.5s steps(20) infinite;
	}

	.loading {
		position: absolute;
		align-self: center;
		width: 3vh;
		height: 3vh;
		border-radius: 50%;
	}

	@keyframes rotateStuff {
		0% {
			transform: rotate(0deg);
		}
		100% {
			transform: rotate(360deg);
		}
	}


	input[type="text"]:focus {

		border: 1px solid DodgerBlue;
	}
</style>
<body>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date date = new Date();
	System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Registration JSP PAGE-----[INFO]"); %>
<%@page import="java.sql.*" %>
<%
	HttpSession ses = request.getSession();
	String role = (String) ses.getAttribute("My_Roles");
	String fname = (String) ses.getAttribute("fname");
	String lname = (String) ses.getAttribute("lname");
	String email = (String) ses.getAttribute("email");
	String project = (String) ses.getAttribute("project");
	String app = (String) ses.getAttribute("application");
	System.out.println(fname + "   " + lname);
	Class.forName("org.gjt.mm.mysql.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool", "root", "password123");
	String query = "select uname from Admin_UserDetails";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(query);
%>

<div class="main-wrapper">

	<!-- ========== TOP NAVBAR ========== -->


	<form class="form-signin" name="loginForm" method="post">

		<div class="content-wrapper">
			<div class="content-container">

				<!-- ========== LEFT SIDEBAR for UserConfiguration ========== -->
				<div class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
					<div class="sidebar-content" id='jqxWidget'>


						<div class="left-sidebar fixed-sidebar bg-primary box-shadow tour-three">
							<div class="sidebar-content" id='jqxWidget'>
								<div class="sidebar-nav">
									<a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
										<img src="images/rlogo.png" alt="Onboarding Tool" class="logo" width="100%">
									</a>

								</div>


								<!-- /.sidebar-nav -->
							</div>

							<!-- /.sidebar-content -->
						</div>
						<!-- /.sidebar-nav -->
					</div>
					<!-- /.sidebar-content -->
				</div>
				<!-- /.left-sidebar -->


				<!-- Projects List Start -->

				<div class="main-page">

					<div class="container-fluid">

						<div class="row page-title-div">
							<div class="col-sm-6">
								<h2 class="title">Registration Form</h2>


							</div>
						</div>

					</div>

					<section class="section">
						<div class="row">
							<div class="col-md-12">


								<div class="container-fluid">
									<div class="col-12 grid-margin">
										<div class="card">
											<div class="card-body">
												<h4 class="card-title"><b>Basic Details</b></h4>
												<br>
												<form class="form-sample">
													<p class="card-description">

													</p>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">
																	<div class="required_fie">First Name</div>
																</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		   name="reg_fname" id="reg_fname"
																		   value="<%=fname%>">
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">
																	<div class="required_fie">Last Name</div>
																</label>
																<div class="col-sm-9">
																	<input type="text" name="reg_lname" id="reg_lname"
																		   class="form-control" value="<%=lname%>">
																</div>
															</div>

														</div>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">
																	<div class="required_fie">Username</div>
																</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		   name="reg_uname" id="reg_uname"
																		   onChange="check()">
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">Roles</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		   name="reg_roles" value="<%=role%>" readonly>
																	<%--<select></select>--%>
																</div>
															</div>

														</div>

														<%--<div class="col-sm-6 form-group">
                                                            <div class="form-group">
                                                                <label style="color:white"><span class="glyphicon glyphicon-bookmark"></span> Roles </label>
                                                                <input type="text" class="form-control" name="reg_roles" value="<%=role%>">
                                                            </div>
                                                        </div>--%>
													</div>

													<div class="row">
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">
																	<div class="required_fie">Email</div>
																</label>
																<div class="col-sm-9">
																	<input type="text" name="reg_email" id="reg_email"
																		   class="form-control" value="<%=email%>">
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">
																	<div class="required_fie">Confirm Email</div>
																</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		   name="reg_cemail" id="reg_cemail">
																</div>
															</div>

														</div>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">
																	<div class="required_fie">Password</div>
																</label>
																<div class="col-sm-9">
																	<input type="password" data-toggle="tooltip" title="Password must contain 8 or More Character, LowerCase & UpperCase!" class="form-control"
																		   name="reg_pwd" id="reg_pwd">
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">
																	<div class="required_fie">Confirm Password</div>
																</label>
																<div class="col-sm-9">
																	<input type="password" class="form-control"
																		   name="reg_cpwd" id="reg_cpwd">
																</div>
															</div>

														</div>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">Project</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		   name="reg_projects" value="<%=project%>" readonly>
																</div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">Application</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		   name="reg_app" value="<%=app%>" readonly>
																</div>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-6 col-form-label">
																	<div class="required_fie">Security Question</div>
																</label>
															</div>
														</div>
													</div>
													<div class="row">
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">Question
																	1</label>
																<div class="col-sm-9">
																	<select class="form-control" name="reg_qn">
																		<option value=""></option>
																		<option value="What is Your Spouse Name?">What
																			is Your pet Name?
																		</option>
																		<option value="Who is your fav Cricketer?">Who
																			is your fav Cricketer?
																		</option>
																		<option value="In what city or town was your first job?">
																			In what city or town was your first job?
																		</option>
																		<option value="What is the name of your favorite childhood friend">
																			What is the name of your favorite childhood
																			friend
																		</option>
																	</select>
																</div>
															</div>
														</div>

													</div>

													<div class="row">
														<div class="col-md-6">
															<div class="form-group row">
																<label class="col-sm-3 col-form-label">Answer</label>
																<div class="col-sm-9">
																	<input type="text" class="form-control"
																		   name="reg_ans" id="reg_ans">
																</div>
															</div>

														</div>
													</div>
													<div class="row">
														<div class="col-md-11">
															<div class="form-group row">
																<button type="button" class="btn btn-primary pull-right"
																		id="send_btn"
																		onclick="register_user();">Register
																</button>

															</div>
														</div>
													</div>
												</form>
											</div>
										</div>
									</div>

								</div>


							</div>
							<!-- /.col-md-6 -->

						</div>
						<!-- /.row -->
						<!-- Footer -->

						<footer class="page-footer font-small blue">

							<!-- Copyright -->
							<div class="footer-copyright text-center py-3">� 2018 Copyright:
								<a href="https://www.Platform3solutions.com">Platform3solutions</a>
							</div>
							<!-- Copyright -->

						</footer>
						<!-- Footer -->
					</section>
					<!-- /.section -->

				</div>
				<!-- /.main-page -->

				<!-- Project List End -->

			</div>
			<!-- /.content-container -->
		</div>
		<!-- /.content-wrapper -->
	</form>
</div>
<!-- /.main-wrapper -->
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
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all"/>
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
<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<script src="js/admin_module/admin_module_send_invites.js"></script>
</body>
<script type="application/javascript">
	function register_user() {

		var ffname = document.getElementById("reg_fname").value;
		var llname = document.getElementById("reg_lname").value;
		var uuname = document.getElementById("reg_uname").value;
		var email = document.getElementById("reg_email").value;
		var pass = document.getElementById("reg_pwd").value;
		var cpass = document.getElementById("reg_cpwd").value;
		var confirm = document.getElementById("reg_cemail").value;
		var SecurityQuestion=$('#reg_qn').val();
		var SecurityAnswer=$('#reg_ans').val();
		var CheckUserName = true;
		<% while(rs.next()){ %>
		if (uuname == "<%=rs.getString(1)%>") {
			
			CheckUserName = false;
			
			/* window.alert("User Name is already taken");
			window.location.href = 'Registration.jsp'; */
		}
		<%}%>
		if (ffname === "" || llname === "" || uuname === "" || SecurityQuestion == "" || SecurityAnswer == "")
			window.alert("fill the mandatory fileds");
		else {
			if ((email.includes("@")) && (email.includes(".com"))) {
				var confirm = document.getElementById("reg_cemail").value;
				var lowerCaseLetters = /[a-z]/g;
				var upperCaseLetters = /[A-Z]/g;
				var checkpassword = true;
				var numbers = /[0-9]/g;
				var popuptext = "password should contain : \n";
				
				if(!pass.match(lowerCaseLetters)){
					checkpassword = false;
					popuptext += "At least one Lower Case Character\n";
				}
				
				if(!pass.match(upperCaseLetters)){
					checkpassword = false;
					popuptext += "At least one Upper Case Character\n";
				}
				
				if(!pass.match(numbers)) {  
					checkpassword = false;
					popuptext += "At least one Numeric Value\n";
				}
				if(!pass.length >= 8){
					checkpassword = false;
					popuptext += "At least eight or More Characters\n";
				}
				
				if (CheckUserName == true){
				if (email == confirm) {
					if (checkpassword == true) {
						if (pass == cpass) {
							var f = document.loginForm;
							f.method = "post";
							f.action = 'user_registration?email=' + email;
							f.submit();
						} else
							window.alert("password and confirm password are not same");
					} else
						window.alert(popuptext);
				} else
					window.alert("both emails are not same");
			} else
				window.alert("User Name is already taken");
			} else
				window.alert("Invalid Email");
		}
	}
</script>
<script>
$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});
</script>
</html>

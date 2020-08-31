<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
		 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" />
	<link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
	<link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css"/>
	<script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>
	<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
	<title>Username Recovery</title>
</head>
<style>
	@import url('https://fonts.googleapis.com/css?family=Poppins');

	/* BASIC */

	html {
		background-image: url("images/Bg.png");


	}

	body {
		font-family: "Poppins", sans-serif;
		height: 100vh;
		background-color: rgba(91, 155, 223, 0.5);
		position: absolute;
		z-index: 2;
		width: 100%;
		height: 86%;
		top: 0;
		left: 0;
		margin:0 auto;

		justify-content: center;
	}
	p{
		padding:5px;
		color:#fff;
		font-size:16px;

	}
	a {
		color: #92badd;
		display:inline-block;
		text-decoration: none;
		font-weight: 400;
	}

	a:hover{

		color:#fff;
		text-decoration:none;

	}

	h2 {
		text-align: center;
		text-decoration:none;
		font-size: 30px;
		font-family: "pt-sans-regular", sans-serif;
		font-weight: 600;

		display:inline-block;
		margin: 40px 8px 10px 8px;
		color: #cccccc;
	}

	.fa{

		font-size:50px;
		text-align: center;
		color:DodgerBlue;


	}

	/* STRUCTURE */

	.wrapper {
		display: flex;
		align-items: center;
		flex-direction: column;
		justify-content: center;
		width: 100%;
		min-height: 100%;
		padding: 20px;
	}

	#formContent {
		-webkit-border-radius: 10px 10px 10px 10px;
		border-radius: 10px 10px 10px 10px;
		background: #fff;
		padding: 30px;
		width: 90%;
		max-width: 450px;
		position: relative;
		padding: 0px;
		-webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
		box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
		text-align: center;
	}

	#formFooter {
		background-color: #f6f6f6;
		border-top: 1px solid #dce8f1;
		padding: 25px;
		text-align: center;
		-webkit-border-radius: 0 0 10px 10px;
		border-radius: 0 0 10px 10px;
	}



	/* TABS */

	h2.inactive {
		color: #cccccc;
	}

	h2.active {
		color: #0d0d0d;

	}



	/* FORM TYPOGRAPHY*/

	input[type=button], input[type=submit], input[type=reset]  {
		background-color: #56baed;
		border: none;
		color: white;
		padding: 15px 80px;
		text-align: center;
		font-family: "Nunito Sans";
		text-decoration: none;
		display: inline-block;
		text-transform: uppercase;
		font-size: 13px;
		-webkit-box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
		box-shadow: 0 10px 30px 0 rgba(95,186,233,0.4);
		-webkit-border-radius: 5px 5px 5px 5px;
		border-radius: 5px 5px 5px 5px;
		margin: 5px 20px 40px 20px;
		-webkit-transition: all 0.3s ease-in-out;
		-moz-transition: all 0.3s ease-in-out;
		-ms-transition: all 0.3s ease-in-out;
		-o-transition: all 0.3s ease-in-out;
		transition: all 0.3s ease-in-out;

	}

	input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover  {
		background-color: #39ace7;

	}

	input[type=button]:active, input[type=submit]:active, input[type=reset]:active  {
		-moz-transform: scale(0.95);
		-webkit-transform: scale(0.95);
		-o-transform: scale(0.95);
		-ms-transform: scale(0.95);
		transform: scale(0.95);
	}

	input[type=text] {
		background-color: #f6f6f6;

		color: #0d0d0d;
		padding: 15px 32px;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 16px;
		margin: 5px;
		width: 85%;
		border: 2px solid #f6f6f6;
		-webkit-transition: all 0.5s ease-in-out;
		-moz-transition: all 0.5s ease-in-out;
		-ms-transition: all 0.5s ease-in-out;
		-o-transition: all 0.5s ease-in-out;
		transition: all 0.5s ease-in-out;
		-webkit-border-radius: 5px 5px 5px 5px;
		border-radius: 10px 10px 10px 10px;
		border: 0;
		outline: 0;

		font-size: 18px;
		margin-top: 36px;
		padding-bottom: 9px;
	}

	input[type=text]:focus {
		background-color: #fff;
		border-bottom: 2px solid #5fbae9;
	}

	input[type=text]:placeholder {
		color: #cccccc;
	}

	input[type=text]:placeholder {
		opacity:0.2;
	}





	/* OTHERS */

	*:focus {
		outline: none;
	}

	#icon {
		width:50%;
	}

	* {
		box-sizing: border-box;
	}

	footer.page-footer .footer-copyright {
		overflow: hidden;
		background-color: rgba(0,0,0,.2);
		color: rgba(255,255,255,.6);
	}


	.text-center {
		text-align: center!important;
	}

	.pb-3, .py-3 {
		padding-bottom: 1rem!important;
	}

	.pt-3, .py-3 {
		padding-top: 1rem!important;
	}


	.vldform1 {
		box-sizing: border-box;
		width: 375px;
		background: #fff;
		display: flex;
		flex-direction: column;
		padding: 35px 55px;
		animation: a .5s;
		animation-fill-mode: forwards;
		border: #d4d4d4 1px solid;
		border-radius: 10px;
		box-shadow: 0 2px 6px 0 hsla(0, 0%, 0%, 0.2);
	}

	.vldform1 a {
		text-decoration: none;
	}

	h1 {
		font-size: 29px;

		margin: 0px 0px 26px 0px;
	}

	.vldform__textbox {

		border: 0;
		outline: 0;
		border-bottom: 2px #2d73a8 solid;
		font-size: 14px;
		margin-top: 36px;
		padding-bottom: 9px;

	}

	.vldform__textbox[type="text"]{

		border: 0;
		outline: 0;
		border-bottom: 2px #2d73a8 solid;
		font-size: 14px;
		margin-top: 36px;
		background:#fff;
		padding-bottom: 9px;
		-webkit-border-radius:0px;
		border-radius: 0px;
		width:97%;
		text-align: left;
		padding:0px;

	}

	.vldform__textbox[type="password"]::after {
		content: " ";
		display: block;
		width: 20px;
		height: 10px;
		background-color: rebeccapurple;
		width:80%;
	}

	.vldform__recoverypassword{
		align-self: flex-end;
		margin: 10px 0px;
		font-size: 16px;
		color: #2E67A9;
	}

	.vldform__button {
		margin-top: 42px;
		height: 50px;
		border: 0;
		color: #fff;
		border-radius: 10px;
		background-color: #39ace7;
		font-size: 22px;
		font-weight: 600;
		font-family: "Nunito Sans";
		cursor: pointer;
	}


	.vldreg {
		display: none;
	}

	.vldrecpass {
		display: none;
	}
	.vlduser {
		display: none;
	}
	@keyframes a {
		0% {
			opacity: 0;
			transform: translateY(-5px)
		}

		to {
			opacity: 1;
			transform: translateY(5px)
		}
	}

	@media (max-width: 400px) {
		.vldform1 {
			width: 350px;
			padding: 20px 40px;
		}

	}

	@media (max-width: 360px) {
		.vldform1 {
			width: 305px;
			padding: 20px 35px;
		}

		.vldform__signup {
			text-align: center;
		}

		.vldform__signup a {
			margin-left: 14px;
		}
	}









</style>
<body>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	Date date = new Date();
	System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed reset_uname JSP PAGE-----[INFO]");  %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%
	System.out.println("start page");
	String x=request.getParameter("email");
	HttpSession passwd=request.getSession();
	passwd.setAttribute("emailid",x);
	String rl=request.getParameter("role");
	String pj=request.getParameter("project");
	System.out.println("in varaibles "+x+" "+rl+" "+pj);
	String Qn="";
	String ans="";
	String uname="";
	Class.forName("org.gjt.mm.mysql.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool", "root", "password123");
	String query = "SELECT * from Admin_UserDetails where email='"+x+"' and roles='"+rl+"' and projects like '%"+pj+"%'";
	Statement st = conn.createStatement();
	ResultSet rs = st.executeQuery(query);

	if(rs.next()){
		Qn=rs.getString(9);
		ans=rs.getString(10);
		uname=rs.getString(1);
		System.out.println("uname ans qn "+Qn+" "+ans+" "+uname);

	}
	System.out.println("uname ans qn "+Qn+" "+ans+" "+uname);

%>

<div class="wrapper fadeInDown">
	<!-- Login form -->
	<form class=" vldauth" name="RecoveryUnameForm">
		<div id="formContent">
			<!-- Tabs Titles -->

			<h2 class="active">  </h2>




			<!-- Login Form -->

				<div><h1>Forgot username? </h1><p id="para" style='color:black;'><%=Qn %></p></div>

				<input type="text" id="Answer" class="fadeIn second" name="answer" placeholder="Security Answer" required>
				<input type="text" id="ans"  class="form-control input-lg" value="<%=ans %>" style="display:none;" />
				<input type="text" id="uname"  class="form-control input-lg" value="<%=uname %>" style="display:none;" />
				<input type="submit" class="fadeIn fourth" value="Submit"  onclick="reset_username()">




		</div>
	</form>
	<!-- Login form -->






</div>
<!-- Footer -->

<footer class="page-footer font-small blue">

	<!-- Copyright -->
	<div class="footer-copyright text-center py-3"><p>This product is the proprietary property of Platform3 Solutions and is only authorized to users with a valid license. If you do not have a license, please contact Platform3 Solutions or one of its partner representatives to obtain the required license.</p>© 2018 Copyright:
		<a href="https://www.Platform3solutions.com">Platform3solutions</a>
	</div>
	<!-- Copyright -->

</footer>
<!-- Footer -->

<!-- Script -->

<script>
	function reset_username()
	{
		var x=document.getElementById("Answer").value;
		var y=document.getElementById("ans").value;
		var name=document.getElementById("uname").value;
		if(x==y){
			/*window.location.href='mail_uname?uname='+name;*/
			var f = document.RecoveryUnameForm;
			f.method="POST";
			f.action='mail_uname?uname='+name;
			f.submit();

		}
		else
			window.alert("wrong answer");
	}
</script>


</body>
</html>

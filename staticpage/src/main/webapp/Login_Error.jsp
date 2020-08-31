
<!DOCTYPE html> 
	<html> 
	<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" /> 
	<meta name="viewport" content="width=1,initial-scale=1,user-scalable=1" /> 
	<title>ONBOARD</title> 
	<!-- Latest compiled and minified CSS --> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> 
	
	<!-- Optional theme --> 
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> 
	
	<!-- Latest compiled and minified JavaScript --> 
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> 
	<link href="http://fonts.googleapis.com/css?family=Lato:100italic,100,300italic,300,400italic,400,700italic,700,900italic,900" rel="stylesheet" type="text/css"> 

	
	<link href="styles/styles.css" rel="stylesheet"> 

	
	<style> 
	
	body{ 
	width:100%; 
	background-repeat: no-repeat; 
	background-position: 0px 0px 10px; 
	} 
	.glyphicon { 
	font-size: 20px; 
	} 
	#uname,#pwd 
	{ 
	margin:0; 
	background-color:white; 
	border-radius:0px; 
	border-left:transparent; 
	border-right:transparent; 
	border-bottom:solid white 1px; 
	border-top:transparent; 
	color:#34495E; 
	
	} 
	#main_col 
	{ 
	background-color:#3276B1; 
	border-radius:0px; 
	border-left:transparent; 
	border-right:transparent; 
	border-bottom:transparent; 
	border-top:transparent; 
	color:#fff; 
	
	} 
	
	.text-gray { color: #4c4d4d !important; } 
	
	.full-body { margin:5% auto; padding:0; overflow-X:hidden; } 
	
	form { 
	position: relative; 
	margin: 0 auto; 
	display: inline-block; 
	padding: 20px 20px; 
	color:black; 
	font-family: "Helvetica Neue",Roboto,Arial,"Droid Sans",sans-serif; 
	border-radius: none; 
	} 
	
	.recov-pass, .recov-user { 
	width:100%; 
	position: relative; 
	margin: 0 auto; 
	display: inline-block; 
	padding: 20px 20px; 
	font-family: "Helvetica Neue",Roboto,Arial,"Droid Sans",sans-serif; 
	border-radius: 5px; 
	text-align:center; 
	} 
	
	::-webkit-input-placeholder { 
	color:white; 
	} 
	
	body { 
	background: url(../onboard/images/bg.jpg) no-repeat center center fixed; 
	-webkit-background-size: cover; 
	-moz-background-size: cover; 
	-o-background-size: cover; 
	background-size: cover; 
	} 
	
	.login-form { 
	font: 16px/2em Lato, serif; 
	margin: 20px auto; 
	} 
	
	.btn-shad { border: none; 
	} 
	
	
	.progress-bar { 
	color: #000 !important; 
	background-color: #3498db !important; } 
	
	
	form[role=login] { 
	color: #5d5d5d; 
	background: #e2e1e145; 
	padding: 26px; 
	} 
	form[role=login] img { 
	display: block; 
	margin: 0 auto; 
	margin-bottom: 35px; 
	} 
	form[role=login] input, 
	form[role=login] button { 
	font-size: 18px; 
	margin: 16px 0; 
	} 
	form[role=login] > div { 
	text-align: center; 
	} 
	
	.form-links { 
	text-align: center; 
	margin-top: 1em; 
	margin-bottom: 50px; 
	} 
	.form-links a { 
	color: #fff; 
	} 
	
	</style></head> 
	
	<body background="assets/images/bg.jpg"> 
	
	<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Login_Error JSP PAGE-----[INFO]");  %>
	
	
	
	
	
	
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> 
	<html> 
	<head> 
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
	<title>Insert title here</title> 
	</head> 
	<body> 
	
	</body> 
	</html> 
	
	
	
	
	
	
	
	
	<div class="container"> 
	<div class="well"> 
	<h1 id="ErrorMessage">  </h1>
	<a href="Login.jsp"> Login </a>
	
	</div> 
	
	</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script>
		var url_string=window.location.href;
		var url = new URL(url_string);
		var ErrorMessage = url.searchParams.get("ErrorMessage");
		$(document).ready(function()
		{
			$('#ErrorMessage').html(ErrorMessage);
		});
	</script>
	</body> 
	</html>

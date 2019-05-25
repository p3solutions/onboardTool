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
  background: url("images/bg.jpg") no-repeat center center fixed;
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
p{
font-family: "Courier New", "Courier", "Lucida Sans Typewriter", "Lucida Typewriter", "monospace";
 color:white;
}

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

    </style>
    <script>
    function res()
    {
    var x=document.getElementById("new_email").value;
    var f=document.loginForm;
    f.method="post";
    f.action="reset_password?email="+x;
    f.submit(); 
    }
    function res_uname()
    {
    var x=document.getElementById("neww_email").value;
    var y=document.getElementById("neww_roles").value;
    var z=document.getElementById("neww_projects").value;
    var f=document.loginForm;
    f.method="post";
    f.action="reset_uname.jsp?email="+x+"&role="+y+"&project="+z;
    f.submit();
    }
    function reset()
    {
    document.getElementById('side').style.display="block";
    document.getElementById('main').style.display="none";
    }
    function reset_uname()
    {
    document.getElementById('sides').style.display="block";
    document.getElementById('main').style.display="none";
    }
    </script>
    <script>
    function chekbox()
    {
    var x=document.getElementById("uname").value;
    var y=document.getElementById("pwd").value;
    if(x!='' && y!=''){
    document.getElementById("burton").disabled=false;
    }
   
    }
    </script>
  
<script type="text/javascript">
        function Clear() {
        document.getElementById("uname").value = "";
        document.getElementById("pwd").value = "";
        }
        </script> 
    
</head>
<body background="onboard/images/bg.jpg" onLoad="Clear();">
<br/><br/><br/><br/><br/>

<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Login JSP PAGE-----[INFO]");  %>
<jsp:include page="db_creation.jsp"/>
	<jsp:include page="tablecreation.jsp"/>
	
	
<div class="container" id="main">
  <div class="col-md-6 col-md-offset-3 col-sm-offset-3 col-sm-6">
  <section class="login-form">
    <form method="post" action="Login" role="login" name="loginForm">
&nbsp;&nbsp;<img src="images/logo1.png" id="imaage" style="margin:0px auto; text-align:center;" class="img-responsive" alt="" /><br/>
<div class="input-group">   
  <div class="input-group-addon" id="main_col">
                                         <span class="glyphicon glyphicon-user"></span>
                                               </div> 
<input type="text" name="usr" id="uname" placeholder="Username" onChange="chekbox()" required class="form-control input-lg" />                                    
                                               </div>  <br/>
                                               <div class="input-group">   
  <div class="input-group-addon" id="main_col">
                                         <span class="glyphicon glyphicon-lock"></span>
                                               </div> 
<input type="password" name="pwd" id="pwd" placeholder="Password" onChange="chekbox()"  required class="form-control input-lg" />                                 
                                               </div>  <br/>
<button type="submit" name="go" id="burton" class="btn btn-lg btn-primary btn-block" >Sign in</button><br/>
<div>
<a style="cursor:pointer; float:left;" onclick="reset_uname();">Forgot UserName?</a><a style="cursor:pointer; float:right;" onclick="reset();">Forgot password?</a>
</div>
</form>
</section>

</div>
</div>
<div class="container" style="display:none" id="side">

  <div class="col-md-6 col-md-offset-3 col-sm-offset-3 col-sm-6">
<h3><span style="color:white">Enter the recovery Mail Address</span></h3>
<div class="row"><div class="col-sm-12 text-center form-group"> 
<label>Email</label><input type="text" id="new_email" required class="form-control input-lg" /> 
<br/><button type="button" class="btn btn-primary" onclick="res()">Submit</button> </div>
</div>
</div>
</div>
<div class="container" style="display:none" id="sides">

  <div class="col-md-6 col-md-offset-3 col-sm-offset-3 col-sm-6">
<h3><span style="color:white">Enter the recovery Mail Address</span></h3>
<div class="row"><div class="col-sm-12 text-center form-group"> 
<label>Email</label><input type="text" id="neww_email" required class="form-control input-lg" />
<label>Roles</label><input type="text" id="neww_roles" required class="form-control input-lg" />
<label>Projects</label><input type="text" id="neww_projects" required class="form-control input-lg" /> 
<br/><button type="button" class="btn btn-primary" onclick="res_uname()">Submit</button> </div>
</div>
</div>
</div>
<footer>
  <div class="footer-copyright py-3 text-center">
       Copyright @2018:
        <a href="https://www.platform3solutions.com/">Platform3solutions</a>
        </br>
        <p>This product is the proprietary property of Platform3 Solutions and is only authorized to users with a valid license. If you do not have a license, please contact Platform3 Solutions or one of its partner representatives to obtain the required license.</p>
    </div>
</footer>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>

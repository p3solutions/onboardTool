<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="viewport" content="width=1,initial-scale=1,user-scalable=1"/>
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    
    <title>D3Sixty</title>
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
        height: 80.5%;
        top: 0;
        left: 0;
        margin: 0 auto;
        justify-content: center;
    }
    p {
        padding: 5px;
        color: #fff;
        font-size: 16px;
    }
    a {
        color: #92badd;
        display: inline-block;
        text-decoration: none;
        font-weight: 400;
    }
    a:hover {
        color: #fff;
        text-decoration: none;
    }
    .fa {
        font-size: 40px;
        text-align: center;
        color: DodgerBlue;
    }
    h2 {
        text-align: center;
        font-size: 16px;
        font-weight: 600;
        text-transform: uppercase;
        display: inline-block;
        margin: 40px 8px 10px 8px;
        color: #cccccc;
    }
    #para {
        padding: 5px;
        font-size: 13px;
        color: black;
        opacity: 0.4;
        padding: 2px;
        text-align: justify;
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
        -webkit-box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
        box-shadow: 0 30px 60px 0 rgba(0, 0, 0, 0.3);
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
        border-bottom: 2px solid #5fbae9;
    }
    /* FORM TYPOGRAPHY*/
    input[type=button], input[type=submit], input[type=reset] {
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
        -webkit-box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
        box-shadow: 0 10px 30px 0 rgba(95, 186, 233, 0.4);
        -webkit-border-radius: 5px 5px 5px 5px;
        border-radius: 5px 5px 5px 5px;
        margin: 5px 20px 40px 20px;
        -webkit-transition: all 0.3s ease-in-out;
        -moz-transition: all 0.3s ease-in-out;
        -ms-transition: all 0.3s ease-in-out;
        -o-transition: all 0.3s ease-in-out;
        transition: all 0.3s ease-in-out;
    }
    input[type=button]:hover, input[type=submit]:hover, input[type=reset]:hover {
        background-color: #39ace7;
    }
    input[type=button]:active, input[type=submit]:active, input[type=reset]:active {
        -moz-transform: scale(0.95);
        -webkit-transform: scale(0.95);
        -o-transform: scale(0.95);
        -ms-transform: scale(0.95);
        transform: scale(0.95);
    }
    input[type=text],input[type=password] {
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
        opacity: 0.2;
    }
    /* ANIMATIONS */
    /* Simple CSS3 Fade-in-down Animation */
    .fadeInDown {
        -webkit-animation-name: fadeInDown;
        animation-name: fadeInDown;
        -webkit-animation-duration: 1s;
        animation-duration: 1s;
        -webkit-animation-fill-mode: both;
        animation-fill-mode: both;
    }
    @-webkit-keyframes fadeInDown {
        0% {
            opacity: 0;
            -webkit-transform: translate3d(0, -100%, 0);
            transform: translate3d(0, -100%, 0);
        }
        100% {
            opacity: 1;
            -webkit-transform: none;
            transform: none;
        }
    }
    @keyframes fadeInDown {
        0% {
            opacity: 0;
            -webkit-transform: translate3d(0, -100%, 0);
            transform: translate3d(0, -100%, 0);
        }
        100% {
            opacity: 1;
            -webkit-transform: none;
            transform: none;
        }
    }
    /* Simple CSS3 Fade-in Animation */
    @-webkit-keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    @-moz-keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    @keyframes fadeIn {
        from {
            opacity: 0;
        }
        to {
            opacity: 1;
        }
    }
    .fadeIn {
        opacity: 0;
        -webkit-animation: fadeIn ease-in 1;
        -moz-animation: fadeIn ease-in 1;
        animation: fadeIn ease-in 1;
        -webkit-animation-fill-mode: forwards;
        -moz-animation-fill-mode: forwards;
        animation-fill-mode: forwards;
        -webkit-animation-duration: 1s;
        -moz-animation-duration: 1s;
        animation-duration: 1s;
    }
    .fadeIn.first {
        -webkit-animation-delay: 0.4s;
        -moz-animation-delay: 0.4s;
        animation-delay: 0.4s;
    }
    .fadeIn.second {
        -webkit-animation-delay: 0.6s;
        -moz-animation-delay: 0.6s;
        animation-delay: 0.6s;
    }
    .fadeIn.third {
        -webkit-animation-delay: 0.8s;
        -moz-animation-delay: 0.8s;
        animation-delay: 0.8s;
    }
    .fadeIn.fourth {
        -webkit-animation-delay: 1s;
        -moz-animation-delay: 1s;
        animation-delay: 1s;
    }
    /* Simple CSS3 Fade-in Animation */
    .underlineHover:after {
        display: block;
        left: 0;
        bottom: -10px;
        width: 0;
        height: 2px;
        background-color: #56baed;
        content: "";
        transition: width 0.2s;
    }
    .underlineHover:hover {
        color: #0d0d0d;
    }
    .underlineHover:hover:after {
        width: 100%;
    }
    /* OTHERS */
    *:focus {
        outline: none;
    }
    #icon {
        width: 50%;
    }
    * {
        box-sizing: border-box;
    }
    footer.page-footer .footer-copyright {
        overflow: hidden;
        background-color: rgba(0, 0, 0, .2);
        color: rgba(255, 255, 255, .6);
    }
    .text-center {
        text-align: center !important;
    }
    .pb-3, .py-3 {
        padding-bottom: 1rem !important;
    }
    .pt-3, .py-3 {
        padding-top: 1rem !important;
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
        font-size: 20px;
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
    .vldform__textbox[type="text"] {
        border: 0;
        outline: 0;
        border-bottom: 2px #2d73a8 solid;
        font-size: 14px;
        margin-top: 36px;
        background: #fff;
        padding-bottom: 9px;
        -webkit-border-radius: 0px;
        border-radius: 0px;
        width: 97%;
        text-align: left;
        padding: 0px;
    }
    .vldform__textbox[type="password"]::after {
        content: " ";
        display: block;
        width: 20px;
        height: 10px;
        background-color: rebeccapurple;
        width: 80%;
    }
    .vldform__recoverypassword {
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
    
    /* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  font-family: 'Poppins', sans-serif;
}

/* Modal Content */
.modal-content {
  position: relative;
  background-color: #fefefe;
  margin: auto;
  padding: 0;
  border: 1px solid #888;
  border-radius:8px;
  width: 40%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s;
  font-family: 'Poppins', sans-serif;
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.close {
  color: #0b3360;
  float: right;
  font-size: 28px;
  padding: 0.5rem 0.5rem;
  margin: 0px -12px 0px 0px;
  font-weight: none;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding: 2px 16px;
  background-color:#1565c0 ;
  color: white;
  border-radius:7px 7px 0px 0px;
  
}

.modal-body {
padding: 2px 16px;
margin-bottom:10px;
}

.modal-footer {
  padding: 2px 16px;
  background-color: #5cb85c;
  color: white;
}

.versioninfo
{
font-size:95%;
font-weight:550;
font-family:sans-serif;
}

</style>
<body onLoad="Clear();">
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@page import="onboard.DBconnection"%>
<%@page import="org.owasp.encoder.Encode" %>
<%@ page import="java.util.ResourceBundle"%>
	<%
	ResourceBundle resource = ResourceBundle.getBundle("VersionInfo");
	ResourceBundle resource1 = ResourceBundle.getBundle("Configuration");
	String versioninfo = resource.getString("VERSION");
	String ssologinurl = resource1.getString("SSOLOGINURL");
	String authtype = resource1.getString("AUTHTYPE");
	System.out.println("Version" + versioninfo);
	System.out.println("SSOURL" + ssologinurl);
	%>
	
	<%
 
  if(authtype.equals("SSO"))
 {
	 response.sendRedirect(ssologinurl);
 }
 
 %>
	
	
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Login JSP PAGE-----[INFO]"); %>
<jsp:include page="db_creation.jsp"/>
<jsp:include page="tablecreation.jsp"/>
<div class="wrapper fadeInDown">
    <!-- Login form -->
    <form class=" vldauth" action="Login" method="POST" name="loginForm">
        <div id="formContent">
            <!-- Tabs Titles -->
            <h2 class="active"></h2>
            <!-- Icon -->
            <div class="fadeIn first">
                <img src="images/logo1.png" style="margin:0px auto; text-align:center;" id="icon" alt=""/>
            </div>
            <br>
            <!-- Login Form -->
            <input type="text" id="uname" class="fadeIn second" name="usr" placeholder="Username">
            <input type="password" id="pwd" class="fadeIn third" name="pwd" placeholder="Password">
            <input type="submit" id="button" name="go" class="fadeIn fourth" value="Log In">
            <!-- Remind Passowrd -->
            <div id="formFooter">
                <!-- <a class="underlineHover" href="#" onclick="showuserform()">Forgot Username?/</a>
                <a class="underlineHover" href="#" onclick="showrecoveryform()">Forgot Password?</a> -->
            </div>
        </div>
    </form>
    <!-- Login form -->
    <!-- Password Recovery form -->
    <form class="vldform1 vldrecpass" method="POST" name="forgot_login">
        <i class="fa fa-lock" aria-hidden="true"></i>
        <div><h1>Forgot Your Password? </h1>
            <p id="para">Enter your e-mail address and we will send you a link to reset your password</p></div>
        <input class="vldform__textbox" type="email" name="new_email" id="new_email" placeholder="E-mail Address"
               required>
        <input class="vldform__button" type="submit" onclick="pwdrecovery()" value="Recovery">
    </form>
    <!-- Password Recovery form -->
    <!-- Username Recovery form -->
    <form class="vldform1 vlduser" action="" method="POST" name="reset_login">
        <h1>Username Recovery</h1>
        <input class="vldform__textbox" type="email" name="email" id="neww_email" placeholder="Email" required>
        <input class="vldform__textbox" type="text" name="role" id="neww_roles" placeholder="Role" required>
        <input class="vldform__textbox" type="text" name="project" id="neww_projects" placeholder="Projects" required>
        <input class="vldform__button" type="submit" onclick="reset_uname()" value="Recovery">
    </form>
    <!-- Username Recovery form -->
</div>
<!-- Footer -->
<footer class="page-footer font-small blue">
    <!-- Copyright -->
    <div class="footer-copyright text-center py-3"><p>This product is the proprietary property of Platform 3 Solutions
        and is only authorized to users with a valid license. If you do not have a license, please contact Platform 3
        Solutions or one of its partner representatives to obtain the required license.</p>D3Sixty&nbsp;<img src="images/info.png" id="myBtn"width="10px" height="10px">&nbsp;Copyright © 2022 <a href="https://www.Platform3solutions.com"> Platform 3 Solutions.</a>All Rights Reserved.
    </div>
    
    <!-- Copyright -->
</footer>

<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      <span class="close">&times;</span>
      <h3 style=" font-family: 'Poppins', sans-serif;">About</h3>
    </div>
    <div class="modal-body">
     <center><img src="images/D3Sixty_logo.png" style="width: 60%;margin-top:5px;"></center>
     
     <center>
											<label class="versioninfo" for="formInput526">Version :
												<%=versioninfo%></label>
										</center>
										<center><label class="versioninfo">Copyright
											&copy; 2022 <a href="https://platform3solutions.com/" style="color:#0d6efd;font-weight:550;">Platform
												3 Solutions.</a> All Rights Reserved.
										</label></center>
										<center>
											<label class="versioninfo" margin-bottom:10px;>Trademarks
												owned by Platform 3 Solutions </label>
										</center>
    </div>
    
  </div>

</div>


<!-- Footer -->
<!-- Script -->

<script>
    //------------------------------Password Recovery Form Hide Start------------------------------//
    function showrecoveryform() {
        document.title = "Password Recovery";
        document.querySelector(".vldauth").style.display = "none";
        document.querySelector(".vldrecpass").style.display = "flex";
    }
    //------------------------------Password Recovery Form Hide End------------------------------//
    //------------------------------User Name Recovery Form Hide Start------------------------------//
    function showuserform() {
        document.title = "Username Recovery";
        document.querySelector(".vldauth").style.display = "none";
        document.querySelector(".vlduser").style.display = "flex";
    }
    //------------------------------User Name Recovery Form Hide Start------------------------------//
    //------------------------------Reset the Password Recovery Start------------------------------//
    function pwdrecovery() {
        var x = document.getElementById("new_email").value;
        //var filter = /^[w-.+]+@[a-zA-Z0-9.-]+.[a-zA-z0-9]{2,4}$/;
        var check=false;
        if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(x)) {
        check=true;
        }
        if(x!=""&&check==true){
            var f = document.forgot_login;
            f.method = "post";
            f.action = "reset_password?email=" + x;
            f.submit();
        }
        else{
            alert("Please fill the valid Email Address");
        }
        arc
    }
    //------------------------------Reset the Password Recovery  End------------------------------//
    //------------------------------Reset the user name Start------------------------------//
    function reset_uname() {
        var x = document.getElementById("neww_email").value;
        var y = document.getElementById("neww_roles").value;
        var z = document.getElementById("neww_projects").value;
        if(x!=""&&y!=""&&z!="") {
            var f = document.reset_login;
            f.method = "post";
            f.action = "reset_uname.jsp?email=" + x + "&role=" + y + "&project=" + z;
            f.submit();
        }
        else {
            alert("Please fill the input fields.");
        }
    }
    //------------------------------Reset the user name End------------------------------//
    //------------------------------Clear Function Start------------------------------//
    function Clear() {
        document.getElementById("uname").value = "";
        document.getElementById("pwd").value = "";
    }
    //------------------------------Clear Function End------------------------------//
</script>

<script>
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
</body>
</html>
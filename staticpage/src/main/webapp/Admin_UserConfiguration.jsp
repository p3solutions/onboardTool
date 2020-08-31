<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <title>UserConfiguration Page</title>
    <a href="Admin_Role_Details.jsp">
    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>

    <link rel="stylesheet" href="styles/styles.css" type="text/css"/>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>


    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css"
          rel="stylesheet" type="text/css"/>
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
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/icheck/skins/line/red.css">
    <link rel="stylesheet" href="css/icheck/skins/line/green.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <style type="text/css">
        .breadcrumb-div {
            background-color: #e7e7e7;
            color: #010101;
        }
    </style>
    <style>
        .selectBox {
            position: static;
        }

        .overSelect {
            position: static;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
        }

        .overSelect1 {
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
        }

        #checkboxes {
            width: auto;
            height: auto;
            overflow: scroll;
            display: none;
            border: 1px #dadada solid;
        }

        #checkboxes label {
            display: block;
        }

        #checkboxes label:hover {
            background-color: #eff5f5;
        }

        #checkboxes {
            background-color: white;
        }

        #app {
            width: auto;
            height: auto;
            overflow: scroll;
            display: none;
            border: 1px #dadada solid;
        }

        #app label {
            display: block;
        }

        #app label:hover {
            background-color: #eff5f5;
        }

        #app {
            background-color: white;
        }

    </style>

    <style>

        .glyphicon.glyphicon-asterisk {
            color: red;
            font-size: 6px;
        }

    </style>

    <script>
        function calls() {
            var x = document.getElementById('myDiv1');
            if (x.style.display === 'none') {
                x.style.display = 'block';
            } else {
                x.style.display = 'none';
            }

        }
    </script>
    <script>
        var har = [];
        var his = [];

        function oop(name) {

            if (har.indexOf(name) >= 0) {
                var i = har.indexOf(name);
                if (i != -1) {
                    har.splice(i, 1);
                }
            } else
                har.push(name);
        }

        function ops(name) {

            if (his.indexOf(name) >= 0) {
                var i = his.indexOf(name);
                if (i != -1) {
                    his.splice(i, 1);
                }
            } else
                his.push(name);
        }


        function servlet_call() {
            var f = document.loginForm;
            f.method = "post";
            f.action = 'deactivate?values=' + har + '&values2=' + his;
            f.submit();
        }
    </script>
    <script>
        var arr = "";

        function ooo() {
            var e = document.getElementById("dates-field2");
            for (i = 0; i < 9; i++) {
                if (e[i].selected == true) {
                    arr = arr + (e[i].value);
                }
            }

        }

        function qq() {
            var msg = document.getElementById("message").value;
            var ffname = document.getElementById("fname").value;
            var llname = document.getElementById("lname").value;
            var email = document.getElementById("email_val").value;
            var project = document.getElementById('proj').value;
            var app = document.getElementById('projapp').value;
            //window.alert(project);
            if (ffname === "" || llname === "" || arr === "")
                window.alert("fill the mandatory fileds");
            else {
                if ((email.includes("@")) && (email.includes(".com"))) {

                    var f = document.loginForm;
                    f.method = "post";
                    f.action = "Admin_Module_Send_Invites_Mail?roless=" + arr + "&mailid=" + email + "&message=" + msg + "&fname=" + ffname + "&lname=" + llname + "&project=" + project + "&application=" + app;
                    f.submit();
                } else
                    window.alert("Invalid EmailID");
            }
        }
    </script>
    <script>
        function checkk() {

            document.getElementById('fname').readOnly = true;
            document.getElementById('message').readOnly = true;
            document.getElementById('lname').readOnly = true;
            document.getElementById('dates-field2').disabled = true;
            document.getElementById('email_val').readOnly = true;
            document.getElementById('proj').readOnly = true;
            document.getElementById('send_btn').disabled = true;
        }
    </script>
</a>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Admin_UserConfiguration JSP PAGE-----[INFO]"); %>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.

    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
    HttpSession details = request.getSession();
    String prjname = (String) details.getAttribute("nameofproject");
    String info = (String) details.getAttribute("admin");

    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool", "root", "password123");
    String query = "select * from Admin_UserDetails";
    String query1 = "select * from Admin_UserDetails";
    Statement s = conn.createStatement();
    Statement s1 = conn.createStatement();
    ResultSet rs = s.executeQuery(query);
    ResultSet rs1 = s1.executeQuery(query1);
    String query2 = "select * from AppEmphazize_ProjectDetails";
    Statement s2 = conn.createStatement();
    ResultSet rs2 = s2.executeQuery(query2);
    int count = 0;
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
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                            data-target="#navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <i class="fa fa-ellipsis-v"></i>
                    </button>
                    <button type="button" class="navbar-toggle mobile-nav-toggle">
                        <i class="fa fa-bars"></i>
                    </button>
                </div>
                <!-- /.navbar-header -->
                <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=prjname %>
                </a>

                <div class="collapse navbar-collapse" id="navbar-collapse-1">

                    <!-- /.nav navbar-nav -->
                    <ul class="nav navbar-nav navbar-right">

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
</div>


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
                                    <a href="User_Configuration.jsp"><i class="fa fa-file-text"></i>
                                        <span>User Configuration</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="Admin_Userslist.jsp"><i class="fa fa-paint-brush"></i>
                                        <span>Users List</span> </a>
                                </li>

                                <li>
                                    <a href="Admin_Role_Details.jsp"><i class="fa fa-map-signs"></i>
                                        <span>Authorization </span> </a>
                                </li>
                            </ul>

                        </div>
                    </div>

                </div>
            </div>
        </div>

    </form>

</body>
</html>

                <!-- Projects List Start -->


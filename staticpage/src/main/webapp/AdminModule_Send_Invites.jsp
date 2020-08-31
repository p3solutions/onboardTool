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

        /*.overSelect1 {
            position: absolute;
            left: 0;
            right: 0;
            top: 0;
            bottom: 0;
        }*/

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
            console.log("koomkortf",project);
            var app = document.getElementById('projapp').value;

            //window.alert(project);
            if (ffname === "" || llname === "" || arr === "")
                window.alert("fill the mandatory fileds");
            else {
                if ((email.includes("@")) && (email.includes(".com"))) {

                    var f = document.loginForm;
                    f.method = "post";
                    f.action = "Admin_Module_Send_Invites_Mail?=roless" + arr + "&mailid=" + email + "&message=" + msg + "&fname=" + ffname + "&lname=" + llname + "&project=" + project + "&application=" + app;
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


    <script type="application/javascript">
        $(document).ready(function () {
            var html_code = '';
            $('#proj').click(function () {
                $.ajax({
                    url: 'Admin_Module_Send_Invites',
                    type: 'post',
                    dataType: 'json',
                    success: function (data) {
                        var userlistdiv = $('#projects_id');
                        console.log("sample----->", data);
                        //var testing=$("#projects_id").append("<option value='0'>Select player...</option>");
                        var testing = "";
                        //$("#projects_id").append("<option value='" +key+ "'>" + value + "</option>")
                        $('#checkboxes').html('');
                        $.each(data, function (key, value) {
                            //testing+= '<option value=' +key+ '>' + value + '</option>';
                            var label = '<label for=' + value + '><input type="checkbox" id=' + value + ' class="op" value=' + value + ' onclick="CheckForm(this.value);ChecForm();">' + value + '</label>';
                            $('#checkboxes').append(label);
                        });


                    }
                });


            });
        });

        /*$(document).ready(function () {

            //var table_data={"mydata":{header: heads, data: data},"selectedEmail":selectedEmail};
            $('#projapp').click(function () {
                var proj = $('#proj').val();
                //alert("appname---->"+proj);
                //var projectname="";
                $.ajax({
                    url: 'Admin_Module_Applications_Info',
                    type: 'post',
                    data: {proj: proj},
                    dataType: 'json',
                    success: function (data) {
                        //alert("sample 1---->", data)
                    }
                });


            });
        });*/
         function appdrop1(proj,checking) {

              $.ajax({
                  url: 'Admin_Module_Applications_Info',
                  type: 'post',
                  data: {proj: proj},
                  dataType: 'json',
                  success: function (data) {
                      if(checking==true)
                      {
                         $.each(data,function(key,value)
                          {
                              var str3 = '<label for="' + proj + "-" + value + '"> <input type="checkbox" id="' + proj + "-" + value + '"class="oppp" value="' + proj + "-" + value + '"onclick="ChecForm();"> ' + proj + "-" + value + '</label>';
                              $('#app').append(str3);
                          });
                      }
                      else {
                          $.each(data,function(key,value)
                          {
                              var remove_element="label[for=" + proj + "-" + value + "]";
                              var string_variabe=remove_element.toString();
                              $(string_variabe).remove();
                          });

                      }


                  }
              });
          }

    </script>

    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/css/bootstrap-select.min.css"/>

</head>
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
                                    <a href="Admin_UserConfiguration.jsp"><i class="fa fa-file-text"></i> <span>User Configuration</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="Admin_Userslist.jsp"><i class="fa fa-paint-brush"></i>
                                        <span>Users List</span> </a>
                                </li>

                                <li>
                                    <a href="Admin_Roledetails.jsp"><i class="fa fa-map-signs"></i>
                                        <span>Authorization </span> </a>
                                </li>
                            </ul>

                        </div>
                        <!-- /.sidebar-nav -->
                    </div>
                    <!-- /.sidebar-content -->
                </div>
                <!-- /.left-sidebar -->


                <!-- Projects List Start -->

                <div class="main-page">
                    <section>
                        <div class="row">
                            <div class="col-md-12">

                                <div id="config" class="tabcontent">
                                    <div class="container-fluid">
                                        <br/>
                                        <div class="col-sm-12">
                                            <br/>
                                            <div class="row">
                                                <div class="col-sm-12">
                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">

                                                            <label><b> First Name</b>
                                                                <span
                                                                        class="glyphicon glyphicon-asterisk"></span>
                                                            </label>
                                                            <input type="text" id="fname" name="fname"
                                                                   class="form-control"/>
                                                        </div>
                                                        <div class="col-sm-6 form-group">

                                                            <label for="comment">Message</label>
                                                            <textarea class="form-control" rows="5"
                                                                      id="message"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label>Last Name<span
                                                                    class="glyphicon glyphicon-asterisk"></span></label>
                                                            <input type="text" class="form-control" id="lname">
                                                        </div>
                                                        <div class="col-sm-6 form-group">
                                                            <label>Email<span
                                                                    class="glyphicon glyphicon-asterisk"></span></label>
                                                            <input type="email" class="form-control" id="email_val">
                                                        </div>
                                                    </div>
                                                   <%-- <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label>Role Name<span
                                                                    class="glyphicon glyphicon-asterisk"></span></label>
                                                            <div class="col-lg-12">
                                                                <select id="dates-field2"
                                                                        class="selectpicker multiselect-ui form-control"
                                                                        data-show-subtext="true"
                                                                        data-live-search="true" &lt;%&ndash;multiple="multiple"&ndash;%&gt;>
                                                                    <option data-subtext="Archival Admin">
                                                                        ArchivalAdmin
                                                                    </option>
                                                                    <option data-subtext="Legacy Technical SME">
                                                                        LegacyTechnicalSME
                                                                    </option>
                                                                    <option data-subtext="Legacy Business SME">
                                                                        LegacyBusinessSME
                                                                    </option>
                                                                    <option data-subtext="Archival Program Manager">
                                                                        ArchivalProgramManager
                                                                    </option>
                                                                    <option data-subtext="Archival Project Manager">
                                                                        ArchivalProjectManager
                                                                    </option>
                                                                    <option data-subtext="Legacy Program Manager">
                                                                        LegacyProgramManager
                                                                    </option>
                                                                    <option data-subtext="Archival Business Analyst">
                                                                        ArchivalBusinessAnalyst
                                                                    </option>
                                                                    <option data-subtext="Archival Technical Lead">
                                                                        ArchivalTechnicalLead
                                                                    </option>
                                                                    <option data-subtext="Archival Developer">
                                                                        ArchivalDeveloper
                                                                    </option>
                                                                    <option data-subtext="Test Lead">TestLead</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>--%>
                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <label>Role Name<span
                                                                    class="glyphicon glyphicon-asterisk"></span></label>
                                                            <div class="col-lg-12">
                                                                <select id="dates-field2"
                                                                        class="multiselect-ui form-control"
                                                                        multiple="multiple" name="myOption">
                                                                    <option value="ArchivalAdmin">archival admin
                                                                    </option>
                                                                    <option value="LegacyTechnicalSME">legacy technical
                                                                        sme
                                                                    </option>
                                                                    <option value="LegacyBusinessSME">legacy business
                                                                        sme
                                                                    </option>
                                                                    <option value="ArchivalProgramManager">archival
                                                                        program manager
                                                                    </option>
                                                                    <option value="ArchivalProjectManager">archival
                                                                        project manager
                                                                    </option>
                                                                    <option value="LegacyProgramManager">legacy
                                                                        program/project manager
                                                                    </option>
                                                                    <option value="ArchivalBusinessAnalyst">archival
                                                                        business analyst
                                                                    </option>
                                                                    <option value="ArchivalTechnicalLead">archival
                                                                        technical lead
                                                                    </option>
                                                                    <option value="ArchivalDeveloper">archival
                                                                        developer
                                                                    </option>
                                                                    <option value="TestLead">test lead</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <script type="text/javascript">
                                                        $(function () {
                                                            $('.multiselect-ui').multiselect({
                                                                includeSelectAllOption: true
                                                            });
                                                        });
                                                    </script>

                                                    <div class="row">
                                                        <div class="col-sm-6 form-group">
                                                            <%--<div class="multiselect">
                                                                <label>Projects<span
                                                                        class="glyphicon glyphicon-asterisk"></span></label>
                                                                <div class="col-lg-12 selectBox"
                                                                     onclick="showCheckboxes();">
                                                                    <select id="projects_id" name="projects_id"
                                                                            class="form-control"
                                                                             required>
                                                                        <option class="overSelect" id="checkboxes" name="checkboxes">

                                                                            &lt;%&ndash; <% while (rs2.next()) { %>
                                                                            <label for=<%=rs2.getString("projectname")%>><input
                                                                                    type="checkbox"
                                                                                    id=<%=rs2.getString("projectname")%> class="op"
                                                                                    value=<%= rs2.getString("projectname")%> onclick="CheckForm(this.value);ChecForm();"> <%=rs2.getString("projectname") %>
                                                                            </label>
                                                                            <%}%>&ndash;%&gt;

                                                                        </option>

                                                                    </select>
                                                                </div>
                                                            </div>--%>


                                                            <div class="multiselect">
                                                                <label>Projects</label>
                                                                <div class="selectBox" onclick="showCheckboxes();">
                                                                    <input type="textbox"
                                                                           style="background-color:white;" id="proj"
                                                                           class="form-control" name="proj" onChange=""
                                                                           onclick="" value="" readonly required>
                                                                    <div class="overSelect"></div>
                                                                </div>
                                                                <div id="checkboxes" name="checkboxes">
                                                                    <%--<% while (rs2.next()) { %>
                                                                    <label for=<%=rs2.getString("projectname")%>><input
                                                                            type="checkbox"
                                                                            id=<%=rs2.getString("projectname")%> class="op"
                                                                            value=<%= rs2.getString("projectname")%> onclick="CheckForm(this.value);ChecForm();"> <%=rs2.getString("projectname") %>
                                                                    </label>
                                                                    <%}%>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <%--<script>
                                                            function calx() {

                                                                var prj = document.getElementById('proj').value;
                                                                var select = document.getElementById("app");


                                                                var length = select.options.length;
                                                                document.getElementById("app").options.length = 0;

                                                                var options = [];
                                                                var option = document.createElement('option');
                                                                var i;
                                                                var prjarray = [];
                                                                var apparray = [];
                                                                <% String query3="select appname,prjname from AppEmphazize_ApplicationInfo";
                                                                Statement s3=conn.createStatement();
                                                                ResultSet rs3=s3.executeQuery(query3);

                                                                while(rs3.next()){
                                                                %>

                                                                apparray.push("<%=rs3.getString("appname") %>");
                                                                prjarray.push("<%=rs3.getString("prjname") %>");
                                                                <%

                                                           }
                                                           %>

                                                                var k = 0;
                                                                for (i = 0; i <= prjarray.length; i++) {
                                                                    if (prj == prjarray[i]) {

                                                                        option.text = option.value = apparray[i];
                                                                        options.push(option.outerHTML);

                                                                    }

                                                                }
                                                                select.insertAdjacentHTML('beforeEnd', options.join('\n'));
                                                            }

                                                        </script>--%>
                                                        <script type="text/javascript">
                                                            function CheckForm(val) {

                                                                var element = document.getElementsByClassName("op");
                                                                var txt = "";
                                                                var options1;
                                                                var eindex = 0;
                                                                for (var i = 0; i < element.length; i++) {
                                                                    if (element[i].checked) {
                                                                        txt = txt + element[i].value + ",";
                                                                        eindex = eindex + 1;
                                                                    }
                                                                }
                                                                var txt1 = txt.substring(0, txt.length - 1);
                                                                document.getElementById("proj").value = txt1;
                                                                var checking = document.getElementById(val).checked;
                                                                appdrop1(val, checking);
                                                            }
                                                        </script>
                                                        <script type="text/javascript">
                                                            function ChecForm() {
                                                                var element = document.getElementsByClassName("oppp");
                                                                var txt = "";
                                                                for (var i = 0; i < element.length; i++) {
                                                                    if (element[i].checked)
                                                                        txt = txt + element[i].value + ",";
                                                                }
                                                                var txt1 = txt.substring(0, txt.length - 1);
                                                                document.getElementById("projapp").value = txt1;

                                                            }
                                                        </script>
                                                      <%--  <script type="text/javascript">
                                                            var lindex = 0;

                                                            /*function appdrop(eindex, val, checking) {
                                                                //alert("val"+val+"eindex"+eindex+"checking"+checking);

                                                                var txt1 = document.getElementById("proj").value;
                                                                var pro = [];
                                                                var ap = [];
                                                                var txt = txt1.split(",");
                                                                var projects = "";
                                                                var apps = "";
                                                                &lt;%&ndash;<% String query4="select appname,prjname from AppEmphazize_ApplicationInfo";
                                                                Statement s4=conn.createStatement();
                                                                 ResultSet rs4=s4.executeQuery(query4);
                                                                 while(rs4.next())
                                                                {%>
                                                                <% String str=rs4.getString("prjname"); %>
                                                                pro.push("<%=str%>");
                                                                projects = projects + "," + "<%=str%>";
                                                                <% String str1=rs4.getString("appname");%>
                                                                ap.push("<%=str1%>");
                                                                apps = apps + "," + "<%=str1%>";
                                                                <%}%>&ndash;%&gt;
                                                                var projects1 = projects.substring(1, projects.length - 1);
                                                                var apps1 = apps.substring(1, apps.length - 1);
                                                                var apps2 = apps1.split(",");
                                                                var projects2 = projects1.split(",");
                                                                var labeop = document.getElementById("proj").value;
                                                                var select = $('#app');
                                                                var len = 0;
                                                                var oplen = document.getElementsByClassName("oppp").length;
                                                                var options1 = [];
                                                                /!*if statement get executed when a project check box is true  *!/
                                                                if (checking == true) {
                                                                    var k = 0;
                                                                    while (k < pro.length) {

                                                                        var projw = pro[k].toString();
                                                                        var appw = ap[k].toString();

                                                                        if (val === projw) {
                                                                            var pa = val + "-" + appw;
                                                                            var appww = ap[k].replace(/\s/g, '');
                                                                            options1.push(pa);
                                                                            var str3 = '<label for="' + val + "-" + appww + '"> <input type="checkbox" id="' + val + "-" + appww + '"class="oppp" value="' + val + "-" + appw + '"onclick="ChecForm();"> ' + val + "-" + appw + '</label>';
                                                                            /!*adding applications in application drop down for respective checked project  *!/
                                                                            select.append(str3);
                                                                            len = len + 1;
                                                                        }
                                                                        k = k + 1;
                                                                    }
                                                                }
                                                                /!*else statement get executed when project check box is false  *!/
                                                                else {
                                                                    var k = 0;
                                                                    while (k < pro.length) {

                                                                        var projw = pro[k].toString();
                                                                        var appw = ap[k].toString();
                                                                        if (val === projw) {
                                                                            var appww = ap[k].replace(/\s/g, '');
                                                                            var pa = "label[for=" + val + "-" + appww + "]";
                                                                            options1.push(pa);
                                                                            var val1 = pa.toString();
                                                                            /!*removing applications in application drop down for respective unchecked project  *!/
                                                                            $(val1).remove();
                                                                            var elem = document.getElementById(pa);
                                                                        }
                                                                        k = k + 1;
                                                                    }
                                                                }
                                                            }*/
                                                        </script>--%>
                                                        <script>
                                                            var expanded = false;

                                                            function showCheckboxes() {
                                                                var checkboxes = document.getElementById("checkboxes");
                                                                if (!expanded) {
                                                                    checkboxes.style.display = "block";
                                                                    expanded = true;
                                                                } else {
                                                                    checkboxes.style.display = "none";
                                                                    expanded = false;
                                                                    /* CheckForm(); */
                                                                }
                                                            }
                                                        </script>
                                                        <script>
                                                            var expanded = false;

                                                            function shoCheckboxes() {
                                                                var checkboxes = document.getElementById("app");
                                                                if (!expanded) {
                                                                    checkboxes.style.display = "block";
                                                                    expanded = true;
                                                                } else {
                                                                    checkboxes.style.display = "none";
                                                                    expanded = false;
                                                                    /* CheckForm(); */
                                                                }
                                                            }
                                                        </script>
                                                        <div class="col-sm-6 form-group" id="cont">
                                                            <div class="multiselect">
                                                                <label>Applications</label>
                                                                <div class="selectBox" onclick="shoCheckboxes();">
                                                                    <input type="textbox"
                                                                           style="background-color:white;" id="projapp"
                                                                           class="form-control" name="proj" onChange=""
                                                                           onclick="CheckForm();" value="" readonly
                                                                           required>
                                                                    <div class="overSelect1"></div>
                                                                </div>
                                                                <div id="app">

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <br/>
                                                    <input type="hidden" id="pwqej" value="<%= info %>" hidden>
                                                    <button type="button" class="btn btn-primary" id="send_btn"
                                                            onclick="ooo();qq();">Send Invites
                                                    </button>
                                                    <br/>
                                                    <hr/>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>


    </form>


</div>
<!-- /.col-md-6 -->

</div>
<!-- /.row -->

</section>
<!-- /.section -->

</div>
<!-- /.main-page -->

<!-- Project List End -->

</div>
<!-- /.content-container -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->


<script>
    if (document.getElementById('pwqej').value == "R")
        checkk();
</script>


<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>


<script type="text/javascript">
    $(document).ready(function () {
        $(".lis").click(function () {
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
        });
        $(".gr").click(function () {
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


<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.6.3/js/bootstrap-select.min.js"></script>
<!-- ========== THEME JS ========== -->

<script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>


<!-- ========== THEME JS ========== -->
<script>
    $(function ($) {

        // 1st  datepicker
        $('#basicExample .time').timepicker({
            'showDuration': true,
            'timeFormat': 'g:ia'
        });

        $('#basicExample .date').datepicker({
            'format': 'm/d/yyyy',
            'autoclose': true
        });

        var basicExampleEl = document.getElementById('basicExample');
        var datepair = new Datepair(basicExampleEl);

        // 2nd  datepicker
        $('#datetimepicker1').datetimepicker({
            debug: true
        });

        // 3rd  datepicker
        $('#datetimepicker9').datetimepicker({
            viewMode: 'years'
        });

        // 4th  datepicker
        $('#datetimepicker10').datetimepicker({
            viewMode: 'years',
            format: 'MM/YYYY'
        });

        // 5th  datepicker
        $('#datetimepicker11').datetimepicker({
            daysOfWeekDisabled: [0, 6]
        });

        // 6th  datepicker
        $('#datetimepicker12').datetimepicker({
            inline: true,
            sideBySide: true
        });
    });
</script>


</body>
</html>



<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>

    <title>List Page</title>

    <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport'/>
    <meta name="viewport" content="width=device-width"/>

    <link rel="stylesheet" href="styles/styles.css" type="text/css"/>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>

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
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>

    <style type="text/css">
        .breadcrumb-div {
            background-color: #e7e7e7;
            color: #010101;
        }


        #nav_userid {
            color: green;
        }

        #nav_role {
            color: blue;
        }

        .bootstrap-dialog-message {
            width: 250px;
            border: 3px;
            padding: 0px;
            margin: auto;
        }
    </style>

    <script>

        var datatable;
        /*var har = [];
        var his = [];*/

        /* function selectCheck(name) {

             if (har.indexOf(name) >= 0) {
                 var i = har.indexOf(name);
                 if (i != -1) {
                     har.splice(i, 1);
                 }
             } else
                 har.push(name);
         }*/

        /*  function selectCheckDeac(name) {

              if (his.indexOf(name) >= 0) {
                  var i = his.indexOf(name);
                  if (i != -1) {
                      his.splice(i, 1);
                  }
              } else
                  his.push(name);
          }*/


    </script>

    <script>
        /*  var populate = "";

          function del(cnt) {
              for (var i = 0; i < cnt; i++) {
                  if (document.getElementsByName('delete_check')[i].checked) {
                      var name = document.getElementsByName('name_user' + i)[0].value;
                      populate = populate + name + ",";

                  }
              }
          }*/

        /* function deluser() {

             var f = document.loginForm;
             f.method = "post";
             f.action = 'delete_users?array=' + populate;
             f.submit();

         }*/

    </script>
    <%--<script>
        function checkk() {

            document.getElementById('add_btn').disabled = true;
            document.getElementById('del_btn').disabled = true;
            document.getElementById('sub_btn').disabled = true;
            for (i = 0; i < 50; i++) {
                document.getElementsByName('delete_check')[i].disabled = true;
                document.getElementsByName('chek')[i].disabled = true;
            }
        }
    </script>--%>

</head>
<body class="top-navbar-fixed">
<%
    HttpSession details = request.getSession();
    String info = (String) details.getAttribute("admin");
    String prjname = (String) details.getAttribute("nameofproject");
%>
<%--<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>--%>
<%--<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Admin_UsersList JSP PAGE-----[INFO]"); %>


<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>--%>
<%--<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.

    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
    }
%>--%>
<%--<%
    HttpSession details = request.getSession();
    String info = (String) details.getAttribute("admin");
    String prjname = (String) details.getAttribute("nameofproject");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding", "root", "password123");
    String query = "select * from Admin_UserDetails";
    Statement s = conn.createStatement();
    ResultSet rs = s.executeQuery(query);

%>--%>
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
                        <%
                            String uname = (String) details.getAttribute("username");
                            String role = (String) details.getAttribute("role");%>
                        <li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span
                                id='nav_role'><%=role%></span></a></li>
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
                                    <a href="User_Configuration.jsp"><i class="fa fa-file-text"></i> <span>User Configuration</span>
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

                                <div class="content">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="card">
                                                    <div class="header">
                                                        <h4 class="title" style="text-align: center">Modify the List Of
                                                            User</h4>
                                                    </div>
                                                    <div class="content table-responsive table-full-width">
                                                        <table class="table table-hover table-striped" id="datatable">
                                                            <thead>

                                                            <th>UserName</th>
                                                            <th>FirstName</th>
                                                            <th>LastName</th>
                                                            <th>Email</th>
                                                            <th>Project</th>
                                                            <th>Application</th>
                                                            <th>Select</th>
                                                            <th></th>
                                                            </thead>
                                                            <tbody>

                                                            </tbody>
                                                        </table>
                                                        <div class="col-md-12">
                                                            <input type="hidden" id="role_conf" value="<%= info %>"
                                                                   hidden>
                                                            &nbsp;&nbsp;


                                                        </div>
                                                    </div>
                                                    <br><br>

                                                    <button type="button" id="add_btn" class="btn btn-primary"
                                                            onclick="window.location.href='Registration.jsp'">
                                                        Add User
                                                    </button>
                                                    &nbsp;&nbsp;

                                                    &nbsp;&nbsp;

                                                    <button type="button" id="edit_button" name="edit_button"
                                                            class="btn btn-primary">
                                                        Edit User
                                                    </button>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </form>
</div>
<script>
    var data_row_id;
    var projects;
    var application;

    /*  if (document.getElementById('role_conf').value == "R")
          checkk();*/

    function selectRow(obj) {
        data_row_id = datatable.row($(obj).closest('tr')).data()[7];
        projects = datatable.row($(obj).closest('tr')).data()[4];
        application = datatable.row($(obj).closest('tr')).data()[5];
    }
</script>
<script>
    datatable = $('#datatable');
    $(document).ready(function () {

        $.ajax({
            url: 'Modify_List_Users_Table',
            type: 'post',
            dataType: 'json',
            success: function (data) {
                console.log("data--->", data);
                var tablevalue = "";
                $.each(data, function (index, jsonObject) {
                    tablevalue = ""
                    tablevalue += '<tr>';
                    $.each(jsonObject, function (key, val) {

                        if (key == 'id') {
                            tablevalue += '<td><input class="single_Checkbox" type="checkbox" id="checkbox_id" name="checkbox_id" onchange="selectRow(this)"/> </td>';
                            tablevalue += '<td> ' + val + ' </td>'
                        } else {
                            tablevalue += '<td>' + val + '</td>';
                        }

                    });
                    tablevalue += '</tr>';
                    datatable.append(tablevalue)
                });
                datatable = $('#datatable').DataTable(
                    {
                        /*responsive: true*/
                    }
                );
                /*new $.fn.dataTable.FixedHeader( datatable );*/
                datatable.columns([7]).visible(false);

            }
        });
    });

    $(document).ready(function () {
        $(document).on('change', ".single_Checkbox", function () {
            $('.single_Checkbox').not(this).prop('checked', false);
        });
    });
    $(document).ready(function () {

        $('#edit_button').click(function () {
            if (!$('.single_Checkbox').is(':checked')) {

                BootstrapDialog.show({
                    title: 'INFORMATION',
                    message: 'Please Select One User',
                    buttons: [{
                        id: 'btn-ok',
                        icon: 'glyphicon glyphicon-check',
                        label: 'OK',
                        cssClass: 'btn-primary',
                        data: {
                            js: 'btn-confirm',
                            'user-id': '3'
                        },
                        autospin: false,
                        action: function (dialogRef) {
                            dialogRef.close();
                        }
                    }]


                });
                return false;
            } else {
                window.location.href = 'Modify_Details.jsp?id=' + data_row_id + '&project=' + projects + '&application=' + application;
            }


        });

    });


</script>

<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>


<%--<script type="text/javascript">
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
</script>--%>


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

<script type="text/javascript" src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<!-- ========== THEME JS ========== -->
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
<%--<script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>--%>


<!-- ========== THEME JS ========== -->
<%--<script>
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
</script>--%>


</body>
</html>



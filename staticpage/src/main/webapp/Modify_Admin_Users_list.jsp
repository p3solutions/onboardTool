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
   <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css"/>

    <style type="text/css">
body{
            background:#f1f1f1;
        }

        .active{
        background:#1565c0;
         }
      .page-title-div {
	 background:#1565c0;
	  padding: 15px;
	  
	  
	}
	.fixed-top{
	width:100%;
	padding-left: 0px;
    padding-right: 0px;
	}

 .btn {

        margin-left: 20px;

    }
  
    
   
    
    .card {
        position: relative;
        display: flex;
        flex-direction: column;
        min-width: 0;
        word-wrap: break-word;
        background-color: #fff;
    
        border: 1px solid rgba(0, 0, 0, 0.125);
        border-radius: 0.3125rem;
        margin-top:50px;
    }
    .card-body {
        flex: 1 1 auto;
        padding: 1.25rem;
    }

    .card-title {
        margin-bottom: 0.75rem;
    }

    


  .navbar-nav .nav-link {
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom: 4px solid transparent;
}        

 .navbar-nav .nav-link.active {
    /* border-top: none; */
    border-left: none;
    border-right: none;
    border-bottom: 4px solid rgba(255,255,255,.5)!important;
}

.navbar-nav .nav-link {
    border-top: none;
    border-left: none;
    border-right: none;
    border-bottom: 4px solid transparent;
}

.link:hover{

background:#1565c0 important;

}

.table-responsive {
    overflow-x: 0 important;
    min-height: .01%;
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


    <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                    </a>

                   


                </div>
                <!-- /.navbar-header -->
                <div class="tabs-content">
                  <ul class="nav navbar-nav">
		      <li ><a href="OpportunityList.jsp" >Applications</a></li>
		      <li class="active"><a href="Admin_Module_Send_Invites.jsp" style="color:#fff">Administration</a></li>
		      <li><a href="Archive_Execution.jsp">Governance</a></li>
		              <li><a href="#">Finance</a></li>
		              <li><a href="ProjectManager_dashboard.jsp">Dashboards</a></li>
		              <li><a href="#">Compliance</a></li>
		    </ul>
		         <ul class="nav navbar-nav navbar-right">
                       

                        <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin</span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
                
                
                
                
            </div>
            <!-- /.row -->
            <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                        <div class="col-sm-12">
                             <!--  <h4 class="title" style="color:#fff">User Configuration</h4>
                               <p class="sub-title">Create and manage your Opportunities here</p>-->
                               <ul class="nav navbar-nav " >
						      <li class=" nav-link "><a class="link" href="Admin_Module_Send_Invites.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Send Invites</a></li>
						      <li class="nav-link active" ><a class="link" href="Modify_Admin_Users_list.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Modify User</a></li>
						      <li class="nav-link"><a class="link" href="Admin_Userslist.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">UserList</a></li>
						        <li class="nav-link"><a class="link" href="Admin_Role_Details.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Permissions</a></li>
		    </ul>
                          
                        </div>
                       
                         <div class="container-fluid ">
                         <ul class="nav navbar-nav" >
						      <li ></li>
						        <li ></li>
		                   </ul>
                         </div>
                    </div>

                </div>
			</nav>
        </div>
        <!-- /.container-fluid -->
    </nav >
    <form class="form-signin" name="loginForm" method="post">

        <div class="content-wrapper">
            <div class="content-container">

              


                <!-- Projects List Start -->

                <div class="main-page">

                    <div class="container-fluid">

                        
                        
                    </div>

                    <section class="section">
                        <div class="row">
                            <div class="col-md-12">


                                <div class="container-fluid">
                                    <div class="col-12 grid-margin">
                                        <div class="card">
                                            <div class="card-body">

                                                <br>
                                                <form class="form-sample">
                                                    <p class="card-description">

                                                    </p>
                                                    <div class="content table-responsive">
                                                        <table class="table table-bordered table-striped" id="datatable">
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

<!doctype html>
<html lang="en">
<head>
     <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>


    <meta charset="utf-8"/>
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">
    

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
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">
   <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
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

        #nav_userid{
            color:green;
        }

        #nav_role{
            color:blue;
        }


        .btn {

            margin-left: 50px;

        }
       
        .card .card-body {
            padding: 1.88rem 1.81rem;
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
    

    </style>

    <script>
        var har=[];
        var his=[];
        function selectCheck(name)
        {

            if(har.indexOf(name)>=0)
            {
                var i = har.indexOf(name);
                if(i != -1) {
                    har.splice(i, 1);
                }
            }
            else
                har.push(name);
        }
        function selectCheckDeac(name)
        {

            if(his.indexOf(name)>=0)
            {
                var i = his.indexOf(name);
                if(i != -1) {
                    his.splice(i, 1);
                }
            }
            else
                his.push(name);
        }


        function servlet_call()
        {
            var f=document.loginForm;
            f.method="post";
            f.action='deactivate?values='+har+'&values2='+his;
            f.submit();
        }
    </script>
    <script>
        var arr="";
        function ooo()
        {
            var e=document.getElementById("dates-field2");
            for(i=0;i<9;i++)
            {
                if(e[i].selected==true){
                    arr=arr+(e[i].value);
                }
            }

        }
        function qq()
        {				 var f=document.loginForm;
            f.method="post";
            f.action="Admin_Module_Send_Invites_Mail?roless="+arr+"&mailid="+email;
            f.submit();

        }
    </script>
    <script>
        var populate="";
        function del(cnt)
        {
        	var checkboxvalidation = true;
            for(var i=0;i<cnt;i++){
                if(document.getElementsByName('delete_check')[i].checked){
                    var name=document.getElementsByName('name_user'+i)[0].value;
                    populate=populate+name+",";
                    var checkboxvalidation = false;
                }
            }
            if (checkboxvalidation){
            	alert("Please select atleast one User!");
            
            } else {confirmation();}
        }
        
                   
        function confirmation(){
        	
        	
            var result = confirm("Are you sure to delete?");
            if(result){
            	var f=document.loginForm;
                f.method="post";
                f.action='delete_users?array='+populate;
                f.submit();
            }
        }

    </script>
    <script>
        function checkk()
        {

            document.getElementById('add_btn').disabled = true;
            document.getElementById('del_btn').disabled = true;
            document.getElementById('sub_btn').disabled = true;
            for(i=0;i<50;i++){
                document.getElementsByName('delete_check')[i].disabled = true;
                document.getElementsByName('chek')[i].disabled = true;
            }
        }
    </script>

</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Admin_UsersList JSP PAGE-----[INFO]");  %>


<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%

    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.

    if (session.getAttribute("username")==null)
    {
        response.sendRedirect("Login.jsp");
    }
%>
<%
    HttpSession details=request.getSession();
    String info=(String)details.getAttribute("admin");
    String prjname=(String)details.getAttribute("nameofproject");
    Class.forName("com.mysql.jdbc.Driver");
    java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool","root","password123");
    String query="select * from Admin_UserDetails";
    Statement s=conn.createStatement();
    ResultSet rs=s.executeQuery(query);

%>
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
						      <li class="nav-link" ><a class="link" href="Modify_Admin_Users_list.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Modify User</a></li>
						      <li class="nav-link active"><a class="link" href="Admin_Userslist.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">UserList</a></li>
						        <li class="nav-link "><a class="link" href="Admin_Role_Details.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Permissions</a></li>
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

               
                    <section class="section">
                        <div class="row">
                            <div class="col-md-12">


                                <div class="container-fluid">
                                    <div class="col-12 grid-margin">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title"><b></b></h4>
                                                <br>
                                                <form class="form-sample">
                                                    <p class="card-description">

                                                    </p>
                                                    <div class="shadow p-3 mb-5 bg-white rounded">
                                                        <table class="table table-striped table-bordered" id="datatable" style="width:100%">
                                                            <thead class="table table-striped">

                                                            <th></th>
                                                            <th>UserName</th>
                                                            <th>FirstName</th>
                                                            <th>LastName</th>
                                                            <th>Email</th>
                                                            <th>Role</th>
                                                            <th>Status</th>
                                                            <th>Deactivate</th>
                                                            <th></th>
                                                            </thead>
                                                            <tbody>

                                                            

                                                            <%
                                                                int count=0;
                                                                while(rs.next()){
                                                                    if(rs.getString(8).equals("active")){
                                                            %>
                                                            <tr style="background-color:white;">
                                                                <td><input type="checkbox" name="delete_check" id="delete_check" ></td>
                                                                <td><%= rs.getString(1) %></td>
                                                                <td><%= rs.getString(2) %></td>
                                                                <td><%= rs.getString(3) %></td>
                                                                <td><%= rs.getString(4) %></td>
                                                                <td><%= rs.getString(7) %></td>
                                                                <td style="background-color:lightgreen"><%=rs.getString(8) %></td>
                                                                <td style="text-align:center;"><input type="checkbox" name="chek" onChange="selectCheck('<%=rs.getString(1) %>');"></td>
                                                                <td style="display:none;"><input type="text" name="name_user<%=count%>" value="<%= rs.getString(1) %>"></td>
                                                            </tr>
                                                            <%
                                                                count++;
                                                            } else{
                                                            %>
                                                            <tr style="background-color:#ccc;cursor:not-allowed;">
                                                                <td><input type="checkbox" name="delete_check" id="delete_check" ></td>
                                                                <td><%= rs.getString(1) %></td>
                                                                <td><%= rs.getString(2) %></td>
                                                                <td><%= rs.getString(3) %></td>
                                                                <td><%= rs.getString(4) %></td>
                                                                <td><%= rs.getString(7) %></td>
                                                                <td> <%=rs.getString(8) %></td>
                                                                <td style="text-align:center;background-color:white;"><input type="checkbox" name="chek" id="chek" onChange="selectCheckDeac('<%=rs.getString(1) %>')" checked></td>
                                                                <td style="display:none;"><input type="text" name="name_user<%=count%>" value="<%= rs.getString(1) %>"></td>
                                                            </tr>
                                                            <%
                                                                        count++;
                                                                    }
                                                                }
                                                            %>
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
                                                            onclick="window.location.href='AdminModuleAddUser.jsp'" style="margin:5px">
                                                        Add User
                                                    </button>

                                                    <%--<button type="button" id="edit_button" name="edit_button"
                                                            class="btn btn-primary" style="margin:5px">
                                                        Delete User
                                                    </button>
                                                    <button type="button" id="delete_button" name="delete_button"
                                                            class="btn btn-primary" style="margin:5px">
                                                        Submit
                                                    </button>--%>
                                                    <input type="button" id="del_btn" class="btn btn-primary" onclick="del(<%=count %>);" value="Delete User" style="margin:5px">
                                                    &nbsp;&nbsp;
                                                    <button type="button" id="sub_btn" class="btn btn-primary" onclick="servlet_call();" style="margin:-5px">Submit</button>

                                            </div>


                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                </div>




            </div>
        </div>
        <script>
            if(document.getElementById('role_conf').value=="R")
                checkk();
        </script>
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


<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>


<script type="text/javascript">
    $(document).ready(function() {
        $(".lis").click(function() {
            $(".cbp-vm-switcher").removeClass("cbp-vm-view-grid");
            $(".cbp-vm-switcher").addClass("cbp-vm-view-list");
        });
        $(".gr").click(function() {
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
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css" type="text/css" media="all" />
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="//cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>
        
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<!-- ========== THEME JS ========== -->

<script type="text/javascript">
    $('.datepicker').datepicker({
        format: 'mm/dd/yyyy',
        startDate: '-3d'
    });
</script>


<!-- ========== THEME JS ========== -->
<script>
    $(function($) {

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

<script>
$(document).ready(function() {
    $('#datatable').DataTable( {
        "pagingType": "full_numbers"
    } );
} );
</script>

</body>
</html>



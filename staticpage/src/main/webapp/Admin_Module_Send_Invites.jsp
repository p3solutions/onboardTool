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
   
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <link href="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css"/>
    <script src="http://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen">
       <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
    <!-- ========== PAGE STYLES ========== -->

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
 
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/css/bootstrap-select.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/css/bootstrap-dialog.min.css">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap3-dialog/1.34.7/js/bootstrap-dialog.min.js"></script>


</head>
<style>
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

        margin-left: 50px;

    }
  
    .card .card-body {
        padding: 1.88rem 1.81rem;
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
        margin-top:50px;
    }
    .card-body {
        flex: 1 1 auto;
        padding: 1.25rem;
    }

    .card-title {
        margin-bottom: 0.75rem;
    }

    form {
        display: inner-block;
        margin-top: 0em;
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
<body class="top-navbar-fixed">
<%
    HttpSession details = request.getSession();
    String project_name = (String) details.getAttribute("nameofproject");
    String info = (String) details.getAttribute("admin");
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
						      <li class=" nav-link active"><a class="link" href="Admin_Module_Send_Invites.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Send Invites</a></li>
						      <li class="nav-link" ><a class="link" href="Modify_Admin_Users_list.jsp" style=" color: #fff;padding: 7px 10px; height: 35px;">Modify User</a></li>
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

                

                    <section class="section">
                        <div class="row">
                            <div class="col-md-12">


                                <div class="container-fluid">
                                    <div class="col-12 grid-margin">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title"><b>Personal Info</b></h4>
                                                <br>
                                                <form class="form-sample">
                                                    <p class="card-description">

                                                    </p>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 col-form-label"><div class="required_fie">First Name</div></label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" id="fname" name="fname" class="form-control">
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 col-form-label"><div class="required_fie">Last Name</div></label>
                                                                <div class="col-sm-9">
                                                                    <input type="text" id="lname" class="form-control">
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 col-form-label"><div class="required_fie">Email</div></label>
                                                                <div class="col-sm-9">
                                                                    <input type="email" class="form-control" id="email_val">
                                                                </div>
                                                            </div>
                                                        </div>


                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 col-form-label"><div class="required_fie">Role Name</div></label>
                                                                <div class="col-sm-9">
                                                                    <select id="dates-field2"
                                                                            class="selectpicker multiselect-ui form-control"
                                                                            data-show-subtext="true"
                                                                            data-live-search="true"
                                                                            &lt;%&ndash;multiple="multiple" &ndash;%&gt;>
                                                                        <option>
                                                                            ArchivalAdmin
                                                                        </option>
                                                                        <option>
                                                                            LegacyTechnicalSME
                                                                        </option>
                                                                        <option>
                                                                            LegacyBusinessSME
                                                                        </option>
                                                                        <option>
                                                                            ArchivalProgramManager
                                                                        </option>
                                                                        <option>
                                                                            ArchivalProjectManager
                                                                        </option>
                                                                        <option>
                                                                            LegacyProgramManager
                                                                        </option>
                                                                        <option>
                                                                            ArchivalBusinessAnalyst
                                                                        </option>
                                                                        <option>
                                                                            ArchivalTechnicalLead
                                                                        </option>
                                                                        <option>
                                                                            ArchivalDeveloper
                                                                        </option>
                                                                        <option>TestLead</option>
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 col-form-label"><div class="required_fie">Project</div></label>
                                                                <div class="col-sm-9">
                                                                    <select class="selectpicker multiselect-ui form-control"
                                                                            id="project_id_Select" name="project_id_Select"
                                                                            data-live-search="true" multiple="multiple">
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 col-form-label"><div class="required_fie">Applications</div></label>
                                                                <div class="col-sm-9">
                                                                    <select class="selectpicker multiselect-ui form-control"
                                                                            id="projapp" name="projapp"
                                                                            data-live-search="true" multiple="multiple">
                                                                    </select>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group row">
                                                                <label class="col-sm-3 col-form-label">Message</label>
                                                                <div class="col-sm-9">
                        <textarea class="form-control" rows="5"
                                  id="message"></textarea>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row">
                                                        <div class="col-md-1">
                                                            <input type="hidden" id="send_invites_id" value="<%= info %>"
                                                                   hidden>

                                                        </div>
                                                        <div class="col-md-3">

                                                            <button type="button" class="btn btn-primary" id="send_btn"
                                                                    onclick="send_email();">Send Invites
                                                            </button><div id="container"></div>
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
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.10.0/js/bootstrap-select.min.js"></script>
<script src="js/admin_module/admin_module_send_invites.js"></script>
</body>
</html>

<!DOCTYPE html>

<html lang="en">
<head>
    <title>Decom3Sixty Modules List</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="js/jquery/jquery-2.2.4.min.js"></script>

    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >
    <link rel="icon" type="image/png" href="assets/img/favicon.ico">

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >
    <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <script src="js/multiplepages.js"></script>
    <style>
  body{
     
     background-color: #fff;
   
   
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
  
  .title {
  color:#fff;
  } 
  
 #module_header{
 
 margin-top:200px;
 }



/* Steps timeline*/
.steps-timeline {
    font-size: 14px;
    line-height: 16px;
}

.step-title,
.step-description {
  margin: 0;
  display: block;
  text-align: center;
}

.step-title{
  font-size: 16px;
  line-height: 22px;
  font-weight: bold;
  margin-bottom: 10px;
}

.ste-description {
  overflow: hidden;
  line-height:20px;
}

.steps-timeline .step {
  outline: 1px dashed rgba(0, 128, 0, 0);
  margin-bottom: 200px;
}

.img-rounded{

padding-top:20px;
transition: width 2s, height 2s, transform 2s;
}

.step-milestone1{
  display: block;
  width: 150px;
  height: 150px;
  background-color: #fff;
  border: 10px solid DodgerBlue;
  border-radius: 50%;
  margin: 100px auto;
  box-sizing: border-box;
  transition: width 2s, height 2s, transform 2s;
}




.step-milestone2{
  display: block;
  width: 150px;
  height: 150px;
  background-color: #fff;
  border: 10px solid DodgerBlue;
  border-radius: 50%;
  margin: 30px auto;
  box-sizing: border-box;
   transition: width 2s, height 2s, transform 2s;
}
.step-milestone3{
  display: block;
  width: 150px;
  height: 150px;
  background-color: #fff;
  border: 10px solid DodgerBlue;
  border-radius: 50%;
  margin: 0 auto;
  box-sizing: border-box;
   transition: width 2s, height 2s, transform 2s;
}
.step-milestone4{
  display: block;
  width: 150px;
  height: 150px;
  background-color: #fff;
  border: 10px solid DodgerBlue;
  border-radius: 50%;
  margin: 100px auto;
  box-sizing: border-box;
   transition: width 2s, height 2s, transform 2s;
}

.step-milestone5{
  display: block;
  width: 150px;
  height: 150px;
  background-color: #fff;
  border: 10px solid DodgerBlue;
  border-radius: 50%;
  margin: 100px auto;
  box-sizing: border-box;
   transition: width 2s, height 2s, transform 2s;
}
@media screen and (max-width: 678px) {
  .steps-timeline {
    border-left: 5px dotted #bbb;
    border-radius:25%;
    margin-left: 200px;
    margin-top: -100px;
  }

  .steps-timeline  .step {
    margin-top:50px;
    margin-left: -290px;
    display: block;
    overflow: auto;
  }

  .step-milestone {
    float: left;
    margin-left: 100px;
  }



}
@media screen and (min-width: 678px) {

  .steps-timeline {
    border-top: 5px dotted #bbb;
    border-radius:50%;
    margin-top: 50px;
    margin-left: 10%;
    margin-right: 10%;
    display: -moz-box;
    display: -ms-flexbox;
    display: -moz-flex;
    display: -webkit-flex;
    display: flex;
    justify-content: space-between;
  }

  .steps-timeline .step {
    margin-top: -60px;
    -webkit-flex: 1;  /* Safari 6.1+ */
    -ms-flex: 1;  /* IE 10 */    
    flex: 1;
    transition: width 2s, height 2s, transform 2s;
  }

}



 img.filtered {
			filter: sepia(100%) hue-rotate(190deg) saturate(1000%);
		}

        .icon{
            
            filter: blue(100%);
        }
    </style>
</head>
<body class="top-navbar-fixed">
<script>
    $(document).ready(function() {

        $('#testDecom').attr('disabled', true);
    });
</script>
<div class="main-wrapper">
    <%@ page import="java.text.SimpleDateFormat"%>
    <%@ page import="java.util.Date"%>
    <%
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Grid JSP PAGE-----[INFO]");  %>
    <%@page language="java"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.text.DateFormat" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.util.Calendar" %>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.

        if (session.getAttribute("username")==null)
        {
            response.sendRedirect("Login.jsp");

        }
        else{
            String name=(String)session.getAttribute("ID");
            HttpSession details=request.getSession();
            Connection con = null;
            String url = "jdbc:mysql://localhost:3306/";
            String db = "decom3sixtytool";
            String driver = "com.mysql.jdbc.Driver";
            String userName ="root";
            String password="password123";
            session.setAttribute("theName", name);
            String roles=(String)details.getAttribute("role");
            String OpportunityName = (String)details.getAttribute("SelectedOpportunity");
            int sumcount=0;
            Statement st,st2;
            try{
                Class.forName(driver).newInstance();
                con = DriverManager.getConnection(url+db,userName,password);
                Statement st1;


                /* String query1 = "select * from AppEmphazize_ProjectDetails where id = "+name;
                st1 = con.createStatement();
                ResultSet rs = st1.executeQuery(query1);
                if(rs.next())
                { */

    %>

    <!-- ========== TOP NAVBAR ========== -->
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
		    <li class="active"><a href="#" style="color:#fff">Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp">Administration</a></li>
		              <li><a href="Archive_Execution.jsp">Governance</a></li>
		              <li><a href="#">Finance</a></li>
		              <li><a href="ProjectManager_dashboard.jsp">Dashboards</a></li>
		              <li><a href="#">Compliance</a></li>
		    </ul>
		         <ul class="nav navbar-nav navbar-right">
                        <%
                            String uname=(String)details.getAttribute("username");
                            String role=(String)details.getAttribute("role");%>

                        <li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
                
                
                
                
            </div>
            <!-- /.row -->
            <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                        
                             <h4 class="title" style="color:#fff">Modules</h4>
                              <!-- <p class="sub-title">Create and manage your Opportunities here</p>-->
                         <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >> <%=OpportunityName%></p>
                        </div>
                       
                    </div>

                </div>
			</nav>
        </div>
        <!-- /.container-fluid -->
    </nav >
    <div class="content-wrapper">
        <div class="content-container">

            <!-- ========== LEFT SIDEBAR ========== -->
            <div class="main-page">
                
                <!-- /.container-fluid -->
              <div class="container-fluid" id="module_header">

                <%
                    if(roles.equals("admin")){
                %>
                <!--  admin Role -->
                <section>
                        <div class="steps-timeline">
  <div class="step">
    <div class="step-milestone1"/>
    
                                   <a href="IntakeDetails.jsp">
                                        <center>
                                            <img src="images/grid/NewIntake.png" class="img-rounded filtered" height="100" width="100" alt="Avatar">

                                        </center>

                                    </a>
    </div>
   <span class="step-title">
      Intake <br> 
    </span>
    
    
     </div>
     <div class="step">
    <div class="step-milestone2"/>
    
    
    <a href="AppEmphasize_EditProject.jsp">
                                        <center>
                                            <img src="images/grid/app.png" class="img-rounded" height="100" width="100" alt="Avatar">

                                        </center>

                                    </a>
    
    </div>
     <span class="step-title">
      Plan  <br> and <br> Priority 
    </span>
  </div>
  <div class="step">
    <div class="step-milestone3"/>
    
    <a href="ArchiveDecommPage.jsp">
                                        <center>
                                          <img src="images/grid/intake.png" class="img-rounded" height="100" width="100" alt="Avatar">

                                        </center>

    </div>
     <span class="step-title">
     Requirements  <br> 
    </span>
  </div>
  <div class="step">
    <div class="step-milestone2"/>
    <a href="#">
                                        <center>
                                             <img src="images/grid/archival-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">

                                        </center>

                                    </a>
    
    
    </div>
     <span class="step-title">
      Archive  <br> Execution
    </span>
  </div>
    <div class="step">
    <div class="step-milestone5"/>
    <a href="DecommManageExecutionInfo.jsp">
                                        <center>
                                             <img src="images/grid/decommission-execution.png" class="img-rounded" height="100" width="100" alt="Avatar">

                                        </center>

                                    </a>
    
    
    </div>
     <span class="step-title">
      Decommission  <br> Execution
    </span>
  </div>
                 
                </section>
                <!-- /.section -->


               
                        <%
}
else if(roles.equals("ArchivalDeveloper"))
{
%>
                    <section>

                      </section>
                        
                        <%} %>


            </div>

        </div>





        </br>
    </div>
    <!-- /.main-page -->

    <!-- Project List End -->

</div>
<!-- /.content-container -->
</div>
<!-- /.content-wrapper -->

</div>
<!-- /.main-wrapper -->


<%
        }
        catch(Exception e){
            e.printStackTrace();
        }
    }
%>

<script>
    $(document).ready(function() {

        $('#testDecom').attr('disabled', true);
    });
</script>

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



</body>
</html>

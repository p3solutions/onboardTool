<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Opportunity List</title>
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen" > <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
    <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >
   <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
   
    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >
    <script type="text/javascript" src="js_in_pages/project.js"></script>

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/Opportunity/OpportunityList/OpportunityList.js"></script>
    <style type="text/css">
         body{
            background:#fff;
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
	
	
	
.search{

margin-top:-40px;
}

hr{

border-top: 3px solid #dce8f1;
}
 input[type=search]{
  outline: 0;
  
  border-width: 0 0 3px 0;
  border-color: #d2d2d2;
}
input[type=search]:focus {
  border-color: #1565c0;
}
.cbp-vm-switcher {
	padding: 20px;
	
}

.cbp-vm-switcher {
	padding: 20px;
	
}


.cbp-vm-options {
	text-align: right;
	padding-bottom: 10px;
	
}

.cbp-vm-options a {
	display: inline-block;
	width: 30px;
	height: 30px;
	overflow: hidden;
	white-space: nowrap;
	color: #d0d0d0;
	margin: 2px;
}

.cbp-vm-options a:hover,
.cbp-vm-options a.cbp-vm-selected {
	color: #47a3da;
}

.cbp-vm-options a:before {
	width: 20px;
	height: 20px;
	line-height: 40px;
	font-size: 20px;
	text-align: center;
	display: inline-block;
}

/* General style of switch items' list */

.cbp-vm-switcher ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

/* Clear eventual floats */
.cbp-vm-switcher ul:before, 
.cbp-vm-switcher ul:after { 
	content: " "; 
	display: table; 
}

.cbp-vm-switcher ul:after { 
	clear: both; 
}

.cbp-vm-switcher ul li {
	display: block;
	position: relative;
}

.cbp-vm-image {
	display: block;
	margin: 0 auto;
}

.cbp-vm-image img {
	display: inline-block;
	max-width: 100%;
}

.cbp-vm-title {
	margin: 0;
	padding: 0;
}

.cbp-vm-price {
	color: #c0c0c0;
}

.cbp-vm-add {
	color: #fff;
	background: #47a3da;
	padding: 10px 20px;
	border-radius: 2px;
	margin: 20px 0 0;
	display: inline-block;
	transition: background 0.2s;
}

.cbp-vm-add:hover {
	color: #fff;
	background: #02639d;
}

.cbp-vm-add:before {
	margin-right: 5px;
}

/* Common icon styles */
.cbp-vm-icon:before {
	font-family: 'fontawesome';
	speak: none;
	font-style: normal;
	font-weight: normal;
	font-variant: normal;
	text-transform: none;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
}



/* Individual view mode styles */

/* Large grid view */
.cbp-vm-view-grid ul {
	text-align: center;
}

.cbp-vm-view-grid ul li {
	width: 20%;
	text-align: center;
	  box-shadow:5px 5px 5px 5px  #dbdbdb;
	
	display: inline-block;
	
	vertical-align: top;
}

.cbp-vm-view-grid .cbp-vm-title {
	font-size: 2em;
}

.cbp-vm-view-grid .cbp-vm-details {
	max-width: 300px;
	min-height: 70px;
	margin: 0 auto;
} 

.cbp-vm-view-grid .cbp-vm-price {
	margin: 10px 0;
	font-size: 1.5em;
}

.cbp-vm-view-list .right-col {
            float: left;
            width: 25%;
        }
        .cbp-vm-view-list .cbp-vm-title {
            font-size: 1.3em;
            padding: 0 30px;
            white-space: normal;
            width: 25%;
        }
        .cbp-vm-view-list .center-col {
            float: left;
            width: 20%;
            margin-right: 51px;
        }
        .cbp-vm-view-list .center-col {
            float: left;
            width: 20%;
            margin-right: 51px;
        }
        .cbp-vm-view-list li {
            padding: 12px 0;
            white-space: nowrap;
            background-color: #fff;
            box-shadow:5px 5px 5px 5px  #dbdbdb;
            margin:13px;
            padding-top:10px;
        }


        .cbp-vm-view-list li:focus {
            display: block;
            border:2px solid red;
        }

@media screen and (max-width: 66.7em) {
	.cbp-vm-view-list .cbp-vm-details  {
		width: 30%;
	}
} 

@media screen and (max-width: 57em) {
	.cbp-vm-view-grid ul li {
		width: 49%;
	}
}

@media screen and (max-width: 47.375em) {
	.cbp-vm-view-list .cbp-vm-image {
		width: 20%;
	}

	.cbp-vm-view-list .cbp-vm-title {
		width: auto;
	}

	.cbp-vm-view-list .cbp-vm-details  {
		display: block;
		width: 100%;
		margin: 10px 0;
	}

	.cbp-vm-view-list .cbp-vm-add  {
		margin: 10px;
	}
}

@media screen and (max-width: 40.125em) {
	.cbp-vm-view-grid ul li {
		width: 100%;
	}
}
        
       
        .grid{
  margin-top:80px;
  
  }
	.cbp-vm-view-list li:focus {
            display: block;
            border:2px solid red;
        }
        .progress{

            margin-top:5px;
        }

         .cologen{
             color: #1c95f8 !important;
         }
    </style>

</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    System.out.println("[INFO]-----"+formatter.format(date1)+"-----Accessed OpportunityList JSP PAGE-----[INFO]"); %>
<%@page language="java"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("username")==null){
        response.sendRedirect("Login.jsp");
    }
%>
<%
    HttpSession role_ses=request.getSession();
    String frole=(String)role_ses.getAttribute("role");
    int sumcount=0;
    Statement st,st1;
    try{
        String query;
        HttpSession details=request.getSession();
        String Projets=(String)details.getAttribute("projects");
        System.out.println("projects-------------"+Projets);
        String roles=(String)details.getAttribute("role");
        DBconnection d=new DBconnection();
        Connection con = (Connection)d.getConnection();
        String visit_query="select * from visits";
        Statement visit_st = con.createStatement();
        ResultSet visit_rs = visit_st.executeQuery(visit_query);
        int flag=1,knt=0;
        Date date = new Date();
        SimpleDateFormat ft,ft1;
        String username=(String)details.getAttribute("u_Name");

        ft=new SimpleDateFormat ("yyyy-MM-dd");
        ft1=new SimpleDateFormat ("hh:mm:ss");
        String strDate=ft.format(date);
        String strTime=ft1.format(date);
        while(visit_rs.next())
        {
            if(visit_rs.getString(6)!=null)
            {
                if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Logged in"))
                {
                    Statement stmtt = con.createStatement();
                    String queryy = "update visits set count=count+1,time='"+strTime+"' where uname='"+username+"' and module='Logged in'  and date ='"+strDate+"'";
                    int count = stmtt.executeUpdate(queryy);
                    flag=0;
                    break;
                }
            }

        }
        //System.out.println("the flag value is "+flag);
        if(flag==1)
        {
            String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
                    + " values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(ins_query);
            preparedStmt.setString (1, username);
            preparedStmt.setString (2, strDate);
            preparedStmt.setString(3, "Logged in");
            preparedStmt.setString(4, "1");
            preparedStmt.setString(5, strTime);
            preparedStmt.setString(6, "None");
            preparedStmt.setString(7, "");

            // execute the preparedstatement
            preparedStmt.execute();
        }%>



<!-- main wrapper -->
<div class="main-wrapper">


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
		              <li ><a href="ProjectManager_dashboard.jsp">Dashboards</a></li>
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
                             <h4 class="title" style="color:#fff">Applications</h4>
                              <!-- <p class="sub-title">Create and manage your Opportunities here</p>-->
                        </div>
                        <!-- /.col-sm-6 -->
                        <div class="col-sm-6 right-side">
                            <button type="button" class="btn btn-primary pull-right" style="color:DodgerBlue;" name="newpr" onclick="location.href='Intake_NewOpportunity.jsp';" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                New Opportunity
                            </button>
                        </div>
                        <!-- /.col-sm-6 text-right -->

                    </div>

                </div>
			</nav>
        </div>
        <!-- /.container-fluid -->
    </nav >
    <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
    <div class="content-wrapper">
        <div class="content-container">
            <!-- Projects List Start -->
            <%
                {
                    int application_count=0;
                    if(Projets=="all") {
                        String projectCount = "select count(*) from appemphazize_projectdetails";
                        Statement projectCountst = con.createStatement();
                        ResultSet projectCountqyery = projectCountst.executeQuery(projectCount);
                        if (projectCountqyery.next()) {
                            application_count = Integer.parseInt(projectCountqyery.getString(1));
                        }
                    }
                    else
                    {
                        String ProjCountQuery="select * from admin_userdetails where uname='"+uname+"'";
                        Statement statement1=con.createStatement();
                        ResultSet resultSet=statement1.executeQuery(ProjCountQuery);
                        if(resultSet.next())
                        {
                            String[] prjs=(resultSet.getString("projects")).split(",");
                            application_count=prjs.length;
                        }
                    }
            %>
             <%} %>
            <div class="main-page">
                <div class="container">
                  

                </div>


                <form method="post" name="form" action="Appin">
                    <section>

                        <div class="row">
                            <div class="container-fluid grid">
                                <div class="main">
                                    <div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
                                        <div class="cbp-vm-options">
                                            <a href="#" id="grid" title="Grid View" class="cbp-vm-icon cbp-vm-grid cologen gr" data-view="cbp-vm-view-grid"></a>
                                            <a href="#" id="list" title="List"  class="cbp-vm-icon cbp-vm-list lis" data-view="cbp-vm-view-list"></a>
                                        </div>
                                        <div class="row search">
                                      <div class="col-md-6">
                                                            <div class="form-group row">
                                                            <i class="fa fa-search" aria-hidden="true"></i>
                                                             <div class="col-md-5">
                                                             
                                                               <input type="search" placeholder="Search the application.."  class="form-control searchbox-input">
                                                             </div>      
                                                                  
                                                            
                                                            
                                                            </div>

                                                        </div>
                                 </div>


 
                                      <div class='col-md-12'>
                                        <ul id = "ul_id">
                                            

                                        </ul>
                                      </div>
                                        <%
                                                con.close();
                                                visit_st.close();
    }


                                            catch(Exception e){
                                                e.printStackTrace();
                                            }
                                        %>


                                        </ul>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.row -->
                    </section>

                </form>




            </div>
            <!-- /.mainPage -->




















            <!-- Project List End -->

        </div>
        <!-- /.content-container -->
    </div>
    <!-- /.content-wrapper -->

</div>
<!-- end of main wrapper -->

<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>


<script type="text/javascript">
    $('#list').click(function()
    {
        $('#grid').removeClass('cologen');
        $('#list').addClass('cologen');
    });
    $('#grid').click(function()
    {
        $('#list').removeClass('cologen');
        $('#grid').addClass('cologen');
    });
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
 <script>
$(document).ready(function() {
    $('.searchbox-input').keyup(function(){
        search_text($(this).val());
    });

    function search_text(value){
        $('#ul_id .cbp-vm-title').each(function(){
            var found = 'false';
            $(this).each(function(){
                if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)
                {
                    found = 'true';
                }
            });
            if(found == 'true'){
                $(this).parent().css('display','');
            }
            else {
                $(this).parent().css('display','none');
            }
        })
    }
});
</script>

</body>
</html>

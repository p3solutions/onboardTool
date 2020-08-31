<html lang="en">
<head>
<title>Role Dashboard</title>
 <meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 
         
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
     <!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

        <!-- ========== PAGE STYLES ========== -->
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
        <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
        <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >
        <link rel="stylesheet" href="css/RoleDashboard/RoleDashboard.css">
       

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
         <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.2/jquery-ui.min.js"></script>
             <script type="text/javascript" src="js/paging.js"></script> 
       
  	
	<script type="text/javascript" src="js_in_pages/tree.js"></script>
	<!-- graph -->
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  </head>
  <style>
   .breadcrumb-div {
                background-color: #e7e7e7;
                color: #010101; }
                #nav_userid{
             color:green;
             }

   .btn {
       border: none;
       outline: none;
       padding: 3px 14px;
       background-color: #3697e8;
       cursor: pointer;

   }
   .activ-pro{font-size: 16px;
       margin-left: -13px;
       margin-right: 129px;}
   .active, .btn:hover {
       color: white;
   }

.pg-normal { 
color: white; 
font-size: 15px; 
cursor: pointer; 
background: #269af8; 
padding: 2px 4px 2px 4px; 
}

.pg-selected { 
color: #fff; 
font-size: 15px; 
background: #269af8; 
padding: 2px 4px 2px 4px; 
}


</style>
 
  <body class="top-navbar-fixed">

<%@page language="java"%>
<%@ page import="java.util.ArrayList" %>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date1 = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date1)+"-----Accessed RoleDashboard JSP PAGE-----[INFO]");  %>

<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.jsp");
}
%>


<script type="text/javascript">
function line_chart()
{

var samp=document.getElementById("year").value;

var date =[];
var month =[];
var year =[];
var no_of_visits =[];
var monthname =[];
var distinct_monthname =[];
var final_count =[];
var final_month=[];
var final_visits=[];
var result_months=[];
var result_visits=[];
result_months.push("January");
result_months.push("February");
result_months.push("March");
result_months.push("April");
result_months.push("May");
result_months.push("June");
result_months.push("July");
result_months.push("August");
result_months.push("September");
result_months.push("October");
result_months.push("November");
result_months.push("December");

result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");
result_visits.push("0");

var flag=0;

<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>


<%
HttpSession details=request.getSession();
String roles=(String)details.getAttribute("role");
String uname=(String)details.getAttribute("username");
String[] values_name = new String[5];
ArrayList<String> date = new ArrayList<String>();
ArrayList<String> month = new ArrayList<String>();
ArrayList<String> year = new ArrayList<String>();
ArrayList<String> no_of_visits = new ArrayList<String>();
ArrayList<String> monthname = new ArrayList<String>();
ArrayList<String> distinct_monthname = new ArrayList<String>();
ArrayList<String> final_count = new ArrayList<String>();
//ArrayList<String> final_month = new ArrayList<String>();

    DBconnection d=new DBconnection();
    Connection con = (Connection)d.getConnection();
    Statement st_distinct= con.createStatement(); 


    ResultSet rs_distinct=st_distinct.executeQuery("select distinct(monthname(date)) from  visits ");
    while (rs_distinct.next())
    {
    %>
    distinct_monthname.push("\"<%=rs_distinct.getString(1)%>\"");
    <%}
    
Statement st_line_chart_month= con.createStatement(); 


ResultSet rs_line_chart_month=st_line_chart_month.executeQuery("select monthname(date),SUBSTR(date,1,4), (SUBSTR(date,6,2)-1),SUBSTR(date,9,2),count from  visits where uname = '+ uname +'");
while (rs_line_chart_month.next())
{
	%>
monthname.push("\"<%=rs_line_chart_month.getString(1)%>\"");
year.push(<%=rs_line_chart_month.getString(2)%>);
month.push(<%=rs_line_chart_month.getString(3)%>);
date.push(<%=rs_line_chart_month.getString(4)%>);
no_of_visits.push(<%=rs_line_chart_month.getString(5)%>);
<%}%>   
var count=0;
var flag=0;
for(var i=0;i<year.length;i++)
	{
	if(samp==year[i])
	{
		flag=1;
		final_month.push(monthname[i]);
		final_visits.push(no_of_visits[i]);
	
	}
	else
		{
		
		continue;
		}
	
}
for(var m=0;m<distinct_monthname.length;m++)
{
	
	for(var j=0;j<final_month.length;j++)
	{
		if(distinct_monthname[m]==final_month[j])
			{
			
			count=count+final_visits[j];
			
			}
		else
			{
			continue;
			}
		
	}
	
	final_count.push(count);
	count=0;
}

for(var x=0;x<result_months.length;x++)
	{
	

	
	for(var y=0;y<distinct_monthname.length;y++)
		{
		
		if(distinct_monthname[y].substr(1,distinct_monthname[y].length -2)==result_months[x])
			{
			
			result_visits[x]=final_count[y];
			
			}
		
		else
			{
			continue;
			}
		}
	
	}
	
console.log("month with selected year " +samp );

google.charts.load('current', {'packages':['corechart','line']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var name;
	
    
  var data = new google.visualization.DataTable();
  data.addColumn('string','name');
  data.addColumn('number','value');

  for(var i=0;i<result_months.length;i++)
	  {
	  
	  data.addRow([result_months[i],Number(result_visits[i])]);
	  }
	
	
  var options = {
        title: '',
        curveType: 'function',
        pointSize: 5,
        
        colors: ['rgb(255, 0, 0)'],
       
        vAxis: {
          title: 'No of visits',
          minValue: 0,
          ticks: [{v:0, f:'0'},{v:100, f:'100'},{v:200, f:'200'},{v:300, f:'300'}],
        },
        
        hAxis: {
            title: 'Months',
            minValue: 0,
            format: 'mmm',
            
          },
       
      };

  var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
  

  

  chart.draw(data, options);
 
}
	
	
	
}



function line_chart_view()
{
google.charts.load('current', {'packages':['corechart','line']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
	var name;

  var data = google.visualization.arrayToDataTable([
	 
    ['Monthly', 'Visits','asd'],
      
   
     <% 
     String name=request.getParameter("year");
    // System.out.println("Year"+name);
     for(int a=0;a<year.size();a++)
     {
     %>
    

     [ '\'<%=monthname.get(a) %>\'', <%=no_of_visits.get(a)%>,'ads'],
     
    
     <% }
    %>
  

  ]);

  var options = {
        title: '',
        curveType: 'function',
        pointSize: 5,
        
        colors: ['#fb8532'],
       
        vAxis: {
          title: 'No of visits',
          minValue: 0,
        },
       
      };

  var chart = new google.visualization.AreaChart(document.getElementById('curve_chart'));
  

  

  chart.draw(data, options);
 
} 

}
</script>

<%


String info=(String)details.getAttribute("app_emp");
try {
String det=(String)session.getAttribute("theName");
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool", "root", "password123");
String query = "select * from AppEmphazize_ProjectDetails";
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query3 = "select * from AppEmphazize_ProjectDetails where id = "+det;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query2 = "select * from logs where USER_ID='"+uname+"'";
Statement st2 = conn.createStatement();
ResultSet rs2 = st2.executeQuery(query2);
String query1 = "SELECT role FROM Role_Details";
Statement st1 = conn.createStatement();
ResultSet rs1 = st1.executeQuery(query1);
String query4 = "select count(uname) from Admin_UserDetails";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
String query5 = "select count(role) from Role_Details";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);
String query6 = "select count(roles) from logs";
Statement st6 = conn.createStatement();
ResultSet rs6 = st6.executeQuery(query6);
String query7 = "select sum(count) from visits";
Statement st7 = conn.createStatement();
ResultSet rs7 = st6.executeQuery(query7);

if(rs.next()){
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
                			 
                			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-1" aria-expanded="false">
                				<span class="sr-only">Toggle navigation</span>
                				<i class="fa fa-ellipsis-v"></i>
                			</button>
                            <button type="button" class="navbar-toggle mobile-nav-toggle" >
                				<i class="fa fa-bars"></i>
                			</button>
                		</div>
                        <!-- /.navbar-header -->
                			 
                    <% if(rs3.next()){
                    details.setAttribute("appno",rs3.getString("appno"));
                    details.setAttribute("projectname",rs3.getString("projectname"));
                    %>
                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %></a>
																					  
					   
                    <%
                    String q2="select * from ArchiveExecution_Details where level=1 and projects='"+rs3.getString("projectname")+"'order by seq_num";
                    Statement s2 = conn.createStatement();
                    ResultSet rss = s2.executeQuery(q2);
                    while(rss.next())
                    {
                    session.setAttribute(rss.getString(3),rss.getString(15));
                    }
                    
                    } %>
                    
                			
                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
					 <ul class="nav navbar-nav navbar-right">
					 	<%
                         
                         String role=(String)details.getAttribute("role");%>                   
	<li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
							<li> <a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a> </li>
                     </ul>
					
                		</div>
                		<!-- /.navbar-collapse -->
                    </div>
                    <!-- /.row -->
            	</div>
            	<!-- /.container-fluid -->
            </nav>
 
           
              
            <div class="content-wrapper">
                <div class="content-container">

                    <!-- ========== LEFT SIDEBAR ========== -->
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

                                    <%--   <li class="nav-header">
                                           <a href="AppEmphasize_EditProject.jsp"><span class="">Plan and pirority</span></a>
                                       </li>--%>
                                    <li class="has-children">
                                        <a href=""><i class="fa fa-archive"></i> <span>Plan and pirority</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_EditProject.jsp" > <span>Project Information</span></a></li>
                                            <li><a href="AppEmphasize_Application.jsp" > <span>Application Information</span></a></li>
                                            <li><a href="AppEmphasize_CostCalculation.jsp" > <span>Application Complexity</span></a></li>
                                            <li><a href="AppEmphasize_PrioritizedApplications.jsp"> <span>Prioritized Applications</span></a></li>
                                            <li><a href="AppEmphasize_Preview.jsp"> <span>Review Page</span></a></li>
                                        </ul>
                                    </li>
                                    <%--<li class="has-children">
                                        <a href="AppEmphasize_EditProject.jsp"><i class="fa fa-file-text"></i> <span>Project Details</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_EditProject.jsp"> <span>Project Information</span></a></li>
                                            <li><a href="AppEmphasize_Application.jsp"> <span>Application Details</span></a></li>
                                        </ul>
                                    </li>--%>


                                    <%--<li class="has-children">
                                        <a href="AppEmphasize_CostCalculation.jsp"><i class="fa fa-paint-brush"></i> <span>Application Prioritization</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="AppEmphasize_CostCalculation.jsp"> <span>Application Complexity </span></a></li>
                                        </ul>
                                    </li>--%>

                                    <%--<li>
                                        <a href="AppEmphasize_PrioritizedApplications.jsp"><i class="fa fa-map-signs"></i> <span>Application Prioritized</span> </a>
                                    </li>--%>

                                    <%-- <li class="nav-header">
                                         <a href='Applications.jsp'><span class="">Intake Module</span></a>
                                     </li>

                                     <li class="has-children">
                                         <a href="Applications.jsp"><i class="fa fa-magic"></i> <span>Business</span> <i class="fa fa-angle-right arrow"></i></a>
                                         <ul class="child-nav">
                                             <li><a href="Applications.jsp"> <span>Application Information</span></a></li>
                                             <li><a href="Applications.jsp"> <span>Legacy Retention Information</span></a></li>
                                             <li><a href="Applications.jsp"> <span>Archive Data Management</span></a></li>
                                             <li><a href="Applications.jsp"> <span>System Requirements</span></a></li>
                                         </ul>
                                     </li>

                                     <li class="has-children">
                                         <a href="Applications.jsp"><i class="fa fa-bars"></i> <span>Technical</span> <i class="fa fa-angle-right arrow"></i></a>
                                         <ul class="child-nav">
                                             <li><a href="Applications.jsp"> <span>Application Data Information</span></a></li>
                                             <li><a href="Applications.jsp"> <span>Infrastructure & Environment Inforamation</span></a></li>
                                             <li><a href="Applications.jsp"> <span>Technical Information</span></a></li>
                                         </ul>
                                     </li>
                                     <li class="has-children">
                                         <a href="Applications.jsp"><i class="fa fa-archive"></i> <span>Archival Requirements</span> <i class="fa fa-angle-right arrow"></i></a>
                                         <ul class="child-nav">
                                             <li><a href="Applications.jsp"> <span>Screen/Report Requirements</span></a></li>
                                             <li><a href="Applications.jsp"> <span>Archive Requirements</span></a></li>
                                         </ul>
                                     </li>--%>
                                    <li class="has-children">
                                        <a href=""><i class="fa fa-file-text"></i> <span>Intake Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Applications.jsp" > <span>Archive Intake</span></a></li>
                                            <li><a href="Decomm_Intake_Applications.jsp" > <span>Decomm Intake</span></a></li>
                                            <%--<li><a href="Intake_TechnicalDetails.jsp"> <span>Technical Details</span></a></li>
                                            <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a></li>
                                            <li><a href="Intake_ReviewPage.jsp"> <span>Review Page</span></a></li>--%>
                                        </ul>
                                    </li>
                                    <%--<li class="nav-header">
                                        <a href='Archive_Execution.jsp'><span class="">Archive Execution Module</span></a>
                                    </li>--%>
                                    <li class="has-children">
                                        <a href=""><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Archive_Execution.jsp" > <span>Archive Execution</span></a></li>
                                            <li><a href="archivesummary.jsp" > <span>Archive summary</span></a></li>

                                        </ul>
                                    </li>
                                    <%--   <li class="nav-header">
                                           <a href='RoleUIDashboard.jsp'><span class="">Report Module</span></a>
                                       </li>--%>
                                    <li class="has-children" >
                                        <a href=""><i class="fa fa-paint-brush"></i> <span>Report Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav"  id="myDIV">
                                            <li><a href="RoleUIDashboard.jsp" > <span>Reports Dashboard</span></a></li>
                                            <li class="btn"><a href="RoleDashboard.jsp" > <span class="activ-pro">Role Dashboard</span></a></li>
                                            <li><a href="ProjectDashboard.jsp" > <span>Project Dashboard</span></a></li>
                                            <li><a href="ApplicationDashboard.jsp"> <span>Application Dashboard</span></a></li>
                                        </ul>
                                    </li>
                                </ul>

                            </div>
                            <!-- /.sidebar-nav -->
                        </div>
                        <!-- /.sidebar-content -->
                    </div>
                    <!-- /.left-sidebar -->




                    <%
String initiate=(String)session.getAttribute("Ideation and Initiate");
String plan=(String)session.getAttribute("Plan");
String execute=(String)session.getAttribute("Execute");
String hypercare=(String)session.getAttribute("Closure");
if(initiate == null)
initiate="0";
if(plan == null)
plan="0";
if(execute == null)
execute="0";
if(hypercare == null)
hypercare="0";
%>      
            
                    <div class="main-page">
                     <div class="container-fluid">
                            <div class="row page-title-div">
                                <div class="col-sm-6">
                                    <h2 class="title">Dashboard</h2>
                                   
                                </div>
                                
                            </div>
                            <!-- /.row -->
                            <div class="row breadcrumb-div">
                                <div class="col-sm-6">
                                    <ul class="breadcrumb">
                                        <li><a href="Project_List.jsp"><i class="fa fa-home"></i> Home</a></li>
                                        <li class="active">Role Dashboard</li>
                                    </ul>
                                </div>
                                <!-- /.col-sm-6 -->
                                <div class="col-sm-6 text-right hidden-xs">
                                    <a href="#" class="pl-20"><i class="fa fa-cog"></i> Settings</a>
                                </div>
                                <!-- /.col-sm-6 -->
                            </div>
                            <!-- /.row -->
                        </div>
                        <!-- /.container-fluid -->
                    
         <section>
         <br>
            <div class="container-fluid">
              <div class="row">
              <div class="col-lg-4 col-md-4">
                        <div class="cardo card-primary">
                            <div class="card-body">
                            
                                <div class="ui-widgetf">
								  <h1 class="ui-valuef"><%  while(rs4.next()){ %>
								  
								  <%= rs4.getString(1) %>
								  
								  <%}%> </h1>
								  <span class="ui-label">Users</span>
								</div> 
                            </div>
                        </div>
                    </div>
                    
                    <!-- col -->
                    
                    <div class="col-lg-4 col-md-4">
                        <div class="cardo card-second">
                            <div class="card-body">
                               <div class="ui-widgets">
						    <h1 class="ui-values"> <%  while(rs7.next()){ %><%= rs7.getString(1) %><%}%> </h1>
						     <span class="ui-label">No.of Visit</span>
						</div>
                            </div>
                        </div>
                    </div>
              
                   <div class="col-lg-4 col-md-4">
                   
                        <div class="cardo card-orange">
                       
                            <div class="card-body">
                            
                               <div class="ui-widgett">
                                
							  <h1 class="ui-valuet"><%  while(rs5.next()){ %><%= rs5.getString(1) %><%}%></h1> 
							  <span class="ui-label">Roles</span>
							  
							</div>
                            </div>
                        </div>
                    </div>
              </div>
                
   </div> 
        <!-- table -->
        <br>
        <div class="container-fluid">
        <div class="row">
 
<div class="col-lg-12 col-md-12">
<div class="panel panel-default">
     <div class="panel-heading">
        <div class="row">
        <div class="col-lg-2 col-md-1">
        <label>FromDate :</label>
        </div>
          <div class="col-lg-3 col-md-3">
           <p> <input type="text" data-provide="datepicker" class="form-control" id="fromDate" placeholder="Select the date"></p>
          </div>
           <div class="col-lg-2 col-md-1">
        <label>ToDate :</label>
        </div>
          <div class="col-lg-3 col-md-3">
           <p>  <input type="text" data-provide="datepicker" class="form-control" id="toDate" onchange="filter(this.id,'fromDate')" placeholder="Select the date"></p>
          </div>
        </div>
      </div>
 
       
   
      
        <table id="tablepaging" class="table table-bordered table-striped" align="center">
          <thead>
            <tr>
              <th class="text-center">User Name</th>
              <th class="text-center"> Role </th>
              <th class="text-center">Date </th>
              <th class="text-center">Details </th>
             
            </tr>
          </thead>
          <tbody id="tbody">
          <%
while(rs2.next())
{

%>

          
            <tr class="content">
              <td  class="text-center"><%=rs2.getString(1)%></td>
              <td  class="text-center"> <%=rs2.getString(6) %> </td>
              <td class="text-center"><%=rs2.getString(2) %></td>
              <td  class="text-center"><%=rs2.getString(5)%></td>
             
            </tr>

<%} %>
                      </tbody>
                      
                      
                       
                     
        </table>
        <div class="form-group">
      <div id="pageNavPosition" style="padding-top: 20px" align="center"><br>
      </div>
</div>
 
        </div>
        
       </div>
    </div>
      </div>
       <br>
        
        <!-- graph -->
      <div class="container-fluid">
      <input type="text" id="getUname" value="<%=uname %>" style="display:none"/>
      <div class="row">
                    <!-- Column -->
                    <div class="col-lg-7 col-md-7">
                        <div class="card">
                            <div class="card-body">
                                <div class="row">
                                  <div class="col-lg-8 col-md-5">
                                    <h3 class="title">&nbsp;&nbsp;Overview of Visits</h3>
                                      </div>
                                     <!-- dropdown -->
                                     <div class="col-lg-12 col-md-12">
                                      <div class="col-lg-4 col-md-4">
                                        
										   <span>
										      <select id='linedrop' onchange="linechartvalues(this.value)"> 
										      <option value = "none" disabled selected>Select any option </option>
										      <option  value="daily"> Daily &nbsp;&nbsp; </option>
										      <option  value="weekly"> Weekly &nbsp;&nbsp; </option>
										       <option  value="monthly"> Monthly</option>
										        <option value="yearly"> Yearly</option>
										      </select>  
										    </span>  
										   
										    </div>
										    <div class="col-lg-4 col-md-4">
										    
										    <span>
										     <select id='month' onchange="val(this.value)" hidden> 
										      <option disabled >-- Select --</option>
										      <option  value="January"> Jan </option>
										       <option  value="February"> Feb </option>
										        <option  value="March"> Mar </option>
										         <option  value="April" selected> Apr</option>
										          <option  value="May"> May </option>
										           <option  value="June"> June </option>
										            <option  value="July"> July </option>
										             <option  value="August"> Aug </option>
										              <option  value="September"> Sep </option>
										               <option  value="October"> Oct </option>
										                <option  value="November"> Nov </option>
										                 <option  value="December"> Dec </option>
										     
										      </select>  
										    
										   
										     <select id="year1"  onchange="weeklyline_chart(this.value)"  hidden> 
										      <option disabled > -- Select --  </option>
										      <option  value="2015">2015</option>
										      <option  value="2016">2016</option>
										      <option  value="2017">2017</option>
										      <option  value="2018" selected>2018</option>
										      <option  value="2019">2019</option>
										      <option  value="2020">2020</option>
										      <option  value="2021">2021</option>
										       
										     
										      </select>  
										    </span>
										    </div>
										    <div class="col-lg-4 col-md-4">
										   
										    <span>
										     <select id="year"  onchange="line_chart(this.value)"  hidden> 
										      <option disabled > -- Select --  </option>
										      <option  value="2015">2015</option>
										      <option  value="2016">2016</option>
										      <option  value="2017">2017</option>
										      <option  value="2018" selected>2018</option>
										      <option  value="2019">2019</option>
										      <option  value="2020">2020</option>
										      <option  value="2021">2021</option>
										       
										     
										      </select>  
										    </span>
										   
										 
										  
										    </div>
										 <div>
										 </div>
										 </div>
                                    <div id="curve_chart" style="height: 250px; width:800px;"></div>
                              
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-5">
                        <div class="card">
                            <div class="card-body">
                                <h3 class="card-title">Role Status</h3>
                                <h6 class="card-subtitle"></h6>
                             <div id="piechart"></div>
                            </div>
                            
                            
                        </div>
                    </div>
                </div>
      
      
      
      </div>      
            <script type="text/javascript">

function Pager(tableName, itemsPerPage) {

this.tableName = tableName;

this.itemsPerPage = itemsPerPage;

this.currentPage = 1;

this.pages = 0;

this.inited = false;

this.showRecords = function(from, to) {

var rows = document.getElementById(tableName).rows;

// i starts from 1 to skip table header row

for (var i = 1; i < rows.length; i++) {

if (i < from || i > to)

rows[i].style.display = 'none';

else

rows[i].style.display = '';

}

}

this.showPage = function(pageNumber) {

if (! this.inited) {

alert("not inited");

return;

}

var oldPageAnchor = document.getElementById('pg'+this.currentPage);

oldPageAnchor.className = 'pg-normal';

this.currentPage = pageNumber;

var newPageAnchor = document.getElementById('pg'+this.currentPage);

newPageAnchor.className = 'pg-selected';

var from = (pageNumber - 1) * itemsPerPage + 1;

var to = from + itemsPerPage - 1;

this.showRecords(from, to);

}

this.prev = function() {

if (this.currentPage > 1)

this.showPage(this.currentPage - 1);

}

this.next = function() {

if (this.currentPage < this.pages) {

this.showPage(this.currentPage + 1);

}

}

this.init = function() {

var rows = document.getElementById(tableName).rows;

var records = (rows.length - 1);

this.pages = Math.ceil(records / itemsPerPage);

this.inited = true;

}

this.showPageNav = function(pagerName, positionId) {

if (! this.inited) {

alert("not inited");

return;

}

var element = document.getElementById(positionId);

var pagerHtml = '<span onclick="' + pagerName + '.prev();" class="pg-normal"> � Prev </span>&nbsp;';

for (var page = 1; page <= this.pages; page++)

pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + ');">' + page + '</span> ';

pagerHtml += '<span onclick="'+pagerName+'.next();" class="pg-normal"> Next �</span>';

element.innerHTML = pagerHtml;

}

}

</script>
    <script type="text/javascript"><!--
var pager = new Pager('tablepaging', 10);
pager.init();
pager.showPageNav('pager', 'pageNavPosition');
pager.showPage(1);
</script>      

  
                   
  
     
      <%
      String query8 = "select * from Admin_UserDetails where roles='"+roles+"'and uname='"+uname+"'"; 
      Statement st8 = conn.createStatement();
      ResultSet rs8 = st8.executeQuery(query8);
      %>  
  
    <script type="text/javascript">
// Load google charts
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

// Draw the chart and set the chart values
function drawChart() {
	 
	 var selectedRole = $('#slct1').val();  
	 var selecteduser = $('#username').val();  
    
	
	var dataTable = new google.visualization.DataTable();
    dataTable.addColumn('string', 'Year');
    dataTable.addColumn('number', 'Sales');
    // A column for custom tooltip content
    dataTable.addColumn({type: 'string', role: 'tooltip'});
    dataTable.addRows([
  <% while(rs8.next()){ 
	 
  String query22 = "select * from ArchiveExecution_Details where projects='"+rs8.getString("projects")+"' and level=1";
	Statement st22 = conn.createStatement();
	ResultSet rs22 = st22.executeQuery(query22);
	
	while(rs22.next())
	{
	if(rs22.getString("progressbar")=="100")
	continue;
	else
	break;
	}

	String status=rs22.getString("name");
	String progressBar=rs22.getString("progressbar");
	
	if(progressBar.equals("0"))
		progressBar="1";
	  String query23 = "select sum(count) from visits where module= 'Logged in' and uname='"+uname+"'";
		Statement st23 = conn.createStatement();
		ResultSet rs23 = st23.executeQuery(query23);
		String ttl_visits="",CurntDay_visits="",last_visited_Module="",last_visited_App="";
		while(rs23.next())
			 ttl_visits=rs23.getString(1);
		 String query24 = "select sum(count) from visits where date=CURDATE() and uname='"+uname+"'";
			Statement st24 = conn.createStatement();
			ResultSet rs24 = st24.executeQuery(query24);
			while(rs24.next())
				CurntDay_visits=rs24.getString(1);
		String query25 = "select module from visits where projects='"+rs8.getString("projects")+"' order by date desc,time desc";
				Statement st25 = conn.createStatement();
				ResultSet rs25 = st25.executeQuery(query25);
				if(rs25.next())
					last_visited_Module=rs25.getString(1);
  
				String query30 = "select Applications from visits where projects='"+rs8.getString("projects")+"' and module='Intake Module' order by date desc,time desc";
				Statement st30 = conn.createStatement();
				ResultSet rs30 = st30.executeQuery(query30);
				if(rs30.next())
					last_visited_App=rs30.getString(1);
	
	String query26 = "select seq_num from ArchiveExecution_Details where projects='"+rs8.getString("projects")+"' and name='"+rs8.getString("application")+"'";
	Statement st26 = conn.createStatement();
	ResultSet rs26 = st26.executeQuery(query26);
	String seqnum="";
	if(rs26.next())
	seqnum=rs26.getString(1);

	String query27="select * from ArchiveExecution_Details where projects='"+rs8.getString("projects")+"' and seq_num>"+seqnum+" and seq_num<="+(Integer.parseInt(seqnum)+70)+" and level=3 order by seq_num";
	//System.out.println(query3);
	Statement st27 = conn.createStatement();
	ResultSet rs27 = st27.executeQuery(query27);

	String Stats="",ProgresBar="";
	while(rs27.next())
	{
	if(rs27.getString("name").equals("Requirements") && Integer.parseInt(rs27.getString("progressbar"))<100 ){
	Stats="Requirements";
	ProgresBar=rs27.getString("progressbar");
	break;
	}
	if(rs27.getString("name").equals("Build and Test") && Integer.parseInt(rs27.getString("progressbar"))<100){
	Stats="Development";
	ProgresBar=rs27.getString("progressbar");
	break;
	}
	if(rs27.getString("name").equals("Implement") && Integer.parseInt(rs27.getString("progressbar"))<100 ){
	Stats="Implement";
	ProgresBar=rs27.getString("progressbar");
	break;
	}
	}
			
	System.out.println(Stats);

		
	
    %>
    ['<%= rs8.getString(6) %>', <%= progressBar %>, "Total Visits : <%= ttl_visits %>\nVisits in current day : <%= CurntDay_visits %>\n Last Visited Module : <%= last_visited_Module %>\n Last Visited Application : <%= last_visited_App %>\n Application : <%= rs8.getString(11)%>,Status : <%= Stats %>\n Percentage of Completion : <%= progressBar %>%"],
  <% }  %>
]);

  // Optional; add a title and set the width and height of the chart
  var options = {
		  'title':'',
		  'width':400,
		  'height':350,
		
		  pieSliceText: 'label',
		  legend : 'none'
  };
  

  // Display the chart inside the <div> element with id="piechart"
  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(dataTable, options);
}
</script>

<%
String query10 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 10 DAY) AND NOW() and uname = '"+uname +"'";
Statement st10 = conn.createStatement();
ResultSet rs10 = st10.executeQuery(query10);
String query12 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 20 DAY) AND NOW() and uname = '"+uname +"'";
Statement st12 = conn.createStatement();
ResultSet rs12 = st12.executeQuery(query12);
String query13 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 30 DAY) AND NOW() and uname = '"+uname +"'";
Statement st13 = conn.createStatement();
ResultSet rs13 = st13.executeQuery(query13);
String query11 = "SELECT    * FROM visits WHERE date BETWEEN DATE_SUB(NOW(), INTERVAL 50 DAY) AND NOW() and uname = '"+uname +"'";
Statement st11 = conn.createStatement();
ResultSet rs11 = st11.executeQuery(query11);
String query15 = "select SUBSTR(date,1,4), (SUBSTR(date,6,2)-1),SUBSTR(date,9,2),count from  visits where uname = '"+uname +"'";
Statement st15 = conn.createStatement();
ResultSet rs15 = st15.executeQuery(query15);
String query16 = "select SUBSTR(date,1,4), MONTHNAME(date),SUBSTR(date,9,2),count from  visits";
Statement st16 = conn.createStatement();
ResultSet rs16 = st16.executeQuery(query16);
String query17 = "select SUBSTR(date,1,4), (SUBSTR(date,6,2)-1),SUBSTR(date,9,2),count from  visits";
Statement st17 = conn.createStatement();
ResultSet rs17 = st17.executeQuery(query17);
String query19 = "select SUBSTR(date,1,4), (SUBSTR(date,6,2)-1),SUBSTR(date,9,2),count from  visits where uname = '"+uname +"'";
Statement st19 = conn.createStatement();
ResultSet rs19 = st19.executeQuery(query19);

int last_10=0,last_30=0,last_50=0,last_20=0;
while(rs10.next())
	last_10+=Integer.parseInt(rs10.getString(4));
while(rs11.next())
	last_50+=Integer.parseInt(rs11.getString(4));
while(rs12.next())
	last_20+=Integer.parseInt(rs12.getString(4));
while(rs13.next())
	last_30+=Integer.parseInt(rs13.getString(4));
%>


<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  
        var data = google.visualization.arrayToDataTable([
        	
          ['day', 'Visits'],
          ['Last 10 days', <%= last_10 %> ],
          ['Last 20 days', <%= last_20 %>],
          ['Last 30 days', <%= last_30 %>],
          ['Last 50 days', <%= last_50 %>]
        ]);

        var options = {
          title: '',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script> 

        <script type="text/javascript">
 function linechartvalues(){
	 
 var lineweekly =document.getElementById("linedrop").value;
 
 

 
  
 if ( lineweekly == 'daily') {
	 
	 document.getElementById('month').style.display = 'none';
	 document.getElementById('year').style.display = 'none';
	 document.getElementById('year1').style.display = 'none';
	 
	 google.charts.load('current', {'packages':['corechart','line']});
     google.charts.setOnLoadCallback(drawChart);

     function drawChart() {
   	
       var data = google.visualization.arrayToDataTable([
       	
         ['Date', 'No.of.Visits'],
        
        <%
        while(rs15.next())
        {
        %>
       	 
       
         [ new Date(<%=rs15.getString(1)%>,<%=rs15.getString(2)%>,<%=rs15.getString(3)%>), <%= rs15.getString(4)%>],
        
        <%}%>
      
       ]);

       var options = {
         title: '',
         curveType: 'function',
        
         pointSize: 5,
         colors: ['rgb(71, 0, 200)'],
         hAxis: {
             title: 'Date',
             format: 'MM/dd/yy',
            
            	 titleTextStyle: {
            		          		    fontSize: '16',
            		  }
         },
         vAxis: {
           title: 'No of visits',
           minValue: 0,
           ticks: [{v:0, f:'0'},{v:100, f:'100'},{v:200, f:'200'},{v:300, f:'300'}],
         },
         
       
       };

       if (data.getNumberOfRows() === 0) {
    	   data.addRows([
    	        ['0', 0, null, 'No Data Copy']
    	      ]);
    	    }

       var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
       
          
       chart.draw(data, options);
          
     
     
	}
	 
 }
   

 
 else if(lineweekly == 'weekly'){
	 
	 document.getElementById('month').style.display = 'block';
	 document.getElementById('year1').style.display = 'block';
	 document.getElementById('year').style.display = 'none';
	 
	 val();
	 
	 
 } 
 else if(lineweekly == 'monthly'){
	 document.getElementById('month').style.display = 'none';
	 document.getElementById('year').style.display = 'block';
	 document.getElementById('year1').style.display = 'none';
	 line_chart();
	 
 } 
 
 else if(lineweekly == 'yearly'){
	 document.getElementById('month').style.display = 'none';
	 document.getElementById('year').style.display = 'none';
	 document.getElementById('year1').style.display = 'none';
	 google.charts.load('current', {'packages':['corechart','line']});
     google.charts.setOnLoadCallback(drawChart);

     function drawChart() {
   	
       var data = google.visualization.arrayToDataTable([
    	   
         ['Year', 'No.of.Visits'],
        
        <%
        while(rs19.next())
        {
        %>
       	 
       
         [new Date(<%=rs19.getString(1)%>,<%=rs19.getString(2)%>,<%=rs19.getString(3)%>), <%= rs19.getString(4)%>],
        
        <%}%>
        
      
       
       ]);

       var options = {
         title: '',
         curveType: 'function',
        
         colors: ['rgb(255, 0, 200)'],
         hAxis: {
             title: 'Year',
            format : 'yyyy',
            pointSize: 5,
             viewWindow: {min:new Date(2017,01,01),
            	 max:new Date(2022,01,01), 
             },
            	 titleTextStyle: {
            		          		    fontSize: '16',
            		  }
         },
         vAxis: {
           title: 'No of visits',
           minValue: 0,
           
           ticks: [{v:0, f:'0'},{v:100, f:'100'},{v:200, f:'200'},{v:300, f:'300'}],
         },
         
       
       };

       if (data.getNumberOfRows() === 0) {
    	   data.addRows([
    	        ['0', 0, null, 'No Data Copy']
    	      ]);
    	    }

       var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
       
          
       chart.draw(data, options);
          
     
     
	}
	 
 } 
 }
 
 
    </script> 
    <script>
    function val(){
    	
    	var month=document.getElementById("month").value;
    	
    	
    	if (month != null ){
    		
    		weeklyline_chart();
    		
    	}
    	
    	
    	
    	
    	
    }
    
    </script>
<script>




  function weeklyline_chart(){
	   var str_array=[];
  
  	var month=document.getElementById("month").value;
  	var year=document.getElementById("year1").value;
  	var uname=document.getElementById("getUname").value;
  	
  	$.ajax({
  	      url: "Weekly_linechart",
  	      type: "Post",
  	      data: { field1: month, field2 : year, field3: uname},
  	      dataType: "text",
  	      
  	    
  	      success : function(data) {
  	    	var str = data;
  	    	str_array=" ";
  	        str_array = str.split(',');
  	    
  	        for(var i = 0; i < str_array.length; i++) {
  	   
  	        str_array[i] = str_array[i].replace(/^\s*/, "").replace(/\s*$/, "");
  	}
  	    	  
  	      google.charts.load('current', {'packages':['corechart','line']});
  	  	google.charts.setOnLoadCallback(drawChart);
  	  
  	  	function drawChart() {
  	  		var name;
  	  		  	    
  	  	  var data = new google.visualization.DataTable();
  	  	  data.addColumn('string','name');
  	  	  data.addColumn('number','value');
  	  	   
  	  	  for(var i=0;i<str_array.length;i=i+2)
  	  		  {
  	  	
  	  		
  	  		  data.addRow([str_array[i],Number(str_array[i+1])]);
  	  		  }
  	  		
  	  	
  	  	  var options = {
  	  	        title: '',
  	  	        curveType: 'function',
  	  	        pointSize: 5,
  	  	        
  	  	        colors: ['#fb8532'],
  	  	       
  	  	        vAxis: {
  	  	          title: 'No of visits',
  	  	          minValue: 0,
  	  	      ticks: [{v:0, f:'0'},{v:100, f:'100'},{v:200, f:'200'},{v:300, f:'300'}],
  	  	        },
  	  	        
  	  	        hAxis: {
  	  	            title: 'No of weeks',
  	  	            minValue: 0,
  	  	        pointSize: 5,
  	  	          },
  	  	        
  	  	      };

  	  	  var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
  	  	  

  	  	  

  	  	  chart.draw(data, options);
  	  	 
  	  	}  
  	          
  	      }   
  });
  	
  	
 
	  
  }
  
  
  </script>

<script>



</script>
 
    
      <!-- filter Html table -->
      
 
      <!-- linechart  -->
      
  <%
}

}
catch(Exception e){}
%>    
           
 
      

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
                          
         </div>
<script>
    // Add active class to the current button (highlight it)
    var header = document.getElementById("myDIV");
    var btns = header.getElementsByClassName("btn");
    for (var i = 0; i < btns.length; i++) {
        btns[i].addEventListener("click", function() {
            var current = document.getElementsByClassName("active");
            current[0].className = current[0].className.replace(" active", "");
            this.className += " active";
        });
    }
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
        <script src="js/main.js"></script>
        <script src="js/production-chart.js"></script>
        <script src="js/traffic-chart.js"></script>
        <script src="js/task-list.js"></script>
       
        <!-- ========== PAGE JS FILES ========== -->
        
        <script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
        <script type="text/javascript" src="js/date-picker/datepair.js"></script>
        <script type="text/javascript" src="js/date-picker/moment.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

        <!-- ========== THEME JS ========== -->
        <script>
            $(function($) {

                // 1st  datepicker
                $('#basicExample .time').timepicker({
                'showDuration': true,
                'timeFormat': 'g:ia'
                });

                $('#basicExample .date').datepicker({
                'format': 'd/m/yyyy',
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

function filter(input,s2)
	{  
    
    var fromdate = document.getElementById("fromDate").value;
    var todate = document.getElementById("toDate").value;
    
    
    if (typeof XMLHttpRequest != "undefined"){
    xmlHttp= new XMLHttpRequest();
    }
    else if (window.ActiveXObject){
    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (xmlHttp==null){
    alert("Browser does not support XMLHTTP Request")
    return;
    } 
    
    var url="table.jsp";
    url +="?fdate="+fromdate+"&tdate="+todate;
    xmlHttp.onreadystatechange = stateChange;
    xmlHttp.open("GET", url, true);
    xmlHttp.send(null);
    
          }

    function stateChange(){   
    if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
    document.getElementById("tbody").innerHTML=xmlHttp.responseText   

   
    }   
    
 
    }
</script>



        
</body>
</html>

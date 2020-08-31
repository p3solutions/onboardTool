
<!DOCTYPE html>
<html lang="en">
<head>
 <meta charset="UTF-8" />
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>Onboard</title>
 
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
        <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
   
 <script type="text/javascript" src="js_in_pages/business.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
  <link rel="stylesheet" href="js_in_pages/business.css" type="text/css" />
  
   
  </head><!--from  w  w w  . ja  va 2 s.co  m-->
    <style>
 body {
  font-family: Arial, sans-serif;

  background-size: cover;
  height: 100vh;
}

h1 {
  text-align: center;
  font-family: Tahoma, Arial, sans-serif;
  color: #06D85F;
  margin: 80px 0;
}

.box {
  width: 40%;
  margin: 0 auto;
  background: rgba(255,255,255,0.2);
  padding: 50px;
  border: 2px solid #fff;
  border-radius: 20px/50px;
  background-clip: padding-box;
  text-align: center;
}



.overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background: rgba(0, 0, 0, 0.7);
  transition: opacity 500ms;
  visibility: hidden;
}
.overlay:target {
  visibility: visible;
  opacity: 1;
}

.popup {
  margin: 210px auto;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  width: 40%;
  position: relative;
  
}

.popup h2 {
  margin-top: 0;
  color: #333;
  font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
  position: absolute;
  top: 20px;
  right: 30px;
  transition: all 200ms;
  font-size: 30px;
  font-weight: bold;
  text-decoration: none;
  color:black;
}
.popup .close:hover {
  color: black;
}
.popup .content {
  max-height: 30%;
  overflow: auto;
}

.button{
color:white;
}
@media screen and (max-width: 700px){
  .box{
    width: 70%;
  }
  .popup{
    width: 70%;
  }
  
}

 #nav_userid{
             color:green;
             }
               
              #nav_role{
              color:blue;
              }  
.ScrollStyle
{
    max-height: 350px;
    overflow-y: scroll;
}
/*END Form Wizard*/
.container { background: white; }

</style>
  <script>
 function chk(){
var number=document.getElementById("number").value;
var s="";
for(var i = 1; i <= number; i++) {
    s+= '<label>Checkbox Label'+i +':</label><input type="text" class="form-control" name="label'+i+'"><br/>'; //Create one textbox as HTML
}
document.getElementById("demo").innerHTML=s;
 }
 
 function radio(){
	 var number=document.getElementById("radio_number").value;
	 var s="";
	 for(var i = 1; i <= number; i++) {
	     s+= '<label>Radiobox Label'+i +':</label><input type="text" class="form-control" name="Rlabel'+i+'"><br/>'; //Create one textbox as HTML
	 }
	 document.getElementById("demo1").innerHTML=s;
	  }
 function drp_dwn(){
	 var number=document.getElementById("drop_number").value;
	 var s="";
	 for(var i = 1; i <= number; i++) {
	     s+= '<label>Options Label'+i +':</label><input type="text" class="form-control" name="drp_label'+i+'"><br/>'; //Create one textbox as HTML
	 }
	 document.getElementById("demo2").innerHTML=s;
	  }
 </script> 
    <script>
   function call()
   {
	  // alert(ans);
	   var type=document.getElementById("types");
	//   alert(type);
	   if(type[type.selectedIndex].value == "Check box") {
		   alert("check box");
	    document.getElementById("check").style.display='block';
	    document.getElementById("rdo").style.display='none';
	    document.getElementById("drop").style.display='none';
	   }
	   if(type[type.selectedIndex].value == "Text box") {
		   alert("text box");
		    document.getElementById("check").style.display='none';
		    document.getElementById("rdo").style.display='none';
		    document.getElementById("drop").style.display='none';
		   }
	   if(type[type.selectedIndex].value == "Radio box") {
		   alert("radio box");
		    document.getElementById("rdo").style.display='block';
		    document.getElementById("check").style.display='none';
		    document.getElementById("drop").style.display='none';
		   }
	   if(type[type.selectedIndex].value == "Dropdown") {
		   alert("dropdown");
		    document.getElementById("rdo").style.display='none';
		    document.getElementById("check").style.display='none';
		    document.getElementById("drop").style.display='block';
		   }
   }
   </script>
 
  
  <body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed EditProject JSP PAGE-----[INFO]");  %>
  <%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<%@ page import="java.util.*" %>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.html");
}
%>


<%
try {
HttpSession details=request.getSession();

String ID=(String)session.getAttribute("theName");
String app_Name = request.getParameter("appname");
if (app_Name != null && !app_Name.isEmpty()) {
session.setAttribute("appidd", app_Name);
}
String label=request.getParameter("label");
String id=request.getParameter("idname");
String name=request.getParameter("name");
app_Name=(String)session.getAttribute("appidd");
DBconnection d=new DBconnection();
Connection conn = (Connection)d.getConnection();

String Project_Name=(String)details.getAttribute("nameofproject");
String username=(String)details.getAttribute("u_Name");



String query3 = "select * from AppEmphazize_ProjectDetails where id = "+ID;
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
String query4 = "select * from AppEmphazize_ApplicationInfo where appname ='"+app_Name+"'";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);

String roles=(String)details.getAttribute("role");
String imp_id="";
String sequenceNumber="",pan_ID="";

if(rs3.next()){
	String project_NAME=rs3.getString("projectname");
{
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
                         
                    <% if(rs4.next()){
                    	%>
                         <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %>-<%=rs4.getString("appname") %></a>
                       <input type="text" id="project_name" name="project_name" value="<%=rs3.getString("projectname")%>" style="display:none;">
                        <input type="text" id="appln_name" name="appln_name" value="<%= app_Name%>" style="display:none;">
                

                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
 <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span id="nav_userid"><%=username%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=roles%></span></a></li>
      
<li><a href="logout.jsp" class=" text-center"><i class="fa fa-sign-out"></i> Logout</a>
                        </li>
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
                                            <li><a href="AppEmphasize_EditProject.jsp" class="active-menu"> <span>Project Information</span></a></li>
                                            <li><a href="AppEmphasize_Application.jsp" class="active-menu"> <span>Application Information</span></a></li>
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
                                            <li><a href="Applications.jsp" class="active-menu"> <span>Application Details</span></a></li>
                                            <li><a href="Intake_Business.jsp" > <span>Business Details</span></a></li>
                                            <li><a href="Intake_TechnicalDetails.jsp"> <span>Technical Details</span></a></li>
                                            <li><a href="Intake_ArchiveRequirements.jsp"> <span>Archive Requirements</span></a></li>
                                            <li><a href="Intake_ReviewPage.jsp"> <span>Review Page</span></a></li>
                                        </ul>
                                    </li>
                                    <%--<li class="nav-header">
                                        <a href='Archive_Execution.jsp'><span class="">Archive Execution Module</span></a>
                                    </li>--%>
                                    <li class="has-children">
                                        <a href=""><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Archive_Execution.jsp" class="active-menu"> <span>Archive Execution</span></a></li>
                                            <li><a href="archivesummary.jsp" > <span>Archive summary</span></a></li>

                                        </ul>
                                    </li>
                                    <%--   <li class="nav-header">
                                           <a href='RoleUIDashboard.jsp'><span class="">Report Module</span></a>
                                       </li>--%>
                                    <li class="has-children">
                                        <a href=""><i class="fa fa-paint-brush"></i> <span>Report Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="RoleUIDashboard.jsp" class="active-menu"> <span>Reports Dashboard</span></a></li>
                                            <li><a href="RoleDashboard.jsp" class="active-menu"> <span>Role Dashboard</span></a></li>
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
            

                <script>
  $(function () {
    // 6 create an instance when the DOM is ready
    $('#jstree').jstree();
    // 7 bind to events triggered on the tree
    $('#jstree').on("changed.jstree", function (e, data) {
      console.log(data.selected);
    });
    // 8 interact with the tree - either way is OK
    $('button').on('click', function () {
      $('#jstree').jstree(true).select_node('child_node_1');
      $('#jstree').jstree('select_node', 'child_node_1');
      $.jstree.reference('#jstree').select_node('child_node_1');
    });
  });
  </script>
                
                			
<!-- Projects List Start -->

                 
                     
            <form class="form-signin" name="loginForm" method="post" action="Edit_Intake">
 <div class="content-wrapper">
                <div class="content-container">
            
                    <div class="main-page">
                    <h2>&nbsp;&nbsp;EDIT PAGE</h2>
                     <div class="container"><br/><br/>
                     
<div class="row">
 <div class="form-group"> 
 <div class="col-sm-8">
<label class="control-label" for="formInput526">Label:</label>
<input type="text" class="form-control" id="label"  name="label" value="<%= label %>" required>
</div>
 </div>
 </div><br/>
  <div class="row">
 <div class="form-group"> 
 <div class="col-sm-8">
<input type="text" class="form-control" id="idname"  name="idname" value="<%= id %>" style="display:none;">
</div>
 </div>
 </div><br/>
 <input type="text" id="servlet_name" name="servlet_name" value="<%= name %>" style="display:none;">
 <div class="row">
 <div class="form-group"> 
 <div class="col-sm-8">
<label class="control-label" for="formInput526">Type:</label>
<select id="types" class="form-control" name="types" onChange="call()" required >  
                                                <option value="Text box">Text box</option>                                                 
                                                <option value="Check box">Check box</option>
                                                <option value="Radio box">Radio box</option> 
                                                <option value="Dropdown">Dropdown</option>                                              
                                            </select>
</div>
 </div>
 </div><br/>
 
 <div class="row" id="check" style="display:none;">
  <div class="form-group"> 
 <div class="col-sm-8">
<label class="control-label" for="formInput526">Number of check boxes:</label>
<input type="text" class="form-control" id="number"  name="number" onChange="chk()">
</div>
 </div>
 <br/>
 </div>
  <div class="row" id="rdo" style="display:none;">
 <div class="form-group"> 
 <div class="col-sm-8">
<label class="control-label" for="formInput526">Number of Radio boxes:</label>
<input type="text" class="form-control" id="radio_number"  name="radio_number" onChange="radio()">
</div>
 </div>
 <br/>
 </div>
  <div class="row" id="drop" style="display:none;">
 <div class="form-group"> 
 <div class="col-sm-8">
<label class="control-label" for="formInput526">Number of Options:</label>
<input type="text" class="form-control" id="drop_number"  name="drop_number" onChange="drp_dwn()">
</div>
 </div>
 <br/>
 </div>

  <div class="row">
  <div class="form-group"> 
 <div class="col-sm-8">
  <div id="demo"></div>
</div>
 </div>
 </div>
 
  <div class="row">
  <div class="form-group"> 
 <div class="col-sm-8">
  <div id="demo1"></div>
</div>
 </div>
 </div>
 <div class="row">
  <div class="form-group"> 
 <div class="col-sm-8">
  <div id="demo2"></div>
</div>
 </div>
 </div>

 <div class="row">
  <div class="form-group"> 
 <div class="col-sm-8">
<label class="control-label" for="formInput526">Mandatory:</label>
<select id="mandatory" class="form-control" name="mandatory" required > 
                                                <option>Yes</option>                                                 
                                                <option>No</option>                                              
                                            </select>
</div>
 </div>
 </div>
<br/><br/>
 <button type="submit" class="btn btn-primary">Submit</button>
 <button type="button" onclick="window.location.href='Intake_Business.jsp'" class="btn btn-default">Cancel</button>
 <br/><br/>
 </div></div></div>
  </form>
                     
                    <%
                    }}
                    }
                    }
                    catch(Exception e){}
                    %>
       
                   <!-- /.row -->
				</section>
                        <!-- /.section -->

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
                     inline: t	rue,
                     sideBySide: true
                 });
             });
         </script>

</body>
</html>

<html lang="en">
<head>
    <title>Edit Wave</title>
    <meta charset="UTF-8" />
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
  
   <!-- ========== multiselect dropdown ========== -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/css/bootstrap-select.css"/>
   

 <!-- =========== Header Icon ========= -->
 
  <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/> 
  <link rel="stylesheet" href="css/headerIcon/headerIcon.css"
	media="screen">
 

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
     <link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
	media="screen">
	<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">
</head>
<style>

    body{
            background:#fff;
        }

        .active1{
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

#panels1{
margin:60px auto;
}

.iconAlign{
    display: flex;
	align-items: center;
	justify-content: center;
    width : 100px;
    margin-bottom: 10px;
    
}
.iconColor{
	color: #1565c0;
}

.textColor:hover{
	text-color: #1565c0;
}

li a .iconColor:hover{
	color: #1565c0;
}

li a .activeIcon :hover{
	color: #1565c0;
}

li a.alignCenter{
	text-align : center;
	font-size: 15px;  
}
.navAlign{
margin-left : 150px;
}

}
    


</style>

<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Access Intake NewOpportunity JSP PAGE-----[INFO]");  %>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.util.ArrayList" %>

<%@page import="java.sql.*"%>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="onboard.DBconnection" %>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.jsp");
}
HttpSession details = request.getSession();
%>

 <%
    String uname=(String)details.getAttribute("username");
    String role=(String)details.getAttribute("role");%>
<%@include file="Nav-Bar.jspf"%>
	<nav class="nav nav-height-50" id="bg-color">
		<div class="container-fluid" id="container-fluid-margin">
			<div class="row" id="d3s-mt-10">
				<div class="col-lg-12 col-md-12">
					<h5 id="title">Edit Wave</h5>
				</div>
			</div>
		</div>
	</nav>
<div class="main-wrapper">

        <!-- ========== TOP NAVBAR ========== -->
   <%--  <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                 <div class="navbar-header no-padding" style = "height : 100px;">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/Decom3Sixty_logo.png" alt="Decom3Sxity" class="logo" style = "margin-top : 50px;">
                    </a>
                </div>
                <!-- /.navbar-header -->
                <div class="tabs-content">
                   <ul class="nav navbar-nav headerTab navAlign">
		              <li><a class = "alignCenter" href="OpportunityList.jsp"><i class="fad fa-folders fa-2x iconAlign iconColor"></i>Applications</a></li>
		              <li><a class = "alignCenter" href="Admin_Module_Send_Invites.jsp"><i class="fad fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a></li>
		              <li class="active1"><a class = "alignCenter" href="PhaseList.jsp" style= "color:#fff;"><i class="fad fa-desktop iconAlign activeIcon fa-2x"></i>Governance</a></li>
		              <li><a class = "alignCenter" href="#"><i class="fad fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
		              <li ><a class = "alignCenter" href="DashBoard.jsp"><i class="fad fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a></li>
		              <li><a class = "alignCenter" href="#"><i class="fad fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a></li>
		          </ul>
		         <ul class="nav navbar-nav navbar-right" style = "margin-top:45px;">
                       

                        <li><a href="#"><span id="nav_userid"><%=uname%>&nbsp;</span>logged in as &nbsp;<span id='nav_role'><%=role%></span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
                
                
                
                
            </div> --%>
            <!-- /.row -->
           <!--  <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h4 class="title" style="color:#fff">Edit Wave</h4>
                              <p class="sub-title">Create and manage your Opportunities here</p>
                        </div>
                       

                    </div>

                </div>
			</nav>
        </div> -->
        <!-- /.container-fluid -->
    <!-- </nav > -->

        <div class="content-wrapper">
            <div class="content-container">

               
                <div class="main-page">

                    <section class="design-process-section" id="process-tab">
 
                          

                            <div class="row">
                             <br>
                                <div class="container">
                              
                                

 <div  class="container" id="panel-container">
 
     <div class="card-container-1 mt-5">
         <div class="Card">
            <div class="card-header" id="cd-header">Edit Wave</div>
         
         <%@ page import="java.sql.*"%>
         <div id="collapse2" class="panel-collapse">
             <div class="panel-body text-left">
             <form class="form-signin" name="OpportunityForm" enctype='application/json'>
             <div id ="inputFields">
                   <div class='form-group'>
                        <input type='hidden' class='form-control' size='35' id="Id" placeholder='' name="Id" value=""/>
                       <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/>
                        </div>	               
              </div>     
              
	              
	                      <div class="row">
                <div class="col-4">
	               <button type="button" class="btn btn-secondary" onclick="location.href='waveList.jsp';">Back</button>
	           </div>
	               <div class = "col-8" align="end">
	                <div class = "dropdown">
                            <button class="btn btn-secondary dropdown-toggle " type="button" data-bs-toggle="dropdown">Actions
                              <span class="caret"></span></button>
                                
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item dropDown-font" href="#" id = "add" data-bs-toggle="modal" data-bs-target="#AddPopUp">
                                	<i class="fas fa-plus" aria-hidden="true">&nbsp;&nbsp;&nbsp;</i>Add</a></li>
                                <li><a class="dropdown-item dropDown-font" href="#" id = "Edit">
                                	<i class="fas fa-edit" aria-hidden="true">&nbsp;&nbsp;</i>Edit</a></li>
                                <li><a class="dropdown-item dropDown-font" href="#" id = "Delete">
                                	<i class="fas fa-trash" aria-hidden="true">&nbsp;&nbsp;&nbsp;</i>Delete</a></li>
                                </ul>
                                
                                </div>
	                       <button type="submit" class="btn btn-primary" id="create">Create</button>
	                       <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" data-bs-toggle="modal" data-bs-target="#EditPopUp" style="display:none;">Edit PopUp</button>
	                      <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-bs-toggle="modal" data-bs-target="#DeletePopUp" style="display:none;">Delete PopUp</button>
	                      <button type="button" class="btn btn-primary pull-right" id="infopopup_btn" data-bs-toggle="modal" data-bs-target="#InfoPopUp" style="display:none;">Info PopUp</button>	                      
	                      <button type="button" class="btn btn-primary pull-right" id="governanceListId" onclick ="window.location.href='waveList.jsp';"style="display:none;"></button>
	                      </div>
	                      </div>
	                      </form>
	               
	     <!--Delete pop up-->
	     <div class="modal" id="DeletePopUp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		<h5 class="modal-title" id="exampleModalLabel">Delete
			Field</h5>
		<button type="button" class="btn-close"
			data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="sequence1"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="submit2" class="btn btn-primary" data-bs-dismiss="modal">Yes</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>                         
	               
 <!-- Info Pop Up-->
	     <div class="modal" id="InfoPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Information</h5>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">No Wave found to create new wave.</p>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="infoSubmit" onclick="location.href='OpportunityList.jsp'"class="btn btn-primary" >OK</button>
      </div>
    </div>
  </div>
</div>                         

	<!-- Edit pop up -->
	<div class="modal" id="EditPopUp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		 <h5 class="modal-title" id="exampleModalLabel">Edit
			Input Field</h5>
		<button type="button" class="btn-close"
			data-bs-dismiss="modal" aria-label="Close"></button>
	</div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="Label_modify"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="text" id="seq_num" name="" value="" style="display:none;">
        </form>

      </div>
      <div class="modal-footer">
        <button type="button" id="submit1" class="btn btn-primary" data-bs-dismiss="modal" >Submit</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>               
<!-------Add popup---------->	
<div class="modal" id="AddPopUp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
     <div class="modal-header">
		<h5 class="modal-title" id="exampleModalLabel">Add
			Input Fields</h5>
			<button type="button" class="btn-close"
				data-bs-dismiss="modal" aria-label="Close"></button>
		</div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="label"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="project_name" name="project_name" value="">

                <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">


                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="idname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="types" class="form-select" name="types" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="row hidefield" id="check" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="number"  name="number1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="rdo" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="radio_number"  name="radio_number">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="drop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="drop_number"  name="drop_number">
                        </div>
                    </div>
                    <br/>
                </div>

                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo"></div>
                        </div>
                    </div>
                </div>
                <div id="options">
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo1"></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <div id="demo2"></div>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="mandatory" class="form-select" name="mandatory" required >
                                <option>Yes</option>
                                <option>No</option>
                            </select>
                        </div>
                    </div>
                </div>
                <br/><br/>
            </div>
        </form>
        
      </div>
      <div class="modal-footer">
        <button type="button" id ="submit" class="btn btn-primary" data-bs-dismiss="modal">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>               
	         
           </div>
           
           
           </div>
           </div>
          </div>
          
                
              
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

</div>
<!-- /.main-wrapper -->

</div>
</div>
</div>

<div class="modal" id="addWavePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Wave Name</h5>
        <button type="button" id="addWaveEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="addWavePopUp">Wave Name</label>
                            <input type="text" class="form-control" id="addWaveModify"  name="addWavelabel" required>
                        
                    </div>
                </div>
                <br/><br/><input type="text" id="addWaveSeqNum" name="" value="" style="display:none;">
                
                 
                     <div class="row" style = "width:150px;">
                          <ul style = "margin-left : 50px; " id ="addId"></ul></div>
                </div><button type="button" id="addWave" class="btn btn-primary" >Add</button>
               
        </form>
      </div>
      <div class="modal-footer">
        
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  

<script>
$(document).on('mouseenter','.active1', function(){
		
		 $('.activeIcon').css('color','#1565c0');
		 
		 
	 });
	 
	 $(document).on('mouseleave','.active1', function(){
			
		 $('.activeIcon').css('color','#fff');
		 
	 });
</script>


<!-- <script>
$('.deletepopup').click(function() {
    alert("Testing index"+$(this).index('.deletepopup'));
});
</script> -->

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
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>
  <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
<!-- ========== THEME JS ========== -->

<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>
 <!-- Date Picker -->
        <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"  
         rel = "stylesheet"><!-- newly added code by parthiban -->
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<!-- ========== THEME JS ========== -->
<script src="js/notification/notification.js"></script>
<!-- ========== multiselect dopdown ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.8.1/js/bootstrap-select.js"></script>
<script src="js/toastr/toastr.min.js"></script>
<script src="js/Opportunity/AddFeatureFunctionality.js"></script>
<script src="js/Opportunity/EditDeleteToggle.js"></script>
<script src="js/Opportunity/edit_delete_popup.js"></script>
<script src="js/governance/editWave/waveDataRetrieveAjaxCall.js"></script>
<script src="js/governance/editWave/editWaveAddAjaxCall.js"></script>
<script src="js/governance/editWave/waveEditDeleteAjaxCall.js"></script>
<script src="js/governance/editWave/waveSaveAjaxCall.js"></script>
<script id ="scripttag">
</script>
<script id ="scripttag1">
</script>
<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
<script src="js/navigation/navigation.js"></script>
</body>
</html>
<html lang="en">
<head>
    <title>New Opportunity</title>
    <meta charset="UTF-8" />
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
    <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
  

   

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen" >
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <script src="js/Opportunity/Opportunity.js"></script>
</head>
<style>

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

#panels1{
margin:60px auto;


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
		      <li><a href="#">Administration</a></li>
		      <li><a href="#">Governance/Finance</a></li>
		        <li><a href="#">Dashboards</a></li>
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
                            <h4 class="title" style="color:#fff">Create Opportunity</h4>
                              <!-- <p class="sub-title">Create and manage your Opportunities here</p>-->
                        </div>
                       

                    </div>

                </div>
			</nav>
        </div>
        <!-- /.container-fluid -->
    </nav >

        <div class="content-wrapper">
            <div class="content-container">

               
                <div class="main-page">

                    <section class="design-process-section" id="process-tab">
 
                          

                            <div class="row">
                             <br>
                                <div class="container">
                              
                                

 <div class="panel-group" id="panels1">
     <div class="panel panel-default">
         <div class="panel-heading">
             <h4 class="panel-title"> <a  data-parent="#panels1" > New Opportunity  </a> </h4>
         </div>
         <%@ page import="java.sql.*"%>
         <div id="collapse2" class="panel-collapse">
             <div class="panel-body text-left">
             <form class="form-signin" name="OpportunityForm" enctype='application/json'>
             <div id ="inputFields">
                   <div class='form-group'>
                        <input type='hidden' class='form-control' size='35' id="Record_No" placeholder='' name="RecordNo" value=""/>
                       <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/>
                        </div>	               
              </div>     
              
	              
	                      <div class="col-md-12">
                <div class="col-md-1">
	               <button type="button" class="btn btn-light" style="padding-top:5px; padding-left:10px; float: left;" onclick="location.href='OpportunityList.jsp';">Back</button>
	           </div>
	               <div class = "col-md-4 dropup" style="padding-top:10px; padding-right:10px; float: right;">

	                <button type="button" class="btn btn-warning" id="template" data-toggle="modal" data-target=".bd-example-modal-lg">Template</button>
                            <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown">Actions
                              <span class="caret"></span></button>
                                <ul class="dropdown-menu">
                                <li><a href="#" id = "add" data-toggle="modal" data-target="#AddPopUp" class="fa fa-plus" style="font-size:19px;color:black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                <li><a href="#" id = "Edit" class="fa fa-edit" style="font-size:19px;color:black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                <li><a href="#" id = "Delete" class="fa fa-trash" style="font-size:18px;color:black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                </ul>
	                       <button type="submit" class="btn btn-success" id="create">Create</button>
	                       <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" data-toggle="modal" data-target="#EditPopUp" style="display:none;">Edit PopUp</button>
	                      <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-toggle="modal" data-target="#DeletePopUp" style="display:none;">Delete PopUp</button>
	                      <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='OpportunityList.jsp';"style="display:none;"></button>
	                      </div>
	                      </div>
	                      </form>
	               
	     <!--Delete pop up-->
	     <div class="modal" id="DeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="delete_close" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
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
        <button type="button" id="submit2" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>                         
	               

	<!-- Edit pop up -->
	<div class="modal" id="EditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="edit_close" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
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
        <button type="button" id="submit1" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>               
<!-------Add popup---------->	
<div class="modal" id="AddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "add_close_id" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
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
                            <select id="types" class="form-control" name="types" required >
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
                            <select id="mandatory" class="form-control" name="mandatory" required >
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
        <button type="button" id ="submit" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>               
	               <!-- Modal -->
	               
<div class="modal fade bd-example-modal-lg" id="myFormModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document" >
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Opportunity Template</h5>
        <button type="button" class="close" id="temp_close_id" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name = "myForm">
            <div class="form-group" id="TemplateFields">
            </div>
	        	        
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary submitDisable" onclick="validateForm()">Add Template</button>
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
<<script src="js/icheck/icheck.min.js"></script>
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
      <script src="js/toastr/toastr.min.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/notification/notification.js"></script>
<script src="js/Opportunity/AddFeatureFunctionality.js"></script>
<script src="js/Opportunity/AddFeatureAjaxCall.js"></script>
<script src="js/Opportunity/EditDeleteToggle.js"></script>
<script src="js/Opportunity/EditFunctionality.js"></script>
<script src="js/Opportunity/NewOpportunityCreate.js"></script>
<script id ="scripttag">
</script>
<script id ="scripttag1">
</script>









</body>
</html>

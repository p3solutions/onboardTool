<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
<link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">

<title>Decom3Sixty - Archive Requirements</title>
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


<!-- =========== Header Icon ========= -->
 <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"/>
 <link rel="stylesheet" href="css/headerIcon/headerIcon.css" media="screen" >

<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>   
<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">


<!-- LegacyApplicationInfo -->
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/archiveLegacyDataRetrieveAjaxCall.js"></script>

<!-- Archive Environment Info  -->
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/ArchiveEnvironmentInfo/archiveEnvironmentInfoDataRetrieve.js"></script>


<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>	
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="js_in_pages/requirements.css" type="text/css"/>
<link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
	media="screen">
<link rel="stylesheet" href="css/Responsive/responsive.css"
	media="screen">
    


</head><!--from  w  w w  . ja  va 2 s.co  m-->

<style>
   body {
  background-color: #fff;
  margin: 0;
  padding: 0;
}

.page-title-div {
background:#1565c0;
padding: 15px; 
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
        background: rgba(255, 255, 255, 0.2);
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
        color: black;
    }

    .popup .close:hover {
        color: black;
    }

    .popup .content {
        max-height: 30%;
        overflow: auto;
    }

    .button {
        color: white;
    }

    @media screen and (max-width: 700px) {
        .box {
            width: 70%;
        }

        .popup {
            width: 70%;
        }

    }

    #nav_userid {
        color: green;
    }

    #nav_role {
        color: blue;
    }

    .ScrollStyle {
        max-height: 350px;
        overflow-y: scroll;
    }
    .table-title .add-new {
    float: right;
    height: 30px;
    font-weight: bold;
    font-size: 12px;
    text-shadow: none;
    min-width: 100px;
    border-radius: 50px;
    line-height: 13px;
	}
	.table-title .add-new i {
    margin-right: 4px;
	}
	table.table td a {
    cursor: pointer;
    display: inline-block;
    margin: 0 5px;
    min-width: 24px;
	}    
	table.table td a.add {
    color: #27C46B;
	}
	table.table td a.edit {
    color: #FFC107;
	}
	table.table td a.delete {
    color: #E34724;
	}
	table.table td i {
    font-size: 19px;
	}
	table.table td a.add i {
    font-size: 24px;
    margin-right: -1px;
    position: relative;
    top: 3px;
	}    
	table.table .form-control {
    height: 32px;
    line-height: 32px;
    box-shadow: none;
    border-radius: 2px;
	}
	table.table .form-control.error {
    border-color: #f50000;
	}
	table.table td .add {
    display: none;
	}

/* table { 
	box-shadow: 5px 5px 5px #999; 
	} */
    /*END Form Wizard*/
   
   .active1{
    background:#1565c0;
}
 .page-title-div {
    background:#1565c0;
	padding: 15px;  
}

.form-wizard .form-wizard-steps {
margin: -6px 0;
}
#module_header {
margin-top: 97px;
}
   
</style>

<body class="top-navbar-fixed">

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Grid JSP PAGE-----[INFO]"); %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="onboard.DBconnection"%>
<%@page import="java.util.Calendar"%>
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
DBconnection dBconnection = new DBconnection();



if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.jsp");



}
else{
String name=(String)session.getAttribute("ID");
HttpSession details=request.getSession();
Connection con = null;
session.setAttribute("theName", name);
String roles=(String)details.getAttribute("role");
String OpportunityName = (String)details.getAttribute("SelectedOpportunity");
String s=OpportunityName;
System.out.println("Welcome"+OpportunityName);

int sumcount=0;
Statement st,st2;
try{

con=dBconnection.getConnection();
Statement st1;

%>
<form class="form-signin" name="loginForm" method="post">

    <div class="main-wrapper">

           <!-- <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
 				<div class="navbar-header no-padding" style = "height : 100px;">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/Decom3Sixty_logo.png" alt="Decom3Sxity" class="logo" style = "margin-top : 50px;">
                    </a>
                </div>
                /.navbar-header
                <div class="tabs-content">
                  <ul class="nav navbar-nav headerTab navAlign">
		              <li class="active1"><a href="OpportunityList.jsp" style= "color:#fff;"><i class="fad fa-folders fa-2x iconAlign activeIcon"></i>Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp"><i class="fad fa-user-cog iconAlign iconColor fa-2x"></i>Administration</a></li>
		              <li><a href="PhaseList.jsp"><i class="fad fa-desktop iconAlign iconColor fa-2x"></i>Governance</a></li>
		              <li><a href="#"><i class="fad fa-wallet iconAlign iconColor fa-2x"></i>Finance</a></li>
		              <li ><a href="DashBoard.jsp"><i class="fad fa-chart-pie iconAlign iconColor fa-2x"></i>Dashboards</a></li>
		              <li><a href="#"><i class="fad fa-comment-lines iconAlign iconColor fa-2x"></i>Compliance</a></li>
		          </ul>
		         <ul class="nav navbar-nav navbar-right" style = "margin-top:45px;">
                      <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin </span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
      </div>
      <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                             <div class="col-sm-6">
                        
                            
                         <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >> 
                         <a  href="ArchiveRequirementsIntroDetails.jsp" id="sitetitle1" style="color:#fff">
                           Introduction</a> >> Legacy Application Information</a></p>
                     
                    

                    </div>

                </div>
			</nav>
      
        </div>
        /.container-fluid
    </nav> -->
    <%@include file="Nav-Bar.jspf"%>
		<nav class="nav nav-height-70 nav-font" id="bg-color"
			style="font-size: 14px;">
			<div class="container-fluid" id="container-fluid-margin">
				<div class="row" id="d3s-mt-10">
						<div class="col-lg-12 col-md-12">
							<div class="sub-title" style="color: #fff">
								<a href="OpportunityList.jsp" id="sitetitle1"
									style="color: #fff"><span class="glyphicon glyphicon-home"></span>
									Home</a> >> <%=OpportunityName%> >><a href="ArchiveRequirementsIntroDetails.jsp"
									id="sitetitle1" style="color: #fff"> Introduction</a> >> Legacy
									Application Information</a>
							</div>
						</div>
					</div>
			</div>
		</nav>
		
		
	<%
}
catch(Exception e){
e.printStackTrace();
}



} %>
    
        <div class="content-wrapper">
        <div class="col-md-12">
								<div style="margin-bottom: -138px;"class="form-wizard">
						<div class="form-wizard-header">
							
							<ul class="list-unstyled form-wizard-steps clearfix nav-font" style="margin-left:23px;">
							<!-- <p class="nav-font" style="margin-bottom: -52px;">Fill all the required fields to go next step</p> -->
								<li class="activated" onclick="location.href='ArchiveRequirementsIntroDetails.jsp;'"><span>1</span><i>Introduction</i></li>
								<li class="active" onclick="location.href='archiveRequirementsLegacyDetails.jsp;'"><span>2</span><i>Legacy Application Info</i></li>
								<li onclick="location.href='archiveRequirementsRetentionDetails.jsp;'"><span>3</span><i>Retention Details</i></li>
								<li onclick="location.href='ArchiveBusinessRequirements.jsp';"><span>4</span><i>Business requirements</i></li>
								<li onclick="location.href='archiveReqAbbrevation.jsp;'"><span>5</span><i>Abbreviations</i></li>
								<li onclick="location.href='archiveRequirementsDocumentRevisions.jsp;'"><span>6</span><i>Revisions</i></li>
								<li onclick="location.href='archiveRequirementsAddendum.jsp;'"><span>7</span><i>Addendum</i></li>
								<li onclick="location.href='archiveRequirementsReviewDetails.jsp;'"><span>8</span><i>Review</i></li>
								<li onclick="location.href='archiveRequirementsApprovalDetails.jsp;'"><span>9</span><i>Approval</i></li>
						
							</ul>
						</div>
						</div></div>
            <div class="content-container">

      
                <!-- Projects List Start -->

                <div class="main-page">

                    <section class="wizard-section">

                        <div class="row">
<div class="container" id="module_header">
                                


                                    <%
                                        String initiate = (String) session.getAttribute("Ideation and Initiate");
                                        String plan = (String) session.getAttribute("Plan");
                                        String execute = (String) session.getAttribute("Execute");
                                        String hypercare = (String) session.getAttribute("Closure");
                                        if (initiate == null)
                                            initiate = "0";
                                        if (plan == null)
                                            plan = "0";
                                        if (execute == null)
                                            execute = "0";
                                        if (hypercare == null)
                                            hypercare = "0";
                                    %>
                                    <br/><br/><br/>
                 

                         

                                           
                                  <div class="tab-pane" role="tabpanel" id="step4">
                                    
                                     <!-- Legacy Application Informations -->
                            <div class="card-container-2 card">
                                        <div class="card-header" id="cd-header">
                                            Legacy Application Information
                                        </div>
                                        
                                        <div id="collapse4" class="panel-collapse ">
                                          
                                            <div id="collapse1" class="panel-collapse " name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFieldsAssessment">
                                      <!-- Application Info -->
                                        <div class="panel panel-default">
                                        <div class="card-header" id="cd-header">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-bs-toggle="collapse" data-bs-parent="#panels1" href="">Application Info</a></h4>
                                        </div>
                                        <div id="collapse5" class="panel-collapse ">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse collapse show" name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsAppInfo">
												 </div>
                                                 <div class="col-md-12">
                                                           
                                                          <!--   <div class="col-md-6 dropup" style="padding-right: 10px; float: right;  width: 30%;">
                                                                <div class = "btn-group dropup dropright">
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu" style = "min-width: inherit;" >
                                                                    <li><a href="#" id="add" data-toggle="modal" data-target="#LegacyAddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="EditLegacy" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="DeleteLegacy" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                               </div>
                                                                <button type="submit" class="btn btn-success" id="legacyAppInfoSave">Save</button>
                                                                <a href="javascript:;" class="form-wizard-next-btn float-right btn-info btn btn-info" onclick="location.href=' ';">Next</a>
                                                                 <button class="form-wizard-next-btn float-right btn-info btn btn-info" onclick="location.href='';" id="next" disabled="true">
                                                                 
                                                                 <a href="javascript:;">Next</a>
                                                                 
                                                                 </button>
                                                              
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" data-toggle="modal" data-target="#LegacyEditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-toggle="modal" data-target="#LegacyDeletePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                                            </div> -->
                                                           <div class="col-12" align="end">
																	
																	<div class="dropdown">
																		<button type="button"
																			class="btn btn-secondary dropdown-toggle"
																			id="dropdownMenuButton1" data-bs-toggle="dropdown"
																			aria-expanded="false">Actions</button>
																		<ul class="dropdown-menu"
																			aria-labelledby="dropdownMenuButton1">
																			<li><a class="dropdown-item dropDown-font"
																				id="add" href="#" data-bs-toggle="modal"
																				data-bs-target="#LegacyAddPopUp"> <i
																					class="fas fa-plus" aria-hidden="true">&nbsp;&nbsp;&nbsp;
																						</i>Add</a></li>
																			<li><a class="dropdown-item dropDown-font"
																				id="EditLegacy" href="#"><i class="fas fa-edit"
																					aria-hidden="true">&nbsp;&nbsp; </i>Edit</a></li>
																			<li><a class="dropdown-item dropDown-font"
																				id="DeleteLegacy" href="#"><i class="fas fa-trash"
																					aria-hidden="true">&nbsp;&nbsp;&nbsp; </i>Delete</a></li>

																		</ul>
																	</div>
																	<button type="submit" class="btn btn-primary"
																		id="legacyAppInfoSave">Save</button>
																	<!-- <a href="javascript:;" class="form-wizard-next-btn float-right btn-info btn btn-info" onclick="location.href='IntakeTriage.jsp';">Next</a> -->
																	<!-- <button
																		class="form-wizard-next-btn float-right btn-info btn btn-info"
																		onclick="location.href='';" id="next"
																		disabled="true">

																		<a href="javascript:;"  style="color: #fff;">Next</a>

																	</button>
 -->
																	<button type="button"
																		class="btn btn-primary pull-right" id="editpopup_btn"
																		data-bs-toggle="modal" data-bs-target="#LegacyEditPopUp"
																		style="display: none;">Edit PopUp</button>
																	<button type="button"
																		class="btn btn-primary pull-right"
																		id="deletepopup_btn" data-bs-toggle="modal"
																		data-bs-target="#LegacyDeletePopUp" style="display: none;">Delete
																		PopUp</button>
																	<!--  <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button> -->
																</div>
                                                    </div>
                                                      
											    
										    </div>
                                            </div>
                                       </div>
							         </div>  
                                                   
                               <!-- Archive Environment Information -->
							    <div class="panel panel-default">
                                        <div class="card-header" id="cd-header">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-bs-toggle="collapse" data-bs-parent="#panels1" href="#collapse6">Archive Environment Information</a></h4>
                                        </div>
                                        <div id="collapse6" class="panel-collapse collapse">
                                        	<div class="panel-body">
                                        		<div id="collapse1" class="panel-collapse collapse show" name="collapse">
                                               		<div class="panel-body">
                                                 		<div id="inputFieldsEnv">
                                                 			<div>
                                                   				<h4 class="title1">Archive Environment</h4>
                                                   				<table class="table-bordered" style="width: 100%;">
														  		 <thead> 												
																	<tr>
																		<th style='text-align:center;vertical-align: middle;'>Dev Name</th>
																		<th style='text-align:center;vertical-align: middle;'>Test Name</th>
																		<th style='text-align:center;vertical-align: middle;'>Stage Name</th>
																		<th style='text-align:center;vertical-align: middle;'>Production Name</th>
																		<th style='text-align:center;vertical-align: middle;'>Action</th>
																	</tr>
																</thead>
																<tbody id ="EnvironmentName">
      												    												
      															</tbody>
      															<button type="button" class="btn btn-primary pull-right" id="EnvmntNameDeleteId" data-bs-toggle="modal" data-bs-target="#EnvmntNameDeletePopUp" style="display: none;">Delete PopUp</button>
																</table>
																 <div class="col-12" align="end">
																	 <button class="btn btn-secondary" type="button" id="AddEnvmntName">Add</button>
																	 <button type="submit" class="btn btn-primary" id="saveEnvmntName"  disabled="true">Save</button>
												
					                                       			 <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
					                                       			</div>
																<br/>
																<br/>
																</div>
																<br/>
																<div>
																<table class="table-bordered" style="width: 100%;">
														  		 <thead> 												
																	<tr>
																		<th style='text-align:center;vertical-align: middle;'>Dev Server IP</th>
																		<th style='text-align:center;vertical-align: middle;'>Test Server IP</th>
																		<th style='text-align:center;vertical-align: middle;'>Stage Server IP</th>
																		<th style='text-align:center;vertical-align: middle;'>Production Server IP</th>
																		<th style='text-align:center;vertical-align: middle;'>Action</th>
																	</tr>
																</thead>
																<tbody id ="EnvironmentServer">
      												    												
      															</tbody>
      															<button type="button" class="btn btn-primary pull-right" id="EnvmntServerDeleteId" data-bs-toggle="modal" data-bs-target="#EnvmntServerDeletePopUp" style="display: none;">Delete PopUp</button>
																</table>
																
																 <div class="col-12" align="end">
												 <button class="btn btn-secondary" type="button" id="AddEnvmntServer">Add</button>
												 <button type="submit" class="btn btn-primary" id="saveEnvmntServer"  disabled="true">Save</button>
												 
                                       			 <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                       			</div>
  																</div>
												  
												
											    </div>
										 		</div>
                                            </div>
                                       </div>
							         </div>  
							               
                                            </div> 
                                            <!-- Legacy Application Screenshot -->
                                            <div class="panel panel-default">
                                        <div class="card-header" id="cd-header">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-bs-toggle="collapse" data-bs-parent="#panels1" href="#collapse3">Legacy Application Screenshots</a></h4>
                                        </div>
                                        <div id="collapse3" class="panel-collapse collapse">
                                        	<div class="panel-body">
                                        		<div id="collapse1" class="panel-collapse collapse show" name="collapse">
                                               		<div class="panel-body">
                                                 		<div id="inputFieldsRoles">
                                                  <!-- <form action="legacyApplicationScreenshotsUpload" method="post" enctype="multipart/form-data">                                                 			
												 <input type="file" name="file" id = "fileUpload" value="D:/abc.png" multiple/>
												 <input type="button" class="btn btn-success" id="UploadFiles" value="upload"/>
												</form> -->
												<div class="container fileClass">
												<form action="" method="post" enctype="multipart/form-data">
												<div class="fileClass">
											<label for="upload"> <input type="file" id="fileUpload" multiple> Upload Files</label>
											</div>
									        <div class="files fileClass">
											<h6><b>Files Selected</b></h6>
											<ul id="FileList"></ul>
											</div>
											<input type="button" value="Upload" class="btn btn-primary" name="submit" id="UploadFiles" />
											</form>
											</div>
											</div>
										<button type="button" id="add_btn" class="btn btn-primary"
															href="#" data-bs-toggle="modal" data-bs-target="#Legacy_ScrPopUp"
															style="margin: 5px">View Uploaded Files</button>
											    </div>
										 		</div>
                                            </div>
                                       </div>
                                       
                                       <div class="col-md-12">
                                        	<br/>
                                        <div class="col-md-4"> 
                                    
                                       <button type="button" class="btn btn-secondary" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='ArchiveRequirementsIntroDetails.jsp';" >Prev</button></div>
                                       <div class="col-md-8 dropup" align="end">
                                       
                                       <button type="submit" class="btn btn-primary" id="edit">Edit</button>
									   <button type="submit" class="btn btn-primary" id="complete" disabled="true">Complete</button>
                                       
                                      <button class="btn btn-primary" onclick="location.href='archiveRequirementsRetentionDetails.jsp';" id="rolesNext" >
                                                                 <a href="javascript:;">Next</a></button>
                                     
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
                <!-- /.row -->
           
            </div>
            
            </section>
            <!-- /.section -->

        </div>
        <!-- /.main-page -->

        <!-- Project List End -->

    </div>
    <!-- /.content-container -->

    <!-- /.main-wrapper -->
    <script>
        function validateform9() {

            var f = document.loginForm;
            f.method = "post";
            f.action = 'ArchivalRequirements';
            f.submit();

        }
    </script>


    <%
       //     }
    //    }
    %>
    </div></div></form>
   
   <!-- Legacy Application Information Add popup -->
   
    <div class="modal" id="LegacyAddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
			<h5 class="modal-title" id="exampleModalLabel">Add
				Input Fields</h5>
			<button type="button" class="btn-close" id = "Legacyaddclose_id"
				data-bs-dismiss="modal" aria-label="Close"></button>
	 </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="Legacyaddlabel"  name="Legacylabel" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="Legacyproject_name" name="project_name" value="">
                <input type="text" id="Legacyappln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="Legacyservlet_name" name="servlet_name" value="" style="display:none;">  

             
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="Legacytypes" class="form-select" name="types" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row Legacyhidefield" id="Legacycheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="Legacycheck_number"  name="Legacycheck_number">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row Legacyhidefield" id="Legacyradio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="Legacyradio_number"  name="Legacyradio_number">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row Legacyhidefield" id="Legacydrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="Legacydrop_number"  name="Legacydrop_number">
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
                <div id="Legacyoptions">
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
                            <select id="Legacymandatory" class="form-select" name="mandatory" required >
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
        <button type="button" id ="Legacysubmit" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="Legacyclose">Close</button>
      </div>
    </div>
  </div>
</div>
   
   <!-- Legacy Edit Popup -->
   
   <div class="modal" id="LegacyEditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		<h5 class="modal-title" id="exampleModalLabel">Edit
			Input Field</h5>
		<button type="button" id="LegacyEditClose" class="btn-close"
			data-bs-dismiss="modal" aria-label="Close"></button>
	 </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="Legacy">Label:</label>
                            <input type="text" class="form-control" id="LegacyLabelModify"  name="Legacylabel" required>
                        </div>
                    </div>
                </div><br/><input type="text" id="LegacySeqNum" name="" value="" style="display:none;">
                <input type="text" id="EditSection" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="LegacyEditSubmit" class="btn btn-primary" data-bs-dismiss="modal">Submit</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div> 
   
   
   
  <!-- Legacy Delete PopUp -->  
  <div class="modal" id="LegacyDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		<h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
		<button type="button" id="LegacyEditClose" class="btn-close"
			data-bs-dismiss="modal" aria-label="Close"></button>
	 </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p>Do you want to delete this Row permanently?</p>
                    <input type="hidden" id="LegacyDeleteSeq"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="LegacyDeleteSubmit" class="btn btn-primary submitDisableDelete" data-bs-dismiss="modal" >Yes</button>
        <button type="button" class="btn btn-secondary" id = "closeLegacyIdDelete" data-bs-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>

 <!-- Environment Name Delete PopUp -->  
  <div class="modal" id="EnvmntNameDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
       <div class="modal-header">
		<h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
		<button type="button" id="EnvmntNameDeleteClose" class="btn-close"
			data-bs-dismiss="modal" aria-label="Close"></button>
	 </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p>Do you want to delete this Row permanently?</p>
                    <input type="hidden" id="EnvmntNameDeleteSeq"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="EnvmntNameDeleteSubmit" class="btn btn-primary submitDisableEnvmntName" data-bs-dismiss="modal">Yes</button>
        <button type="button" class="btn btn-secondary" id = "closeEnvmntNameIdDelete" data-bs-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>

<div class="modal" id="Legacy_ScrPopUp" tabindex="-1" 
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header" style="background-color:#1565c0;">
														<h5 class="modal-title" id="exampleModalLabel" style="color:white;">Legacy Application Screenshots</h5>
														<button type="button" class="btn-close"
															data-bs-dismiss="modal" aria-label="Close"></button>
													</div>
													<div class="modal-body" data-bs-target="">
														<table class="table table-bordered table-striped"
																id="legacy_datatable">
																
																<thead>

																<tr>	
																	<th style="text-align:center;">File Name</th>
																	<th style="text-align:center;">Action</th>
																</tr>
																</thead>
															
																<tbody id ="Legacy_Scr_List">
      												    											
      												</tbody></table>
      												<div class="modal-footer">
														
														<button type="button" class="btn btn-secondary"
															data-bs-dismiss="modal">Close</button>
														
													</div>
							          			</div>
							          		</div>
							          	</div>
							          	<form action="legacy_scr_download.jsp" method="post">
      												<input type="hidden" id="File_Name" name="File_Name">
      												<input type="submit" id="scr_submit" style="display:none;">
      												
											    </form>
											 		<input type="submit" id="deletegrid_update" style="display:none;">												
																											
													</div>
													
												</div>
											</div>
										</div>
									

<!-- Environment Server Delete PopUp -->  
  <div class="modal" id="EnvmntServerDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
		<h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
		<button type="button" id="EnvmntNameDeleteClose" class="btn-close"
			data-bs-dismiss="modal" aria-label="Close"></button>
	 </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p>Do you want to delete this Row permanently?</p>
                    <input type="hidden" id="EnvmntServerDeleteSeq"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="EnvmntServerDeleteSubmit" class="btn btn-primary submitDisableEnvmntServer" data-bs-dismiss="modal">Yes</button>
        <button type="button" class="btn btn-secondary" id = "closeEnvmntServerIdDelete" data-bs-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>

<%-- <jsp:include page="samp_forms.jsp">
    <jsp:param name="ProjectName" value="<%=Opportunityname %>"/>
    <jsp:param name="AppName" value="<%=idd %>"/>
    <jsp:param name="number" value="2"/>
    <jsp:param name="servlet" value="Requirements"/>
</jsp:include>
<%
     //       }
    //    }
    } 
    catch (Exception e) {
    }
%> --%>

<!-- Active Icon Color changes  -->
<script>
$(document).on('mouseenter','.active1', function(){
		
		 $('.activeIcon').css('color','#1565c0');
		 
	 });
	 
	 $(document).on('mouseleave','.active1', function(){
			
		 $('.activeIcon').css('color','#fff');
		 
	 });
</script>

<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>

<script src="js/iscroll/iscroll.js"></script>


<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script src="js/waypoint/waypoints.min.js"></script>
<script src="js/counterUp/jquery.counterup.min.js"></script>
<script src="js/amcharts/amcharts.js"></script>
<script src="js/amcharts/serial.js"></script>
<script src="js/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css"
        type="text/css" media="all" />
<script src="js/amcharts/themes/light.js"></script>
<script src="js/toastr/toastr.min.js"></script>
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== THEME JS ========== -->

<script id ="scripttag"></script>

<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script type="text/javascript" src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>

<script src="js/notification/notification.js"></script>

<!-- Legacy Application Info  -->

<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/EditDeleteToggleLegacy.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/LegacyAddFeatureFunctionality.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/archiveLegacyAddAjaxcall.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/archiveReqLegacyEditDeleteAjaxCall.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/archiveLegacyAppInfoSaveAjaxCall.js"></script>


<!-- Archive Environment Info  -->

<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/ArchiveEnvironmentInfo/archiveEnvironmentInfoSaveAjaxCall.js"></script>

<!-- Legacy Application Screenshot -->
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacyApplicationScreenshotsUploadAjaxCall.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacy_scr_retrieve.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacy_scr_download.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacy_scr_delete.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacyAppInfoFileUpload.js"></script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

</body>
</html>
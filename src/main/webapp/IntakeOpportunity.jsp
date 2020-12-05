<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Decom3Sixty - IntakeOpportunity</title>
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

<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/IntakeOpportunity.js"></script>
<link rel="stylesheet" href="css/Intake/IntakeOpportunity.css" media="screen" > 

<link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel = "stylesheet">

</head>
<body class="top-navbar-fixed">

<div class="main-wrapper">
 <!-- ========== TOP NAVBAR ========== -->
    <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding">
                    <a class="navbar-brand" href="OpportunityList.jsp" id="sitetitle">
                        <img src="images/logo1.png" alt="Decomm3Sixty" class="logo">
                    </a>
                </div>
                <!-- /.navbar-header -->
                <div class="tabs-content">
                  <ul class="nav navbar-nav">
		              <li class="active"><a href="#" style="background:#1565c0;color:white;">Applications</a></li>
		              <li><a href="Admin_Module_Send_Invites.jsp">Administration</a></li>
		              <li><a href="Archive_Execution.jsp">Governance</a></li>
		              <li><a href="#">Finance</a></li>
		              <li ><a href="ProjectManager_dashboard.jsp">Dashboards</a></li>
		              <li><a href="#">Compliance</a></li>
		          </ul>
		         <ul class="nav navbar-nav navbar-right">
                      <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin </span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
      </div>
      <nav class="navbar navbar-down">
				  <div class="container-fluid fixed-top">
                    <div class="row page-title-div">
                             <div class="col-sm-6">
                        
                            
                         <p class="sub-title" style="color:#fff"> <a  href="OpportunityList.jsp" id="sitetitle1" style="color:#fff"><span class="glyphicon glyphicon-home"></span> Home</a> >>Opportunity</p>
                     
                    

                    </div>

                </div>
			</nav>
      
        </div>
        <!-- /.container-fluid -->
    </nav >
<div class="content-wrapper">
 <div class="content-container" >
  <div class="main-page">
       <section class="wizard-section">
		<div class="container" id="module_header">
			<div class=" col-md-12">
				<div class="form-wizard">
					<form action="" method="post" role="form">
						<div class="form-wizard-header">
							<p>Fill all the required fields to go next step</p>
							<ul class="list-unstyled form-wizard-steps clearfix">
								<li class="active"><span>1</span><i>Opportunity</i></li>
								<li><span>2</span><i>Triage</i></li>
								<li><span>3</span><i>Triage Summary</i></li>
								<li><span>4</span><i>Assessment</i></li>
								<li><span>5</span> <i>Stake Holder</i></li>
								<li><span>6</span><i>Review</i></li>
								<li><span>7</span><i>Approval</i></li>
							</ul>
						</div>
						<fieldset class="wizard-fieldset show" style="border-style: none">
							   <div class="tab-pane active" role="tabpanel" id="step1">
                                       <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a class="collapsed" data-toggle="collapse"
                                                        data-parent="#panels1" >Opportunity</a> </h4>
                                            </div>
                                            <div id="collapse1" class="panel-collapse "
                                                name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFields" >
                                                        <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/>
                                                    </div>                                                
                                                    <div class="col-md-12">
                                                            <div class="col-md-1">
                                                                <button type="button" class="btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Back</button>
                                                            </div>
                                                            <div class="col-md-6 dropup" style="padding-right: 10px; float: right;  width: 43%;">
                                                                <button type="button" class="btn btn-warning" id="template" data-toggle="modal" data-target=".bd-example-modal-lg">Template</button>
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#" id="add" data-toggle="modal" data-target="#AddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="Edit" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="Delete" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                               
                                                                <button type="submit" class="btn btn-success" id="create">Save</button>
                                                                <!-- <a href="javascript:;" class="form-wizard-next-btn float-right btn-info btn btn-info" onclick="location.href='IntakeTriage.jsp';">Next</a> -->
                                                                 <button class="form-wizard-next-btn float-right btn-info btn btn-info" onclick="location.href='IntakeTriage.jsp';" id="next" disabled="true">
                                                                 
                                                                 <a href="javascript:;">Next</a>
                                                                 
                                                                 </button>
                                                              
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" data-toggle="modal" data-target="#EditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-toggle="modal" data-target="#DeletePopUp" style="display: none;">Delete PopUp</button>
                                                               <!--  <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button> -->
                                                            </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                
                               
                                
                                
                                
                                
                                
						</fieldset>	
			
			  <!-- Modal -->
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="exampleModalLabel"> Questions :</h5>
                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                                                </div>
                                                <div class="modal-body">
                                                    <form>
                                                        <div class="form-group">
                                                            <div class="form-check form-check-inline">
                                                                <div class="col-md-1">
                                                                    <input class="form-check-input" type="checkbox" id="inlineCheckbox1" value="option1">
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="form-check-label" for="inlineCheckbox1">Add developer Name</label>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </form>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                    <button type="button" class="btn btn-primary">Add</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>			
						
						     <!-- Intake OpportunityTemplate modal-->
    <div class="modal fade bd-example-modal-lg" id="myFormModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Opportunity Template</h5>
                    <button type="button" class="close" id="temp_close_id" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button>
                </div>
                <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="TemplateFields">
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="apmid_temp" name="apmid_temp" class="Template_Field" value="" disabled="disabled" checked=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Id</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="apmid_temp1" name="apmid"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appName_temp" name="appName_temp" class="Template_Field" value="" disabled="disabled" checked=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Name</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="appName_temp1" name="appName"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="creation_date_temp" name="creation_date_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Creation Date</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control datepicker1 hasDatepicker" size="35" id="creation_date_temp1" placeholder="mm/dd/yyyy" name="creation_date"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="source_temp" name="source_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Request Source</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="source_temp1" name="source"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="status_temp" name="status_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Status</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="status_temp1" name="status"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="request_type_temp" name="request_type_temp" class="Template_Field" value="" disabled="disabled" checked ="">  </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Request Type</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control" id="request_type_temp1" name="request_type_temp">
                                        <option label="Decommission" class="control-label" for="opportunity">Decommission</option>
                                        <option label="Archive" class="control-label" for="opportunity">Archive</option>
                                        <option label="To" be="" retrive="" class="control-label" for="opportunity">To be retrive</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="requester_temp" name="requester_temp" class="Template_Field" value="" disabled="disabled" checked =""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Requester</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="requester_temp1" name="requester"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appdesc_temp" name="appdesc_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Descrpition</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="appdesc_temp1" name="appdesc"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appowner_temp" name="appowner_temp" class="Template_Field" value="" disabled="disabled" checked =""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Application Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="appowner_temp1" name="appowner"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="businessowner_temp" name="businessowner_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Business Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="businessowner_temp1" name="businessowner"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="sme_temp" name="sme_temp" class="Template_Field" value="" disabled="disabled" checked =""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Development Owner/SME</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="sme_temp1" name="sme"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="billcode_temp" name="billcode_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Billing Code</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="billcode_temp1" name="billcode"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="buisnesssegment_temp" name="buisnesssegment_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Buisness Segment</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="buisnesssegment_temp1" name="buisnesssegment"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="buisnessunit_temp" name="buisnessunit_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Buisness Unit</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="buisnessunit_temp1" name="buisnessunit"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="keyfunction_temp" name="keyfunction_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Key Function</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="keyfunction_temp1" name="keyfunction"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="pscontact_temp" name="pscontact_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Program or Segment Contact</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="pscontact_temp1" name="pscontact"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="date_type_temp" name="date_type_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Data Type</label> </div>
                                <div></div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control"
                                        id="date_type_temp1" name="date_type_temp">
                                        <option label="EMR" system="" class="control-label"
                                            for="opportunity">EMR System</option>
                                        <option label="ERP" data="" class="control-label"
                                            for="opportunity">ERP Data</option>
                                        <option label="Financial" data="" class="control-label"
                                            for="opportunity">Financial Data</option>
                                        <option label="HealthCare" data="" class="control-label"
                                            for="opportunity">HealthCare Data</option>
                                        <option label="HR" data="" class="control-label"
                                            for="opportunity">HR Data</option>
                                        <option label="MR/HR" data="" class="control-label"
                                            for="opportunity">MR/HR Data</option>
                                        <option label="Other" dat="" class="control-label"
                                            for="opportunity">Other Data</option>
                                    </select>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="if_other_data_temp" name="if_other_data_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">If Other Data</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="if_other_data_temp1" name="if_other_data"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="arcdecomm_temp" name="arcdecomm_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Please describe your needs for Archival and Decommission Service</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" id="arcdecomm_temp1" name="arcdecomm"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="completion_date_temp" name="completion_date_temp" class="Template_Field" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="opportunity">Desired Completion Date</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control datepicker1 hasDatepicker" size="35" id="completion_date_temp1" placeholder="mm/dd/yyyy" name="completion_date"> </div>
                            </div>
                            <br>
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
                                    
<!-------Oppurtunity Add popup---------->
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


 
 
        
	 <a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button" ><i class="fa fa-arrow-up"></i></a> 					
						
					</form>
					
					
					
					 
				</div>
			</div>
		</div>
	</section>

  </div> <!-- main-page -->
 </div>  <!-- content-container -->
</div>   <!-- content-wrapper -->

</div> <!-- main-wrapper -->

<script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
<script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<link href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css" rel="stylesheet">
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
 <script src="js/toastr/toastr.min.js"></script>
 
 
 <!-- IntakeOpportunity -->
<script src="js/notification/notification.js"></script>
<script src="js/Opportunity/AddFeatureFunctionality.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/AddFeatureAjaxCall.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/EditDeleteToggle.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/EditDeleteAjaxCall.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/TemplateFeature.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/IntakeDetailsOpportunitySave.js"></script>



 <script>
    $(document).ready(function(){
    	$(window).scroll(function () {
    			if ($(this).scrollTop() > 50) {
    				$('#back-to-top').fadeIn();
    			} else {
    				$('#back-to-top').fadeOut();
    			}
    		});
    		// scroll body to 0px on click
    		$('#back-to-top').click(function () {
    			$('body,html').animate({
    				scrollTop: 0
    			}, 400);
    			return false;
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

<!-- ========== THEME JS ========== -->
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/main.js"></script>
<script id ="scripttag"></script>





</body>
</html>
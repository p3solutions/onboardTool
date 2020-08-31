<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<title>Decom3Sixty - Intake</title>

<!-- ========== COMMON STYLES ========== -->
<link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
<link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
<link rel="stylesheet" href="css/animate-css/animate.min.css"
    media="screen">
<link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
    media="screen">
 <link rel="stylesheet" href="css/UserInfo/userinfo.css" >
<!-- ========== PAGE STYLES ========== -->
<link rel="stylesheet" href="css/prism/prism.css" media="screen">
<link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
<link rel="stylesheet" href="css/icheck/skins/line/blue.css">
<link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
<!-- ========== THEME CSS ========== -->
<link rel="stylesheet" href="css/main.css" media="screen">
<link rel="stylesheet" href="css/Intake/Intake.css" type="text/css" />
<!-- ========== MODERNIZR ========== -->
<script src="js/modernizr/modernizr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/IntakeDetails/IntakeOpportunity/IntakeOpportunity.js"></script>
<script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummary.js"></script>
<script src="js/IntakeDetails/IntakeAssessment/Common/IntakeAssessmentDataRetrieve.js"></script>
<style>
 body{
            background:#fff;
        }

       .active{
          background: transparent;
       
       }
      
	.fixed-top{
	width:100%;
	padding-left: 0px;
    padding-right: 0px;
	}
	
	#module_header{
 
 margin-top:-120px;
 }

/*------------------------*/
input:focus,
button:focus,
.form-control:focus{
	outline: none;
	box-shadow: none;
}
.form-control:disabled, .form-control[readonly]{
	background-color: #fff;
}
/*----------step-wizard------------*/


/*---------signup-step-------------*/
.bg-color{
	background-color: #333;
}
.signup-step-container{
	padding: 150px 0px;
	padding-bottom: 60px;
}




    .wizard .nav-tabs {
        position: relative;
        margin-bottom: 0;
        border-bottom-color: transparent;
    }

    .wizard > div.wizard-inner {
            position: relative;
    margin-bottom: 50px;
    text-align: center;
    }

.connecting-line {
    height: 2px;
    background: #e0e0e0;
    position: absolute;
    width:75%;
    margin: 0 auto;
    left: -70px;
    right: 0;
    top: 36px;
    z-index: 0.0;
}

.wizard .nav-tabs > li.active > a, .wizard .nav-tabs > li.active > a:hover, .wizard .nav-tabs > li.active > a:focus {
    color: #555555;
    cursor: default;
    border: 0;
    border-bottom-color: transparent;
}

span.round-tab {
    width: 30px;
    height: 30px;
    line-height: 30px;
    display: inline-block;
    border-radius: 50%;
    background: #fff;
    z-index: 2;
    position: absolute;
    left: 0;
    text-align: center;
    font-size: 16px;
    color: #0e214b;
    font-weight: 500;
    border: 1px solid #ddd;
}
span.round-tab i{
    color:#555555;
}
.wizard li.active span.round-tab {
        background: #0db02b;
    color: #fff;
    border-color: #0db02b;
}
.wizard li.active span.round-tab i{
    color: #5bc0de;
}
.wizard .nav-tabs > li.active > a i{
	color: #0db02b;
}

.wizard .nav-tabs > li {
    width: 15%;
}

.wizard li:after {
    content: " ";
    position: absolute;
    left: 46%;
    opacity: 0;
    margin: 0 auto;
    bottom: 0px;
    border: 5px solid transparent;
    border-bottom-color: red;
    transition: 0.1s ease-in-out;
}



.wizard .nav-tabs > li a {
    width: 30px;
    height: 30px;
    margin: 20px auto;
    border-radius: 100%;
    padding: 0;
    background-color: transparent;
    position: relative;
    top: 0;
}
.wizard .nav-tabs > li a i{
	position: absolute;
    top: -15px;
    font-style: normal;
    font-weight: 400;
    white-space: nowrap;
    left: 50%;
    transform: translate(-50%, -50%);
    font-size: 12px;
    font-weight: 700;
    color: #000;
}

    .wizard .nav-tabs > li a:hover {
        background: transparent;
    }

.wizard .tab-pane {
    position: relative;
    
}


.wizard h3 {
    margin-top: 0;
}
.prev-step,
.next-step{
    font-size: 13px;
    padding: 8px 24px;
    border: none;
    border-radius: 4px;
    margin-top: 30px;
}
.next-step{
	background-color: #0db02b;
}
.skip-btn{
	background-color: #cec12d;
}
.step-head{
    font-size: 20px;
    text-align: center;
    font-weight: 500;
    margin-bottom: 20px;
}
.term-check{
	font-size: 14px;
	font-weight: 400;
}
.custom-file {
    position: relative;
    display: inline-block;
    width: 100%;
    height: 40px;
    margin-bottom: 0;
}
.custom-file-input {
    position: relative;
    z-index: 2;
    width: 100%;
    height: 40px;
    margin: 0;
    opacity: 0;
}
.custom-file-label {
    position: absolute;
    top: 0;
    right: 0;
    left: 0;
    z-index: 1;
    height: 40px;
    padding: .375rem .75rem;
    font-weight: 400;
    line-height: 2;
    color: #495057;
    background-color: #fff;
    border: 1px solid #ced4da;
    border-radius: .25rem;
}
.custom-file-label::after {
    position: absolute;
    top: 0;
    right: 0;
    bottom: 0;
    z-index: 3;
    display: block;
    height: 38px;
    padding: .375rem .75rem;
    line-height: 2;
    color: #495057;
    content: "Browse";
    background-color: #e9ecef;
    border-left: inherit;
    border-radius: 0 .25rem .25rem 0;
}
.footer-link{
	margin-top: 30px;
}
.all-info-container{

}
.list-content{
	margin-bottom: 10px;
}
.list-content a{
	padding: 10px 15px;
    width: 100%;
    display: inline-block;
    background-color: #f5f5f5;
    position: relative;
    color: #565656;
    font-weight: 400;
    border-radius: 4px;
}
.list-content a[aria-expanded="true"] i{
	transform: rotate(180deg);
}
.list-content a i{
	text-align: right;
    position: absolute;
    top: 15px;
    right: 10px;
    transition: 0.5s;
}
.form-control[disabled], .form-control[readonly], fieldset[disabled] .form-control {
    background-color: #fdfdfd;
}
.list-box{
	padding: 10px;
}
.signup-logo-header .logo_area{
	width: 200px;
}
.signup-logo-header .nav > li{
	padding: 0;
}
.signup-logo-header .header-flex{
	display: flex;
	justify-content: center;
	align-items: center;
}
.list-inline li{
    display: inline-block;
}
.pull-right{
    float: right;
}
/*-----------custom-checkbox-----------*/
/*----------Custom-Checkbox---------*/
input[type="checkbox"]{
    position: relative;
    display: inline-block;
    margin-right: 5px;
}
input[type="checkbox"]::before,
input[type="checkbox"]::after {
    position: absolute;
    content: "";
    display: inline-block;   
}
input[type="checkbox"]::before{
    height: 16px;
    width: 16px;
    border: 1px solid #999;
    left: 0px;
    top: 0px;
    background-color: #fff;
    border-radius: 2px;
}
input[type="checkbox"]::after{
    height: 5px;
    width: 9px;
    left: 4px;
    top: 4px;
}
input[type="checkbox"]:checked::after{
    content: "";
    border-left: 1px solid #fff;
    border-bottom: 1px solid #fff;
    transform: rotate(-45deg);
}
input[type="checkbox"]:checked::before{
    background-color: #18ba60;
    border-color: #18ba60;
}






@media (max-width: 767px){
	.sign-content h3{
		font-size: 40px;
	}
	.wizard .nav-tabs > li a i{
		display: none;
	}
	.signup-logo-header .navbar-toggle{
		margin: 0;
		margin-top: 8px;
	}
	.signup-logo-header .logo_area{
		margin-top: 0;
	}
	.signup-logo-header .header-flex{
		display: block;
	}
}


.back-to-top {
    position: fixed;
    bottom: 20px;
    right: 35px;
    
    border-radius:50%;
    background:Gray;
}

.fa{
padding-left:3px;
padding-top:-3px;
padding-bottom:10px;
margin:0 auto;
font-size:14x;
color:#fff;

}





</style>
</head>
<body class="top-navbar-fixed">
    <form class="form-signin" name="loginForm" method="post">
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
		      <li class="active"><a href="OpportunityList.jsp" style="color:#fff; background:#1565c0; ">Applications</a></li>
		      <li><a href="Admin_Module_Send_Invites.jsp">Administration</a></li>
		     <li><a href="Archive_Execution.jsp">Governance</a></li>
		              <li><a href="#">Finance</a></li>
		              <li><a href="ProjectManager_dashboard.jsp">Dashboards</a></li>
		              <li><a href="#">Compliance</a></li>
		    </ul>
		         <ul class="nav navbar-nav navbar-right">
                       

                        <li><a href="#"><span id="nav_userid">admin &nbsp;</span>logged in as &nbsp;<span id='nav_role'> admin </span></a></li>
                        <li><a href="Logout" class="text-center"> Logout</a> </li>
                    </ul>
                </div>
                
                
                
                
            </div>
            <!-- /.row -->
            
        </div>
        <!-- /.container-fluid -->
    </nav >
            <div class="content-wrapper">
                <div class="content-container" >
                   
                    <div class="main-page">
                        
                        <section class="signup-step-container">
        <div class="container" id="module_header">
            <div class="row d-flex justify-content-center">
                <div class="col-md-12">
                    <div class="wizard">
                        <div class="wizard-inner">
                            <div class="connecting-line"></div>
                            <ul class="nav nav-tabs" role="tablist">
                                <li role="presentation" >
                                    <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" aria-expanded="true"><span class="round-tab">1 </span> <i>Opportunity</i></a>
                                </li>
                                <li role="presentation" >
                                    <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" aria-expanded="false"><span class="round-tab">2</span> <i>Triage</i></a>
                                </li>
                                <li role="presentation" >
                                    <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab"><span class="round-tab">3</span> <i>Triage Summary</i></a>
                                </li>
                                <li role="presentation" >
                                    <a href="#step4" data-toggle="tab" aria-controls="step4" role="tab"><span class="round-tab">4</span> <i>Assessment</i></a>
                                </li>
                                 <li role="presentation" >
                                    <a href="#step5" data-toggle="tab" aria-controls="step5" role="tab"><span class="round-tab">5</span> <i>Stake Holder</i></a>
                                </li>
                                 <li role="presentation" >
                                    <a href="#step6" data-toggle="tab" aria-controls="step6" role="tab"><span class="round-tab">6</span> <i>Preview</i></a>
                                </li>
                            </ul>
                        </div>
                        
                          <form role="form" action="index.html" class="login-box">
                            <div class="tab-content" id="main_form">
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
                                                    <div id="inputFields">
                                                        <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/>
                                                    </div>                                                
                                                    <div class="col-md-12">
                                                            <div class="col-md-1">
                                                                <button type="button" class="btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Back</button>
                                                            </div>
                                                            <div class="col-md-5 dropup" style="padding-top: 10px; padding-right: 10px; float: right;">
                                                                <button type="button" class="btn btn-warning" id="template" data-toggle="modal" data-target=".bd-example-modal-lg">Template</button>
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#" id="add" data-toggle="modal" data-target="#AddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="Edit" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="Delete" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                               
                                                                <button type="submit" class="btn btn-success" id="create">Save</button>
                                                                 <a href="#step2"  aria-controls="step2" role="tab" data-toggle="tab" aria-expanded="false"><button class="btn btn-info">Next</button></a>
                                                                
                                                              
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" data-toggle="modal" data-target="#EditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-toggle="modal" data-target="#DeletePopUp" style="display: none;">Delete PopUp</button>
                                                               <!--  <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button> -->
                                                            </div>
                                                    </div>
                                                    <!--  <div class="form-group">
                   <button type="button" data-toggle="modal" data-target="#exampleModal" class="btn btn-primary  pull-right" id="create">Use Exists Que</button>
                   </div> -->
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                
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
                                
                                    <div class="tab-pane" role="tabpanel" id="step2">
                                    
                                             <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1"  onclick="switchColors();">Triage Information</a>  </h4>
                                        </div>
                                        <div id="collapse2" class="panel-collapse ">
                                            <div class="panel-body">
                                            <div id="inputValue">
                                                        <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/>
                                             </div>
                                            <div class="col-md-12">
                                                <div class="col-md-1">
                                                     <button type="button" class="btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Back</button> </div>
                                                            <div class="col-md-5 dropup" style="padding-top: 10px; padding-right: 10px; float: right;">
                                                                <button type="button" class="btn btn-warning" id="template" data-toggle="modal" data-target=".triage-example-modal-lg">Template</button>
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span> </button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#" id="add" data-toggle="modal" data-target="#AddTriagePopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="EditTriage" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="DeleteTriage" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                                <button type="submit" class="btn btn-success" id="createbtn">Save</button>
                                                                <a href="#step3"  aria-controls="step3" role="tab" data-toggle="tab" aria-expanded="false"><button class="btn btn-info">Next</button></a>
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn1" data-toggle="modal" data-target="#EditTriagePopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn1" data-toggle="modal" data-target="#DeleteTriagePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                                            </div>
                                            </div>    
                                            </div>
                                        </div>
                                    </div>
                                    
                                    
                                    
                                    </div>
                                
                                 
                                  <div class="tab-pane" role="tabpanel" id="step3">
                                                        <!-- Triage Summary -->
                                    <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1"  onclick="switchColors();">Triage Summary</a></h4>
                                        </div>
                                        <div id="collapse3" class="panel-collapse ">
                                            <div class="panel-body">
                                            <div id="inputFieldsSummary">
                                                    <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/> </div>
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFieldsSummary">
                                                        <input type='hidden' class='form-control' size='35' id="Json_sample_id" placeholder='' name="Json_Sample" value=""/></div>                                           
                                                    <div class="col-md-12">
                                                       <div class="col-md-1">
                                                          <button type="button" class="btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;"><a href="#step2">Back</a></button></div>
                                                       <div class="col-md-5 dropup" style="padding-top: 10px; padding-right: 10px; float: right;">
                                                          <button type="button" class="btn btn-warning" id="template" data-toggle="modal" data-target=".triage-summary-example-modal-lg">Template</button>
                                                                <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                                                <ul class="dropdown-menu">
                                                                    <li><a href="#" id="addSummary" data-toggle="modal" data-target="#TiageSummAddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                                                    <li><a href="#" id="EditSummary" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                                                    <li><a href="#" id="DeleteSummary" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                                                </ul>
                                                                <button type="submitBtn" class="btn btn-success" id="createTriSummary">Save</button>
                                                                <a href="#step4"  aria-controls="step4" role="tab" data-toggle="tab" aria-expanded="false"><button class="btn btn-info">Next</button></a>
                                                                <button type="button" class="btn btn-primary pull-right" id="editpopupSummary_btn" data-toggle="modal" data-target="#TriSummEditPopUp" style="display: none;">Edit PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="deletepopupSummary_btn" data-toggle="modal" data-target="#TriageSummaryDeletePopUp" style="display: none;">Delete PopUp</button>
                                                                <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                                            </div>
                                                        </div>
								</div>
					</div>
                                    </div>
                                    
                                </div>
                            </div>
                                  </div>
                                  
                                  
                                  
                                  
                                  <div class="tab-pane" role="tabpanel" id="step4">
                                     <!-- Assessment Table -->
                            <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1"  onclick="switchColors();">Assessment</a></h4>
                                        </div>
                                        <div id="collapse4" class="panel-collapse ">
                                          
                                            <div id="collapse1" class="panel-collapse " name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFieldsAssessment">
                                      <!-- Application Information -->
                                     <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1"  onclick="switchColors();">Application information</a></h4>
                                        </div>
                                        <div id="collapse5" class="panel-collapse ">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse " name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsAppInfo">
												 </div>   
											    </div>
											<div class="col-md-12">
                                                 <div class="col-md-1">
                                                 <button type="button" class="btn btn-primary pull-right" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Next</button></div>														
								                 </div>
					                        </div>
                                            </div>
                                       </div>
							         </div>   
                                                   
                               <!-- Data Characteristics -->
                                     <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse6" onclick="switchColors();">Data Characteristics</a></h4>
                                        </div>
                                        <div id="collapse6" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsDataChar">
												 </div>   
											    </div>
											<div class="col-md-12">
                                                 <div class="col-md-1">
                                                 <button type="button" class="btn btn-primary pull-right" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Next</button></div>														
								                 </div>
					                        </div>
                                            </div>
                                       </div>
							         </div>         
                                                    
                             <!-- Compliance Characteristics -->
                                      <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse7" onclick="switchColors();">Compliance Characteristics</a></h4>
                                        </div>
                                        <div id="collapse7" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsComplianceChar">
												 </div>   
											    </div>
											<div class="col-md-12">
                                                 <div class="col-md-1">
                                                 <button type="button" class="btn btn-primary pull-right" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Next</button></div>														
								                 </div>
					                        </div>
                                            </div>
                                       </div>
							         </div>
							         
							      <!-- Archival Consumption -->
                                      <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse8" onclick="switchColors();">Archival Consumption</a></h4>
                                        </div>
                                        <div id="collapse8" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsArchivConsump">
												 </div>   
											    </div>
											<div class="col-md-12">
                                                 <div class="col-md-1">
                                                 <button type="button" class="btn btn-primary pull-right" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Next</button></div>														
								                 </div>
					                        </div>
                                            </div>
                                       </div>
							         </div>
							         
							         <!-- Contract Information-->
							         <div id ="ContractInformation" style="display:none;">
							           <div class="panel panel-default">
                                        <div class="panel-heading">
                                            <h4 class="panel-title">
                                                <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse9" onclick="switchColors();">Contract Information</a></h4>
                                        </div>
                                        <div id="collapse9" class="panel-collapse collapse">
                                            <div class="panel-body">
                                            <div id="collapse1" class="panel-collapse collapse in" name="collapse">
                                               <div class="panel-body">
                                                 <div id="inputFieldsContInfo">
												 </div>   
											    </div>
											<div class="col-md-12">
                                                 <div class="col-md-1">
                                                 <button type="button" class="btn btn-primary pull-right" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Next</button></div>														
								                 </div>
					                        </div>
                                            </div>
                                       </div>
							         </div>
							         </div>
							         <br>
							         <div class="col-md-12">
                                       <div class="col-md-1">
                                       <button type="button" class="btn btn-light" style="padding-top: 5px; padding-left: 10px; float: left;" onclick="location.href='OpportunityGrid.jsp';">Back</button></div>
                                       <div class="col-md-4 dropup" style="padding-top: 10px; padding-right: 10px; float: right;">
                                       <button class="btn btn-primary dropdown-toggle " type="button" data-toggle="dropdown"> Actions <span class="caret"></span></button>
                                       <ul class="dropdown-menu">
                                       <li><a href="#" id="AddAssess" data-toggle="modal" data-target="#AssessAddPopUp" class="fa fa-plus" style="font-size: 19px; color: black;">&nbsp;&nbsp;&nbsp;Add</a></li>
                                       <li><a href="#" id="EditAssess" class="fa fa-edit" style="font-size: 19px; color: black">&nbsp;&nbsp;&nbsp;Edit</a></li>
                                       <li><a href="#" id="DeleteAssess" class="fa fa-trash" style="font-size: 18px; color: black">&nbsp;&nbsp;&nbsp;Delete</a></li>
                                       </ul>
                                       <button type="button" class="btn btn-success" id="AssessmentSaveBtn">Save</button>
                                       <a href="#step5"  aria-controls="step5" role="tab" data-toggle="tab" aria-expanded="false"><button class="btn btn-info" onclick = "window.location.href='IntakeStakeHolder.jsp';">Next</button></a>
                                       <button type="button" class="btn btn-primary pull-right" id="editpopupAssess_btn" data-toggle="modal" data-target="#AssessEditPopUp" style="display: none;">Edit PopUp</button>
                                       <button type="button" class="btn btn-primary pull-right" id="deletepopupAssess_btn" data-toggle="modal" data-target="#AssessDeletePopUp" style="display: none;">Delete PopUp</button>
                                       <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button>
                                       </div>
                                     </div>
								</div>
					           </div>     
                                </div>
                            </div>
                    </div>
                                  
                                  
                                  
                                  </div>
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                
                                </div>
                                 <a id="back-to-top" href="#" class="btn btn-light btn-lg back-to-top" role="button" ><i class="fa fa-arrow-up"></i></a> 
                               </form>
        
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
   <!-- Triage Template modal-->
        <div class="modal fade triage-example-modal-lg" id="myFormModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Triage Template</h5>
                    <button type="button" class="close" id="triage_temp_close_id" data-dismiss="modal" aria-label="Close"> <span aria-hidden="true">&times;</span> </button> </div>
                <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="Templatevalues" >
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appId_temp" name="appId" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">APM Id</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>        
                            </div>        
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="applicationName_temp" name="appName" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">APM Name</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="applicationDesc_temp" name="appDesc" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Application Description</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> 
							</div>
                             <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="applicationOwner_temp" name="appOwner" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Application Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="busOwner_temp" name="busOwner" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Business Owner</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="devOwner_temp" name="devOwner" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Developement Owner or SME</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>
                            <br>   
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="billing_Code_temp" name="billing_Code" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Billing Code</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>           
                            <br>   
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="business_Segment_temp" name="biling_Segment" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Billing Segement</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" name="biling_Segment"> </div>
                             </div>           
                             <br> 
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="busUnit_temp" name="busUnit" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Business Unit</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> 
						    </div>    
                             <br>
							<div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="segment_contact_temp" name="segment_contact" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Program or Segement Contact</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
							</div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="logic_Grp_temp" name="logic_Grp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Logical Grouping</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br> 
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Preliminary_CBA_temp" name="Preliminary_CBA" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Preliminary CBA</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="funding_Avl_temp" name="funding_Avl" class="Template_Values" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Funding available</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Yes" class="control-label" for="Triage">Yes</option>
                                        <option label="No" class="control-label" for="Triage">No</option>
                                    </select>
                               </div>
                            </div>     
							<br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="prgFunder_temp" name="prgFunder" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Program Funder</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
							<div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="PrjInfo_temp" name="PrjInfo" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Project Portfolio Information</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                             <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Decom_date_temp" name="Decom_date" class="Template_Values" value=""> </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Project Decomission Date</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control datepicker1 hasDatepicker" size="35" placeholder="mm/dd/yyyy"> </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="infrastructure_impact_temp" name="infrastructure_impact" class="Template_Values" value="" >  </div>
                                <div class="col-md-2">  <label class="control-label" for="Triage">Infrastructure Impact</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Yes" class="control-label" for="Triage">Yes</option>
                                        <option label="No" class="control-label" for="Triage">No</option>
                                        </select> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="nmbr_of_infrastructure_components_temp" name="nmbr_of_infrastructure_components" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Number of Infrastructure Components</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                             </div>    
                             <br>
                             <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="archival_Sol_temp" name="archival_Sol" class="Template_Values" value="" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Archival Solution</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Yes" class="control-label" for="Triage">Yes</option>
                                        <option label="No" class="control-label" for="Triage">No</option>
                                    </select> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Status_temp" name="Status" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Status/Notes</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="decomAnalyst_temp" name="decomAnalyst" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Decom Analyst</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="rationalization_type_temp" name="rationalization_type" class="Template_Values" value="" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Rationalization Type</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Replace" class="control-label" for="Triage">Replace</option>
                                        <option label="Retire" class="control-label" for="Triage">Retire</option>
                                        <option label="Combine" class="control-label" for="Triage">Combine</option>
                                        <option label="Other" class="control-label" for="Triage">Other</option>
                                    </select> </div>
                            </div>    
                             <br>
                             <div class="row" style = "display:none;">
                                <div class="col-md-1"> <input type="hidden" id="If_other_please_describe_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If other, please describe </label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                             </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="appPlatfrm_temp" name="appPlatfrm" class="Template_Values" value="" >  </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Application platform</label> </div>
                                <div class="col-md-6">
                                    <select style="width: 100%;" class="form-control">
                                        <option label="Mainframe" class="control-label" for="Triage">Mainframe</option>
                                        <option label="Distibuted - Unix" class="control-label" for="Triage">Distibuted - Unix</option>
                                        <option label="Windows" class="control-label" for="Triage">Windows</option>
                                        <option label="hybrid" class="control-label" for="Triage">hybrid</option>
                                        <option label="Others" class="control-label" for="Triage">Others</option>
                                     </select>  </div>
                            </div>            
                            <br>
                            <div class="row" style="display:none;">
                                <div class="col-md-1"> <input type="hidden" id="If_Other_describe_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If Other,please describe </label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="app_and_data_hosted_temp" name="app_and_data_hosted_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Is application and Data hosted externally?</label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No           </div>        
                            </div>           
                            <br>
                            <div class="row" style="display:none;">
                                <div class="col-md-1"> <input type="hidden" id="vendor_temp" name="" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If yes,vendor?Location?</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="compliance_temp" name="compliance_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Are there any compliance or legal drivers determining retirement by a certain date </label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>        
                            </div>    
                            <br>
                            <div class="row" style="display:none;">
								<div class="col-md-1"><input type="hidden" id="describe_temp" name="" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">If yes above,please describe</label></div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                             <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="Financialdate_temp" name="Financialdate_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Are there any business or financial drivers determining retirement by a certain date?Eg.,contract expiring</label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>        
                            </div>    
                            <br>
                            <div class="row" style="display:none;">
                                    <div class="col-md-1"><input type="hidden" id="plsdescribe_temp" name="" class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">If Yes above,please describe</label> </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="TechincalDeterminingdate_temp" name="TechincalDeterminingdate_temp" class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Are there any technical drivers determining retirement by a certain date?.(Eg server end of life ,support,software,end of life,support)</label> </div>
                                <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>        
                            </div>    
                            <br>
                            <div class="row" style="display:none;">
                             <div class="col-md-1"> <input type="hidden" id="pls_describe_temp" name="" class="Template_Values" value="" > </div>
                            <div class="col-md-2"> <label class="control-label" for="Triage">If Yes above,please describe</label> </div>
                            <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="useforArchival_temp" name="useforArchival " class="Template_Values" value=""> </div> 
								<div class="col-md-2"> <label class="control-label" for="Triage">Please describe business need/use for Archival</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> </div>    
                             <br>
                             <div class="row">
                                <div class="col-md-1">
                                     <input type="checkbox" id="highlevelapplicationdata_temp" name="highlevelapplicationdata " class="Template_Values" value="" > </div>
                                     <div class="col-md-2"> <label class="control-label" for="Triage">Please describe at high-level your applications data </label> </div>
                                     <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="ideaNmbr_temp" name="ideaNmbr " class="Template_Values" value="" > </div>
                                <div class="col-md-2"> <label class="control-label" for="Triage">Idea Number</label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35">  </div>
                            </div>    
                            <br>
                            <div class="row">
                                <div class="col-md-1"> <input type="checkbox" id="DemandNmbr" name="DemandNmbr " class="Template_Values" value="" > </div> <div class="col-md-2"> <label class="control-label" for="Triage">Demand Number </label> </div>
                                <div class="col-md-6"> <input type="text" class="form-control" size="35" name="DemandNmbr"> </div>
                            </div>    
                            <br>
                            <div class="row">
									<div class="col-md-1"> <input type="checkbox" id="PrjNmbr_temp" name="PrjNmbr " class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">Project Number </label> </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                            <br>
                            <div class="row">
                                    <div class="col-md-1"> <input type="checkbox" id="PrjctTaskNmbr_temp" name="PrjctTaskNmbr " class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">Project Task Number </label> </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>    
                             <br>
                             <div class="row">
                                     <div class="col-md-1"> <input type="checkbox" id="Bigrock_temp" name="Bigrock " class="Template_Values" value="" > </div>
                                     <div class="col-md-2"> <label class="control-label" for="Triage">Big Rock </label> </div>
                                     <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No </div>
                              </div>
                             <br>
                            <div class="row">
                                   <div class="col-md-1"> <input type="checkbox" id="DenialRsn_temp" name="DenialRsn " class="Template_Values" value="" > </div>
                                    <div class="col-md-2"> <label class="control-label" for="Triage">Denial Reason </label>  </div>
                                    <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                            </div>     <br> </div>
                                       </form>
                                       </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary submitDisable" onclick="validateTriage()">Add Template</button>
                </div>
		</div>
		</div>
		</div>
	<!-- Triage Ssummary Template modal-->                                        
	 <div class="modal fade triage-summary-example-modal-lg" id="myFormModal"
                   tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
                      aria-hidden="true">
                   <div class="modal-dialog modal-lg" role="document">
                     <div class="modal-content">
                      <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Triage Summary Template</h5>
                    <button type="button" class="close" id="TriageTempSummaryCloseId" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form name="myForm">
                        <div class="form-group" id="TriSummTemplate" >
                                   <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="ideaNumber_temp" name="ideaNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Idea Number</label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="DemandNumber_temp" name="DemandNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Demand Number </label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35" name="DemandNmbr"> </div>
									</div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="PrjNumber_temp" name="PrjNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Project Number </label> </div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="PrjctTaskNumber_temp" name="PrjctTaskNumber_temp" class="Template_Summary_Values" value="" > </div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Project Task Number </label></div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div> 
									</div>    
                                     <br>
                                    <div class="row">
                                            <div class="col-md-1"> <input type="checkbox" id="BigrockSumm_temp" name="BigrockSumm_temp" class="Template_Summary_Values" value="" ></div>
                                            <div class="col-md-2"> <label class="control-label" for="Triage">Big Rock </label> </div>
                                            <div class="col-md-6"> <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="Yes">&nbsp;Yes &nbsp;<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="No">&nbsp;No</div>
                                    </div>    
                                    <br>
                                    <div class="row">
                                        <div class="col-md-1"> <input type="checkbox" id="DenialReason_temp" name="DenialReason_temp" class="Template_Summary_Values" value="" ></div>
                                        <div class="col-md-2"> <label class="control-label" for="Triage">Denial Reason </label></div>
                                        <div class="col-md-6"> <input type="text" class="form-control" size="35"> </div>
                                    </div>     <br> </div>
                                       </form>
                                       </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary SubmitDisableTriSumm" onclick="validateTriageSummary()">Add Template</button>
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
<!-------Triage Add popup---------->
    <div class="modal" id="AddTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "add_Triage_close_id" data-dismiss="modal" aria-label="Close">
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
                            <input type="text" class="form-control" id="Triagelabel"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <input type="hidden" id="Triage_project_name" name="project_name" value="">
                <input type="text" id="Triage_appln_name" name="appln_name" value="" style="display:none;">
                <input type="text" id="Triage_servlet_name" name="servlet_name" value="" style="display:none;">

                <!-- <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Column name:</label>
                            <input type="text" class="form-control" id="Triageidname"  name="idname" required>
                        </div>
                    </div>
                </div> -->
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Type:</label>
                            <select id="Triagetypes" class="form-control" name="types" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row TriageHideField" id="TriageCheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="TriageNumber"  name="TriageNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row TriageHideField" id="TriageRadio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="TriageRadioNumber"  name="TriageRadioNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row TriageHideField" id="TriageDrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="TriageDropNumber"  name="TriageDropNumber">
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
                <div id="TriageOptions">
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
                            <select id="Triagemandatory" class="form-control" name="mandatory" required >
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
        <button type="button" id ="submitTriage" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>        
    <!-------Triage Summary Add popup---------->
    <div class="modal" id="TiageSummAddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "TriageSummAddCloseId" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="TriageSummary">Label:</label>
                            <input type="text" class="form-control" id="TriSummLabel"  name="TriSummLabel" required>
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
                            <label class="control-label" for="TriageSummary">Type:</label>
                            <select id="TriSummTypes" class="form-control" name="TriSummTypes" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row hidefield" id="TriSummCheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="TriageSummary">Number of check boxes:</label>
                            <input type="text" class="form-control" id="TriSummNumber"  name="TriSummNumber1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="TriSummRadio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="TriageSummary">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="TriSummRadioNbr"  name="TriSummRadioNbr">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row hidefield" id="TriSummDrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="TriageSummary">Number of Options:</label>
                            <input type="text" class="form-control" id="TriSummDropNbr"  name="TriSummDropNbr">
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
                <div id="TriageSummaryOptions">
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
                            <label class="control-label" for="TriageSummary">Mandatory:</label>
                            <select id="TriSummMandatory" class="form-control" name="TriSummMandatory" required >
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
        <button type="button" id ="TriSummSubmit" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>        
 
 <!-- Assessment Common Add Popup -->
 
     <div class="modal" id="AssessAddPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Add Input Fields</h5>
        <button type="button" class="close" id = "AssessAddCloseId" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div id="scrollbar">
             <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Section:</label>
                            <select id="AssessSection" class="form-control" name="AssessSection" required >
                                <option value="ApplicationInformation" selected>Application Information</option>
                                <option value="DataCharacteristics">Data Characteristics</option>
                                <option value="ComplianceCharacteristics">Compliance Characteristics</option>
                                <option value="ArchivalConsumption">Archival Consumption</option>
                                <option value="ContractInformation">Contract Information</option>
                            </select>
                        </div>
                    </div>
                </div><br/>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="AssessLabel"  name="AssessLabel" required>
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
                            <select id="AssessTypes" class="form-control" name="AssessTypes" required >
                                <option value="Text box">Text box</option>
                                <option value="Check box">Check box</option>
                                <option value="Radio box">Radio box</option>
                                <option value="Dropdown">Dropdown</option>
                                <option value="Datepicker">Datepicker</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row AssessHideField" id="AssessCheck" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of check boxes:</label>
                            <input type="text" class="form-control" id="AssessCheckNumber"  name="AssessCheckNumber1">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row AssessHideField" id="AssessRadio" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Radio boxes:</label>
                            <input type="text" class="form-control" id="AssessRadioNumber"  name="AssessRadioNumber">
                        </div>
                    </div>
                    <br/>
                </div>
                <div class="row AssessHideField" id="AssessDrop" style="display:none;">
                    <div class="form-group">
                        <div class="col-sm-4">
                            <label class="control-label" for="formInput526">Number of Options:</label>
                            <input type="text" class="form-control" id="AssessDropNumber"  name="AssessDropNumber">
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
                <div id="AssessOptions">
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
                            <select id="AssessMandatory" class="form-control" name="AssessMandatory" required >
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
        <button type="button" id ="AssessAddSubmit" class="btn btn-primary">Add Fields</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
<!--Triage Delete pop up-->
         <div class="modal" id="DeleteTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="TriageDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="sequenceTriageDelete"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriageDeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>                                      
   <!-- Triage Summary Delete Pop up -->
        <div class="modal" id="TriageSummaryDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="TriSummDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="TriSummSequence"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriSummDeleteSubmit" class="btn btn-primary" >Yes</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close" >No</button>
      </div>
    </div>
  </div>
</div>    

<!-- AssessmentCommon Delete Pop Up -->

<div class="modal" id="AssessDeletePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Delete Field</h5>
        <button type="button" id ="AssessDeleteClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="DeleteForm">
                <div class="modal-body">
                    <p style="font-size:20px;">Do you want to delete this input field permanently?</p>
                    <input type="hidden" id="AssessSequence"/>
                    <input type="hidden" id="DeleteSection"/>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="AssessDeleteSubmit" class="btn btn-primary" >Yes</button>
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
 <!--Triage Edit pop up -->
    <div class="modal" id="EditTriagePopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="TriageEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Label:</label>
                            <input type="text" class="form-control" id="TriageLabelModify"  name="label" required>
                        </div>
                    </div>
                </div><br/>
                <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="formInput526">Mandatory:</label>
                            <select id="TriageEditMandatory" class="form-control" name="TraigeEditMandatory" required >
                                <option value = "Yes" >Yes</option>
                            </select>
                        </div>
                    </div>
                </div>   <input type="text" id="TriageEditSeqNum" name="TriageEditSeqNum" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriageEditSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  

  <!-- Triage Summary Edit pop up -->
    <div class="modal" id="TriSummEditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="TriSummEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="TriageSummary">Label:</label>
                            <input type="text" class="form-control" id="TriSummLabelModify"  name="TriSummlabel" required>
                        </div>
                    </div>
                </div><br/><input type="text" id="TriSummSeqNum" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="TriSummEditSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div>  

<!--  Assessment Common Edit Pop up -->

 <div class="modal" id="AssessEditPopUp" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Edit Input Field</h5>
        <button type="button" id="AssessEditClose" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form name="PopUpform">
            <div class="row">
                    <div class="form-group">
                        <div class="col-lg-8">
                            <label class="control-label" for="Assessment">Label:</label>
                            <input type="text" class="form-control" id="AssessLabelModify"  name="Assesslabel" required>
                        </div>
                    </div>
                </div><br/><input type="text" id="AssessSeqNum" name="" value="" style="display:none;">
                <input type="text" id="EditSection" name="" value="" style="display:none;">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" id="AssessEditSubmit" class="btn btn-primary" >Submit</button>
        <button type="button" class="btn btn-default" data-dismiss="modal" aria-label="Close">Cancel</button>
        
      </div>
    </div>
  </div>
</div> 
        
        
        
                       
                    </div>
                </div>
            </div>
        </div>
    </section>
                        
                        
                        
                   </div>
                 </div>
                       
             </div>                   
                                          
                                          
                                          
                                          
                                    
                                    
                                    
                                    

    <!-- Date picker --> 
    
       <link href = "https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"  
         rel = "stylesheet"><!-- newly added code by parthiban -->
      <script src = "https://code.jquery.com/jquery-1.10.2.js"></script>
      <script src = "https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
      <script src="js/toastr/toastr.min.js"></script>
      
      <script src="js/notification/notification.js"></script>
    <script src="js/Opportunity/AddFeatureFunctionality.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/AddFeatureAjaxCall.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/EditDeleteToggle.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/EditDeleteAjaxCall.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/TemplateFeature.js"></script>
    <script src="js/IntakeDetails/IntakeOpportunity/IntakeDetailsOpportunitySave.js"></script>
    
    <!-- Triage js file -->
    
    <script src="js/IntakeDetails/IntakeTriage/IntakeTriage.js"></script>
    <script src="js/IntakeDetails/IntakeTriage/AddTemplateTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/AddFeatureAjaxCallTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/EditDeleteToggleTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/EditDeleteAjaxCallTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/AddFeatureFunctionalityTriage.js"></script>
     <script src="js/IntakeDetails/IntakeTriage/IntakeTriageSave.js"></script>
     
     <!-- Intake triage Summary -->
     
     <script src="js/IntakeDetails/IntakeTriageSummary/EditDeletAjaxCallTriageSummary.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummarySave.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/AddFeatureFunctionality.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/TriageSummaryAddFeatureAjaxCall.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/EditDeleteToggle.js"></script>
     <script src="js/IntakeDetails/IntakeTriageSummary/IntakeTriageSummaryTemplate.js"></script>
     
     <!-- Intake Assessment -->
     <script src="js/IntakeDetails/IntakeAssessment/ApplicationInformation/ApplicationDetailsFieldFunctionality.js"></script>  
     <script src="js/IntakeDetails/IntakeAssessment/Common/AssessmentAddAjaxCall.js"></script>  
     <script src="js/IntakeDetails/IntakeAssessment/Common/AssessmentAddFunctionality.js"></script>
     <script src="js/IntakeDetails/IntakeAssessment/Common/EditDeleteToggle.js"></script>
     <script src="js/IntakeDetails/IntakeAssessment/Common/AssessEditDeleteAjaxCall.js"></script>
     <script src="js/IntakeDetails/IntakeAssessment/Common/IntakeAssessmentSave.js"></script>
     
  
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
    </body>
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
    <link rel="stylesheet" href="js/amcharts/plugins/export/export.css"
        type="text/css" media="all" />
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
    
</html>

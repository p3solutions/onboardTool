
<!DOCTYPE html>  
<html>  

<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Decomm Manager - Archive Executive Sample</title>
        
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
  
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
        <!-- ========== COMMON STYLES ========== -->
        <link rel="stylesheet" href="css/bootstrap.min.css" media="screen" >
        <link rel="stylesheet" href="css/font-awesome.min.css" media="screen" >
        <link rel="stylesheet" href="css/animate-css/animate.min.css" media="screen" >
        <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css" media="screen" >

        <link rel="stylesheet" type="text/css" href="css/date-picker/jquery.timepicker.css" />
        <link rel="stylesheet" type="text/css" href="css/date-picker/bootstrap-datepicker.css" />

		<script type="text/javascript" src="js/archivesummary/jqueryprogressbar.js"></script>
		<script type="text/javascript" src="js/archivesummary/main.js"></script>
        <script src="https://docraptor.com/docraptor-1.0.0.js"></script>
		<link type="text/css" rel="stylesheet" href="old/css/progressbar.css" />
		<script src="js/archivesummary/treeTable.js"></script>

        <!-- ========== PAGE STYLES ========== -->
        <link rel="stylesheet" href="css/prism/prism.css" media="screen" >
        <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen" >
        <link rel="stylesheet" href="css/icheck/skins/line/blue.css" >
        <link rel="stylesheet" href="css/icheck/skins/line/red.css" >
        <link rel="stylesheet" href="css/icheck/skins/line/green.css" >
        <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css" >

        <!-- ========== PAGE STYLES ========== -->
        <link rel="stylesheet" type="text/css" href="css/date-picker/jquery.timepicker.css" />
        <link rel="stylesheet" type="text/css" href="css/date-picker/bootstrap-datepicker.css" />

        <!-- ========== THEME CSS ========== -->
        <link rel="stylesheet" href="css/main.css" media="screen" >

        <!-- ========== MODERNIZR ========== -->
        <script src="js/modernizr/modernizr.min.js"></script>
	
<script type="text/javascript" src="js_in_pages/archive_exec.js"></script>
<script type="text/javascript" src="js_in_pages/tree.js"></script>
<link rel="stylesheet" href="js_in_pages/archive_exec.css" type="text/css" />
<link rel="stylesheet" href="old/css0/progressbar.css" type="text/css" />


		<script src="js/archivesummary/jstree.min.js"></script>
   
        
<script>

$(function() {
	 for(var i=0;i<200;i++)
		{
	    $( "#pln_srt_date"+i ).datepicker({
	        format: "mm/dd/yyyy",
	        autoclose: true
	    });
	    $( "#pln_end_date"+i ).datepicker({
	        format: "mm/dd/yyyy",
	        autoclose: true
	    });
	    $( "#act_srt_date"+i ).datepicker({
	        format: "mm/dd/yyyy",
	        autoclose: true
	    });
	    $( "#act_end_date"+i ).datepicker({
	        format: "mm/dd/yyyy",
	        autoclose: true
	    });
		}
	});

</script>		  
 
    <script>
	  function getID(lev,pln_srt,pln_end,act_srt,status,pln_hrs,act_hrs,progressbar,actual_enddate)
	  {
		 // window.alert(pln_srt+" "+pln_end+" "+act_srt+" "+status.id+" "+pln_hrs.id+" "+act_hrs.id+" "+progressbar.id);
		  var startDate =pln_srt;
		  var endDate =pln_end;
		  var actual_startdate =act_srt;
		  var percentage;

		  if (startDate!="" && endDate!="" && actual_startdate!= "") {
		  var minDate = new Date(convertStringToDate(startDate));
		  var today = new Date();
		  var maxDate = new Date(convertStringToDate(endDate));
		  var actual_minDate = new Date(convertStringToDate(actual_startdate));
		  var nbPastDays = Math.floor((today.getTime() - actual_minDate.getTime()) / 86400000);

		  var actual_Hours= (nbPastDays*24)/3;

		  var total_days = (minDate-maxDate)-86400000;

		  var total_hours =(Math.round(Math.abs(total_days/(60*60*1000))))/3;

		  var percent = (actual_Hours/total_hours) * 100;

		  //alert("minDate "+minDate);
		  //alert("maxDate "+maxDate);
		  percentage=100;
		  console.log("actual_Hours : "+actual_Hours);
		  console.log("total_hours : "+total_hours);
		  if(lev!=1){
		  document.getElementById(pln_hrs.id).value=total_hours;
		  document.getElementById(act_hrs.id).value=actual_Hours;
		  }
		  if (percent < 0 ) {
		  percent=0;
		  $('#'+progressbar.id).reportprogress(percent);
		  } 
		  else if(percent>100)
		  {
			  percent=100;
			  $('#'+progressbar.id).reportprogress(percent);
			  $('#'+status.id).css({background:'green'});
		  }  
		  else if (actual_enddate!="") {
		  
		  percent=100 ;
		  $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'green'});
		  }
		  else if (percent < 20) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'red'});
		  }
		  else if (percent > 20) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'yellow'});
		  }
		               else if (percent < 75) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'orange'});
		  }
		               else if (percent >76 ) 
		  { $('#'+progressbar.id).reportprogress(percent);
		  $('#'+status.id).css({background:'green'});
		  }
		  }
		  else
			  {
		
			  }
		  }
	  </script>
	  <script>
	  var mindates=[];
	  var maxdates=[];
	  var actdates=[];
	  function exxexx(x){
		  var dat=document.getElementById(x).value;
		  actdates.push(new Date(dat));
		  var actDate=new Date(Math.max.apply(null,actdates));
		  document.getElementById("act_srt_date0").value=(actDate.getMonth()+1)+'/'+actDate.getDate()+'/'+actDate.getFullYear();  
	  }
	  function exex(x){
		  var dat=document.getElementById(x).value;
		  mindates.push(new Date(dat));
		  var minDate=new Date(Math.min.apply(null,mindates));
		  document.getElementById("pln_srt_date0").value=(minDate.getMonth()+1)+'/'+minDate.getDate()+'/'+minDate.getFullYear();  
	  }
	  function exexx(x){
		  var dat=document.getElementById(x).value;
		  maxdates.push(new Date(dat));
		  var minDate=new Date(Math.max.apply(null,maxdates));
		  document.getElementById("pln_end_date0").value=(minDate.getMonth()+1)+'/'+minDate.getDate()+'/'+minDate.getFullYear();  
	  }
	  </script>
    
 
  
    <script type="text/javascript">
        $(document).ready(function () {
            // Create jqxTree
            $('#jqxTree').jqxTree({ height: '550px', width: '300px' });
            $('#jqxTree').css('visibility', 'visible');
            var contextMenu = $("#jqxMenu").jqxMenu({ width: '120px',  height: '56px', autoOpenPopup: false, mode: 'popup' });
            var clickedItem = null;
            
            var attachContextMenu = function () {
                // open the context menu when the user presses the mouse right button.
                $("#jqxTree li").on('mousedown', function (event) {
                    var target = $(event.target).parents('li:first')[0];
                    var rightClick = isRightClick(event);
                    if (rightClick && target != null) {
                        $("#jqxTree").jqxTree('selectItem', target);
                        var scrollTop = $(window).scrollTop();
                        var scrollLeft = $(window).scrollLeft();
                        contextMenu.jqxMenu('open', parseInt(event.clientX) + 5 + scrollLeft, parseInt(event.clientY) + 5 + scrollTop);
                        return false;
                    }
                });
            }
            attachContextMenu();
            $("#jqxMenu").on('itemclick', function (event) {
                var item = $.trim($(event.args).text());
                switch (item) {
                    case "Add Item":
                        var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                        if (selectedItem != null) {
                            $('#jqxTree').jqxTree('addTo', { label: 'Item' }, selectedItem.element);
                            attachContextMenu();
                        }
                        break;
                    case "Remove Item":
                        var selectedItem = $('#jqxTree').jqxTree('selectedItem');
                        if (selectedItem != null) {
                            $('#jqxTree').jqxTree('removeItem', selectedItem.element);
                            attachContextMenu();
                        }
                        break;
                }
            });
            // disable the default browser's context menu.
            $(document).on('contextmenu', function (e) {
                if ($(e.target).parents('.jqx-tree').length > 0) {
                    return false;
                }
                return true;
            });
            function isRightClick(event) {
                var rightclick;
                if (!event) var event = window.event;
                if (event.which) rightclick = (event.which == 3);
                else if (event.button) rightclick = (event.button == 2);
                return rightclick;
            }
        });
    </script>
 
<style>

#pdf-button{


float:right;
}
@page {
size: A4 landscape;
/*prince-bleed: 10mm;*/
/*prince-trim: 10mm;*/
/*prince-mark-offset: 1cm;*/
marks: crop cross;
margin: -3mm;
padding:2mm;
prince-bleed: 0.25in;
    prince-trim: 0.25in;
      background-position: center;
    background-size: 104%;
    background: url("images/logo1.png");
}


input
{
border:none;
border-color:transparent;
width:200px;
}
.in
{
border:none;
border-color:transparent;
width:75px;
}
.task
{
width:250px;
}
.intask
{
border:1px;
padding:10px;
margin-bottom:0px;
background-color:lightgrey;
width:200px;
}  
.intask1
{
border:1px;
padding:10px;
margin-bottom:0px;
background-color:lightgrey;
width:150px;
} 
.intask2
{
border:1px;
padding:10px;
margin-bottom:0px;
background-color:lightgrey;
width:50px;
} 
.task1
{
border:1px;
padding:10px;
margin-left:10%;
margin-bottom:0px;
background-color:lightblue;
border-left:5px solid black;
width:100px;
} 
.btn
{
  background-color:#00BFFF;
  padding:10px;
  border:none;
  width:100px;
  color:white;
  margin-right:10px;
}
.another
{
  border:1px solid black;
  padding:10px;
  border-left:5px solid black;
  width:250px;
}
input:hover
{
  cursor:pointer;
}
thead
{
  text-align:center;
}

.sidenav {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 1;
    top: 0;
    right: 0;
    background-color: #111;
    overflow-x: hidden;
    transition: 0.5s;
    padding-top: 60px;
}

.sidenav a {
    padding: 8px 8px 8px 32px;
    text-decoration: none;
    font-size: 25px;
    color: #818181;
    display: block;
    transition: 0.3s;
}

.sidenav a:hover, .offcanvas a:focus{
    color: #f1f1f1;
}

.sidenav .closebtn {
    position: absolute;
    top: 0;
    right: 0px;
    font-size: 36px;
    margin-right: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}

.tab { width: 100%;
    overflow: scroll;
    margin-bottom: 10px; }

.tab::-webkit-scrollbar {
    background-color: #868686;
    width: 10px;
    height: 10px;
 }
 
.tab::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);
}
 
.tab::-webkit-scrollbar-thumb {
    background-color: #2f2f2f;
    outline: 1px solid slategrey;
    border-radius: 5px;
 }
.but11 {
    border: none;
    outline: none;
    padding: 3px 14px;
    background-color: #3697e8;
    cursor: pointer;

}
.activ-pro{font-size: 16px;
    margin-left: -17px;}
.active, .btn:hover {
    color: white;
}

</style>

<script>

$(function() {
    $("#datamig").change(function() {
        if ($(this).val() == "yes") {
            console.log(true);
            $("#textbox").removeAttr("disabled");
        }
        else {
            console.log(false);
            $("#textbox").attr("disabled", "disabled");
        }
    });
});
$(function() {
    $("#datamig").change(function() {
        if ($(this).val() == "yes") {
            console.log(true);
            $("#textbox1").removeAttr("disabled");
        }
        else {
            console.log(false);
            $("#textbox1").attr("disabled", "disabled");
        }
    });
});


</script>
 <style>
 
.progressTSK {
  overflow: hidden;
 
  padding: 0 15px;
  width: 220px;
  height: 34px;
  background: #d3d5d9;
  border-radius: 17px;
  background-image: -webkit-linear-gradient(top, #ebecef, #bfc3c7);
  background-image: -moz-linear-gradient(top, #ebecef, #bfc3c7);
  background-image: -o-linear-gradient(top, #ebecef, #bfc3c7);
  background-image: linear-gradient(to bottom, #ebecef, #bfc3c7);
  -webkit-box-shadow: inset 0 1px rgba(255, 255, 255, 0.8), 0 2px 4px rgba(0, 0, 0, 0.35), 0 0 0 1px rgba(0, 0, 0, 0.1), 0 0 0 6px #b6babe, 0 7px rgba(255, 255, 255, 0.1);
  box-shadow: inset 0 1px rgba(255, 255, 255, 0.8), 0 2px 4px rgba(0, 0, 0, 0.35), 0 0 0 1px rgba(0, 0, 0, 0.1), 0 0 0 6px #b6babe, 0 7px rgba(255, 255, 255, 0.1);
}

.progressTSK-val {
  float: right;
  margin-left: 15px;
  font: bold 15px/34px Helvetica, Arial, sans-serif;
  color: #333;
  text-shadow: 0 1px rgba(255, 255, 255, 0.6);
}

.progressTSK-bar {
  display: block;
  overflow: hidden;
  height: 8px;
  margin: 13px 0;
  background: #b8b8b8;
  border-radius: 4px;
  background-image: -webkit-linear-gradient(top, rgba(0, 0, 0, 0.2), transparent 60%);
  background-image: -moz-linear-gradient(top, rgba(0, 0, 0, 0.2), transparent 60%);
  background-image: -o-linear-gradient(top, rgba(0, 0, 0, 0.2), transparent 60%);
  background-image: linear-gradient(to bottom, rgba(0, 0, 0, 0.2), transparent 60%);
  -webkit-box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2), 0 1px rgba(255, 255, 255, 0.6);
  box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.2), 0 1px rgba(255, 255, 255, 0.6);
}

.progressTSK-in {
  display: block;
  min-width: 3px;
  height: 20px;
  background: #1997e6;
  background-image: -webkit-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), -webkit-linear-gradient(left, #147cd6, #24c1fc);
  background-image: -moz-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), -moz-linear-gradient(left, #147cd6, #24c1fc);
  background-image: -o-linear-gradient(top, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), -o-linear-gradient(left, #147cd6, #24c1fc);
  background-image: linear-gradient(to bottom, rgba(255, 255, 255, 0.3), rgba(255, 255, 255, 0) 60%, rgba(0, 0, 0, 0) 61%, rgba(0, 0, 0, 0.2)), linear-gradient(to right, #147cd6, #24c1fc);
  border-radius: 4px;
  -webkit-box-shadow: inset 0 1px rgba(0, 0, 0, 0.2), inset 0 0 0 1px rgba(0, 0, 0, 0.2);
  box-shadow: inset 0 1px rgba(0, 0, 0, 0.2), inset 0 0 0 1px rgba(0, 0, 0, 0.2);
}
 
 #table{
 
 padding:0px;
 
 }
 
  </style>
 
  <script>
  function sub(x,y,z,w)
  {
	  var f=document.loginForm;
	    f.method="post";
	    f.action='archive_exec?s='+x+'&l='+y+'&r='+z+'&m='+w;
	    f.submit();
  	}
  </script>
  <script>
  function update()
  {
	  
	  var f=document.loginForm;
	    f.method="post";
	    f.action='update_view';
	    f.submit(); 
	 // document.loginForm.action = "update_view";
  	 // document.loginForm.submit();   
  // document.Form1.target = "_blank";    // Open in a new window
  //document.loginForm.submit(); 
	  
  }
  
  </script>
  <script>
  function call_fun(name,a,b,c,d,e,g)
  {
	 var f=document.loginForm;
	    f.method="post";
	    f.action='date_update?name='+name+'&sequence_no='+a+'&plan_start='+b+'&plan_end='+c+'&actual_start='+d+'&actual_hrs='+g+'&plan_hrs='+e;
	    f.submit();  
  }
  </script>
  
<script>
function remove(x)
{
	var f=document.loginForm;
    f.method="post";
    f.action='remove?s='+x;
    f.submit();
}
</script>


<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed ArchiveSummary JSP PAGE-----[INFO]");  %>
<%@ page import="java.sql.*"%>
		<%@ page import="javax.sql.*"%>
		<%
		HttpSession details=request.getSession();
		String Project_Name=(String)details.getAttribute("nameofproject");
		%>
		
<form class="form-signin" name="loginForm" method="post" action="archive_exec">
	
        <div class="main-wrapper">
        
            <!-- ========== TOP NAVBAR ========== -->
            <nav class="navbar top-navbar bg-white box-shadow">
            	<div class="container-fluid">
                    <div class="row">
                        <div class="navbar-header no-padding">
                			<a class="navbar-brand" href="project.jsp" id="sitetitle">
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
                        <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">Onboarding Tool-<%=Project_Name %></a>

                		<div class="collapse navbar-collapse" id="navbar-collapse-1">
                			
                            <!-- /.nav navbar-nav -->
 					<ul class="nav navbar-nav navbar-right">
      
						<li><a href="Logout" class=" text-center"><i class="fa fa-sign-out"></i> Logout</a>
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
                                    <li class="has-children" id="myDIV">
                                        <a href=""><i class="fa fa-map-signs"></i> <span>Archive Execution Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="Archive_Execution.jsp" > <span>Archive Execution</span></a></li>
                                            <li class="but11" style="padding-right: 0px;"><a href="archivesummary.jsp" > <span class="activ-pro">Archive summary</span></a></li>

                                        </ul>
                                    </li>
                                    <%--   <li class="nav-header">
                                           <a href='RoleUIDashboard.jsp'><span class="">Report Module</span></a>
                                       </li>--%>
                                    <li class="has-children">
                                        <a href=""><i class="fa fa-paint-brush"></i> <span>Report Module</span> <i class="fa fa-angle-right arrow"></i></a>
                                        <ul class="child-nav">
                                            <li><a href="RoleUIDashboard.jsp" > <span>Reports Dashboard</span></a></li>
                                            <li><a href="RoleDashboard.jsp" > <span>Role Dashboard</span></a></li>
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



                    <!-- Projects List Start -->

                    <div class="main-page">
                      
                        <section>

                                <div class="row">
                                    <div class="col-md-12">
            <div class="container-fluid">
<%

String det=(String)session.getAttribute("theName");
Class.forName("com.mysql.jdbc.Driver"); 
java.sql.Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool","root","password123"); 

String query = "select * from AppEmphazize_ProjectDetails where id = "+det;
Statement st = conn.createStatement();
ResultSet rs = st.executeQuery(query);
String query9 = "select * from AppEmphazize_ProjectDetails where id = "+det;
Statement st9 = conn.createStatement();
ResultSet rs9 = st9.executeQuery(query9);
String query4 = "select * from dummy";
Statement st4 = conn.createStatement();
ResultSet rs4 = st4.executeQuery(query4);
if(rs9.next()){
}
String query3 = "select * from ArchiveExecution_Details where projects='"+rs9.getString("projectname")+"' order by seq_num";
Statement st3 = conn.createStatement();
ResultSet rs3 = st3.executeQuery(query3);
//System.out.println(rs9.getString("projectname"));
String query5 = "select * from ArchiveExecution_Details where projects='"+rs9.getString("projectname")+"' order by seq_num";
Statement st5 = conn.createStatement();
ResultSet rs5 = st5.executeQuery(query5);

String query7 = "select * from AppEmphazize_ProjectDetails where id = "+det;
Statement st7 = conn.createStatement();
ResultSet rs7 = st7.executeQuery(query7);

if(rs4.next()){
	%>
	 <% if(rs.next()){ %>
                		                     <input type="text" id="project_name" name="project_name" value="<%=rs.getString("projectname")%>" style="display:none;">                              
                    <%
                    String q2="select * from ArchiveExecution_Details where level=1 and projects='"+rs.getString("projectname")+"'order by seq_num";
                    Statement s2 = conn.createStatement();
                    ResultSet rss = s2.executeQuery(q2);
                    while(rss.next())
                    {
                    	session.setAttribute(rss.getString(3),rss.getString(15));
                    	session.setAttribute((rss.getString(3)+"1"),rss.getString(1));
                    }
                    
                    %>
     

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
 
                     <script>
                     $(function(){
                    	    $.contextMenu({
                    	        selector: '.context-menu-one', 
                    	        items: $.contextMenu.fromMenu($('#html5menu'))
                    	    });
                    	});
                     </script>
                  <script>
               function toenable()
               {
            	   
            	   document.getElementsByName("addbtn")['0'].disabled=false;
               	   document.getElementsByName("subbtn")['0'].disabled=false;
            	   for(var i=0;i<60;i++){
            	  document.getElementsByName("name"+i)['0'].disabled=false;
            	  document.getElementsByName("mem_ass"+i)['0'].disabled=false;
        		  document.getElementsByName("act_srt_date"+i)['0'].disabled=false;
        		  document.getElementsByName("act_end_date"+i)['0'].disabled=false;
        		  document.getElementsByName("pln_srt_date"+i)['0'].disabled=false;
        		  document.getElementsByName("pln_end_date"+i)['0'].disabled=false;
        		  document.getElementsByName("hrs"+i)['0'].disabled=false;
            	   }
            	  
            	   
            	  
               }
                  </script>
                  
                  <%
String initiate=(String)session.getAttribute("Ideation and Initiate");
String plan=(String)session.getAttribute("Plan");
String execute=(String)session.getAttribute("Execute");
String hypercare=(String)session.getAttribute("Closure");
String initiate_seqno=(String)session.getAttribute("Ideation and Initiate1");
String plan_seqno=(String)session.getAttribute("Plan1");
String execute_seqno=(String)session.getAttribute("Execute1");
String hypercare_seqno=(String)session.getAttribute("Closure1");
if(initiate == null)
	initiate="0";
if(plan == null)
	plan="0";
if(execute == null)
	execute="0";
if(hypercare == null)
	hypercare="0";
//System.out.println(plan);
%>                            

<div class="row">

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Initiate</label></center>
  <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar" style="width: <%=initiate%>%" aria-valuenow="<%=initiate %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=initiate %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Plan</label></center>
  <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar1" style="width: <%=plan%>%" aria-valuenow="<%=plan%>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=plan %>%</span></div>
</div></div></div>

  <div class="col-md-3">
  <div class="form-group">
  <center><label >Execute</label></center>
  <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar" id="prog_bar2" style="width: <%=execute %>%" aria-valuenow="<%=execute %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=execute %>%</span></div>
</div></div></div>

 <div class="col-md-3">
 <div class="form-group">
 <center><label >Closure</label></center>
 <div class="progress">
  <div class="progress-bar progress-bar-success progress-bar-stripedss-bar" role="progressbar" id="prog_bar3" style="width: <%=hypercare %>%" aria-valuenow="<%=hypercare %>" aria-valuemin="0" aria-valuemax="100"><span style="color:black;"><%=hypercare %>%</span></div>
</div></div></div>
</div>
<jsp:include page="progress_details.jsp" >
<jsp:param name="Initiate" value="<%=initiate %>"/>
<jsp:param name="Plan" value="<%=plan %>"/>
<jsp:param name="Execute" value="<%=execute %>"/>
<jsp:param name="Hypercare" value="<%=hypercare %>"/>
</jsp:include>
                  
              
<h3 align="center">Archive Execution</h3>
<a href="archive_exec_samp.jsp" class="btn btn-primary" class="btn pull-right">Edit</a>
<button id="pdf-button" type="button"  class="btn btn-primary" value="Download PDF" onclick="downloadPDF()" />Export PDF</button>
   
<div class="container-fluid" id="table">
<div class="tab" style="width: 100%;
    height: 65vh;
    overflow: scroll;">
<table class="table table-bordered" style="float:left" >
<thead style="background-color: #9dd2ff;">
<tr>
<th>Tasks </th> 
<th>Resource Assigned</th>
<th>Plan start date</th>
<th>Plan End date</th>
<th>Actual start date</th>
<th>Actual End date</th>
<th>Planned Hours</th>
<th>Actual Hours</th>
<th>Progress %</th>
<th style="width:15px;">Status</th>
<th>Comments</th>
<th>Action</th>

</tr>
</thead>
<tbody>      
<%
 int i=0,count=0;
while(rs3.next()){
	if(Integer.parseInt(rs3.getString(2))==1)
	{
	%>
<tr style="" data-tt-id="<%=rs3.getString(10) %>">
<td>
<b>
	<span style="color:#3071a9;font-size:150%;">
		<input type="text" placeholder="enter" id="task" name="name<%=i %>" value="<%=rs3.getString(3) %>" readonly />
	</span> 
	<span style="float:right;cursor:pointer;" onclick="sub('<%=rs3.getString(1) %>','<%= (Integer.parseInt(rs3.getString(2))+1) %>','<%=rs4.getString(1) %>','<%=rs3.getString(10) %>')">
	</span>
</b>
</td>

<td><input type="text" class="in" placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(4) %>" /></td>
<td id="basicExample"><input type="text" class="in date start" id="pln_srt_date<%=i %>" name="pln_srt_date<%=i %>" value="<%=rs3.getString(7) %>" onChange="pass('<%=rs3.getString(3)%>',this.value,'<%=i %>')"  readonly/></td>
<td id="basicExample"><input type="text" class="in date start" id="pln_end_date<%=i %>" name="pln_end_date<%=i %>" value="<%=rs3.getString(8) %>" /></td>
<td id="basicExample"><input type="text" class="in date start" id="act_srt_date<%=i %>" name="act_srt_date<%=i %>" value="<%=rs3.getString(5) %>" /></td>
<td id="basicExample"><input type="text" class="in date start" id="act_end_date<%=i %>" name="act_end_date<%=i %>" value="<%=rs3.getString(6) %>"  /></td>
<td id="basicExample"><input type="text" class="in date start"  id="phours<%=i %>" name="phrs<%=i %>" value="<%=rs3.getString(13) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)" /></td>
<td id="basicExample"><input type="text" class="in date start"  id="hours<%=i %>" name="hrs<%=i %>" value="<%=rs3.getString(9) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value)"/></td>
<td><div class="progressbar" id="progressbar<%=i%>"></div></td>
<td><input type="text" style="width:50px"; id="status<%=i %>"  /></td>
<td></td>
<td><i class="fa fa-plus"></i>  <i class="fa fa-edit"></i>  <i class="fa fa-trash"></i></td>
<td style="display:none"><input type="text" name="seqnum<%=i %>" value="<%=rs3.getString(1) %>" hidden /></td>
<script>
getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value);
</script>

</tr>
<%}
	else
	{%>

		<tr style="" data-tt-id="<%=rs3.getString(10) %>" data-tt-parent-id="<%=rs3.getString(11) %>">
		&nbsp;&nbsp;
		<td>
		<span style="color:#00BFFF;font-size:100%;">
			<input  type="text" placeholder="enter" id="name<%=i %>" style="padding-left:15px; width:230px;" name="name<%=i %>" value="<%=rs3.getString(3) %>" readonly/>
		</span>
		<span style="float:right;cursor:pointer;" onclick="sub('<%=rs3.getString(1) %>','<%= (Integer.parseInt(rs3.getString(2))+1) %>','<%=rs4.getString(1) %>','<%=rs3.getString(10) %>')">
		</span> 
		</td>
		
<td><input  type="text" class="in" placeholder="enter" name="mem_ass<%=i %>" value="<%=rs3.getString(4) %>" /></td>
<td id="basicExample"><input  type="text" class="in date start" id="pln_srt_date<%=i %>" name="pln_srt_date<%=i %>" value="<%=rs3.getString(7) %>"  /></td>
<td id="basicExample"><input  type="text" class="in date start" id="pln_end_date<%=i %>" name="pln_end_date<%=i %>" value="<%=rs3.getString(8) %>"  /></td>
<td id="basicExample"><input type="text" class="in date start" id="act_srt_date<%=i %>" name="act_srt_date<%=i %>" value="<%=rs3.getString(5) %>"  /></td>
<td id="basicExample"><input  type="text" class="in date start" id="act_end_date<%=i %>" name="act_end_date<%=i %>" value="<%=rs3.getString(6) %>"  /></td>
<td id="basicExample"><input  type="text" class="in date start"  id="phours<%=i %>" name="phrs<%=i %>" value="<%=rs3.getString(13)%>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value);call_fun(document.getElementById('name<%=i %>').value,document.getElementById('seqnum<%=i %>').value,document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('phours<%=i %>').value,document.getElementById('hours<%=i %>').value);""/></td>
<td id="basicExample"><input  type="text" class="in date start" id="hours<%=i %>" name="hrs<%=i %>" value="<%=rs3.getString(9) %>" onclick="getID('<%=rs3.getInt(2) %>',document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('status<%=i %>'),document.getElementById('phours<%=i %>'),document.getElementById('hours<%=i %>'),document.getElementById('progressbar<%=i %>'),document.getElementById('act_end_date<%=i %>').value);call_fun(document.getElementById('name<%=i %>').value,document.getElementById('seqnum<%=i %>').value,document.getElementById('pln_srt_date<%=i %>').value,document.getElementById('pln_end_date<%=i %>').value,document.getElementById('act_srt_date<%=i %>').value,document.getElementById('phours<%=i %>').value,document.getElementById('hours<%=i %>').value);" /></td>
<td ><div class="progressbar" id="progressbar<%=i%>" style="display:none;"></div></td>
<td ><input type="text" style="background-color:transparent;display:none;width:20%;" id="status<%=i %>"  /></td>
<td></td>
<td><i class="fa fa-plus"></i>  <i class="fa fa-edit"></i>  <i class="fa fa-trash"></i></td>
<td style="display:none"><input type="text" id="seqnum<%=i %>" name="seqnum<%=i %>" value="<%=rs3.getString(1) %>" hidden /></td>

</tr>
<%
	}
i++;
}
%>




</tbody>

</table>
</div>
</div>
   <script type="text/javascript">
		com_github_culmat_jsTreeTable.register(this)

		treeTable($('#table'))
	</script>       
<div>
<%if(rs7.next()){ %>
    <input type="hidden" class="form-control" id="formInput198" placeholder="Application Name" name="prjname" value="<%=rs7.getString("projectname") %>" >
<%} %>

</div>
</div>

                                              </div>                             
                        </div>    
                        
                                  
       <%
	 }

}
%>
</form>

				    </div>
                                    <!-- /.col-md-6 -->
							</div>
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
            

 <script>
    var downloadPDF = function() {
   
      DocRaptor.createAndDownloadDoc("YOUR_API_KEY_HERE", {
        test: true, // test documents are free, but watermarked
        type: "pdf",
        document_content: document.querySelector('html').innerHTML,
       
        
        // use this page's HTML
        // document_content: "<h1>Hello world!</h1>",               // or supply HTML directly
        // document_url: "http://example.com/your-page",            // or use a URL
        // javascript: true,                                        // enable JavaScript processing
        // prince_options: {
        //   media: "screen",                                       // use screen styles instead of print styles
        // }
        
        
        
        
        
      })
    };
    
   
  </script>

<script>
window.DocRaptor = {
  // Creates an HTML form with doc_attrs set, submits it. If successful
  // this will force the browser to download a file. On failure it shows
  // the DocRaptor error directly.
  createAndDownloadDoc: function(api_key, doc_attrs) {
    var makeFormElement = function(name, value) {
      var element = document.createElement("textarea")
      element.name = name
      element.value = value
      return element
    }

    var form = document.createElement("form")
    form.action = "https://docraptor.com/docs"
    form.method = "post"
    form.style.display = "none"

    form.appendChild(makeFormElement("user_credentials", api_key))

    for (var key in doc_attrs) {
      if (key == "prince_options") {
        for (var option in doc_attrs.prince_options) {
          form.appendChild(makeFormElement("doc[prince_options][" + option + "]", doc_attrs.prince_options[option]))
        }
      } else {
        form.appendChild(makeFormElement("doc[" + key + "]", doc_attrs[key]))
      }
    }

    document.body.appendChild(form);
    form.submit()
  }
}

</script>

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
   
  </body>

</html>

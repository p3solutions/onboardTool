<!DOCTYPE html>
<html lang="en">
<head>
<script type='text/javascript'
  src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

<link rel="stylesheet" href="css/style.min.css">

<script type="text/javascript" src="js_in_pages/tree.js"></script>
<script type="text/javascript" src="js_in_pages/newapplication.js"></script>

  <link rel="stylesheet" href="js_in_pages/newapplication.css" type="text/css" />
 
    <link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />

    <script type="text/javascript" src="scripts/demos.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxbuttons.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxscrollbar.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxpanel.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxtree.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcheckbox.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxmenu.js"></script>

  </head><!--from  w  w w  . ja  va 2 s.co  m-->
  <body>
  <%@ page import="java.text.SimpleDateFormat"%>
		<%@ page import="java.util.Date"%>
		<%
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed newapplications JSP PAGE-----[INFO]");  %>
  <%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%

response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.

if (session.getAttribute("username")==null)
{
response.sendRedirect("Login.jsp");
}
%>
<%

String det=(String)session.getAttribute("theName");
DBconnection d=new DBconnection();
Connection con = (Connection)d.getConnection();
String query3 = "select * from AppEmphazize_ProjectDetails where id = "+det;
Statement st3 = con.createStatement();
ResultSet rs3 = st3.executeQuery(query3);






%>

<form class="form-signin"name="loginForm" method="post" action="Appin">
<div class="container">
<nav class=" navbar-fixed-top" style="background-color:#3276B1">
            <div class="container-fluid">
                
                 <%if (rs3.next()) {%>
                    
                     <a class="navbar-brand" style="color:white"id="sitetitle">Onboarding Tool-<%=rs3.getString("projectname") %></a>
              
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                        <img src="assets/images/logo1.png" id="image" class="img-rounded" height="50" width="80" alt="Platform3Solutions" />&nbsp;
</li>
                       <li style="background:#3276B1">
   <a href="Logout" style="color:white; background:#3276B1">Logout</a>
</li>
                    </ul>
                    
                </div>
            </div>
        </nav>
        </div>
       
            <div class="row">
            <br>
                <div class="col-md-3 sidebar">
                    <div id='jqxWidget'>  <div id='jqxTree' style='visibility: hidden;  padding-top:30px;   float:right; '>
                    <ul class="nav nav-sidebar" id ="sidemenu" >
                        

            <ul>
                <li id='home' item-selected='true'> <a href="Project_List.jsp"><i class="fa fa-home"></i>&nbsp;Home </a></li>
                <li item-expanded='true'>App Emphasize Module
                    <ul>
                       <li item-expanded='true'>Project Details
                    <ul>
                        <li><a href="AppEmphasize_EditProject.jsp">Project Information</a></li>
                        <li><a href="AppEmphasize_Application.jsp">Application Details</a></li>
                        </ul>
                        </li>
                        <li item-expanded='true'> <a href="AppEmphasize_CostCalculation.jsp">Application Prioritization</a>
                         <ul>
                                <li id="xxx">Parameters</li>
                                <li id="xxz">Archival Complexity Calculation</li>
                                <li id="xxy">Archival Cost Estimate</li>
                                
                            </ul>
                        </li>
                        <li><a href="AppEmphasize_PrioritizedApplications.jsp">Application-Prioritized</li>
                        
                       <li> <a href="demo.jsp">ROI Calculation</a></li>
                        <li>Estimates</li>

                    </ul>
                </li>
                <li item-expanded='true'><a href='Applications.jsp'>Intake Module</a>
                <ul>
                <li item-expanded='true'><a href="Intake_Business.jsp">Business</a>
                <ul>
                <li>Application Information</li>
                <li>Legacy Retention Information</li>
                <li>Archive Data Management</li>
                <li>System Requirements</li>
                
                </ul></li>
                <li item-expanded='true'><a href="component.jsp">Technical</a>
                <ul>
                <li>Application Data Information</li>
                <li>Infrastructure & Environment Inforamation</li>
                <li>Technical Information</li>
                </ul>
                </li>
                
                 <li item-expanded='true'><a href="Intake_ArchiveRequirements.jsp">Archival Requirements</a>
                 <ul>
                 <li>Screen/Report Requirements</li>
                 <li>Archive Requirements</li>
                 </ul>
                 </li>
                </ul>
                </li>
                
               
                          </ul>
    
     </ul>
         </div>
   </div>
                </div>

 
        
                <div class="col-md-9">
                    <h1 class="page-header">Intake</h1>
                    <h3>Application Details</h3>
<div class="panel-group" id="panels1"> 
                        <div class="panel panel-default"> 
                            <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a data-toggle="collapse" data-parent="#panels1" href="#collapse1">                           Application Information                            </a> </h4> 
                            </div>                             
                            <div id="collapse1" class="panel-collapse collapse"> 
                                <div class="panel-body text-left">
                               
                                         <div class="form-group"> 
                                            <label class="control-label" for="formInput198">
                                               Project Name&nbsp;
</label>
                                            <input type="text" class="form-control" id="formInput198" placeholder="Application Name" name="prjname" value="<%=rs3.getString("projectname") %>">
                                        </div>
 
                                   
                                        
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput198">
                                               Application Name&nbsp;
</label>
                                            <input type="text" class="form-control" id="formInput198" placeholder="Application Name" name="appname" >
                                        </div>
                                        
                                
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput229">Description
</label>
                                            <input type="text" class="form-control" id="formInput229" placeholder="Description" name="descr" >
                                        </div>
                                       
                                         <div class="form-group row log-date">
          <div class="col-md-12">
            <label class="control-label required">Read Only Date</label>
            <input placeholder="yyyy/mm/dd" id="date" name="rod" class="form-control ember-text-field zf-date-picker date-picker ember-view" type="text">
          </div>
          
        </div>  
         <div class="form-group"> 
                                            <label class="control-label" for="formInput229">Size of DB
</label>
                                            <input type="text" class="form-control" id="formInput229" placeholder="DB Size" name="dbsize" >
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput229">Location of DB
</label>
                                            <input type="text" class="form-control" id="formInput229" placeholder="Location of DB" name="dbloc" >
                                        </div>
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput229">Legacy Application SME
</label>
                                            <input type="text" class="form-control" id="formInput229" placeholder="Legacy Application SME" name="legappsme" >
                                        </div>
                                       
                       
                             
                                </div>                                 
                            </div>                             
                        </div>                         
                        <div class="panel panel-default"> 
                            <div class="panel-heading" style="background:#3276B1 ; color:white;"> 
                                <h4 class="panel-title"> <a class="collapsed" data-toggle="collapse" data-parent="#panels1" href="#collapse2">                 Additional Details</a> </h4> 
                            </div>                             
                            <div id="collapse2" class="panel-collapse collapse "> 
                                <div class="panel-body text-left">
                                   
                                        <div class="form-group"> 
                                            <label class="control-label" for="formInput253">Details</label>
                                            <input type="text" class="form-control" id="formInput253" placeholder="Details" name="users">
                                        </div>
                                       
                                          
                                        
                                     </div>   
                                     </div>  
                                     </div> 
                                                                           
                                                                    
                                                               
                            
                                                
                    </div>
                    
                    
        <button type="submit" class="btn btn-primary btn pull-left" >Save</button>&nbsp;
                    <button type="button" class="btn btn-default" >Back</button> 
       </div>
       <% } %>
              </form>    
            </div>
            
         <center>
      <nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="Project_List.jsp" tabindex="-1">Previous</a>
    </li>
    
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>
</center>



  </body>
</html>
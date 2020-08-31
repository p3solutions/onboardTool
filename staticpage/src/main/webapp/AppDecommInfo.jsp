<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>App-DecommRequirements</title>
    <meta name="description" content="Blueprint: View Mode Switch" />


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
    <link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>



</head>
<style type="text/css">
    .breadcrumb-div {
        background-color: #e7e7e7;
        color: #010101; }
    #button1{

        padding:20px;


    }

    #return-to-top {
        position: fixed;
        bottom: 20px;
        right: 20px;
        background: rgb(0, 0, 0);
        background: rgba(0, 0, 0, 0.7);
        width: 50px;
        height: 50px;
        display: block;
        text-decoration: none;
        -webkit-border-radius: 35px;
        -moz-border-radius: 35px;
        border-radius: 35px;
        display: none;
        -webkit-transition: all 0.3s linear;
        -moz-transition: all 0.3s ease;
        -ms-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }
    #return-to-top i {
        color: #fff;
        margin: 0;
        position: relative;
        left: 16px;
        top: 13px;
        font-size: 19px;
        -webkit-transition: all 0.3s ease;
        -moz-transition: all 0.3s ease;
        -ms-transition: all 0.3s ease;
        -o-transition: all 0.3s ease;
        transition: all 0.3s ease;
    }
    #return-to-top:hover {
        background: rgba(0, 0, 0, 0.9);
    }
    #return-to-top:hover i {
        color: #fff;
        top: 5px;
    }
</style>

<body class="top-navbar-fixed">

<div class="main-wrapper">

<%@ page import="java.text.SimpleDateFormat"%>
    <%@ page import="java.util.Date"%>
    <%
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed AppDecommInfo JSP PAGE-----[INFO]");  %>
    <%@page language="java"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.text.DateFormat" %>
    <%@page import="java.text.SimpleDateFormat" %>
    <%@page import="java.util.Date" %>
    <%@page import="java.util.Calendar" %>
    <%
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
        response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
        response.setHeader("Expires", "0"); // Proxies.

        if (session.getAttribute("username")==null)
        {
            response.sendRedirect("Login.jsp");

        }
        else{
            String name=(String)session.getAttribute("ID");
            String Opportunityname=(String)session.getAttribute("SelectedOpportunity");
            HttpSession details=request.getSession();
            Connection con = null;
            String url = "jdbc:mysql://localhost:3306/";
            String db = "Onboarding";
            String driver = "com.mysql.jdbc.Driver";
            String userName ="root";
            String password="password123";
            session.setAttribute("theName", name);
            String roles=(String)details.getAttribute("role");
            int sumcount=0;
            Statement st,st2;
            try{
                Class.forName(driver).newInstance();
                con = DriverManager.getConnection(url+db,userName,password);
                Statement st1;


             //   String query1 = "select * from AppEmphazize_ProjectDetails where id = "+name;
             //   st1 = con.createStatement();
             //   ResultSet rs = st1.executeQuery(query1);
              //  if(rs.next())
               // {
                	 %>
                	 
    <!-- ========== TOP NAVBAR ========== -->
    <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
            
            	<%
                  //      details.setAttribute("nameofproject",rs.getString("projectname"));
                %>
            
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
                <a class="navbar-brand" href="Project_List" id="sitetitle"></a>

                <div class="collapse navbar-collapse" id="navbar-collapse-1">

                    <!-- /.nav navbar-nav -->
                    <ul class="nav navbar-nav navbar-right">
					<a class="navbar-brand" href="Project_List.jsp" id="sitetitle1">OPPORTUNITY NAME -<%= Opportunityname %></a>
                   <%
                            String uname=(String)details.getAttribute("username");
                            String role=(String)details.getAttribute("role");
                            %>
                    
                        <li><a href="#"><span id="nav_userid">&nbsp;</span>logged in as &nbsp;<span id='nav_role'></span></a></li>
                        <li><a href="Logout" class="text-center"><i class="fa fa-sign-out"></i> Logout</a>
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
                            <li class="has-children ">
                                <a href=""><i class="fa fa-archive"></i> <span>Plan and pirority</span> <i class="fa fa-angle-right arrow"></i></a>
                                <ul class="child-nav"  id="myDIV">
                                    <li class="btn"><a href="AppEmphasize_EditProject.jsp" > <span  class="activ-pro">Project Information</span></a></li>
                                    <li ><a href="AppEmphasize_Application.jsp" > <span>Application Information</span></a></li>
                                    <li ><a href="AppEmphasize_CostCalculation.jsp" > <span>Application Complexity</span></a></li>
                                    <li ><a href="AppEmphasize_PrioritizedApplications.jsp"> <span>Prioritized Applications</span></a></li>
                                    <li ><a href="AppEmphasize_Preview.jsp"> <span>Review Page</span></a></li>
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
                                    <li><a href="Applications.jsp" > <span>Archive Requirements</span></a></li>
                                    <li><a href="Decomm_Requirements_Applications.jsp" > <span>Decomm Requirements</span></a></li>
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

            <div class="main-page">
                <div class="container-fluid">

                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h2 class="title">Decomm Requirements</h2>
                        </div>
                    </div>
                    <!-- /.row -->
                    <div class="row breadcrumb-div">
                        <div class="col-sm-6">
                            <ul class="breadcrumb">
                                <li><a href="Project_List.jsp"><i class="fa fa-home"></i>Home</a></li>

                            </ul>
                        </div>



                    </div>
                    <!-- /.row -->
                </div>
                <section>
                    <a href="javascript:" id="return-to-top"><i class="icon-chevron-up"></i></a>
                    <br>

                    <div class="row">

                        <div class="container">

                            <div class="panel-group" id="panels1">

                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h4 class="panel-title"> <a  data-parent="#panels1" > App Decomm Info  </a> </h4>
                                    </div>
                                    <form name="Decomm_Intake_Requirements">
                                        <div id="collapse2" class="panel-collapse">
                                            <div class="panel-body text-left">
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"> Opportunity Name</label>
                                                    <input type="text" class="form-control" id="app_name" placeholder="Opportunity Name" name="appname" readonly >
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"><div class="required_fie"> Legacy Application Name</div></label>
                                                    <input type="text" class="form-control" id="legacyappname" placeholder="Legacy Application Name" name="legacyappname" required >
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"> Enterprise Team Decomm Project Number</label>
                                                    <input type="text" class="form-control" id="projectnumber" placeholder="Project Number" name="projectnumber" >
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"><div class="required_fie"> Application Identification Number</div></label>
                                                    <input type="text" class="form-control" id="ain" placeholder="Tracking ID/Unique Application Id from Service Now or any relevant source" name="ain" >
                                                </div>

                                                <!--End of Table Info -->
                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"> Infrastructure Project Number</label>
                                                    <input type="text" class="form-control" id="infraprojectnumber" placeholder="Infrastructure Project Number" name="infraprojectnumber" >
                                                </div>

                                                <!--End of Table Info -->

                                                <div class="form-group">
                                                    <label class="control-label" for="formInput664"><div class="required_fie">Read Only Date</div></label>
                                                    <input placeholder="mm/dd/yyyy" type="text" class="form-control ember-text-field zf-date-picker date-picker ember-view date start" id="RO_DATE"  name="read_date" onChange="updatesum()" readonly>
                                                </div>

                                                <!-- Table Info -->

                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"><div class="required_fie"> Business Unit and Geographic Location Code(For decommission Project to charge back)</div></label>
                                                    <div class="table-responsive" id="table-scroll">

                                                        <table class="table table-bordered">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">Business Unit</th>
                                                                <th scope="col" style="color:white;">Operation Unit</th>
                                                                <th scope="col" style="color:white;">Location Unit</th>
                                                                <th scope="col" style="color:white;">Department</th>
                                                                <th scope="col" style="color:white;"></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody id ="business_unit_and_geographic_location">

                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary" onclick="addrow_bussiness();">Add</button>
                                                    </div>

                                                </div>


                                                <!-- Table Info -->

                                                <div class="form-group">
                                                    <label class="control-label" for="formInput198"><div class="required_fie"> Site Location of the Assets</div></label>
                                                    <div class="table-responsive">

                                                        <table class="table table-bordered">
                                                            <thead style="color:white;background-color:DodgerBlue;">
                                                            <tr >
                                                                <th scope="col" style="color:white;">Country</th>
                                                                <th scope="col" style="color:white;">City</th>
                                                                <th scope="col" style="color:white;">State</th>
                                                                <th scope="col" style="color:white;">Office Designation</th>
                                                                <th scope="col" style="color:white;"></th>

                                                            </tr>
                                                            </thead>
                                                            <tbody id="SiteLocation">
                                                            </tbody>
                                                        </table>
                                                        <button type="button" class="btn btn-primary" onclick="addrow_sitelocation();">Add</button>
                                                    </div>
                                                </div>


                                                <br>
                                                <br>
                                            </div>

                                        </div>
                                    </form>
                                    <button type="button" class="btn btn-primary pull-right" onclick="submit();">Save & Continue</button>







                                </div>

                            </div>

                        </div>
                    </div>

                </section>

           </div>

        </div>

		      <%

 //   }
%>

<%
        }
       catch(Exception e){
            e.printStackTrace();
        }
    }
%>


        <script>
            /*if(document.getElementById('Role_info').value=="R")
                checkk();*/
        </script>
        <script>
            var url_string=window.location.href;
            var url = new URL(url_string);
            var appname = url.searchParams.get("appname");
            var projname=url.searchParams.get("projectname");
            console.log("application name",appname,"project name ",projname);
            $('#app_name').val(appname);
            $(document).ready(function(){

                $.ajax({
                    url: "DecommIntakeFRequirementsDataRetrieveServlet",
                    type: 'POST',
                    data: {ApplicationName:appname,ProjectName: projname},
                    dataType: "json",
                    success: function (data) {
                        console.log("json object of array--->", data[0].CheckExistance);
                        var trid = $("#business_unit_and_geographic_location");
                        if (data[0].CheckExistance == false) {
                            var input_fields = "<tr id='Row_id0' name = 'Row0'><td><input type='text' id ='business_unit_0' class='BusinessUnit' name='BusinessUnit0'></td>\n" +
                                "<td><input type='text' id ='operation_unit_0' class='OperationUnit' name='OperationUnit0'></td>\n" +
                                "<td><input type='text' id ='location_unit_0' class='LocationUnit' name='LocationUnit0'></td>\n" +
                                "<td><input type='text' id ='department_0' class='Department' name='Department0'></td>\n" +
                                "<td> <img src='images/Delete.png' id='Delete0' name = 'Delete0' style='height:30px; width:30px;' onclick='SomeDeleteRowFunction(this.id);'></td>"+
                                "</tr>";
                            trid.append(input_fields);
                        } else {

                            for (var i = 1; i <= data.length-1; i++) {
                                var input_fields = "<tr id='Row_id"+(i-1)+"' name = 'Row"+(i-1)+"'><td><input type='text' id ='business_unit_" + (i - 1) + "' class='BusinessUnit' name='BusinessUnit" + (i - 1) + "' value='" + data[i].BusinessUnit + "'></td>\n" +
                                    "<td><input type='text' id ='operation_unit_" + (i - 1) + "' class='OperationUnit' name='OperationUnit" + (i - 1) + "' value='" + data[i].OperationUnit + "'></td>\n" +
                                    "<td><input type='text' id ='location_unit_" + (i - 1) + "' class='LocationUnit' name='LocationUnit" + (i - 1) + "' value='" + data[i].LocationUnit + "'></td>\n" +
                                    "<td><input type='text' id ='department_" + (i - 1) + "' class='Department' name='Department" + (i - 1) + "' value='" + data[i].Dept + "' ></td>\n" +
                                    "<td> <img src='images/Delete.png' id='Delete"+(i-1)+"'  name = 'Delete"+(i-1)+"' style='height:30px; width:30px;' onclick='SomeDeleteRowFunctionUnit(this.id);'></td>"+
                                    "</tr>";
                                trid.append(input_fields);
                                console.log("Testing", data[i].BusinessUnit);
                            }
                        }
                    }
                });

                $.ajax({
                    url: "DecommIntakeSiteRequirementsDataRetrieveServlet",
                    type: 'POST',
                    data: {ApplicationName:appname,ProjectName: projname},
                    dataType: "json",
                    success: function (data) {
                        console.log("json object of array1--->", data);
                        var trid1=$("#SiteLocation");
                        if(data[0].CheckExistance==false)
                        {
                            var input_fields1="<tr id='row_id0' name = 'row0'><td><input type='text' id ='Country_0' class='Country' name='Country0'></td>\n" +
                                "<td><input type='text' id ='City_0' class='City' name='City0'></td>\n" +
                                "<td><input type='text' id ='State_0' class='State' name='State0'></td>\n" +
                                "<td><input type='text' id ='office_designation0' class='office_designation' name='OfficeDesignation0'></td>\n" +
                                "<td> <img src='images/Delete.png' id='delete0' name = 'delete_0' style='height:30px; width:30px;' onclick='SomeDeleteRowFunction(this);'></td>"+
                                "</tr>";
                            trid1.append(input_fields1);
                        }
                        else {
                            for(var i=1;i<=data.length-1;i++)
                            {
                                var input_fields1='<tr id="row_id'+(i-1)+'" name = "row'+(i-1)+'"><td><input type="text" id ="country'+(i-1)+'" class="Country" name="Country'+(i-1)+'" value="'+data[i].Country+'"></td>'+
                                    '<td><input type="text" id ="City_'+(i-1)+'" class="City" name="City'+(i-1)+'" value="'+data[i].City+'"></td>'+
                                    '<td><input type="text" id ="State_'+(i-1)+'" class="State" name="State'+(i-1)+'" value="'+data[i].State+'"></td>'+
                                    '<td><input type="text" id ="office_designation'+((i-1))+'" class="OfficeDesignation" name="OfficeDesignation'+(i-1)+'" value="'+data[i].OfficeDesignation+'"></td>'+
                                    "<td> <img src='images/Delete.png' id='delete"+(i-1)+"' name = 'delete_"+(i-1)+"' style='height:30px; width:30px;' onclick='SomeDeleteRowFunction(this.id);'></td>"+
                                    '</tr>';
                                trid1.append(input_fields1);
                                console.log("Testing", data[i].Country);
                            }
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });

                $('#app_name').val(appname);
                $.ajax({
                    url: "DecommIntakeRequirementServlet",
                    type: 'POST',
                    data: {ApplicationName:appname,ProjectName: projname},
                    dataType: "json",
                    success: function (data) {
                        console.log("json object--->", data);
                        if(data.CheckExistance==false) {
                            $('#legacyappname').val("");
                            $('#projectnumber').val("");
                            $('#ain').val("");
                            $('#infraprojectnumber').val("");
                            $('#RO_DATE').val(data.Read_Only);
                        }
                        else{
                            $('#app_name').val(data.App_Name);
                            $('#legacyappname').val(data.Legacy_App_Name);
                            $('#projectnumber').val(data.Enterprise_Team_Decomm_Prj_No);
                            $('#ain').val(data.App_Identification_No);
                            $('#infraprojectnumber').val(data.Infra_Prj_No);
                            $('#RO_DATE').val(data.Read_Only);
                        }
                    },
                    error: function (e) {
                        console.log(e);
                    }
                });

            });

            function submit()
            {
                var url_string=window.location.href;
                var url = new URL(url_string);
                var appname = url.searchParams.get("appname");
                var projname=url.searchParams.get("projectname");
                var classlength=$('.BusinessUnit').length;
                var site_classlength=$('.Country').length;
                console.log("class length",classlength,projname);
                console.log("Site class length",site_classlength,projname);
                var f=document.Decomm_Intake_Requirements;
                f.method = "post";
                f.action="DecommIntakeRequirements_db_update?appnames="+appname+"&projectname="+projname+'&BULUClassLength='+classlength+'&SLAClassLength='+site_classlength;
                f.submit();
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

        <script type="text/javascript">
            $('.datepicker').datepicker({
                format: 'mm/dd/yyyy',
                startDate: '-3d'
            });
        </script>
        <script>


            $(window).scroll(function() {
                if ($(this).scrollTop() >= 50) {        // If page is scrolled more than 50px
                    $('#return-to-top').fadeIn(200);    // Fade in the arrow
                } else {
                    $('#return-to-top').fadeOut(200);   // Else fade out the arrow
                }
            });
            $('#return-to-top').click(function() {      // When arrow is clicked
                $('body,html').animate({
                    scrollTop : 0                       // Scroll to top of body
                }, 500);
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
                    inline: true,
                    sideBySide: true
                });
            });
        </script>

        <script>
            function SomeDeleteRowFunction(o) {
                var classlength = $('.Country').length;
                var id = parseInt(o.substring(o.lastIndexOf('e')+1,o.length));
                $('#row_id'+id).remove();
                for(var i=id+1;i<classlength;i++)
                {
                    $('#country'+i).removeAttr("name");
                    $('#country'+i).attr('name','Country'+(i-1));
                    $('input[name=Country'+(i-1)+']').removeAttr("id");
                    $('input[name=Country'+(i-1)+']').attr('id','country'+(i-1));
                    $('#City_'+i).removeAttr("name");
                    $('#City_'+i).attr('name','City'+(i-1));
                    $('input[name=City'+(i-1)+']').removeAttr("id");
                    $('input[name=City'+(i-1)+']').attr('id','City_'+(i-1));
                    $('#State_'+i).removeAttr("name");
                    $('#State_'+i).attr('name','State'+(i-1));
                    $('input[name=State'+(i-1)+']').removeAttr("id");
                    $('input[name=State'+(i-1)+']').attr('id','State_'+(i-1));
                    $('#office_designation'+i).removeAttr("name");
                    $('#office_designation'+i).attr('name','OfficeDesignation'+(i-1));
                    $('input[name=OfficeDesignation'+(i-1)+']').removeAttr("id");
                    $('input[name=OfficeDesignation'+(i-1)+']').attr('id','office_designation'+(i-1));
                    $('#delete'+i).removeAttr("name");
                    $('#delete'+i).attr('name','delete_'+(i-1));
                    $('img[name=delete_'+(i-1)+']').removeAttr("id");
                    $('img[name=delete_'+(i-1)+']').attr('id','delete'+(i-1));
                    $('#row_id'+i).removeAttr("name");
                    $('#row_id'+i).attr('name','row'+(i-1));
                    $('tr[name=row'+(i-1)+']').removeAttr("id");
                    $('tr[name=row'+(i-1)+']').attr('id','row_id'+(i-1));
                }
            }
        </script>

        <script>
            function SomeDeleteRowFunctionUnit(o) {
                var classlength = $('.BusinessUnit').length;
                var id = parseInt(o.substring(o.lastIndexOf('e')+1,o.length));
                $('#Row_id'+id).remove();
                for(var i=id+1;i<classlength;i++)
                {
                    $('#business_unit_'+i).removeAttr("name");
                    $('#business_unit_'+i).attr('name','BusinessUnit'+(i-1));
                    $('input[name=BusinessUnit'+(i-1)+']').removeAttr("id");
                    $('input[name=BusinessUnit'+(i-1)+']').attr('id','business_unit_'+(i-1));
                    $('#operation_unit_'+i).removeAttr("name");
                    $('#operation_unit_'+i).attr('name','OperationUnit'+(i-1));
                    $('input[name=OperationUnit'+(i-1)+']').removeAttr("id");
                    $('input[name=OperationUnit'+(i-1)+']').attr('id','operation_unit_'+(i-1));
                    $('#location_unit_'+i).removeAttr("name");
                    $('#location_unit_'+i).attr('name','LocationUnit'+(i-1));
                    $('input[name=LocationUnit'+(i-1)+']').removeAttr("id");
                    $('input[name=LocationUnit'+(i-1)+']').attr('id','location_unit_'+(i-1));
                    $('#department_'+i).removeAttr("name");
                    $('#department_'+i).attr('name','Department'+(i-1));
                    $('input[name=Department'+(i-1)+']').removeAttr("id");
                    $('input[name=Department'+(i-1)+']').attr('id','department_'+(i-1));
                    $('#Delete'+i).removeAttr("name");
                    $('#Delete'+i).attr('name','Delete'+(i-1));
                    $('img[name=Delete'+(i-1)+']').removeAttr("id");
                    $('img[name=Delete'+(i-1)+']').attr('id','Delete'+(i-1));
                    $('#Row_id'+i).removeAttr("name");
                    $('#Row_id'+i).attr('name','Row'+(i-1));
                    $('tr[name=Row'+(i-1)+']').removeAttr("id");
                    $('tr[name=Row'+(i-1)+']').attr('id','Row_id'+(i-1));
                }
            }
        </script>

        <script>
            function addrow_sitelocation()
            {

                var rowlength=$('.Country').length;

                var i=rowlength;
                var element='<tr><td><input type="text" id ="country'+i+'" class="Country" name="Country'+i+'" value=""></td>'+
                    '<td><input type="text" id ="city'+i+'" class="City" name="City'+i+'" value=""></td>'+
                    '<td><input type="text" id ="state'+i+'" class="State" name="State'+i+'" value=""></td>'+
                    '<td><input type="text" id ="office_designation'+i+'" class="OfficeDesignation" name="OfficeDesignation'+i+'" value=""></td>'+
                    "<td> <img src='images/Delete.png' id='delete'"+i+"' style='height:30px; width:30px;' onclick='SomeDeleteRowFunction(this);'></td>"+
                    '</tr>';
                $('#SiteLocation').append(element);

            }

            function addrow_bussiness()
            {

                var rowlength=$('.BusinessUnit').length;

                var i=rowlength;
                var element="<tr><td><input type='text' id ='business_unit_"+i+"' class='BusinessUnit' name='BusinessUnit"+i+"' value=''></td>\n"+
                    "<td><input type='text' id ='operation_unit_"+i+"' class='OperationUnit' name='OperationUnit"+i+"' value=''></td>\n"+
                    "<td><input type='text' id ='location_unit_"+i+"' class='LocationUnit' name='LocationUnit"+i+"' value=''></td>\n"+
                    "<td><input type='text' id ='department_"+i+"' class='Department' name='Department"+i+"' value='' ></td>\n"+
                    "<td> <img src='images/Delete.png' id='delete'"+i+"' style='height:30px; width:30px;' onclick='SomeDeleteRowFunction(this);'></td>"+
                    "</tr>";
                $('#business_unit_and_geographic_location').append(element);

            }
        </script>

</body>

</html>

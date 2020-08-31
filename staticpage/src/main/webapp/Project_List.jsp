<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Project List</title>
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
    <script type="text/javascript" src="js_in_pages/project.js"></script>

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <style type="text/css">
        body{
            background:#f5f5f5;
        }

        .page-title-div{
            background:#f5f5f5;
        }

        .cbp-vm-view-grid ul li {
            width: 30%;
            padding: 3%;
            margin: 10px;
            display: inline-block;
            min-height: 220px;
            background-color:#fff;
            box-shadow: 5px 5px 10px 12px #dbdbdb;
            transition: all 0.4s;
            float: left;
        }

        .cbp-vm-title{
            color:DodgerBlue;
            font-family: Proxima Nova,'Source Sans Pro',Helvetica,Arial,sans-serif;

        }
        .cbp-vm-view-grid .cbp-vm-title {
            font-size: 1.4em ;
            padding-bottom: 17px;

        }

        .cbp-vm-view-list .right-col {
            float: left;
            width: 25%;
        }
        .cbp-vm-view-list .cbp-vm-title {
            font-size: 1.3em;
            padding: 0 30px;
            white-space: normal;
            width: 25%;
        }
        .cbp-vm-view-list .center-col {
            float: left;
            width: 20%;
            margin-right: 51px;
        }
        .cbp-vm-view-list .center-col {
            float: left;
            width: 20%;
            margin-right: 51px;
        }
        .cbp-vm-view-list li {
            padding: 12px 0;
            white-space: nowrap;
            background-color: #fff;
            box-shadow: 5px 5px  #dbdbdb;
            margin:13px;
        }


        .cbp-vm-view-list li:focus {
            display: block;
            border:2px solid red;
        }
        .progress{

            margin-top:5px;
        }

         .cologen{
             color: #1c95f8 !important;
         }


    </style>

</head>
<body class="top-navbar-fixed">
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    System.out.println("[INFO]-----"+formatter.format(date1)+"-----Accessed Project_List JSP PAGE-----[INFO]"); %>
<%@page language="java"%>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.*"%>
<%@ page import="onboard.DBconnection" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("username")==null){
        response.sendRedirect("Login.jsp");
    }
%>
<%
    HttpSession role_ses=request.getSession();
    String frole=(String)role_ses.getAttribute("role");
    int sumcount=0;
    Statement st,st1;
    try{
        String query;
        HttpSession details=request.getSession();
        String Projets=(String)details.getAttribute("projects");
        System.out.println("projects-------------"+Projets);
        String roles=(String)details.getAttribute("role");
        DBconnection d=new DBconnection();
        Connection con = (Connection)d.getConnection();
        String visit_query="select * from visits";
        Statement visit_st = con.createStatement();
        ResultSet visit_rs = visit_st.executeQuery(visit_query);
        int flag=1,knt=0;
        Date date = new Date();
        SimpleDateFormat ft,ft1;
        String username=(String)details.getAttribute("u_Name");

        ft=new SimpleDateFormat ("yyyy-MM-dd");
        ft1=new SimpleDateFormat ("hh:mm:ss");
        String strDate=ft.format(date);
        String strTime=ft1.format(date);
        while(visit_rs.next())
        {
            if(visit_rs.getString(6)!=null)
            {
                if(visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Logged in"))
                {
                    Statement stmtt = con.createStatement();
                    String queryy = "update visits set count=count+1,time='"+strTime+"' where uname='"+username+"' and module='Logged in'  and date ='"+strDate+"'";
                    int count = stmtt.executeUpdate(queryy);
                    flag=0;
                    break;
                }
            }

        }
        //System.out.println("the flag value is "+flag);
        if(flag==1)
        {
            String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
                    + " values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(ins_query);
            preparedStmt.setString (1, username);
            preparedStmt.setString (2, strDate);
            preparedStmt.setString(3, "Logged in");
            preparedStmt.setString(4, "1");
            preparedStmt.setString(5, strTime);
            preparedStmt.setString(6, "None");
            preparedStmt.setString(7, "");

            // execute the preparedstatement
            preparedStmt.execute();
        }%>



<!-- main wrapper -->
<div class="main-wrapper">


    <!-- ========== TOP NAVBAR ========== -->
    <nav class="navbar top-navbar bg-white box-shadow">
        <div class="container-fluid">
            <div class="row">
                <div class="navbar-header no-padding">
                    <a class="navbar-brand" href="Project_List.jsp" id="sitetitle">
                        <img src="images/logo1.png" alt="Onboarding Tool" class="logo">
                    </a>




                </div>
                <!-- /.navbar-header -->

                <div class="collapse navbar-collapse" id="navbar-collapse-1">

                    <!-- /.nav navbar-nav -->
                    <ul class="nav navbar-nav navbar-right">
                        <%
                            String uname=(String)details.getAttribute("username");
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

    <!-- ========== WRAPPER FOR BOTH SIDEBARS & MAIN CONTENT ========== -->
    <div class="content-wrapper">
        <div class="content-container">
            <!-- Projects List Start -->
            <%
                {
                    int application_count=0;
                    if(Projets=="all") {
                        String projectCount = "select count(*) from appemphazize_projectdetails";
                        Statement projectCountst = con.createStatement();
                        ResultSet projectCountqyery = projectCountst.executeQuery(projectCount);
                        if (projectCountqyery.next()) {
                            application_count = Integer.parseInt(projectCountqyery.getString(1));
                        }
                    }
                    else
                    {
                        String ProjCountQuery="select * from admin_userdetails where uname='"+uname+"'";
                        Statement statement1=con.createStatement();
                        ResultSet resultSet=statement1.executeQuery(ProjCountQuery);
                        if(resultSet.next())
                        {
                            String[] prjs=(resultSet.getString("projects")).split(",");
                            application_count=prjs.length;
                        }
                    }
            %>
            <div class="main-page">
                <div class="container">
                    <div class="row page-title-div">
                        <div class="col-sm-6">
                            <h2 class="title">All Projects&nbsp;(<%= application_count%>)</h2>
                            <%} %>
                            <p class="sub-title">Create and manage your existing projects below</p>
                        </div>
                        <!-- /.col-sm-6 -->
                        <div class="col-sm-6 right-side">
                            <button type="button" class="btn btn-primary pull-right" style="color:DodgerBlue;" name="newpr" onclick="location.href='AppEmphasize_NewProject.jsp';" ><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                New Project
                            </button>
                        </div>
                        <!-- /.col-sm-6 text-right -->

                    </div>

                </div>


                <form method="post" name="form" action="Appin">
                    <section>

                        <div class="row">
                            <div class="container">
                                <div class="main">
                                    <div id="cbp-vm" class="cbp-vm-switcher cbp-vm-view-grid">
                                        <div class="cbp-vm-options">
                                            <a href="#" id="grid" title="Grid View" class="cbp-vm-icon cbp-vm-grid cologen gr" data-view="cbp-vm-view-grid">Grid View</a>
                                            <a href="#" id="list" title="List"  class="cbp-vm-icon cbp-vm-list lis" data-view="cbp-vm-view-list">List View</a>
                                        </div>





                                        <ul>
                                            <%  String[] projets1=Projets.split(",");

                                                if(Projets.equals("all"))
                                                {
                                                    query = "select * from AppEmphazize_ProjectDetails";
                                                }
                                                else
                                                {
                                                    int num=0;
                                                    String projectname="";
                                                    while(num<projets1.length)
                                                    {
                                                        System.out.println("project name --------arrrrrrr"+projets1[num]);
                                                        projectname+="OR "+"projectname='"+projets1[num]+"' ";
                                                        num++;
                                                    }%>
                                            <% String projectnam=projectname.substring(3,projectname.length());

                                                query = "select * from AppEmphazize_ProjectDetails where "+projectnam;%>


                                            <%}
                                            %>
                                            <% st = con.createStatement();
                                                ResultSet rs = st.executeQuery(query);%>
                                            <%
                                                int k=0;
                                                while(rs.next()){
                                                    k++;
                                                    // System.out.println("pname is "+rs.getString(1));
                                            %>
                                            <li>
                                                <h3 class="cbp-vm-title left-col primary" name="name"><%=rs.getString(1)%></h3>
                                                <% String q="select * from ArchiveExecution_Details where level=1 and projects='"+rs.getString(1)+"'order by seq_num";
                                                    st1 = con.createStatement();
                                                    ResultSet rs1 = st1.executeQuery(q);
                                                    while(rs1.next())
                                                    {
                                                        if(rs1.getString(15).equals("100") || Integer.parseInt(rs1.getString(15))>=100)
                                                            continue;
                                                        else
                                                        {%>
                                                <p class="right-col primary" ><%=rs1.getString(3) %></p>
                                                <center>

                                                    <div class="progress center-col cbp-vm-detail">
                                                        <div class="progress-bar progress-bar-success progress-bar-striped" id="prog_bar<%=k %>" role="progressbar" aria-valuenow="<%=rs1.getString(15) %>"
                                                             aria-valuemin="0" aria-valuemax="100" style="width:<%=rs1.getString(15) %>%">
                                                            <%=rs1.getString(15) %>%
                                                        </div>

                                                    </div>


                                                </center>

                                                <%
                                                    if(Integer.parseInt(rs1.getString(15))<35){
                                                %>
                                                <script>document.getElementById('prog_bar<%=k%>').className='progress-bar progress-bar-danger progress-bar-striped';</script>
                                                <%    }
                                                else if(Integer.parseInt(rs1.getString(15))<65){
                                                %>
                                                <script>document.getElementById('prog_bar<%=k%>').className='progress-bar progress-bar-warning progress-bar-striped';</script>
                                                <%
                                                    } %>

                                                <%
                                                            break;
                                                        }
                                                    } %>

                                                <button type="button" class="btn btn-primary" name="btn" onClick="edit('<%=rs.getString(10)%>','<%=rs.getString(1)%>');">
                                                    <i class="fa fa-eye"></i>/ &nbsp; <i class="fa fa-edit"></i>
                                                </button>

                                            </li>
                                            <%
                                                }
                                            %>

                                        </ul>

                                        <%
                                                con.close();
                                                visit_st.close();
    }


                                            catch(Exception e){
                                                e.printStackTrace();
                                            }
                                        %>


                                        </ul>

                                    </div>
                                </div>
                            </div>

                        </div>
                        <!-- /.row -->
                    </section>

                </form>




            </div>
            <!-- /.mainPage -->




















            <!-- Project List End -->

        </div>
        <!-- /.content-container -->
    </div>
    <!-- /.content-wrapper -->

</div>
<!-- end of main wrapper -->

<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>
<script src="js/lobipanel/lobipanel.min.js"></script>
<script src="js/iscroll/iscroll.js"></script>


<script type="text/javascript">
    $('#list').click(function()
    {
        $('#grid').removeClass('cologen');
        $('#list').addClass('cologen');
    });
    $('#grid').click(function()
    {
        $('#list').removeClass('cologen');
        $('#grid').addClass('cologen');
    });
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


</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="./Bootstrap/ApplicationPage.css">
    <!-- ========== Toastr ========== -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

    <!-- ========== JQuery FILES ========== -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


    <script src="js/governance/phaseList/phaseList.js"></script>
    <script src="js/governance/phaseList/FilteringList.js"></script>
    <title>Phase List</title>
    <style>
        .addApplication {
            border: none !important;
        }
        div.scrollbar {
            height: 110px;
            overflow-y: auto;
        }

        div.scroll-up{
            position: fixed;
            bottom: 20px !important;
            right: 20px;
            background-color: #4B92CE;
            border-radius: 50%;
            opacity: 70% !important;
        }
        .top-scroll-lock{
            background-color: #FFFFFF !important;
            box-shadow: 0px 2px 8px 0px #0000001A;
        }

    </style>
</head>
<body>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date1 = new Date();
    System.out.println("[INFO]-----" + formatter.format(date1) + "-----Accessed OpportunityList JSP PAGE-----[INFO]");
%>
<%@page language="java" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="java.sql.*" %>
<%@ page import="onboard.DBconnection" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setHeader("Expires", "0");
    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");
    }
%>
<%
    PreparedStatement visit_st = null;
    ResultSet visit_rs = null;
    HttpSession role_ses = request.getSession();
    String frole = (String) role_ses.getAttribute("role");
    int sumcount = 0;
    Statement st, st1;
    try {
        String query;
        HttpSession details = request.getSession();
        String Projets = (String) details.getAttribute("projects");
        System.out.println("projects-------------" + Projets);
        String roles = (String) details.getAttribute("role");
        DBconnection d = new DBconnection();
        Connection con = (Connection) d.getConnection();
        String visit_query = "select * from visits";
        visit_st = con.prepareStatement(visit_query);
        visit_rs = visit_st.executeQuery();
        int flag = 1, knt = 0;
        Date date = new Date();
        SimpleDateFormat ft, ft1;
        String username = (String) details.getAttribute("username");

        ft = new SimpleDateFormat("yyyy-MM-dd");
        ft1 = new SimpleDateFormat("hh:mm:ss");
        String strDate = ft.format(date);
        String strTime = ft1.format(date);
        while (visit_rs.next()) {
            if (visit_rs.getString(6) != null) {
                if (visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate)
                        && visit_rs.getString(3).equals("Logged in")) {
                    String queryy = "update visits set count=count+1,time=? where uname=? and module='Logged in' and date =?";
                    PreparedStatement stmtt = con.prepareStatement(queryy);
                    stmtt.setString(1, strTime);
                    stmtt.setString(2, username);
                    stmtt.setString(3, strDate);
                    int count = stmtt.executeUpdate();
                    flag = 0;
                    break;
                }
            }

        }
        if (flag == 1) {
            String ins_query = " insert into visits (uname, date, module, count, time, Projects, Applications)"
                    + " values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(ins_query);
            preparedStmt.setString(1, username);
            preparedStmt.setString(2, strDate);
            preparedStmt.setString(3, "Logged in");
            preparedStmt.setString(4, "1");
            preparedStmt.setString(5, strTime);
            preparedStmt.setString(6, "None");
            preparedStmt.setString(7, "");

            // execute the preparedstatement
            preparedStmt.execute();
        }
%>
<%
    String uname = (String) details.getAttribute("username");
    /* String role = (String) details.getAttribute("role"); */
%>

<%@ include file="./Nav-Bar.jspf" %>
<div class="row m-0">
    <div class="col p-0">
        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);"
             aria-label="breadcrumb">

            <ol class="breadcrumb px-4 m-0 ">
                <li class="breadcrumb-item inactive my-3"><a href="DashBoard.jsp"
                                                             class="text-decoration-none text-light">Home</a></li>
                <li class="breadcrumb-item inactive my-3"><a href="Governance_Home.jsp"
                                                             class="text-decoration-none text-light">Governance</a></li>
                <li class="breadcrumb-item inactive my-3"><a href="applicationList.jsp"
                                                             class="text-decoration-none text-light">Plan and Priority</a></li>
                <li class="breadcrumb-item active my-3 text-white" aria-current="page">Phases</li>
            </ol>
        </nav>
    </div>
</div>

<section class="container-fluid p-0 ">
    <div class="row m-0 ">
        <div class="col p-0">
            <div class="filter-Container py-3 mb-0 mb-lg-4" id="Filter-container">
                <div class="row mx-1 p-0">
                    <div class="col-lg-4 col-xl-3 col-md-11 col-10 my-lg-0 ">
                        <div class="input-group ">
                        <span class="input-group-append btn1 btn search-button">
                                <i class="fa fa-search iconColor"></i>
                        </span>
                            <input class="form-control searchboxInput" type="search" placeholder="Search the Phase..." id="appFilter">
                        </div>
                    </div>
                    <div class="col-1 px-0 mb-3 mb-lg-0">
                        <a href="NewPhase.jsp" class="btn btn-outline-none btn1 addApplication"
                           role="button"><i
                                class="fa-solid fa-circle-plus fa-2xl addWaveIcon "></i></a>
                    </div>
                </div>
            </div>
        </div>
        <button type="button" class="btn btn-primary pull-right"
                id="addWaveBtnId" style="color: DodgerBlue; display: none;"
                name="newpr" data-bs-toggle='modal' data-bs-target='#existWavePopUp'>
        </button>
        <button type="button" class="btn btn-primary pull-right"
                id="deleteBtn" style="color: DodgerBlue; display: none;"
                name="newpr" data-bs-toggle='modal' data-bs-target='#deletePopUp'>
        </button>
        <button type="button" class="btn btn-primary pull-right"
                id="deletePhaseBtn" style="color: DodgerBlue; display: none;"
                name="newpr" data-bs-toggle='modal' data-bs-target='#deletePhasePopUp'>
        </button>
        <button type="button" class="btn btn-primary pull-right"
                id="deleteWaveBtn" style="color: DodgerBlue; display: none;"
                name="newpr" data-bs-toggle='modal' data-bs-target='#deleteWavePopUp'>
        </button>
    </div>
    </div>  <!-- This div is used to hold the filter container and breadcrumb static on scroll-->
    <%
        {
            int application_count=0;
            PreparedStatement projectCountst=null;
            ResultSet projectCountqyery=null;
            if(Projets.equals("all")) {

                String projectCount = "select count(*) from appemphazize_projectdetails";
                projectCountst = con.prepareStatement(projectCount);
                projectCountqyery = projectCountst.executeQuery();
                if (projectCountqyery.next()) {
                    application_count = Integer.parseInt(projectCountqyery.getString(1));
                }
            }
            else
            {
                String ProjCountQuery="select * from admin_userdetails where uname=?";
                PreparedStatement statement1 = con.prepareStatement(ProjCountQuery);
                statement1.setString(1, uname);
                ResultSet resultSet = statement1.executeQuery();
                if(resultSet.next())
                {
                    String[] prjs=(resultSet.getString("projects")).split(",");
                    application_count=prjs.length;
                }
            }
    %>
    <%
            projectCountst.close();
            projectCountqyery.close();
        } %>
    <div class="container-fluid ">
<%--        <div id="overlay">--%>
<%--            <div class="d-flex justify-content-center my-5">--%>
<%--                <div class="spinner-border text-primary" role="status">--%>
<%--                    <span class="visually-hidden">Loading...</span>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>

        <form method="post" name="form" action="Appin">
            <div class="row px-1 row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4  row-cols-xxl-4 g-4" id="ul_id">
                <!-- Card appending is done here -->
            </div>
        </form>
    </div>
    <%

            visit_st.close();
            visit_rs.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    %>


</section>
<div class="scroll-up">
    <button class="btn iconColor fs-4" id="Scroll-Button" onclick="scrollToTop()"  style="display: none;">
        <i class="fa-solid fa-arrow-up fa-xl" style=" color: #FFFFFF;"></i>
    </button>
</div>

<footer class="fixed-left mt-5 mb-3 text-center ">
    D3Sixty Copyright &copy; 2022 <a href="" class="">Platform 3 Solutions</a>. All Rights Reserved.
</footer>

<!-- Modal -->
<!-- Add to Existing Wave Popup -->
<div class="modal fade" id="existWavePopUp" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header modal-font-label">
                    <h5 class="modal-title">Add To Existing Wave</h5>
                    <button type="button" id="existWaveClose" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form name="PopUpform">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <label class="control-label" for="formInput526">Select Wave Name:</label>
                                    <select id="existWaveTypesId" class="form-control" name="existWaveTypesName" required >

                                    </select>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <input type="text" id="existWaveSeqNum" name="" value="" style="display:none;"/>
                        <input type="text" id="oppNameId" name="" value="" style="display:none;"/>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn  tertiaryButton text-center" data-bs-dismiss="modal" id = "closeIdExistWave" aria-label="Close">Cancel</button>
                    <button type="button" id="existWaveSubmit" class="btn primaryButton text-center" >Submit</button>
                </div>
            </div>
        </div>
</div>
<!-- Application Delete Pop Up -->

<div class="modal fade" id="deletePopUp" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header modal-font-label">
                    <h5 class="modal-title">Delete Application</h5>
                    <button type="button" id="deleteClose" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form name="PopUpform">
                        <div class="row">
                            <div class="form-group">
                                <div class="col-lg-8">
                                    <p>Are you sure, want to delete the Application permanently?</p>
                                </div>
                            </div>
                        </div>
                        <br/>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn  tertiaryButton text-center" data-bs-dismiss="modal" id = "closeIdDeleteApp" aria-label="Close">No</button>
                    <button type="button" id="deleteYesBtn" class="btn primaryButton text-center" >Yes</button>
                </div>
            </div>
        </div>
</div>

<!-- Phase Delete Pop Up -->
<div class="modal fade" id="deletePhasePopUp" tabindex="-1" role="dialog"
     aria-labelledby="exampleModalLabel">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title modal-title-1" id="exampleModalLabel">Delete Wave</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-10">
                                <p>Are you sure, want to delete the Phase permanently?</p>
                                <input type="checkbox" id="includePhaseAll" value="true" />&nbsp;&nbsp;Include Phase
                                content (Associated Wave and Application)
                                <input type="textbox" id="phaseIndex" value="" style="display:none;" />
                            </div>
                        </div>
                    </div>
                    <br />
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center" id="closeIdDeleteApp"
                        data-bs-dismiss="modal">No</button>
                <button type="button" id="deletePhaseYesBtn" class="btn primaryButton text-center"
                        data-bs-dismiss="modal">Yes</button>
            </div>
        </div>
    </div>
</div>


<script>
    let mybutton = document.getElementById("Scroll-Button");
    let scrollStickyFilterContainer =document.getElementById("Filter-container");

    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function() {scrollFunction()};

    function scrollFunction() {
        if (document.body.scrollTop > 40 || document.documentElement.scrollTop > 40) {
            mybutton.style.display = "block";
            scrollStickyFilterContainer.classList.add("top-scroll-lock");
        } else {
            mybutton.style.display = "none";
            scrollStickyFilterContainer.classList.remove("top-scroll-lock");
        }
    }
</script>
<script>
    function scrollToTop() {
        $(window).scrollTop(0);
    }
</script>

<script type="text/javascript" src="./js_in_pages/project.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="js/governance/phaseList/phaseCategorySelection.js"></script>
<script type="text/javascript" src="js/governance/phaseList/phaseFilterByApp.js"></script>
<script type="text/javascript" src="js/governance/phaseList/governanceEditFunctionality.js"></script>
<%--<script type="text/javascript" src="js/threeDotOptions/threeDotOptions.js"></script>--%>
<script src="js/notification/notification.js"></script>
<script src="js/Opportunity/OpportunityList/addToExistWaveAjaxCall.js"></script>
<script src="js/Opportunity/OpportunityList/deleteOpportunity.js"></script>

<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
</body>
</html>
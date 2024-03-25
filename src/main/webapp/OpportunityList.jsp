<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <link rel="stylesheet" href="./Bootstrap/ApplicationPage.css">
    <title>Application Page</title>

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- ========== SELECT TAG IMPORT ========== -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
          referrerpolicy="no-referrer" />
</head>
<style>
    .addApplication {
        border: none !important;
    }
        div.scrollbar {
        height: 90px ;
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
                <li class="breadcrumb-item active my-3 text-white" aria-current="page">Applications</li>
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
                            <input class="form-control" type="search" placeholder="Search..." id="appFilter" >
                        </div>
                    </div>
                    <div class="col-1 px-0 mb-3 mb-lg-0">
                        <a href="./Intake-NewOpportunity.jsp" class="btn btn-outline-none btn1 addApplication"
                           role="button"><i
                                class="fa-solid fa-circle-plus fa-2xl addWaveIcon "></i></a>
                    </div>
                    <div class=" col-md-11 col-lg-7 col-xl-8 d-md-flex justify-content-md-between justify-content-lg-end">
                        <div class="col-md-4 col-lg-3 col-xxl-2 mb-3 mb-lg-0">
    <select class="selectpicker form-control selectInput filter " id="category"
            aria-label=".form-select-lg example">
        <option class='options' value='All' selected>Select Category</option>
        <option class='options' value='Intake'>Intake</option>
        <option class='options' value='Triage'>Triage</option>
        <option class='options' value='Assessment'>Assessment</option>
        <option class='options' value='Archive_Requirement'>Archive
            Requirement
        </option>
        <option class='options' value='Decomm_Requirement'>Decommission
            Requirement
        </option>
        <option class='options' value='DecommissionExecution'>Decommission
            Execution
        </option>
        <option class='options' value='ArchiveExecution'>Archive
            Execution
        </option>
        <option class='options' value='Closure'>Closure</option>
        <option class='options' value='Apps' style="display:none;">Apps</option>
    </select>
                        </div>
                        <div class="col-md-3 col-lg-3 col-xxl-2 mb-3 mb-lg-0 mx-lg-3">
                            <select class="selectpicker form-control selectInput filter" id="phase"
                                    aria-label=".form-select-lg example">
                            </select>
                        </div>
                        <div class="col-md-3 col-lg-3 col-xxl-2 mb-3 mb-lg-0 ">
                            <select class="selectpicker form-control selectInput filter" id="wave"
                                    aria-label=".form-select-lg example">
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>  <!-- This div is used to hold the filter container and breadcrumb static on scroll-->
    <div class="container-fluid ">
        <div id="overlay">
            <div class="d-flex justify-content-center my-5">
                <div class="spinner-border text-primary" role="status">
                    <span class="visually-hidden">Loading...</span>
                </div>
            </div>
        </div>
        <%
            {
                PreparedStatement projectCountst = null;
                ResultSet projectCountqyery = null;
                int application_count = 0;
                if (Projets.equals("all")) {
                    String projectCount = "select count(*) from appemphazize_projectdetails";
                    projectCountst = con.prepareStatement(projectCount);
                    projectCountqyery = projectCountst.executeQuery();
                    if (projectCountqyery.next()) {
                        application_count = Integer.parseInt(projectCountqyery.getString(1));
                    }
                } else {
                    String ProjCountQuery = "select * from admin_userdetails where uname=?";
                    PreparedStatement statement1 = con.prepareStatement(ProjCountQuery);
                    statement1.setString(1, uname);
                    ResultSet resultSet = statement1.executeQuery();
                    if (resultSet.next()) {
                        String[] prjs = (resultSet.getString("projects")).split(",");
                        application_count = prjs.length;
                    }
                }
        %>
        <%
                projectCountst.close();
                projectCountqyery.close();
            }
        %>
        <button type="button" class="btn btn-primary pull-right" id="addWaveBtnId" style="display: none;"
                data-bs-toggle='modal' data-bs-target='#existWavePopUp'>
        </button>
        <button type="button" class="btn btn-primary pull-right"
                id="deleteBtn" style="display: none;"
                name="newpr" data-bs-toggle="modal"
                data-bs-target="#deletePopUp">
        </button>
        <form method="post" name="form" action="Appin">
            <div class="row px-1 row-cols-1 row-cols-md-2 row-cols-lg-3 row-cols-xl-4  row-cols-xxl-4 g-4 mb-5" id="ul_id">
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


<!-- Delete Modal -->

<div class="modal fade" id="deletePopUp" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Delete Application</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-8">
                                <p>
                                    Are you sure, </br>want to delete the application permanently?
                                </p>
                            </div>
                        </div>
                    </div>
                    <br/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn buttonFrame tertiaryButton text-center" data-bs-dismiss="modal">No
                </button>
                <button type="button" id="deleteYesBtn" class="btn primaryButton  text-center" data-bs-dismiss="modal">
                    Yes
                </button>
            </div>
        </div>
    </div>
</div>


<%--Add to Existing pop up--%>
<div class="modal fade " id="existWavePopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title ">Add To Existing Wave</h5>
                <button type="button" id="existWaveClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-8">
                                <label class="control-label">Select Wave Name:</label>
                                <select id="existWaveTypesId" class="selectpicker form-control " name="existWaveTypesName" required>

                                </select>
                            </div>
                        </div>
                    </div>
                    <br/> <input type="text" id="existWaveSeqNum" name="" value=""
                                 style="display: none;"/>
                    <input type="text" id="oppNameId" name="" value="" style="display: none;"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn buttonFrame tertiaryButton text-center" data-bs-dismiss="modal"
                        id="closeIdExistWave" aria-label="Close">Cancel
                </button>
                <button type="button" id="existWaveSubmit" class="btn primaryButton text-center"
                        data-bs-dismiss="modal">Submit
                </button>
            </div>
        </div>
    </div>
</div>
<%@include file="Footer.jspf"%>
<script>
    $(document).ready(function() {
        $('#category').selectpicker({
            title: ''
        });
    });
</script>
<script>
    $(document)
        .ready(
            function () {
                $('.searchbox-input').keyup(function () {
                    search_text($(this).val());
                });

                function search_text(value) {
                    $('#ul_id .cbp-vm-title')
                        .each(
                            function () {
                                var found = 'false';
                                $(this)
                                    .each(
                                        function () {
                                            if ($(
                                                this)
                                                .text()
                                                .toLowerCase()
                                                .indexOf(
                                                    value
                                                        .toLowerCase()) >= 0) {
                                                found = 'true';
                                            }
                                        });
                                if (found == 'true') {
                                    $(this).parent().css(
                                        'display', '');
                                } else {
                                    $(this).parent().css(
                                        'display',
                                        'none');
                                }
                            })
                }
            });
</script>

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

<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.14/dist/js/bootstrap-select.min.js"></script>--%>
<script type="text/javascript" src="./js_in_pages/project.js"></script>
<script src="./js/Opportunity/OpportunityList/OpportunityList.js"></script>
<script src="./js/Opportunity/OpportunityList/opportunityFilterList.js"></script>
<script src="./js/Opportunity/OpportunityList/addToExistWaveAjaxCall.js"></script>
<script src="./js/Opportunity/OpportunityList/deleteOpportunity.js"></script>
<script src="./js/Opportunity/OpportunityList/opportunitySearchList.js"></script>
<script src="./js/navigation/navigation.js"></script>

<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
</body>
</html>
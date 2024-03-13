<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D3Sixty - Retention Details</title>
    <!-- ========== PAGE STYLES ========== -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Archive Retention Info  -->
    <script type="text/javascript"
            src="js/Requirements/ArchiveRequirements/LegacyAppInfo/retentionDetails/archiveRetentionDataRetrieve.js"></script>
</head>
<body>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Grid JSP PAGE-----[INFO]"); %>
<%@page language="java" %>
<%@page import="java.sql.*" %>
<%@page import="java.text.DateFormat" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@page import="onboard.DBconnection" %>
<%@page import="java.util.Calendar" %>
<%@page import="org.owasp.encoder.Encode" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
    DBconnection dBconnection = new DBconnection();


    if (session.getAttribute("username") == null) {
        response.sendRedirect("Login.jsp");


    } else {
        String name = (String) session.getAttribute("ID");
        HttpSession details = request.getSession();
        Connection con = null;
        session.setAttribute("theName", name);
        String roles = (String) details.getAttribute("role");
        String OpportunityName = (String) details.getAttribute("SelectedOpportunity");
        String s = OpportunityName;
        System.out.println("Welcome" + OpportunityName);

        int sumcount = 0;
        Statement st, st2;
        try {

            con = dBconnection.getConnection();
            Statement st1;

%>
<form class="form-signin" name="loginForm" method="post">


    <%@include file="Nav-Bar.jspf" %>
    <div class="row m-0">
        <div class="col p-0">
            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);"
                 aria-label="breadcrumb">
                <ol class="breadcrumb px-4 m-0 ">
                    <li class="breadcrumb-item inactive my-3 text-light "><a href="DashBoard.jsp"
                                                                             class="text-decoration-none breadcrumbtextinactive">Home</a>
                    </li>
                    <li class="breadcrumb-item inactive my-3 text-light "><a href="OpportunityGrid.jsp"
                                                                             class="text-decoration-none breadcrumbtextinactive"><%=Encode.forHtml(OpportunityName)%>
                    </a></li>
                    <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveDecommPage.jsp"
                                                                             class="text-decoration-none breadcrumbtextinactive">Requirements</a>
                    </li>
                    <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveRequirementsIntroDetails.jsp"
                                                                             class="text-decoration-none breadcrumbtextinactive">Introduction</a>
                    </li>
                    <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsLegacyDetails.jsp"
                                                                             class="text-decoration-none breadcrumbtextinactive">Legacy
                        Application Info</a></li>
                    <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Retention Details
                    </li>
                </ol>
            </nav>
        </div>
    </div>
    </div>

    <%
            } catch (Exception e) {
                e.printStackTrace();
            }
        } %>

    <div class="container-fluid m-0 my-5 px-4">
        <div class="card">
            <div class="card-header Card-Header" id="cd-header">
                Retention Details
            </div>
            <div id="inputFieldsRetention">
                <div class=" changeText Retention mt-2" contenteditable='true' id="contentDivId">
                    <ul id="contentInfoList">

                    </ul>
                </div>
            </div>
            <div class="table-responsive mx-3 mt-3">
                <table class="table table-bordered ">
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Retention Level (Select all Used)</th>
                        <th scope="col">Retention Level</th>
                        <th scope="col">Condition (If applicable)</th>
                        <th scope="col">Date Used</th>
                        <th scope="col">Description</th>
                    </tr>
                    </thead>
                    <tbody id="RetentionTable" class="text-center align-middle">

                    </tbody>
                </table>
            </div>

            <div class="row my-3 mx-1">
                <div class="col-sm-12 d-flex justify-content-center">
                    <button type="button" class="btn buttonFrame tertiaryButton text-center d-none d-sm-block"
                            onclick="location.href='archiveRequirementsLegacyDetails.jsp';">Back
                    </button>
                    <button type="submit" class="btn secondaryButton text-center mx-2 d-none d-sm-block" id="edit">
                        Edit
                    </button>
                    <button type="submit" class="btn primaryButton text-center px-1" id="complete"
                            disabled="true">Complete
                    </button>
                    <button type="submit" class="btn primaryButton text-center mx-2" id="saveRetentionId">Save</button>
                    <button class="btn primaryButton text-center"
                            onclick="location.href='ArchiveBusinessRequirements.jsp';" id="next" disabled="true">
                        <a href="javascript:;" class="text-decoration-none text-reset ">Next</a>
                    </button>
                </div>
            </div>
            <div class="row mb-3 mx-1 d-block d-sm-none">
                <div class="col-12 d-flex justify-content-center">
                    <button type="button" class="btn buttonFrame tertiaryButton text-center"
                            onclick="location.href='archiveRequirementsLegacyDetails.jsp';">Back
                    </button>
                    <button type="submit" class="btn secondaryButton text-center mx-2" id="edit">Edit</button>
                </div>
            </div>
        </div>
    </div>
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

</form>
<!-- Active Icon Color changes  -->
<script>
    $(document).on('mouseenter', '.active1', function () {

        $('.activeIcon').css('color', '#1565c0');

    });

    $(document).on('mouseleave', '.active1', function () {

        $('.activeIcon').css('color', '#fff');

    });
</script>
<%@include file="Footer.jspf" %>


<script id="scripttag"></script>

<!-- ========== PAGE JS FILES ========== -->
<script type="text/javascript"
        src="js/date-picker/bootstrap-datepicker.js"></script>
<script src="js/notification/notification.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyAppInfo/retentionDetails/archiveRetentionSave.js"></script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
        href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        rel="stylesheet">

</body>
</html>
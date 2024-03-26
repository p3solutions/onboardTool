<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ========== COMMON STYLES ========== -->
    <title>Revisions</title>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/Requirements/ArchiveRequirements/documentRevisions/archiveReqDocRevDataRetrieve.js"></script>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>--%>
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
                    <li class="breadcrumb-item inactive my-3 text-light "><a
                            href="archiveRequirementsRetentionDetails.jsp"
                            class="text-decoration-none breadcrumbtextinactive">Retention Details</a></li>
                    <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveBusinessRequirements.jsp"
                                                                             class="text-decoration-none breadcrumbtextinactive">Business
                        Requirements</a></li>
                    <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveReqAbbrevation.jsp"
                                                                             class="text-decoration-none breadcrumbtextinactive">Abbreviations</a>
                    </li>
                    <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Revisions</li>
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
                Document Revisions
            </div>
            <div class="card-body mx-4">
            </div>
            <div class="table-responsive mx-3">
                <table class="table table-bordered  ">
                    <thead class="text-center ">
                    <tr>
                        <th scope="col">Date</th>
                        <th scope="col">Version No</th>
                        <th scope="col">Document Changes</th>
                        <th scope="col">Change Author</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>
                    <tbody id="docRevInfo" class="text-center align-middle">

                    </tbody>
                </table>
            </div>
            <button type="button" class="btn btn-primary pull-right"
                    id="docRevDeleteId" data-bs-toggle="modal"
                    data-bs-target="#docRevDeletePopUp"
                    style="display: none;">Delete PopUp
            </button>

            <div class="row my-3 mx-1">
                <div class="col-12  d-flex justify-content-center ">
                    <button type="button" class="btn  tertiaryButton text-center mx-2"
                            onclick="location.href='archiveReqAbbrevation.jsp';">Prev
                    </button>
                    <button class="btn secondaryButton text-center" type="button" id="docRevAdd">Add</button>
                    <button type="submit" class="btn primaryButton text-center mx-2" id="docRevSave">Save</button>
                    <button class="btn primaryButton text-center"
                            onclick="location.href='archiveRequirementsAddendum.jsp';" id="docRevNext" disabled="true">
                        <a href="javascript:;"
                           class="text-decoration-none text-reset">Next</a>
                    </button>
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
<!-- Delete PopUp -->
<div class="modal fade" id="docRevDeletePopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
                <button type="button" id="docRevDeleteClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p>Do you want to delete this Row permanently?</p>
                        <input type="hidden" id="docRevDeleteSeq"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        id="closedocRevIdDelete" data-bs-dismiss="modal"
                        aria-label="Close">No
                </button>
                <button type="button" id="docRevDeleteSubmit"
                        class="btn primaryButton text-center submitDisableDocRev"
                        data-bs-dismiss="modal">Yes
                </button>
            </div>
        </div>
    </div>
</div>

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

<!-- ========== THEME JS ========== -->
<script id="scripttag"></script>

<!-- ========== PAGE JS FILES ========== -->
<script type="text/javascript"
        src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>

<script src="js/notification/notification.js"></script>
<script
        src="js/Requirements/ArchiveRequirements/documentRevisions/archiveReqDocRevAddAjaxCall.js"></script>
<script
        src="js/Requirements/ArchiveRequirements/documentRevisions/archiveReqDocRevEditDeleteAjaxCall.js"></script>
<script
        src="js/Requirements/ArchiveRequirements/documentRevisions/archiveReqDocRevSaveAjaxCall.js"></script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
        href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        rel="stylesheet">
</body>
</html>
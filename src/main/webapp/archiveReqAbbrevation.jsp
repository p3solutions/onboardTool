<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D3Sixty - Archive Requirements</title>
    <!-- ========== MODERNIZR ========== -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>--%>
</head>

<body>

<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed Grid JSP PAGE-----[INFO]");
%>
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
                    <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Abbreviations</li>
                </ol>
            </nav>
        </div>
    </div>
    </div>

    <%
            } catch (Exception e) {
                e.printStackTrace();
            }

        }
    %>
    <div class="container-fluid m-0 my-5 px-4">
        <div class="card">
            <div class="card-header Card-Header" id="cd-header">
                Abbreviations, Acronyms, Definitions
            </div>
            <div class="card-body mx-4">
            </div>
            <div class="table-responsive mx-2">
                <table id="trackerTable" class="table table-bordered  ">
                    <thead class="text-center ">
                    <tr>
                        <th scope="col">Sequence</th>
                        <th scope="col">Abbreviation/Acronym</th>
                        <th scope="col">Description</th>
                        <th scope="col" class="useractionheader">Action</th>
                    </tr>
                    </thead>
                    <tbody id="abbreviationlist" class="text-center align-middle">

                    </tbody>
                </table>

            </div>
            <button type="button" class="btn btn-primary pull-right"
                    id="DataDeleteId" data-toggle="modal"
                    data-target="#DataDeletePopUp" style="display: none;">Delete
                PopUp
            </button>
            <div class="row my-3 mx-1">
                <div class="col-12 d-flex justify-content-center">
                    <button type="button" class="btn  tertiaryButton text-center"
                            onclick="location.href='ArchiveBusinessRequirements.jsp';">Prev
                    </button>
                    <button class="btn secondaryButton text-center mx-2" type="button" id="addabbreviationbtn" href="#"
                            data-bs-toggle="modal" data-bs-target="#addabbreviationModal">Add
                    </button>
                    <button class="btn btn-secondary" type="button" hidden id="editabbreviationbtn" href="#"
                            data-bs-toggle="modal" data-bs-target="#editabbreviationModal">Edit
                    </button>
                    <button class="btn btn-secondary" type="button" hidden id="dltabbreviationbtn" href="#"
                            data-bs-toggle="modal" data-bs-target="#dltabbreviationModal">Delete
                    </button>
                    <button class="btn primaryButton text-center"
                            onclick="location.href='archiveRequirementsDocumentRevisions.jsp';" id="busreqNext">
                        <a href="archiveRequirementsDocumentRevisions.jsp"
                           class="primaryButton text-center text-decoration-none ">Next</a>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <script>
        // function validateform9() {
        //
        //     var f = document.loginForm;
        //     f.method = "post";
        //     f.action = 'ArchivalRequirements';
        //     f.submit();
        //
        // }
    </script>
</form>


<div class="modal fade" id="addabbreviationModal"
     tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel"
                    style="color: white;">Add New Abbreviation</h5>
                <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12">
                                <label class="control-label" for="formInput526" style="color:black;">Abbreviation/Acronym:</label>
                                <input type="text" class="form-control"
                                       id="abbreviation_acronym"
                                       name="abbreviation/acronym" required>
                            </div>
                            <div class="col-lg-12">
                                <label class="control-label" for="formInput526"
                                       style="color:black;">Description:</label>
                                <textarea class="form-control"
                                          id="abb_description" name="abb_description"
                                          rows="4" required></textarea>
                            </div>
                        </div>
                    </div>


                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        data-bs-dismiss="modal">Cancel
                </button>
                <button type="button" class="btn primaryButton  text-center"
                        id="add_abbreviation_submit" data-dismiss="modal"
                >Add
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="editabbreviationModal"
     tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Update
                    Abbreviation/Acronym Details</h5>
                <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12">
                                <label class="control-label" for="formInput526"
                                       style="color:black;">Abbreviation:</label>
                                <input type="text" class="form-control"
                                       id="abbreviation_acronym_modify"
                                       name="abbreviation_acronym_modify" required>
                                <label class="control-label" for="formInput526"
                                       style="color:black;">Description:</label>
                                <textarea class="form-control"
                                          id="description_modify"
                                          name="description_modify" rows="4" required></textarea> <input
                                    type="text" hidden class="form-control"
                                    id="seq_no_modify" name="seq_no_modify"
                                    required> <input type="text" hidden
                                                     class="form-control" id="app_id_modify"
                                                     name="app_id_modify" required>

                            </div>
                        </div>
                    </div>
                    <input type="text" id="random_id_modify"
                           name="random_id" value="" style="display: none;">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        data-bs-dismiss="modal">Cancel
                </button>
                <button type="button" class="btn primaryButton text-center"
                        id="update_abbreviation_submit">Update
                </button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="dltabbreviationModal"
     tabindex="-1" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered ">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Delete
                    Abbreviation/Acronym</h5>
                <button type="button" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p>Do you want to
                            delete this Abbreviation/Acronym permanently?</p>
                        <input type="text" class="form-control"
                               id="seq_no_dlt" name="seq_no" required style="display:none;"><input
                            type="text" id="random_id" style="display: none;"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        data-bs-dismiss="modal">No
                </button>
                <button type="button" class="btn primaryButton text-center"
                        data-bs-dismiss="modal"
                        id="delete_abbreviation_submit">Yes
                </button>
            </div>
        </div>
    </div>
</div>
<%
    //     }
    //    }
%>

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


<!-- ========== PAGE JS FILES ========== -->

<script src="js/notification/notification.js"></script>
<script src="js/navigation/navigation.js"></script>
<script
        src="js/Requirements/ArchiveRequirements/archiveRequirementAbbreviation/Archive_Req_Add_Abbreviation.js"></script>
<script
        src="js/Requirements/ArchiveRequirements/archiveRequirementAbbreviation/Archive_Req_Delete_Abbreviation.js"></script>
<script
        src="js/Requirements/ArchiveRequirements/archiveRequirementAbbreviation/Archive_Req_Retrieve_Abbreviations.js"></script>
<script
        src="js/Requirements/ArchiveRequirements/archiveRequirementAbbreviation/Archive_Req_Update_Abbreviation.js"></script>

<!-- ========== Toastr ========== -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
        href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        rel="stylesheet">
</body>
</html>
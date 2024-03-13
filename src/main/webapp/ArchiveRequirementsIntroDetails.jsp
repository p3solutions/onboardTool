<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ========== COMMON STYLES ========== -->
    <title>D3Sixty - Introduction</title>
    <!-- ========== MODERNIZR ========== -->
    <script src="js/common/email/emailAjaxCall.js"></script>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/Requirements/ArchiveRequirements/Introduction/archiveReqDataRetrieveAjaxCall.js"></script>
    <!-- ========== SELECT TAG IMPORT ========== -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
          referrerpolicy="no-referrer" />
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>--%>
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
                                                                         class="text-decoration-none breadcrumbtextinactive">Requirements </a>
                </li>
                <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Introduction</li>
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
<form class="form-signin" name="loginForm" method="post">
    <div class="container-fluid my-5 px-4">
        <div class="card">
            <div class="card-header Card-Header" id="cd-header">
                Introduction
            </div>
            <div class="accordion m-3 " id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Purpose & Scope
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body" id="inputFieldsPurpose">
                            Purpose <br>
                            <textarea rows="3"
                                      class="changeText Purpose my-2 w-100">The scope of this document is to gather information pertinent for data archiving, including creating custom screen/display views, with data that is specified to be non-transactional and is static/read-only. Retention policies will be applied according to Company Policies. A job aid will be provided for general navigation, performing searches, and basic functionality within the Archive.   </textarea>
                            <br>
                            Scope <br>
                            <textarea id="todolist" class="changeText Scope my-2 w-100" name="todolist" rows="3"
                                      id="scope_temp">Read-only data will be archived</textarea> <br>
                            <div class="row my-2">
                                <div class="col-12 d-flex justify-content-center">
                                    <button class="btn primaryButton text-center " type="button"
                                            data-bs-toggle="collapse"
                                            data-bs-target="#collapseTwo" aria-expanded="false"
                                            aria-controls="multiCollapseExample2">Next
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Roles & Responsibilities
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <h5>Apporvers</h5>
                            <div class="table-responsive" id="inputFieldsRoles">
                                <table id="trackerTable" class="table table-bordered">
                                    <thead class="text-center ">
                                    <tr>
                                        <th scope="col">Role</th>
                                        <th scope="col">Name</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">User Name</th>
                                        <th scope="col">Priority</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody id="Approver" class="text-center align-middle">

                                    </tbody>
                                </table>
                            </div>
                            <div class="col-12 d-flex  justify-content-center">
                                <button class="btn secondaryButton text-center" type="button" id="AddRoleResponse">
                                    Add
                                </button>
                                <button type="submit" class="btn primaryButton text-center mx-2"
                                        id="saveRoleResponse">Save
                                </button>
                                <button class="btn primaryButton text-center" type="button"
                                        data-bs-toggle="collapse"
                                        data-bs-target="#collapseThree" aria-expanded="false"
                                        aria-controls="multiCollapseExample2">Next
                                </button>
                                <button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn"
                                        onclick="window.location.href='IntakeDetails.jsp';"
                                        style="display: none;"></button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="accordion-item ">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Assumptions
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                         data-bs-parent="#accordionExample">
                        <div id="inputFieldsAssumptions">
                            <div class="accordion-body" id="TemplateFields">
                                <div class="row changeText Assumption mx-2" contenteditable='true'>
                                    <ul>
                                        <li>Legacy Application SMEs are available
                                            for Requirements gathering
                                        </li>
                                        <li>Legacy Application SMEs/users�will be
                                            available for UAT activities
                                        </li>
                                        <li>The Data Archive Project Team has
                                            access granted to the front end of the legacy
                                            application along with network connectivity
                                        </li>
                                        <li>The retiring/repurposing legacy
                                            application has been turned to read-only mode
                                            before the Production archival begins (if this
                                            is not the case the archive could be
                                            compromised)
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <button type="button"
                        class="btn btn-primary pull-right"
                        id="ArchReqDeleteId" data-bs-toggle="modal"
                        data-bs-target="#ArchiveDeletePopUp"
                        style="display: none;">Delete PopUp
                </button>
                <button type="button"
                        class="btn btn-primary pull-right"
                        id="OpportunityListbtn"
                        onclick="window.location.href='IntakeDetails.jsp';"
                        style="display: none;"></button>
                <div class="col-12 d-flex justify-content-center mt-3">
                    <button type="submit" class="btn secondaryButton text-center" id="edit">Edit</button>
                    <button type="submit" class="btn primaryButton text-center mx-2 px-1" id="complete"
                            disabled="true">Complete
                    </button>
                    <button class="btn primaryButton text-center"
                            onclick="location.href='archiveRequirementsLegacyDetails.jsp';" id="rolesNext"
                            disabled="true"><a href="javascript:;" class="text-decoration-none text-reset">Next</a>
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

<!-- Archive Req Intro Roles & Response Delete PopUp -->
<div class="modal fade" id="ArchiveDeletePopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
                <button type="button" id="ArchiveDeleteClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p>Do you want to delete this Row permanently?</p>
                        <input type="hidden" id="ArchiveDeleteSeq"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn buttonFrame tertiaryButton text-center" id="closeIdDelete"
                        data-bs-dismiss="modal" aria-label="Close">No
                </button>
                <button type="button" id="ArchiveDeleteSubmit"
                        class="btn  primaryButton text-center submitDisableDelete">Yes
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
<!-- ========== COMMON JS FILES ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/Introduction/archiveReqIntroAssumptionToDoList.js"></script>
<script src="js/notification/notification.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/Introduction/ArchiveIntroSave.js"></script>
<%--<script src="js/navigation/navigation.js"></script>--%>
<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
</body>
</html>
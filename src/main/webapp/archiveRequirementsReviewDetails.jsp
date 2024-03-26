
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D3Sixty - Intake</title>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/common/email/emailAjaxCall.js"></script>
    <script src ="js/pdf/downloadPDF_AjaxCall.js"></script>
    <script src ="js/pdf/deletePDF_AjaxCall.js"></script>
<%--    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>--%>
<%--    <script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>--%>
</head>
<style>
    .exportButton {
        font-family: 'Roboto' !important;
        font-size: 14px !important;
        font-weight: 500 !important;
        line-height: 16px !important;
        letter-spacing: 0em;
        background-color: #237dca !important;
        color: #FFFFFF !important;
        width: 110px !important;
        height: 40px !important;
        border-radius: 6px;
        position: relative;
        top: -5px;
    }
    .exportButton:hover{
        background-color: #237dca;
        color: #FFFFFF;
    }
    .requestButton{
        font-family: 'Roboto' !important;
        font-size: 14px !important;
        font-weight: 500 !important;
        line-height: 16px !important;
        letter-spacing: 0em;
        background-color: #2a3f57 !important;
        color: #FFFFFF !important;
        width: 110px !important;
        height: 40px !important;
        border-radius: 6px;
    }
    table,tr,th{
        background-color: #f2f7fc !important;
        color: #474747 !important;
    }
</style>
<body>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Grid JSP PAGE-----[INFO]"); %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="onboard.DBconnection"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.owasp.encoder.Encode" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
    DBconnection dBconnection = new DBconnection();
    if (session.getAttribute("username")==null)
    {
        response.sendRedirect("Login.jsp");
    }
    else{
        String name=(String)session.getAttribute("ID");
        HttpSession details=request.getSession();
        Connection con = null;
        session.setAttribute("theName", name);
        String roles=(String)details.getAttribute("role");
        String OpportunityName = (String)details.getAttribute("SelectedOpportunity");
        String s=OpportunityName;
        System.out.println("Welcome"+OpportunityName);

        int sumcount=0;
        Statement st,st2;
        try{

            con=dBconnection.getConnection();
            Statement st1;

%>


<%@include file="Nav-Bar.jspf"%>
<div class="row m-0">
    <div class="col p-0">
        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
            <ol class="breadcrumb px-4 m-0 ">
                <li class="breadcrumb-item inactive my-3 text-light "><a href="DashBoard.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Home</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="OpportunityGrid.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive"><%=Encode.forHtml(OpportunityName)%></a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveDecommPage.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Requirements</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveRequirementsIntroDetails.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Introduction</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsLegacyDetails.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Legacy Application Info</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsRetentionDetails.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Retention Details</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveBusinessRequirements.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Business Requirements</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveReqAbbrevation.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Abbreviations</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsDocumentRevisions.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Revisions</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsAddendum.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Addendum</a></li>
                <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Review</li>
            </ol>
        </nav>
    </div></div>
</div>
<%
        }
        catch(Exception e){
            e.printStackTrace();
        }
    } %>

<div class="container-fluid m-0 my-5 px-4">
    <div class="card">
        <div class="card-header Card-Header pb-2 d-flex justify-content-between" id="cd-header">Archive Requirements Summary
                <button id="exportPdf" class="btn exportButton text-center"><i class="fa-solid fa-download text-white"></i> Export Pdf</button>
        </div>

        <div class="card-body mx-4">
            <h6 class="panel-title">1.1 Purpose & Scope</h6>
            <h6 class="panel-title">Purpose</h6>
            <div id="purposeInfoPreview" class="mb-2">
            </div>
            <div id="scopeInfoPreview">
                <h6 class="panel-title">Scope</h6>

            </div>
            <h6 class="panel-title mt-2">1.2 Assumptions</h6>
            <div>
                <div class="bg-light p-2 scroll-div"  id="AssumptionInfoPreview">

                </div>
            </div>
            <h6 class="panel-title mt-3">2 Legacy Application Information</h6>
            <h6 class="panel-title mt-2">2.1 Application Information</h6>
            <div class="table-responsive mt-2 ">
                <table class='table table-bordered w-100'>
                    <tbody id="AppInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">2.2 Archive Environment Information</h6>
            <div class="table-responsive my-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope='col'>Dev DB Name</th>
                        <th scope='col'>Test DB Name</th>
                        <th scope='col'>Stage DB Name</th>
                        <th scope='col'>Production DB Name</th>
                    </tr>
                    </thead>
                    <tbody id="ArchiveEnvInfoPreview">

                    </tbody>
                </table>
                <table class="table table-bordered mt-5">
                    <thead class="text-center">
                    <tr>
                        <th scope='col'>Dev DB Server</th>
                        <th scope='col'>Test DB Server</th>
                        <th scope='col'>Stage DB Server</th>
                        <th scope='col'>Production DB Server</th>
                    </tr>
                    </thead>
                    <tbody id="ArchiveEnvServerInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">2.3 Legacy Application Screenshots</h6>
            <div class="table-responsive">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope='col'>File Name</th>
                        <th scope='col'>Action</th>
                    </tr>
                    </thead>
                    <tbody id="Legacy_Scr_List">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">3 Retention Details</h6>
            <div class="bg-light scroll-div pt-2" >
                <ul id="RetentionDetailsInfoPreview">

                </ul>
            </div>
            <div class="table-responsive mt-4">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope='col'>Retention Level (Select all Used)</th>
                        <th scope='col'>Retention Level</th>
                        <th scope='col'>Condition (If applicable)</th>
                        <th scope='col'>Date Used</th>
                        <th scope='col'>Description</th>
                    </tr>
                    </thead>
                    <tbody id="RetentionInfoPreview" class="text-center align-middle">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">4 Business Requirements</h6>
            <div class="bg-light scroll-div" id="BusinessReqHeaderInfo">

            </div>
            <h6 class="panel-title mt-3">4.1 Requirement In Scope</h6>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Req In-Scope(Y/N)</th>
                        <th scope="col">Description</th>
                    </tr>

                    </thead>
                    <tbody class="text-center" id="BusinessReqTableInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">4.2 Functional Requirement</h6>
            <h6 class="panel-title mt-3">4.2.1 Data Requirements</h6>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Req Id</th>
                        <th scope="col">Req In-Scope(Y/N)</th>
                        <th scope="col">Requirement Type</th>
                        <th scope="col">Requirement</th>
                        <th scope="col">Additional Info</th>
                    </tr>
                    </thead>
                    <tbody class="text-center" id="FunctionReqDataReqInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">4.2.2 Retention and Legal Requirements</h6>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Req Id</th>
                        <th scope="col">Req In-Scope(Y/N)</th>
                        <th scope="col">Requirement Type</th>
                        <th scope="col">Description</th>
                        <th scope="col">Additional Info</th>
                    </tr>
                    </thead>
                    <tbody class="text-center" id="FunctionReqRetentionLegalReqInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">4.2.3 Security Requirements</h6>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Req Id</th>
                        <th scope="col">Req In-Scope(Y/N)</th>
                        <th scope="col">Requirement Type</th>
                        <th scope="col">Description</th>
                        <th scope="col">Additional Info</th>
                    </tr>
                    </thead>
                    <tbody class="text-center" id="FunctionReqSecurityReqInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">4.2.4 Usability Requirements</h6>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Req Id</th>
                        <th scope="col">Req In-Scope(Y/N)</th>
                        <th scope="col">Requirement Type</th>
                        <th scope="col">Description</th>
                        <th scope="col">Additional Info</th>
                    </tr>
                    </thead>
                    <tbody class="text-center" id="FunctionReqUsabilityReqInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">4.2.5 Audit Requirements</h6>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Req Id</th>
                        <th scope="col">Req In-Scope(Y/N)</th>
                        <th scope="col">Requirement Type</th>
                        <th scope="col">Description</th>
                        <th scope="col">Additional Info</th>
                    </tr>
                    </thead>
                    <tbody class="text-center" id="FunctionReqAuditReqInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">4.3 Screen Requirements</h6>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Req Id</th>
                        <th scope="col">Screen Display Name in Infoarchive</th>
                        <th scope="col">Purpose</th>
                        <th scope="col">Equivalent in the Legacy Application</th>
                    </tr>
                    </thead>
                    <tbody class="text-center" id="ScreenReqInfoPreview">

                    </tbody>
                </table>
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th>Req Id</th>
                        <th scope="col">Search Form Name</th>
                        <th scope="col">Search Field Name</th>
                        <th scope="col">Field Format</th>
                        <th scope="col">Data Type</th>
                        <th scope="col">Data Retrieval Requirement</th>
                        <th scope="col">Required Field</th>
                        <th scope="col">Search Field Additional Information</th>
                    </tr>
                    </thead>
                    <tbody class="text-center" id="SearchFormInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">5 Abbreviations, Acronyms, Definitions</h6>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Abbreviation/Acronym</th>
                        <th scope="col">Description</th>
                    </tr>
                    </thead>
                    <tbody class="text-center" id="AbbrevationDescriptionInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">6 Document Revisions</h6>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope="col">Date</th>
                        <th scope="col">Version No</th>
                        <th scope="col">Document Changes</th>
                        <th scope="col">Change Author</th>
                    </tr>
                    </thead>
                    <tbody class="text-center" id="documentRevisionsInfoPreview">

                    </tbody>
                </table>
            </div>
            <h6 class="panel-title mt-3">7 Addendum</h6>
            <div id="addendumInfoPreview">

            </div>
            <h6 class="panel-title mt-3">8 Roles & Responsibilites</h6>
            <div class="table-responsive mt-3">
                <table class="table table-bordered">
                    <thead class="text-center">
                    <tr>
                        <th scope='col'>Role</th>
                        <th scope='col'>Name</th>
                        <th scope='col'>Email</th>
                        <th scope='col'>Username </th>
                        <th scope='col'>Priority </th>
                    </tr>
                    </thead>
                    <tbody class="text-center" id="roleResponseInfoPreview">

                    </tbody>
                </table>
            </div>
        </div>
        <!-- button section -->
        <div class="row my-3 mx-4">
            <div class="col-12 d-flex justify-content-center">
                <button type="button" class="btn  tertiaryButton text-center mx-1" id="ReviewPrevBtn" onclick="location.href='archiveRequirementsAddendum.jsp';">Prev</button>
                <button type="button" id="button_id" name="button_id" class="btn requestButton text-center mx-1">
                    Request Sign </button>
                <button type="button" class="btn primaryButton text-center mx-1"
                        onclick="location.href='archiveRequirementsApprovalDetails.jsp'"
                        id="ReviewNextBtn">Next</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="myModal modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" >
        <div id="modal-content">
            <div class="modal-header modal-font-label">
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel"><b>List of Users</b></h4>
                <input type="checkbox" name="signorder" id="signorder"> <b>Set signing order</b>
                <input class="searchbox" id="search_bar" type="text" placeholder="Search User"
                       name="search" style="font-size: 15px"/>
            </div>
            <div class="modal-body" style="width: 500px" id="user_list_div_id_name">

            </div>
            <div class="modal-footer" >
                <button type="button" class="btn  tertiaryButton text-center" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn primaryButton text-center" name="email_id" id="email_id"
                        data-bs-dismiss="modal">Send Email
                </button>
            </div>
        </div>
    </div>
</div>

<script src="js/toastr/toastr.min.js"></script>
<script src="js/notification/notification.js"></script>
</body>
<%@include file="Footer.jspf"%>
<!-- ========== COMMON JS FILES ========== -->

<!-- Active Icon Color changes  -->
<script>
    $(document).on('mouseenter','.active1', function(){

        $('.activeIcon').css('color','#1565c0');

    });

    $(document).on('mouseleave','.active1', function(){

        $('.activeIcon').css('color','#fff');

    });

</script>
<form action="legacy_scr_download" method="post">
    <input type="hidden" name="File_Name" id="File_Name">
    <input type="submit" id="scr_submit" style="display:none;">
</form>
<input type="submit" id="delete_icon_none" style="display:none;">
<form action="ArchiveReqAddendumFileDownload" method="post">
    <input hidden type="text" name="Seq_Number" id="Seq_Number">
    <input hidden type="text" name="Section_Number" id="Section_Number">
    <input hidden type="text" name="Add_File_Name" id="Add_File_Name">
    <input hidden type="submit" id="addendum_file_submit" style="display:none;">
</form>
<input type="submit" id="delete_icon_none" style="display:none;">
<script>
    var myVar;
    function myFunction() {
        document.getElementById("overlay").style.display = "block";
        myVar = setTimeout(showPage,180);
    }
    function showPage() {
        document.getElementById("overlay").style.display = "none";
    }
</script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== script ========== -->
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacy_scr_download.js"></script>
<script src="js/Requirements/ArchiveRequirements/archiveRequirementReview/archiveReqReviewDataRetrieveAjaxCall.js"></script>
<%--          <script src="js/Requirements/ArchiveRequirements/addendumInfo/archiveReqAddendumDataRetrieve.js"></script>--%>
<script src="js/Requirements/ArchiveRequirements/addendumInfo/archiveReqAddendumFileDownload.js"></script>
<script type="text/javascript" src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacy_scr_retrieve_review.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
</html>

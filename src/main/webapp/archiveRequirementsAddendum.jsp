   <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D3Sixty - Archive Requirements</title>
    <!-- ========== Upload Icon ========== -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/Requirements/ArchiveRequirements/addendumInfo/archiveReqAddendumDataRetrieve.js"></script>
<%--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>--%>
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
                                                                         class="text-decoration-none breadcrumbtextinactive">Requirements</a>
                </li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveRequirementsIntroDetails.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Introduction</a>
                </li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsLegacyDetails.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Legacy
                    Application Info</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsRetentionDetails.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Retention
                    Details</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveBusinessRequirements.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Business
                    Requirements</a></li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveReqAbbrevation.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Abbreviations</a>
                </li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsDocumentRevisions.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Revisions</a>
                </li>
                <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Addendum</li>
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
            Addendum
        </div>
        <div class="mx-3" id="inputFieldsAddendum">

        </div>
        <%--hidden buttons--%>
        <button type="button"
                class="btn btn-primary pull-right" id="addendumAddId"
                data-bs-toggle="modal"
                data-bs-target="#addendumAddPopUp"
                style="display: none;">Add PopUp
        </button>
        <button type="button"
                class="btn btn-primary pull-right"
                id="addendumDeleteId" data-bs-toggle="modal"
                data-bs-target="#addendumDeletePopUp"
                style="display: none;">Delete PopUp
        </button>

        <button type="button"
                class="btn btn-primary pull-right" id="addendumViewUploadId"
                data-bs-toggle="modal"
                data-bs-target="#addendumViewPopUp"
                style="display: none;">View Uploaded Files PopUp
        </button>

        <button type="button"
                class="btn btn-primary pull-right" id="addendumUploadId"
                data-bs-toggle="modal"
                data-bs-target="#addendumUploadPopUp"
                style="display: none;">Upload Files
        </button>
        <%--button section--%>
        <div class="row my-3 mx-1">
            <div class="col-12  d-flex justify-content-center ">
                <button type="button" class="btn  tertiaryButton text-center"
                        onclick="location.href='archiveRequirementsDocumentRevisions.jsp';">Prev
                </button>
                <div class="dropdown mx-2">
                    <button type="button" class="btn secondaryButton text-center dropdown-toggle"
                            id="dropdownMenuButton1"
                            data-bs-toggle="dropdown" aria-expanded="false">Actions
                    </button>
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                        <li><a class="dropdown-item dropdown-styles" id="addendumAdd" data-bs-toggle="modal"
                               data-bs-target="#AddPopUp"> <i class="fas fa-plus iconColor"
                                                              aria-hidden="true">&nbsp;&nbsp;&nbsp;
                        </i>Add
                        </a></li>
                        <li>
                            <hr class="dropdown-divider m-0">
                        </li>
                        <li><a class="dropdown-item dropdown-styles" id="addendumDelete" href="#"><i
                                class="fas fa-trash-can text-danger" aria-hidden="true">&nbsp;&nbsp;&nbsp;
                        </i>Delete</a></li>
                    </ul>
                </div>
                <button type="submit" class="btn primaryButton text-center" id="addendumSave">Save</button>
                <button class="btn primaryButton text-center mx-2" id="addendumNext" disabled="true">
                    <a href='archiveRequirementsReviewDetails.jsp'
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
<!-- Add popup -->
<div class="modal fade" id="addendumAddPopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Add Input Field</h5>
                <button type="button" id="addendumAddClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-8">
                                <label class="control-label" for="formInput526">Label:</label>
                                <input type="text" id="addendumLabelId" class="form-control"
                                       name="addendumLabelName" required>
                            </div>
                        </div>
                    </div>
                    <br/> <input type="text" id="addendumAddSeqNum" name="" value=""
                                 style="display: none;"/>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn   tertiaryButton text-center"
                        data-bs-dismiss="modal" id="closeIdAddendum" aria-label="Close">Cancel
                </button>
                <button type="button" id="addendumAddSubmit"
                        class="btn  primaryButton text-center" data-bs-dismiss="modal">Submit
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Delete PopUp -->
<div class="modal fade" id="addendumDeletePopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
                <button type="button" id="addendumDeleteClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p>Do you want to delete this Row permanently?</p>
                        <input type="hidden" id="addendumDeleteSeq"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        id="closeAddendumIdDelete" data-bs-dismiss="modal"
                        aria-label="Close">No
                </button>
                <button type="button" id="addendumDeleteSubmit"
                        class="btn  primaryButton text-center submitDisableAddendum"
                        data-bs-dismiss="modal">Yes
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Delete Uploaded Files PopUp -->

<button type="button" class="btn btn-primary"
        id="uploaded_files_delete_btn" data-bs-toggle="modal"
        data-bs-target="#LegacySCRDeletePopUp" style="display: none;"></button>
<!-- View Uploaded Files PopUp -->

<div class="modal fade" id="addendumViewPopUp" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel"
                    style="color: white;">View Uploaded Files</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body" data-bs-target="">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped"
                           id="addendum_datatable">
                        <thead class="text-center">
                        <tr>
                            <th scope='col'>File Name</th>
                            <th scope='col'>Action</th>
                        </tr>
                        </thead>
                        <tbody class="Uploaded_Files_List">
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn tertiaryButton text-center"
                            data-bs-dismiss="modal">Close
                    </button>
                </div>
            </div>
        </div>
    </div>
    <form action="ArchiveReqAddendumFileDownload" method="post">
        <input type="hidden" id="Seq_Number" name="Seq_Number">
        <input type="hidden" id="Section_Number" name="Section_Number">
        <input type="hidden" id="Add_File_Name" name="Add_File_Name">
        <input
                type="submit" id="addendum_file_submit" style="display: none;">
    </form>
    <input type="submit" id="addendum_deletegrid_update" style="display: none;">
</div>

<div class="modal fade" id="addendumUploadPopUp" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel11"
                    style="color: white;">Upload Files</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body" data-bs-target="">
                <div class="container fileClass">
                    <form action="" method="post"
                          enctype="multipart/form-data">
                        <div class="fileClass">
                            <label for="upload"> <input type="file"
                                                        id="fileUpload" multiple>
                            </label>
                            <input type="text" id="seq_no_section_insert" name="seq_no_section_insert"
                                   style="display:none;">
                        </div>
                        <div class="files fileClass">
                            <h6>
                                <b>Files Selected</b>
                            </h6>
                            <ul id="FileList"></ul>
                        </div>
                        <input type="button" value="Upload"
                               class="btn btn-primary" name="submit"
                               id="UploadFiles"/>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        data-bs-dismiss="modal">Close
                </button>
            </div>
        </div>
    </div>
</div>
<form action="legacy_scr_download" method="post">
    <input type="hidden" id="File_Name111" name="File_Name"> <input
        type="submit" id="scr_submit111" style="display: none;">
</form>
<input type="submit" id="deletegrid_update111" style="display: none;">
<div class="modal fade" id="LegacySCRDeletePopUp" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Delete File</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p style="font-size: 14px;">Do you want to Delete this File
                            Permanently?</p>
                        <input type="hidden" id="Delete_Seq_Number" name="Delete_Seq_Number">
                        <input type="hidden" id="Delete_Section_Number" name="Delete_Section_Number">
                        <input type="hidden" id="Delete_File_Name" name="Delete_File_Name">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        data-bs-dismiss="modal">No
                </button>
                <button type="button" class="btn primaryButton text-center"
                        data-bs-dismiss="modal" id="addendum_scr_delete_submit">Yes
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
<script src="js/notification/notification.js"></script>
<script src="js/Requirements/ArchiveRequirements/addendumInfo/archiveReqAddendumAddAjaxCall.js"></script>
<script src="js/Requirements/ArchiveRequirements/addendumInfo/archiveReqAddendumDeleteAjaxCall.js"></script>
<script src="js/Requirements/ArchiveRequirements/addendumInfo/archiveReqAddendumSaveAjaxCall.js"></script>
<script src="js/Requirements/ArchiveRequirements/addendumInfo/archiveReqAddendumFileUploadAjaxCall.js"></script>
<script src="js/Requirements/ArchiveRequirements/addendumInfo/archiveReqAddendumFileDownload.js"></script>
<script src="js/Requirements/ArchiveRequirements/addendumInfo/archiveReqAddendumFileDelete.js"></script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== Toaster ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
</body>
</html>
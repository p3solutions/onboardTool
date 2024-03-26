<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>D3Sixty - Archive Requirements</title>
    <!-- ========== PAGE STYLES ========== -->

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- LegacyApplicationInfo -->
    <script type="text/javascript"
            src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/archiveLegacyDataRetrieveAjaxCall.js"></script>
    <!-- Archive Environment Info  -->
    <script type="text/javascript"
            src="js/Requirements/ArchiveRequirements/LegacyAppInfo/ArchiveEnvironmentInfo/archiveEnvironmentInfoDataRetrieve.js"></script>
    <!-- ========== SELECT TAG IMPORT ========== -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
          referrerpolicy="no-referrer" />
<%--    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>--%>
</head>
<style>
    /*.required_fie:after {*/
    /*    content: " *";*/
    /*    color: red;*/
    /*}*/

    .secondaryButtonUpload {
        font-family: 'Roboto' !important;
        font-size: 14px !important;
        font-weight: 500 !important;
        line-height: 16px !important;
        letter-spacing: 0em;
        background-color: #2a3f57 !important;
        color: #FFFFFF !important;
        width: 160px !important;
        height: 40px !important;
        border-radius: 6px;
    }

    .secondaryButtonUpload:hover {
        background-color: #2a3f57;
        color: #FFFFFF;
    }
</style>

<body class="top-navbar-fixed">

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
                <li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveRequirementsIntroDetails.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Introduction </a>
                </li>
                <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Legacy Application
                    Info
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

<form class="form-signin" name="loginForm" method="post">

    <div class="container-fluid px-3 my-5">
        <div class="card">
            <div class="card-header Card-Header" id="cd-header">
                Legacy Application Information
            </div>
            <div class="accordion m-3 " id="accordionExample">
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingOne">
                        <button class="accordion-button " type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                            Application Info
                        </button>
                    </h2>
                    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="row row-cols-1 row-cols-md-2 gx-5 g-3" id="inputFieldsAppInfo">

                            </div>
                            <div class="col-12 d-flex justify-content-center my-4 px-3">
                                <button type="button" class="btn secondaryButton text-center dropdown-toggle mx-2"
                                        data-bs-toggle="dropdown"
                                        aria-expanded="false">Actions
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item dropdown-styles" id="add" data-bs-toggle="modal"
                                           data-bs-target="#LegacyAddPopUp"><i
                                            class="fa-solid fa-plus iconColor"></i>&nbsp;&nbsp;&nbsp;Add</a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider m-0">
                                    <li><a class="dropdown-item dropdown-styles" id="EditLegacy"><i class="fa-solid fa-pencil iconColor"
                                    ></i>&nbsp;&nbsp;&nbsp;Edit</a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider m-0">
                                    </li>
                                    <li><a class="dropdown-item dropdown-styles" id="DeleteLegacy"><i
                                            class="fa-solid fa-trash-can text-danger"></i>&nbsp;&nbsp;&nbsp;Delete</a>
                                    </li>
                                </ul>
                                <button type="submit" class="btn primaryButton text-center " id="legacyAppInfoSave">
                                    Save
                                </button>
                            </div>
                            <button type="button"
                                    class="btn btn-primary pull-right"
                                    id="editpopup_btn" data-bs-toggle="modal"
                                    data-bs-target="#LegacyEditPopUp"
                                    style="display: none;">Edit PopUp
                            </button>
                            <button type="button"
                                    class="btn btn-primary pull-right"
                                    id="deletepopup_btn" data-bs-toggle="modal"
                                    data-bs-target="#LegacyDeletePopUp"
                                    style="display: none;">Delete PopUp
                            </button>
                        </div>
                    </div>
                </div>
                <!-- Archive Environment Information -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingTwo">
                        <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                            Archive Environment Information
                        </button>
                    </h2>
                    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body">
                            <div class="table-responsive" id="inputFieldsEnv">
                                <table class="table table-bordered ">
                                    <thead class="text-center">
                                    <tr>
                                        <th scope="col">Dev DB Name</th>
                                        <th scope="col">Test DB Name</th>
                                        <th scope="col">Stage DB Name</th>
                                        <th scope="col">Production DB Name</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody id="EnvironmentName" class="text-center align-middle">

                                    </tbody>
                                    <button type="button" class="btn btn-primary pull-right" id="EnvmntNameDeleteId"
                                            data-bs-toggle="modal" data-bs-target="#EnvmntNameDeletePopUp"
                                            style="display: none;">Delete PopUp
                                    </button>
                                </table>
                                <div class="col-12 d-flex justify-content-center mb-4">
                                    <button class="btn secondaryButton text-center mx-2" type="button"
                                            id="AddEnvmntName">Add
                                    </button>
                                    <button type="submit" class="btn primaryButton text-center " id="saveEnvmntName"
                                            disabled="true">Save
                                    </button>
                                    <button type="button" class="btn primaryButton text-center" id="OpportunityListbtn"
                                            onclick="window.location.href='IntakeDetails.jsp';"
                                            style="display: none;"></button>
                                </div>
                                <table class="table table-bordered ">
                                    <thead class="text-center">
                                    <tr>
                                        <th scope="col">Dev DB Server</th>
                                        <th scope="col">Test DB Server</th>
                                        <th scope="col">Stage DB Server</th>
                                        <th scope="col">Production DB Server</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody id="EnvironmentServer" class="text-center align-middle">

                                    </tbody>
                                    <button type="button"
                                            class="btn btn-primary pull-right"
                                            id="EnvmntServerDeleteId"
                                            data-bs-toggle="modal"
                                            data-bs-target="#EnvmntServerDeletePopUp"
                                            style="display: none;">Delete PopUp
                                    </button>
                                </table>
                                <div class="col-12 d-flex justify-content-center">
                                    <button class="btn secondaryButton text-center mx-2" type="button"
                                            id="AddEnvmntServer">Add
                                    </button>
                                    <button type="submit" class="btn primaryButton text-center" id="saveEnvmntServer"
                                            disabled="true">Save
                                    </button>
                                    <button type="button" class="btn primaryButton text-center" id="OpportunityListbtn"
                                            onclick="window.location.href='IntakeDetails.jsp';"
                                            style="display: none;"></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Legacy Application Screenshot -->
                <div class="accordion-item">
                    <h2 class="accordion-header" id="headingThree">
                        <button class="accordion-button collapsed " type="button" data-bs-toggle="collapse"
                                data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                            Legacy Application ScreenShots
                        </button>
                    </h2>
                    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
                         data-bs-parent="#accordionExample">
                        <div class="accordion-body" id="inputFieldsRoles">
                            <form action="" method="post"
                                  enctype="multipart/form-data">
                                <div class="mb-3 col-12 col-md-5 col-lg-4 col-xl-3 col-xxl-2">
                                    <input class="form-control" type="file" id="fileUpload" multiple>
                                </div>
                                <h6>
                                    <b>Files Selected</b>
                                </h6>
                                <ul id="FileList">

                                </ul>
                                <div>
                                    <input type="button" value="Upload" class="btn primaryButton text-center"
                                           id="UploadFiles"/>
                                    <button type="button" id="add_btn"
                                            class="btn secondaryButtonUpload text-center mx-2"
                                            data-bs-toggle="modal" data-bs-target="#Legacy_ScrPopUp">View Uploaded Files
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row my-3 mx-1">
                <div class="col-12  d-flex justify-content-center ">
                    <button type="button" class="btn  tertiaryButton text-center mx-2"
                            onclick="location.href='ArchiveRequirementsIntroDetails.jsp';">Prev
                    </button>
                    <button type="submit" class="btn secondaryButton text-center" id="edit">Edit</button>
                    <button type="submit" class="btn primaryButton text-center px-1 mx-2" id="complete"
                            disabled="true">Complete
                    </button>
                    <button class="btn primaryButton text-center"
                            onclick="location.href='archiveRequirementsRetentionDetails.jsp';" id="rolesNext">
                        <a href="javascript:;" class="text-decoration-none text-reset">Next</a>
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

<!-- Legacy Application Information Add popup -->

<div class="modal fade" id="LegacyAddPopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Add Input
                    Fields</h5>
                <button type="button" class="btn-close" id="Legacyaddclose_id"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div id="scrollbar">
                        <div class="row">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Label:</label>
                                    <input type="text" class="form-control" id="Legacyaddlabel"
                                           name="Legacylabel" required>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" id="Legacyproject_name" name="project_name"
                               value=""> <input type="text" id="Legacyappln_name"
                                                name="appln_name" value="" style="display: none;"> <input
                            type="text" id="Legacyservlet_name" name="servlet_name" value=""
                            style="display: none;">


                        <div class="row">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Type:</label>
                                    <select id="Legacytypes" class="selectpicker form-control" name="types"
                                            required>
                                        <option value="Text box">Text box</option>
                                        <option value="Check box">Check box</option>
                                        <option value="Radio box">Radio box</option>
                                        <option value="Dropdown">Dropdown</option>
                                        <option value="Datepicker">Datepicker</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row Legacyhidefield" id="Legacycheck"
                             style="display: none;">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Number
                                        of check boxes:</label> <input type="text" class="form-control"
                                                                       id="Legacycheck_number"
                                                                       name="Legacycheck_number">
                                </div>
                            </div>

                        </div>
                        <div class="row Legacyhidefield" id="Legacyradio"
                             style="display: none;">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Number
                                        of Radio boxes:</label> <input type="text" class="form-control"
                                                                       id="Legacyradio_number"
                                                                       name="Legacyradio_number">
                                </div>
                            </div>

                        </div>
                        <div class="row Legacyhidefield" id="Legacydrop"
                             style="display: none;">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Number
                                        of Options:</label> <input type="text" class="form-control"
                                                                   id="Legacydrop_number" name="Legacydrop_number">
                                </div>
                            </div>
                            <br/>
                        </div>

                        <div class="col-lg-12" id="Legacyoptions"></div>

                        <div class="row">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Mandatory:</label>
                                    <select id="Legacymandatory" class="selectpicker form-control"
                                            name="mandatory" required>
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br/>
                        <br/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn   tertiaryButton text-center"
                        data-bs-dismiss="modal" id="Legacyclose">Close
                </button>
                <button type="button" id="Legacysubmit" class="btn primaryButton text-center">Add
                    Fields
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Legacy Edit Popup -->

<div class="modal fade" id="LegacyEditPopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Edit Input
                    Field</h5>
                <button type="button" id="LegacyEditClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-8">
                                <label class="control-label" for="Legacy">Label:</label> <input
                                    type="text" class="form-control" id="LegacyLabelModify"
                                    name="Legacylabel" required>
                            </div>
                        </div>
                    </div>
                    <br/>
                    <input type="text" id="LegacySeqNum" name="" value=""
                           style="display: none;"> <input type="text"
                                                          id="EditSection" name="" value="" style="display: none;">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn   tertiaryButton text-center"
                        data-bs-dismiss="modal" aria-label="Close">Cancel
                </button>
                <button type="button" id="LegacyEditSubmit" class="btn primaryButton text-center"
                        data-bs-dismiss="modal">Submit
                </button>
            </div>
        </div>
    </div>
</div>


<!-- Legacy Delete PopUp -->
<div class="modal fade" id="LegacyDeletePopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
                <button type="button" id="LegacyEditClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p>Do you want to delete this Row permanently?</p>
                        <input type="hidden" id="LegacyDeleteSeq"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn   tertiaryButton text-center"
                        id="closeLegacyIdDelete" data-bs-dismiss="modal"
                        aria-label="Close">No
                </button>
                <button type="button" id="LegacyDeleteSubmit"
                        class="btn primaryButton text-center submitDisableDelete"
                        data-bs-dismiss="modal">Yes
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Environment Name Delete PopUp -->
<div class="modal fade" id="EnvmntNameDeletePopUp" tabindex="-1"
     role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
                <button type="button" id="EnvmntNameDeleteClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p>Do you want to delete this Row permanently?</p>
                        <input type="hidden" id="EnvmntNameDeleteSeq"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        id="closeEnvmntNameIdDelete" data-bs-dismiss="modal"
                        aria-label="Close">No
                </button>
                <button type="button" id="EnvmntNameDeleteSubmit"
                        class="btn primaryButton text-center submitDisableEnvmntName"
                        data-bs-dismiss="modal">Yes
                </button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="Legacy_ScrPopUp" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Legacy Application Screenshots</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body" data-bs-target="">
                <table class="table table-bordered table-striped"
                       id="legacy_datatable">
                    <thead class="text-center align-middle">
                    <tr>
                        <th scope="col">File Name</th>
                        <th scope="col">Action</th>
                    </tr>
                    </thead>

                    <tbody id="Legacy_Scr_List">

                    </tbody>
                </table>
                <div class="modal-footer">
                    <button type="button" class="btn  tertiaryButton text-center"
                            data-bs-dismiss="modal">Close
                    </button>
                </div>
            </div>
        </div>
    </div>
    <form action="legacy_scr_download" method="post">
        <input type="hidden" id="File_Name" name="File_Name"> <input
            type="submit" id="scr_submit" style="display: none;">
    </form>
    <input type="submit" id="deletegrid_update" style="display: none;">
</div>


<!-- Environment Server Delete PopUp -->
<div class="modal fade" id="EnvmntServerDeletePopUp" tabindex="-1"
     role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
                <button type="button" id="EnvmntNameDeleteClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p>Do you want to delete this Row permanently?</p>
                        <input type="hidden" id="EnvmntServerDeleteSeq"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        id="closeEnvmntServerIdDelete" data-bs-dismiss="modal"
                        aria-label="Close">No
                </button>
                <button type="button" id="EnvmntServerDeleteSubmit"
                        class="btn primaryButton text-center submitDisableEnvmntServer"
                        data-bs-dismiss="modal">Yes
                </button>
            </div>
        </div>
    </div>
</div>

<button type="button" class="btn btn-primary"
        id="legacy_scr_delete_popup" data-bs-toggle="modal"
        data-bs-target="#LegacySCRDeletePopUp" style="display: none;"></button>
<div class="modal fade" id="LegacySCRDeletePopUp" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel"
                >Delete File</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p style="font-size: 14px;">Do you want to Delete this File
                            Permanently?</p>
                        <input type="text" id="random_id" style="display: none;"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        data-bs-dismiss="modal">No
                </button>
                <button type="button" class="btn primaryButton text-center"
                        data-bs-dismiss="modal" id="legacy_scr_delete_submit">Yes
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<script type="text/javascript"
        src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>

<script src="js/notification/notification.js"></script>

<!-- Legacy Application Info  -->

<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/EditDeleteToggleLegacy.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/LegacyAddFeatureFunctionality.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/archiveLegacyAddAjaxcall.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/archiveReqLegacyEditDeleteAjaxCall.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyApplicationInfo/archiveLegacyAppInfoSaveAjaxCall.js"></script>


<!-- Archive Environment Info  -->

<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyAppInfo/ArchiveEnvironmentInfo/archiveEnvironmentInfoSaveAjaxCall.js"></script>

<!-- Legacy Application Screenshot -->
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacyApplicationScreenshotsUploadAjaxCall.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacy_scr_retrieve.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacy_scr_download.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacy_scr_delete.js"></script>
<script type="text/javascript"
        src="js/Requirements/ArchiveRequirements/LegacyAppInfo/legacyAppScreenshot/legacyAppInfoFileUpload.js"></script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
        href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        rel="stylesheet">

</body>
</html>
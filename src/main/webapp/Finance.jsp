<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css"
          media="screen">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">

    <title>D3Sixty - Finance </title>
    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">

    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/icheck/skins/line/red.css">
    <link rel="stylesheet" href="css/icheck/skins/line/green.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
    <link rel="stylesheet" href="css/UserInfo/userinfo.css">

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">


    <!-- =========== Header Icon ========= -->
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <link rel="stylesheet" href="css/headerIcon/headerIcon.css"
          media="screen">

    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <link
            href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
            rel="stylesheet">

    <link rel="stylesheet" href="css/Finance/Finance.css">
    <!-- Finance ApplicationInfo -->
    <script type="text/javascript" src="js/Finance/FinanceTemplateRetrive.js"></script>



    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <link rel="stylesheet" href="js_in_pages/requirements.css"
          type="text/css" />
    <link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
          media="screen">
    <link rel="stylesheet" href="css/Responsive/responsive.css"
          media="screen">


<style>
    #suggestionDropdown {
        z-index: 1000; /* Adjust the value based on your layout */
        position: absolute;
    }

    /*#suggestionDropdown{*/
    /*    margin-left: 25px;*/
    /*}*/
    /*.suggestionEnabled1{*/
    /*    max-height: 50px;*/
    /*    max-width: 200px ;*/
    /*    overflow-y: auto;*/
    /*    border: 1px solid #ccc;*/
    /*}*/

    /*.suggestionEnabled .suggestion:hover {*/
    /*    background-color: #1565c0 ;*/
    /*    color: white;*/
    /*}*/
    #nameInput{
        outline: none;
        border: none;
        border-bottom: 1px solid #959595;
        -o-border-image: initial;
        border-image: initial;
        border-radius: 0;
        color: black !important;
        text-indent: 12px;
        background-color: transparent !important;
        box-shadow: none  !important;
        height: 28px;
        padding-bottom: 3px;
        width: 240px;
        margin-left: 25px;
    }
    #labelhead{
        margin-left: 20px;
    }
    #til

</style>
</head>

<body class="top-navbar-fixed">

<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Add Finance JSP PAGE-----[INFO]"); %>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="onboard.DBconnection"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.owasp.encoder.Encode"%>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
    DBconnection dBconnection = new DBconnection();

    if (session.getAttribute("username")==null)
    {
        response.sendRedirect("Login.jsp");

    }
    else {
%>
<form class="form-signin" name="loginForm" method="post">
    <div class="main-wrapper">
        <%@include file="Nav-Bar.jspf"%>
        <nav class="nav nav-height-70 nav-font" id="bg-color"
             style="font-size: 14px;">
            <div class="container-fluid" id="container-fluid-margin">
                <div class="row" id="d3s-mt-10">
                    <div class="col-lg-12 col-md-12">
                        <div class="sub-title" style="color: #fff">
                            <a href="OpportunityList.jsp" id="sitetitle1"
                               style="color: #fff"><span class="glyphicon glyphicon-home"></span>
                                Home</a> >> <a href="FinanceList.jsp" id="sitetitle2"
                                               style="color: #fff">Finance</a> >> <a href="#" id="sitetitle3"
                                               style="color: #fff"></a>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

<% } %>
        <input type="hidden" name="selectedId" id="selectedId" value="">
        <input type="hidden" name="selectedName" id="selectedName" value="">
        <%
            String Opportunity = request.getParameter("selectedName");
            String ID = request.getParameter("selectedId");

          // Set selectedId and selectedName into the session
            session.setAttribute("seId", ID);
            session.setAttribute("seName", Opportunity);
        %>


        <div class="content-wrapper">
            <div class="content-container">
                <!-- Projects List Start -->
                <div class="main-page">
                    <section class="wizard-section">
                        <div class="row">
                            <div class="container" id="module_header">
                                <%
                                    String initiate = (String) session.getAttribute("Ideation and Initiate");
                                    String plan = (String) session.getAttribute("Plan");
                                    String execute = (String) session.getAttribute("Execute");
                                    String hypercare = (String) session.getAttribute("Closure");
                                    if (initiate == null)
                                        initiate = "0";
                                    if (plan == null)
                                        plan = "0";
                                    if (execute == null)
                                        execute = "0";
                                    if (hypercare == null)
                                        hypercare = "0";
                                %>
                                <br />
                                <br />
                                <br />


                                <div class="tab-pane" role="tabpanel" id="step4">
                                    <!-- Application Informations -->
                                    <div class="card-container-2 card">

                                        <div class="card-header" id="cd-header"> Finance Information</div>
<%--                                        <label id="labelhead">Enter the name of the Application: </label>--%>
<%--                                        <input type="text" id="nameInput" name = "appName" placeholder="Enter a name">--%>
<%--                                        <button id="refreshButton">Refresh Page</button>--%>

                                        <div id="collapse4" class="panel-collapse ">
                                            <div id="collapse1" class="panel-collapse " name="collapse">
                                                <div class="panel-body">
                                                    <div id="inputFieldsAssessment">
                                                        <!-- Application Info -->
                                                        <div class="panel panel-default">
                                                            <div class="card-header" id="cd-header">
                                                                <h4 class="panel-title">
                                                                    <a class="collapsed" data-bs-toggle="collapse"
                                                                       data-bs-parent="#panels1" href="">Application Finance
                                                                        Info</a>
                                                                </h4>
                                                            </div>
                                                            <div id="suggestionDropdown"></div>
                                                            <div id="collapse5" class="panel-collapse ">
                                                                <div class="panel-body">
                                                                    <div id="collapse1"
                                                                         class="panel-collapse collapse show" name="collapse">
                                                                        <div class="panel-body">
                                                                            <div id="inputFieldsAppInfo"></div>
                                                                            <div class="col-md-12">

                                                                                <div class="col-12" align="end">

                                                                                    <div class="dropdown">
                                                                                        <button type="button"
                                                                                                class="btn btn-secondary dropdown-toggle"
                                                                                                id="dropdownMenuButton1"
                                                                                                data-bs-toggle="dropdown" aria-expanded="false">Actions</button>
                                                                                        <ul class="dropdown-menu"
                                                                                            aria-labelledby="dropdownMenuButton1">
                                                                                            <li><a class="dropdown-item dropDown-font"
                                                                                                   id="add" href="#" data-bs-toggle="modal"
                                                                                                   data-bs-target="#LegacyAddPopUp"> <i
                                                                                                    class="fas fa-plus" aria-hidden="true">&nbsp;&nbsp;&nbsp;
                                                                                            </i>Add
                                                                                            </a></li>
                                                                                            <li><a class="dropdown-item dropDown-font"
                                                                                                   id="EditLegacy" href="#"><i
                                                                                                    class="fas fa-edit" aria-hidden="true">&nbsp;&nbsp;
                                                                                            </i>Edit</a></li>
                                                                                            <li><a class="dropdown-item dropDown-font"
                                                                                                   id="DeleteLegacy" href="#"><i
                                                                                                    class="fas fa-trash" aria-hidden="true">&nbsp;&nbsp;&nbsp;
                                                                                            </i>Delete</a></li>

                                                                                        </ul>
                                                                                    </div>
                                                                                    <button type="submit" class="btn btn-primary"
                                                                                            id="legacyAppInfoSave">Save</button>

                                                                                    <button type="button"
                                                                                            class="btn btn-primary pull-right"
                                                                                            id="editpopup_btn" data-bs-toggle="modal"
                                                                                            data-bs-target="#LegacyEditPopUp"
                                                                                            style="display: none;">Edit PopUp</button>
                                                                                    <button type="button"
                                                                                            class="btn btn-primary pull-right"
                                                                                            id="deletepopup_btn" data-bs-toggle="modal"
                                                                                            data-bs-target="#LegacyDeletePopUp"
                                                                                            style="display: none;">Delete PopUp</button>
                                                                                    <!--  <button type="button" class="btn btn-primary pull-right" id="TriageSummaryListbtn" onclick ="window.location.href='IntakeDetails.jsp';"style="display:none;"></button> -->
                                                                                </div>
                                                                            </div>


                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- Legacy Application Screenshot -->
                                                            <div class="panel panel-default">
                                                                <div class="card-header" id="cd-header">
                                                                    <h4 class="panel-title">
                                                                        <a class="collapsed" data-bs-toggle="collapse"
                                                                           data-bs-parent="#panels1" href="#collapse3">Finance
                                                                            Application Screenshots</a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapse3" class="panel-collapse collapse">
                                                                    <div class="panel-body">
                                                                        <div id="collapse1"
                                                                             class="panel-collapse collapse show" name="collapse">
                                                                            <div class="panel-body">
                                                                                <div id="inputFieldsRoles">

                                                                                    <div class="container fileClass">
                                                                                        <form action="" method="post"
                                                                                              enctype="multipart/form-data">
                                                                                            <div class="fileClass">
                                                                                                <label for="upload"> <input type="file"
                                                                                                                            id="fileUpload" multiple> Upload Files
                                                                                                </label>
                                                                                            </div>
                                                                                            <div class="files fileClass">
                                                                                                <h6>
                                                                                                    <b>Files Selected</b>
                                                                                                </h6>
                                                                                                <ul id="FileList"></ul>
                                                                                            </div>
                                                                                            <input type="button" value="Upload"
                                                                                                   class="btn btn-primary" name="submit"
                                                                                                   id="UploadFiles" />
                                                                                        </form>
                                                                                    </div>
                                                                                </div>
                                                                                <button type="button" id="add_btn"
                                                                                        class="btn btn-primary" href="#"
                                                                                        data-bs-toggle="modal"
                                                                                        data-bs-target="#Legacy_ScrPopUp"
                                                                                        style="margin: 5px">View Uploaded Files</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>

                                                                <div class="col-md-12">
                                                                    <br />
                                                                    <div class="col-md-4">
                                                                        <button type="button" class="btn btn-secondary"
                                                                                style="padding-top: 5px; padding-left: 10px; float: left;"
                                                                                onclick="clearSessionItem()">Back</button>
                                                                    </div>
                                                                    <div class="col-md-8 dropup" align="end">
                                                                        <button type="submit" class="btn btn-primary"
                                                                                id="complete" onclick="clearSessionItem()">Submit</button>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                        </div>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>


                                    </div>
                                </div>
                            </div>
                            <!-- /.row -->

                        </div>

                    </section>
                    <!-- /.section -->

                </div>
                <!-- /.main-page -->
                <!-- Project List End -->
            </div>
            <!-- /.content-container -->

            <!-- /.main-wrapper -->
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
        </div>
    </div>
</form>

<!-- Legacy Application Information Add popup -->

<div class="modal" id="LegacyAddPopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
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
                                    <select id="Legacytypes" class="form-select" name="types"
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
                                                                       id="Legacycheck_number" name="Legacycheck_number">
                                </div>
                            </div>

                        </div>
                        <div class="row Legacyhidefield" id="Legacyradio"
                             style="display: none;">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Number
                                        of Radio boxes:</label> <input type="text" class="form-control"
                                                                       id="Legacyradio_number" name="Legacyradio_number">
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
                            <br />
                        </div>

                        <div class="col-lg-12" id="Legacyoptions"></div>

                        <div class="row">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Mandatory:</label>
                                    <select id="Legacymandatory" class="form-select"
                                            name="mandatory" required>
                                        <option>Yes</option>
                                        <option>No</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <br />
                        <br />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="Legacysubmit" class="btn btn-primary">Add
                    Fields</button>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal" id="Legacyclose">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Legacy Edit Popup -->

<div class="modal" id="LegacyEditPopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
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
                    <br />
                    <input type="text" id="LegacySeqNum" name="" value=""
                           style="display: none;"> <input type="text"
                                                          id="EditSection" name="" value="" style="display: none;">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="LegacyEditSubmit" class="btn btn-primary"
                        data-bs-dismiss="modal">Submit</button>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal" aria-label="Close">Cancel</button>

            </div>
        </div>
    </div>
</div>



<!-- Legacy Delete PopUp -->
<div class="modal" id="LegacyDeletePopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
                <button type="button" id="LegacyEditClose" class="btn-close"
                        data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p>Do you want to delete this Row permanently?</p>
                        <input type="hidden" id="LegacyDeleteSeq" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" id="LegacyDeleteSubmit"
                        class="btn btn-primary submitDisableDelete"
                        data-bs-dismiss="modal">Yes</button>
                <button type="button" class="btn btn-secondary"
                        id="closeLegacyIdDelete" data-bs-dismiss="modal"
                        aria-label="Close">No</button>
            </div>
        </div>
    </div>
</div>


<div class="modal" id="Legacy_ScrPopUp" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" style="background-color: #1565c0;">
                <h5 class="modal-title" id="exampleModalLabel"
                    style="color: white;">Finance Application Screenshots</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body" data-bs-target="">
                <table class="table table-bordered table-striped"
                       id="legacy_datatable">

                    <thead>

                    <tr>
                        <th style="text-align: center;">File Name</th>
                        <th style="text-align: center;">Action</th>
                    </tr>
                    </thead>

                    <tbody id="Legacy_Scr_List">

                    </tbody>
                </table>
                <div class="modal-footer">

                    <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">Close</button>

                </div>
            </div>
        </div>
    </div>
    <form action="Finance_scr_download" method="post">
        <input type="hidden" id="File_Name" name="File_Name"> <input
            type="submit" id="scr_submit" style="display: none;">

    </form>
    <input type="submit" id="deletegrid_update" style="display: none;">

</div>

</div>
</div>
</div>



<%--finance screenshot delete--%>

<button type="button" class="btn btn-primary"
        id="legacy_scr_delete_popup" data-bs-toggle="modal"
        data-bs-target="#LegacySCRDeletePopUp" style="display: none;"></button>

<div class="modal" id="LegacySCRDeletePopUp" tabindex="-1"
     aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="width: auto; height: 250px;">
            <div class="modal-header" style="background-color: #1565c0;">
                <h5 class="modal-title" id="exampleModalLabel"
                    style="color: white;">Delete File</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p style="font-size: 14px;">Do you want to Delete this File
                            Permanently?</p>
                        <input type="text" id="random_id" style="display: none;" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary"
                        data-bs-dismiss="modal" id="legacy_scr_delete_submit">Yes</button>
                <button type="button" class="btn btn-secondary"
                        data-bs-dismiss="modal">No</button>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        // Find the link with id "sitetitle1" and text "Add Finance"
        var addFinanceLink = $('a#sitetitle1:contains("Add Finance")');

        // Append the "hello" text after the link
        addFinanceLink.after(" >> hello");
    });

</script>

<%--session attribute issue--%>
<script>
    function clearSessionItem() {
        // Specify the key of the item you want to remove
        var itemKey = "APPID";
        var  itemKey1 = "APPNAME";

        // Remove the specific item from sessionStorage
        sessionStorage.removeItem(itemKey);
        sessionStorage.removeItem(itemKey1);

        // Optionally, you can perform additional actions after removing the item
        console.log("Item with key '" + itemKey + "' removed from sessionStorage.");

        // Refresh the page or navigate to another page if needed
        location.href='FinanceList.jsp';
    }
</script>
<script>
    document.getElementById('complete').addEventListener('click', function() {
        // Trigger the click events for button 1 and button 2
        document.getElementById('legacyAppInfoSave').click();
        document.getElementById('UploadFiles').click();
    });
</script>

<!-- Active Icon Color changes  -->
<script>
    $(document).on('mouseenter','.active1', function(){

        $('.activeIcon').css('color','#1565c0');

    });

    $(document).on('mouseleave','.active1', function(){

        $('.activeIcon').css('color','#fff');

    });
    $("#status").prop("disabled", true);
</script>
<%@include file="Footer.jspf"%>
<!-- ========== COMMON JS FILES ========== -->
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/jquery-ui/jquery-ui.min.js"></script>
<script src="js/bootstrap/bootstrap.min.js"></script>
<script src="js/pace/pace.min.js"></script>

<script src="js/iscroll/iscroll.js"></script>


<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script src="js/waypoint/waypoints.min.js"></script>
<script src="js/counterUp/jquery.counterup.min.js"></script>
<script src="js/amcharts/amcharts.js"></script>
<script src="js/amcharts/serial.js"></script>
<script src="js/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="js/amcharts/plugins/export/export.css"
      type="text/css" media="all" />
<script src="js/amcharts/themes/light.js"></script>
<script src="js/toastr/toastr.min.js"></script>
<script src="js/icheck/icheck.min.js"></script>
<script src="js/bootstrap-tour/bootstrap-tour.js"></script>

<!-- ========== THEME JS ========== -->
<script src="js/production-chart.js"></script>
<script src="js/traffic-chart.js"></script>
<script src="js/task-list.js"></script>

<!-- ========== THEME JS ========== -->

<script id="scripttag"></script>

<!-- ========== PAGE JS FILES ========== -->
<script src="js/prism/prism.js"></script>
<script type="text/javascript"
        src="js/date-picker/bootstrap-datepicker.js"></script>
<script type="text/javascript"
        src="js/date-picker/jquery.timepicker.js"></script>
<script type="text/javascript" src="js/date-picker/datepair.js"></script>
<script type="text/javascript" src="js/date-picker/moment.js"></script>

<script src="js/notification/notification.js"></script>

<!-- Application Info  -->
<script type="text/javascript" src="js/Finance/Session_ID_Name&Retrive.js"></script>
<script type="text/javascript" src="js/Finance/FinaceAddAppInfoSaveAjaxCall.js"></script>
<script type="text/javascript" src="js/Finance/FinanceAddFieldEditDeleteAjaxCall.js"></script>
<script type="text/javascript" src="js/Finance/FinanceAddAjaxcall.js"></script>
<script type="text/javascript" src="js/Finance/FinanceAddFeatureFunctionality.js"></script>
<script type="text/javascript" src="js/Finance/EditDeleteToggleFinanceAdd.js"></script>

<!-- Application Screenshot -->
<!-- <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script type="text/javascript" src="js/Finance/Screenshot/FinanceApplicationScreenshotsUploadAjaxCall.js"></script>
<script type="text/javascript" src="js/Finance/Screenshot/Finance_scr_retrieve.js"></script>
<script type="text/javascript" src="js/Finance/Screenshot/Finance_scr_download.js"></script>
<script type="text/javascript" src="js/Finance/Screenshot/Finance_scr_delete.js"></script>
<script type="text/javascript" src="js/Finance/Screenshot/FinanceAppInfoFileUpload.js"></script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
        href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        rel="stylesheet">

</body>
</html>
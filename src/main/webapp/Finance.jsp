<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>D3Sixty - Finance </title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
          referrerpolicy="no-referrer" />
    <!-- ========== Toastr ========== -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

    <!-- ========== COMMON JS FILES ========== -->
        <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Finance ApplicationInfo -->
    <script type="text/javascript" src="js/Finance/FinanceTemplateRetrive.js"></script>

</head>

<style>
    .form-group,
    .form-select {
        font-family: 'Roboto';
        font-size: 14px;
        box-shadow: none !important;
    }
    .accordion-button{
        background-color: #AED9F9 !important;
        color: #FFFFFF !important ;
        font-family: 'Roboto';
        font-size: 16px;
        font-weight: 500;
        line-height: 19px;
        letter-spacing: 0em;
        text-align: left;
        box-shadow: none !important;
    }

    div.financeSuggestionScrollBar {
        height: 110px;
        overflow-y:auto;
        /*margin-left: -10px;*/
    }
    div.suggestion {
        border: 1px solid #d4d4d4;
        border-top: none;
        max-height: 150px;
        overflow-y: auto;
    }
    div.suggestion {
        padding: 10px;
        cursor: pointer;
    }
    div.suggestion:hover {
        background-color: #e9e9e9;
    }
</style>
<body>

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
<%--<form class="form-signin" name="loginForm" method="post">--%>
        <%@include file="Nav-Bar.jspf"%>
<div class="row m-0">
    <div class="col p-0">
        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
            <ol class="breadcrumb px-4 m-0 ">
                <li class="breadcrumb-item inactive my-3 text-light ">
                    <a href="#" class="text-decoration-none breadcrumbtextinactive">Home</a>
                </li>
                <li class="breadcrumb-item inactive my-3 text-light ">
                    <a href="FinanceList.jsp" class="text-decoration-none breadcrumbtextinactive">Finance List</a>
                </li>
                <li class="breadcrumb-item active my-3 breadcrumbtextactive" id="Current-page" aria-current="page"></li>
            </ol>
        </nav>
        </div></div></div>

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

<div class="container-fluid px-4 my-5">
    <div class="card">
        <div class="card-header Card-Header" id="cd-header">Finance Information
        </div>

        <div class="accordion m-3 " id="accordionExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button " type="button" data-bs-toggle="collapse"
                            data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Application Finance Info
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
                     data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <div class="row row-cols-1 row-cols-md-2 gx-5 g-3" id="inputFieldsAppInfo">
<%--                            <div id="suggestionDropdown" class="financeSuggestionScrollBar">--%>

                        </div>
                            <div id="suggestionDropdown" >
                        </div>
                        <div class="row my-3 mx-1 hidden-contents">
                            <div class="col-12  d-flex justify-content-center " >
                                <div class="dropdown">

                                    <button class="btn secondaryButton text-center dropdown-toggle" type="button"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                        Action
                                    </button>
                                    <ul class="dropdown-menu ">
                                        <li><a class="dropdown-item dropdown-styles" id="add" data-bs-toggle="modal"
                                               data-bs-target="#LegacyAddPopUp"><i
                                                class="fa-solid fa-plus iconColor"></i>&nbsp;&nbsp;&nbsp;Add</a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider m-0">
                                        </li>
                                        <li><a class="dropdown-item dropdown-styles" id="EditLegacy" ><i
                                                class="fa-solid fa-pencil iconColor"></i>&nbsp;&nbsp;&nbsp;Edit</a>
                                        </li>
                                        <li>
                                            <hr class="dropdown-divider m-0">
                                        </li>
                                        <li><a class="dropdown-item dropdown-styles" id="DeleteLegacy" ><i
                                                class="fa-solid fa-trash-can text-danger"></i>&nbsp;&nbsp;&nbsp;Delete</a>
                                        </li>
                                    </ul>
                                </div>




                                <!-- end of dropdown  -->
                                <button type="submit" class="btn primaryButton text-center mx-2"
                                        id="legacyAppInfoSave">Save</button>
                                <button type="button" class="btn btn-primary pull-right" id="editpopup_btn"
                                        data-bs-toggle="modal" data-bs-target="#LegacyEditPopUp"
                                        style="display: none;">Edit PopUp</button>
                                <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn"
                                        data-bs-toggle="modal" data-bs-target="#LegacyDeletePopUp"
                                        style="display: none;">Delete PopUp</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="accordion-item hidden-contents">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed " type="button"
                            data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false"
                            aria-controls="collapseTwo">
                        Finance Application Screenshots
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
                     data-bs-parent="#accordionExample">
                    <div class="accordion-body" id="inputFieldsRoles">
                        <div class="mb-3 col-3">
                            <input class="form-control" type="file" id="fileUpload" multiple>
                        </div>
                        <h6>
                            <b>Files Selected</b>
                        </h6>
                        <ul id="FileList">

                        </ul>
                        <div>
                            <input type="button" value="Upload" class="btn primaryButton text-center" name="submit"
                                   id="UploadFiles" />
                            <button type="button" id="add_btn" class="btn primaryButton text-center w-auto mx-2" href="#"
                                    data-bs-toggle="modal" data-bs-target="#Legacy_ScrPopUp">View Uploaded
                                Files</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row my-3 mx-1">
            <div class="col-12  d-flex justify-content-center ">
                <button type="button" class="btn buttonFrame tertiaryButton text-center"
                        onclick="clearSessionItem()">Back</button>
                <button type="submit" class="btn primaryButton text-center mx-2" id="complete"
                        onclick="clearSessionItem()">Submit</button>
            </div>
        </div>
    </div>
</div>



            <%

            %>
<%--</form>--%>
<!-- modal -->

<!-- Finance Application Information Add popup -->
<div class="modal fade" id="LegacyAddPopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Add Input
                    Fields</h5>
                <button type="button" class="btn-close" id="Legacyaddclose_id" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div id="scrollbar">
                        <div class="row">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Label:</label>
                                    <input type="text" class="form-control" id="Legacyaddlabel" name="Legacylabel"
                                           required>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" id="Legacyproject_name" name="project_name" value=""> <input
                            type="text" id="Legacyappln_name" name="appln_name" value="" style="display: none;">
                        <input type="text" id="Legacyservlet_name" name="servlet_name" value=""
                               style="display: none;">
                        <div class="row">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Type:</label>
                                    <select id="Legacytypes" class="form-select" name="types" required>
                                        <option value="Text box">Text box</option>
                                        <option value="Check box">Check box</option>
                                        <option value="Radio box">Radio box</option>
                                        <option value="Dropdown">Dropdown</option>
                                        <option value="Datepicker">Datepicker</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row Legacyhidefield" id="Legacycheck" style="display: none;">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Number
                                        of check boxes:</label> <input type="text" class="form-control"
                                                                       id="Legacycheck_number" name="Legacycheck_number">
                                </div>
                            </div>
                        </div>
                        <div class="row Legacyhidefield" id="Legacyradio" style="display: none;">
                            <div class="form-group-popup">
                                <div class="col-lg-12">
                                    <label class="control-label" for="formInput526">Number
                                        of Radio boxes:</label> <input type="text" class="form-control"
                                                                       id="Legacyradio_number" name="Legacyradio_number">
                                </div>
                            </div>
                        </div>
                        <div class="row Legacyhidefield" id="Legacydrop" style="display: none;">
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
                                    <select id="Legacymandatory" class="form-select" name="mandatory" required>
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
                <button type="button" class="btn buttonFrame tertiaryButton text-center" data-bs-dismiss="modal"
                        id="Legacyclose">Close</button>
                <button type="button" id="Legacysubmit" class="btn primaryButton text-center">Add
                    Fields</button>
            </div>
        </div>
    </div>
</div>

<!-- Finance Edit Popup -->
<div class="modal fade" id="LegacyEditPopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Edit Input
                    Field</h5>
                <button type="button" id="LegacyEditClose" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-8">
                                <label class="control-label" for="Legacy">Label:</label> <input type="text"
                                                                                                class="form-control" id="LegacyLabelModify" name="Legacylabel" required>
                            </div>
                        </div>
                    </div>
                    <br />
                    <input type="text" id="LegacySeqNum" name="" value="" style="display: none;"> <input type="text"
                                                                                                         id="EditSection" name="" value="" style="display: none;">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn buttonFrame tertiaryButton text-center" data-bs-dismiss="modal"
                        aria-label="Close">Cancel</button>
                <button type="button" id="LegacyEditSubmit" class="btn primaryButton text-center"
                        data-bs-dismiss="modal">Submit</button>
            </div>
        </div>
    </div>
</div>

<!-- Finance Delete PopUp -->
<div class="modal fade" id="LegacyDeletePopUp" tabindex="-1" role="dialog">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
                <button type="button" id="LegacyEditClose" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
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
                <button type="button" class="btn buttonFrame tertiaryButton text-center" id="closeLegacyIdDelete"
                        data-bs-dismiss="modal" aria-label="Close">No</button>
                <button type="button" id="LegacyDeleteSubmit"
                        class="btn primaryButton text-center submitDisableDelete" data-bs-dismiss="modal">Yes</button>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="Legacy_ScrPopUp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Finance Application Screenshots
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <table class="table table-bordered table-striped" id="legacy_datatable">
                    <thead class="Table-Header text-center">
                    <tr>
                        <th>File Name</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody class="Table-Body text-center mx-5" id="Legacy_Scr_List">
                    </tbody>
                </table>
                <div class="modal-footer">
                    <button type="button" class="btn buttonFrame tertiaryButton text-center"
                            data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    <form action="Finance_scr_download" method="post">
        <input type="hidden" id="File_Name" name="File_Name"> <input type="submit" id="scr_submit"
                                                                     style="display: none;">
    </form>
    <input type="submit" id="deletegrid_update" style="display: none;">
</div>


<%@include file="Footer.jspf"%>
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
        console.log('itemkey : ',itemKey);
        var  itemKey1 = "APPNAME";
		console.log('itemkey1',itemKey1);
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
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

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


</body>
</html>
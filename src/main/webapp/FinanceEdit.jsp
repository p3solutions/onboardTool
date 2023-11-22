<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>New Opportunity</title>
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <!-- ========== MODERNIZR ========== -->
    <script src="js/modernizr/modernizr.min.js"></script>

    <!-- ========== COMMON STYLES ========== -->
    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">
    <link rel="stylesheet" href="css/font-awesome.min.css" media="screen">
    <link rel="stylesheet" href="css/animate-css/animate.min.css"
          media="screen">
    <link rel="stylesheet" href="css/lobipanel/lobipanel.min.css"
          media="screen">
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">

    <!-- ========== PAGE STYLES ========== -->
    <link rel="stylesheet" href="css/prism/prism.css" media="screen">
    <!-- USED FOR DEMO HELP - YOU CAN REMOVE IT -->
    <link rel="stylesheet" href="css/toastr/toastr.min.css" media="screen">
    <link rel="stylesheet" href="css/icheck/skins/line/blue.css">
    <link rel="stylesheet" href="css/icheck/skins/line/red.css">
    <link rel="stylesheet" href="css/icheck/skins/line/green.css">
    <link rel="stylesheet" href="css/bootstrap-tour/bootstrap-tour.css">
    <link rel="stylesheet" href="css/UserInfo/userinfo.css">

    <!-- ========== THEME CSS ========== -->
    <link rel="stylesheet" href="css/main.css" media="screen">
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" />
    <script type="text/javascript" src="js_in_pages/project.js"></script>

    <link rel="stylesheet" href="css/headerIcon/headerIcon.css"
          media="screen">

    <link rel="stylesheet" href="css/threeDots/threeDots.css" media="screen">
    <link rel="stylesheet"
          href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
          integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
          crossorigin="anonymous" />
    <!-- ========== BootstrapV5 ========== -->

    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous">
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
            integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
            crossorigin="anonymous"></script>
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
            integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
            crossorigin="anonymous"></script>

    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>

    <link
            href="https://fonts.googleapis.com/css2?family=Poppins&display=swap"
            rel="stylesheet">
    <link rel="stylesheet" href="css/Responsive/intake-opportunity.css"
          media="screen">
    <link rel="stylesheet" href="css/Responsive/responsive.css"
          media="screen">
    <style id="alignEnd"></style>

</head>
<body>

<%@include file="Nav-Bar.jspf"%>
<nav class="nav nav-height-50" id="bg-color">
    <div class="container-fluid" id="container-fluid-margin">
        <div class="row" id="d3s-mt-10">
            <div class="col-lg-12 col-md-12">
                <h5 id="title">Create Finance List</h5>
            </div>
        </div>
    </div>
</nav>


<input type="hidden" id="selectedId"/>
<input type="hidden" id="selectedName"/>

<div class="card-container-1 mt-5">
    <div class="card">
        <div class="card-header" id="cd-header">Finance Info</div>
        <div class="card-body">
            <form class="form-signin" name="OpportunityForm"
                  enctype='application/json'>
                <div id="inputFields">
                    <div id="suggestionDropdown"></div>
                    <div class='form-group'>
                        <input type='hidden' class='form-control' size='35'
                               id="Record_No" placeholder='' name="RecordNo" value="" /> <input
                            type='hidden' class='form-control' size='35' id="Json_sample_id"
                            placeholder='' name="Json_Sample" value="" />
                    </div>
                </div>
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
                </div>









                <div class="row">
                    <div class="col-4">
                        <button type="button" class="btn btn-secondary"
                                onclick="location.href='FinanceList.jsp';">Back</button>
                    </div>
                    <div class="col-8" align="end">
                        <div class="dropdown">
                            <button type="button" class="btn btn-secondary dropdown-toggle"
                                    id="dropdownMenuButton1" data-bs-toggle="dropdown"
                                    aria-expanded="false">Actions</button>
                            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
                                <li><a class="dropdown-item dropDown-font" id="add"
                                       href="#" data-bs-toggle="modal" data-bs-target="#addModal">
                                    <i class="fas fa-plus" aria-hidden="true">&nbsp;&nbsp;&nbsp;
                                    </i>Add
                                </a></li>
                                <li><a class="dropdown-item dropDown-font" id="Edit"
                                       href="#"><i class="fas fa-edit" aria-hidden="true">&nbsp;&nbsp;
                                </i>Edit</a></li>
                                <li><a class="dropdown-item dropDown-font" id="Delete"
                                       href="#"><i class="fas fa-trash" aria-hidden="true">&nbsp;&nbsp;&nbsp;
                                </i>Delete</a></li>

                            </ul>
                        </div>
                        <button type="button" class="btn btn-primary" id="create">Create</button>
                        <button type="button" class="btn btn-primary " id="editpopup_btn"
                                data-bs-toggle="modal" data-bs-target="#EditPopUp"
                                style="display: none;">Edit PopUp</button>
                        <button type="button" class="btn btn-primary"
                                id="deletepopup_btn" data-bs-toggle="modal"
                                data-bs-target="#DeletePopUp" style="display: none;">Delete
                            PopUp</button>
                        <button type="button" class="btn btn-primary pull-right"
                                id="OpportunityListbtn"
                                onclick="window.location.href='FinanceList.jsp';"
                                style="display: none;"></button>
                    </div>
                </div>
            </form>
            <!-------addModal---------->

            <div class="modal" id="addModal" tabindex="-1"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add Input
                                Fields</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form name="PopUpform">
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <label class="control-label" for="formInput526">Label:</label>
                                            <input type="text" class="form-control" id="label"
                                                   name="label" required>
                                        </div>
                                    </div>
                                </div>
                                <input type="hidden" id="project_name" name="project_name"
                                       value=""> <input type="text" id="appln_name"
                                                        name="appln_name" value="" style="display: none;"> <input
                                    type="text" id="servlet_name" name="servlet_name" value=""
                                    style="display: none;">
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <label class="control-label" for="formInput526">Type:</label>
                                            <select id="types" class="form-select" name="types" required>
                                                <option value="Text box">Text box</option>
                                                <option value="Check box">Check box</option>
                                                <option value="Radio box">Radio box</option>
                                                <option value="Dropdown">Dropdown</option>
                                                <option value="Datepicker">Datepicker</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>

                                <div class="row hidefield" id="check" style="display: none;">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <label class="control-label" for="formInput526">Number
                                                of check boxes:</label> <input type="text" class="form-control"
                                                                               id="number" name="number1">
                                        </div>
                                    </div>

                                </div>
                                <div class="row hidefield" id="rdo" style="display: none;">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <label class="control-label" for="formInput526">Number
                                                of Radio boxes:</label> <input type="text" class="form-control"
                                                                               id="radio_number" name="radio_number">
                                        </div>
                                    </div>

                                </div>
                                <div class="row hidefield" id="drop" style="display: none;">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <label class="control-label" for="formInput526">Number
                                                of Options:</label> <input type="text" class="form-control"
                                                                           id="drop_number" name="drop_number">
                                        </div>
                                    </div>

                                </div>



                                <div class="form-group">
                                    <div class="col-lg-12" id="options"></div>
                                </div>


                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <label class="control-label" for="formInput526">Mandatory:</label>
                                            <select id="mandatory" class="form-select" name="mandatory"
                                                    required>
                                                <option>Yes</option>
                                                <option>No</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="submit"
                                    data-bs-dismiss="modal">Add Fields</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-------editModal---------->

            <div class="modal" id="EditPopUp" tabindex="-1"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit Input
                                Field</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form name="PopUpform">
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-lg-12">
                                            <label class="control-label" for="formInput526">Label:</label>
                                            <input type="text" class="form-control" id="Label_modify"
                                                   name="label" required>
                                        </div>
                                    </div>
                                </div>
                                <input type="text" id="seq_num" name="" value=""
                                       style="display: none;">
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">Cancel</button>
                            <button type="button" class="btn btn-primary" id="submit1"
                                    data-bs-dismiss="modal">Submit</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-------DeleteModal---------->
            <div class="modal" id="DeletePopUp" tabindex="-1"
                 aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form name="DeleteForm">
                                <div class="modal-body">
                                    <p style="font-size: 20px;">Do you want to delete this
                                        input field permanently?</p>
                                    <input type="hidden" id="sequence1" />
                                </div>
                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary"
                                    data-bs-dismiss="modal" id="submit2">Yes</button>
                            <button type="button" class="btn btn-secondary"
                                    data-bs-dismiss="modal">No</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%--finance view file popup--%>
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
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="js/toastr/toastr.min.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script src="js/notification/notification.js"></script>


<%--==============================other js====================--%>
<script type="text/javascript" src="js/Finance/FinanceAddDataRetrieveAjaxCall.js"></script>
<script type="text/javascript" src="js/Finance/FinanceEditDeleteAjaxCall.js"></script>
<script type="text/javascript" src="js/Finance/EditDeleteToggleFinance.js"></script>
<script type="text/javascript" src="js/Finance/FinanceAddFeatureFunctionality.js"></script>
<script type="text/javascript" src="js/Finance/FinanceAddAjaxcall.js"></script>
<script type="text/javascript" src="js/Finance/FinanceSaveAjaxcall.js"></script>
<script type="text/javascript" src="js/Finance/AppNameFilter.js"></script>
<%--<script type="text/javascript" src="js/Finance/FinanceAppInfoSaveAjaxCall.js"></script>--%>

<!-- ========== Toastr ========== -->
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link
        href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
        rel="stylesheet">


<%--screen schot--%>
<script type="text/javascript" src="js/Finance/Screenshot/FinanceApplicationScreenshotsUploadAjaxCall.js"></script>
<script type="text/javascript" src="js/Finance/Screenshot/Finance_scr_retrieve.js"></script>
<script type="text/javascript" src="js/Finance/Screenshot/Finance_scr_download.js"></script>
<script type="text/javascript" src="js/Finance/Screenshot/Finance_scr_delete.js"></script>
<script type="text/javascript" src="js/Finance/Screenshot/FinanceAppInfoFileUpload.js"></script>
<!-- Date Picker -->
<link
        href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css"
        rel="stylesheet">

<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<script src="js/toastr/toastr.min.js"></script>

<script id="scripttag"></script>
<script id="scripttag1"></script>
<script src="js/navigation/navigation.js"></script>
</body>
</html>
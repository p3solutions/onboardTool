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
                                        <div id="suggestionDropdown"></div>

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
                                                            <%--                                                            <div id="suggestionDropdown"></div>--%>
                                                            <div class="card-header" id="cd-header">
                                                                <h4 class="panel-title">
                                                                    <a class="collapsed" data-bs-toggle="collapse"
                                                                       data-bs-parent="#panels1" href="">Application Finance
                                                                        Info</a>
                                                                </h4>
                                                            </div>
                                                            <%--                                                            <div id="suggestionDropdown"></div>--%>
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
                                                            <div class="panel panel-default" >
                                                                <div class="card-header" id="cd-header">
                                                                    <h4 class="panel-title">
                                                                        <a class="collapsed" data-bs-toggle="collapse"
                                                                           data-bs-parent="#panels1" href="#collapse3">Finance
                                                                            Application Screenshots</a>
                                                                    </h4>
                                                                </div>
                                                                <div id="collapse3" class="panel-collapse collapse">
                                                                    <div class="panel-body" >
                                                                        <div id="collapse1"
                                                                             class="panel-collapse collapse show" name="collapse">
                                                                            <div class="panel-body" id="screentab">
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
<%@include file="Footer.jspf"%>


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
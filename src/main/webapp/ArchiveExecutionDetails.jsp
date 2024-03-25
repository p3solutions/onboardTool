<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>D3Sixty - Intake</title>
<%--    <link rel="stylesheet" href="css/bootstrap.min.css" media="screen">--%>

    <link rel="stylesheet" href="css/ArchiveExecutionCss/archiveCircleStatus/circle.css" />
    <!-- ========== JQuery FILES ========== -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- ========== Data retrieve JS FILES ========== -->
    <!-- ========== DATE PICKER IMPORT========== -->
<%--    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.5.0/css/bootstrap-datepicker.css" rel="stylesheet">--%>
    <link href=”https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css” rel=”stylesheet” type=”text/css” />

    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="js/ArchiveExecutionDetails/ArchiveExecutionInfo/ArchiveExecutionDataRetrieve.js"></script>
<%--        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>--%>
    <!-- ========== SELECT TAG IMPORT ========== -->


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
          referrerpolicy="no-referrer" />
</head>
<style>
    .form-control{
        width: auto !important;
    }
    .statusRed {
        background-color: RGBA(200, 16, 47);
    }

    .statusOrange {
        background-color: RGBA(255, 153, 0);
    }

    .statusGreen {
        background-color: RGBA(42, 148, 70);
    }

    .statusCode {
        height: 25px;
        width: 25px;
        border-radius: 50%;
        display: inline-block;
    }
    .tab-shift {
        position: relative;
        bottom: 33px;
    }
    .top-scroll-lock{
        background-color: #FFFFFF !important;
        box-shadow: 0px 2px 8px 0px #0000001A;
    }
    .triangle{
        position:absolute;
        top: -10px;
    }
    .triangle.down{
        width: 0;
        height: 0;
        border-left: 10px solid transparent;
        border-right: 10px solid transparent;
        border-top: 10px solid #ccc;
        top: 10px;
    }
    .triangle.up{
        width: 0;
        height: 0;
        border-left: 10px solid transparent;
        border-right: 10px solid transparent;
        border-bottom: 10px solid #ccc;
        border-top: none;

    }
    /*selectpicker*/
    a.dropdown-item.selected{
        background-color: #d9edff;
        color: #474747 !important;
    }
    .bs-actionsbox{
        padding: 0px !important;
    }
    .actions-btn{
        text-align: center !important;
    }
    .actions-btn:hover{
        background-color: #d9edff !important;
        color: #474747 !important;
    }
    .bs-searchbox>input{
        min-width: 100% !important;
        box-shadow: none !important;
    }
</style>
<body>


 <%@include file="Nav-Bar.jspf"%>
 <div class="row m-0">
     <div class="col p-0">
 <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
     <ol class="breadcrumb px-4 m-0 ">
         <li class="breadcrumb-item inactive my-3 text-light "><a href="DashBoard.jsp"
                                                                  class="text-decoration-none breadcrumbtextinactive">Home</a></li>
<%--         <li class="breadcrumb-item inactive my-3 text-light "><a href="#"--%>
<%--                                                                  class="text-decoration-none breadcrumbtextinactive"><%=Encode.forHtml(OpportunityName)%></a></li>--%>
         <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Archive Execution</li>
     </ol>
 </nav>
     </div></div>
 <div class="row m-0">
     <div class="col p-0">
 <div id="Filter-container">
     <ul class="nav nav-underline mx-4 py-3 ">
         <li class="nav-item">
             <a class="nav-link active" aria-current="page" href="ArchiveExecutionDetails.jsp">Project Plan</a>
         </li>
         <li class="nav-item">
             <a class="nav-link text-dark" href="archiveExeIssueRiskTracker.jsp">Issue/Risk Tracker</a>
         </li>
     </ul>
     <hr class="tab-shift">
 </div>
     </div></div></div>


 <div class="container-fluid px-3 ">
<%--     Title cards--%>
    <form class="form-signin" name="loginForm" method="post">
    <form action="" method="post" role="form">
    <div class="row row-cols-2 row-cols-md-2 row-cols-lg-2 row-cols-xl-4  row-cols-xxl-4 g-4 mx-1 bg-white p-0 mb-4 m-0 pb-3">
    <div class="col m-auto">
        <div class="text-muted">
            Opportunity Name :
        </div>
        <div class="text-bold" id = "oppName">

        </div>
    </div>
    <div class="col m-auto">
        <div class="text-muted">
            Opportunity Id :
        </div>
        <div class="text-bold" id = "oppId">

        </div>
    </div>
    <div class="col m-auto">
        <div class="text-muted">
            Start Date :
        </div>
        <div class="text-bold" id = "startDate">

        </div>
    </div>
    <div class="col m-auto">
        <div class="text-muted">
            Estimated Completion :
        </div>
        <div class="text-bold" id = "endDate">

        </div>
    </div>
    </div>


    <div class="card h-auto mb-5">
         <div class="card-header Card-Header">
             Archive Execution
         </div>
         <!-- <div class=""> -->
         <div class="table-responsive">
             <table class="table table-bordered">
                 <thead class="text-center Table-Header">
                 <tr>
                     <th scope="col">Task Id</th>
                     <th scope="col">Task Group</th>
                     <th scope="col">Task Name</th>
                     <th scope="col">Task Type</th>
                     <th scope="col">Pred/Major Dependencies</th>
                     <th scope="col">Assigned To</th>
                     <th scope="col">Planned Start</th>
                     <th scope="col">Planned End</th>
                     <th scope="col">Actual Start</th>
                     <th scope="col">Actual End</th>
                     <th scope="col">% Completion</th>
                     <th scope="col">Status</th>
                     <th scope="col">Remarks</th>
                     <th scope="col">Action</th>
                 </tr>
                 </thead>
                 <tbody class="text-center align-middle Table-Body" id="ArchiveExecutionList">

                 </tbody>
             </table>
             <button type="button" class="btn btn-primary pull-right" id="ArchExecParentId"
                     data-bs-toggle="modal" data-bs-target="#ArchiveParentAddPopUp" style="display: none;">Parent
                 Add PopUp</button>
             <!-- Child  -->
             <button type="button" class="btn btn-primary pull-right" id="ArchExecChildId"
                     data-bs-toggle="modal" data-bs-target="#ArchiveChildAddPopUp" style="display: none;">Child Add
                 PopUp</button>
             <!-- Edit Button -->
             <button type="button" class="btn btn-primary pull-right" id="ArchExecEditId"
                     data-bs-toggle="modal" data-bs-target="#ArchiveEditPopUp" style="display: none;">Edit
                 PopUp</button>
             <!-- Delete Button -->
             <button type="button" class="btn btn-primary pull-right" id="ArchExecDeleteId"
                     data-bs-toggle="modal" data-bs-target="#ArchiveDeletePopUp" style="display: none;">Delete
                 PopUp</button>
             <!-- Remarks Button -->
             <button type="button" class="btn btn-primary pull-right" id="ArchExecRemarksId"
                     data-bs-toggle="modal" data-bs-target="#ArchiveRemarksPopUp" style="display: none;">Remark popup</button>

         </div>
     </div>

    </form>
    </form>
 </div>


 <!-- Archive Execution Parent Add PopUp -->
 <div class="modal fade" id="ArchiveParentAddPopUp" tabindex="-1" role="dialog">
     <div class="modal-dialog  modal-dialog-centered" role="document">
         <div class="modal-content">
             <div class="modal-header modal-font-label">
                 <h5 class="modal-title modal-title-1" id="exampleModalLabel">Add Input Fields</h5>
                 <button type="button" class="btn-close" id="ArchiveParentAddCloseId" data-bs-dismiss="modal"
                         aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <form name="PopUpform">
                     <div id="scrollbar">
                         <div class="row">
                             <div class="form-group">
                                 <div class="col-lg-8">
                                     <label class="control-label mb-2" for="ArchiveExecution">Select Sibling or
                                         Child</label> <br>
                                     <input class="form-check-input" type="radio" class="radioOption"
                                            name="ArchExecRadio" id="inlineRadio1" value="Parent">&nbsp;Sibling Row
                                     &nbsp;
                                     <input class="form-check-input" type="radio" class="radioOption"
                                            name="ArchExecRadio" id="inlineRadio2" value="Child">&nbsp;Child Row
                                 </div>
                             </div>
                         </div><br />
                         <div class="row">
                             <div class="form-group">
                                 <div class="col-lg-8">
                                     <label class="control-label" for="ArchiveExecution">Task Group Label</label>
                                     <input type="text" class="form-control" id="ArchiveParentGrpLabel"
                                            name="ArchiveParentGrpLabel" required>
                                 </div>
                             </div>
                         </div><br />
                         <div class="row">
                             <div class="form-group">
                                 <div class="col-lg-8">
                                     <label class="control-label" for="ArchiveExecution">Task Name Label</label>
                                     <input type="text" class="form-control" id="ArchiveParentNameLabel"
                                            name="ArchiveParentNameLabel" required>
                                 </div>
                             </div>
                         </div>
                         <br />
                         <div class="row" style="display:none;">
                             <div class="col-md-8"> <label class="control-label hidePlanSrt" style="display:none;"
                                                           for="ArchiveExecution">Plan Start Date</label>
                                 <input type="text" class="form-control datepicker2 hidePlanSrt"
                                        style="display:none;" size="35" id="planSrtDate" placeholder="mm/dd/yyyy"
                                        name="planSrtDateName" />
                             </div>
                         </div>
                         <input type="hidden" id="checkPlanStartDate" value="" />
                         <input type="hidden" id="seqNumParId" name="seqNumParName" value="">
                         <input type="hidden" id="project_name" name="project_name" value="">
                         <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                         <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">
                     </div>
                 </form>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn buttonFrame tertiaryButton text-center" id="closeIdParent"
                         data-bs-dismiss="modal">Close</button>
                 <button type="button" id="ArchiveParentSubmit"
                         class="btn primaryButton text-center submitDisable">Add
                     Fields</button>
             </div>
         </div>
     </div>
 </div>

 <!-- Archive Execution Child Add PopUp -->
 <div class="modal fade" id="ArchiveChildAddPopUp" tabindex="-1" role="dialog">
     <div class="modal-dialog  modal-dialog-centered " role="document">
         <div class="modal-content">
             <div class="modal-header  modal-font-label">
                 <h5 class="modal-title ">Add Input Fields</h5>
                 <button type="button" class="btn-close" id="ArchiveChildAddCloseId" data-bs-dismiss="modal"
                         aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <form name="PopUpform">
                     <div id="scrollbar">
                         <div class="row">
                             <div class="form-group">
                                 <div class="col-lg-8 ">
                                     <label class="control-label mb-2" for="ArchiveExecution">Select Sibling or
                                         Child</label><br>
                                     <input class="form-check-input" type="radio" class="radioOption"
                                            name="ArchcExecRadio" id="inlineRadio1" value="Child">&nbsp;Sibling Row
                                     <input class="form-check-input" type="radio" class="radioOption mb-2"
                                            name="ArchcExecRadio" id="inlineRadio2" value="SubChild">&nbsp;Child Row
                                     <br>
                                     <label class="control-label mt-2" for="ArchiveExecution">Task Group
                                         Label:</label>
                                     <input type="text" class="form-control" id="ArchiveChildGrpLabel"
                                            name="ArchiveChildGrpLabel" required>
                                 </div>
                             </div>
                         </div><br />
                         <div class="row">
                             <div class="form-group">
                                 <div class="col-lg-8">
                                     <label class="control-label" for="ArchiveExecution">Task Name Label:</label>
                                     <input type="text" class="form-control" id="ArchiveChildNameLabel"
                                            name="ArchiveChildNameLabel" required>
                                 </div>
                             </div>
                         </div><br />
                         <div class="row" style="display:none;">
                             <div class="col-md-8"> <label class="control-label hidePlanSrt1"
                                                           for="ArchiveExecution">Plan Start Date</label>
                                 <input type="text" class="form-control datepicker2 hidePlanSrt1" size="35"
                                        id="planSrtDate1" placeholder="mm/dd/yyyy" name="planSrtDateName1" />
                             </div>
                         </div><br />
                         <input type="hidden" id="checkChildPlanStartDate" value="" />
                         <input type="hidden" id="seqNumChlId" name="seqNumChlName" value="" />
                         <input type="hidden" id="project_name" name="project_name" value="">
                         <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                         <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">
                     </div>
                 </form>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn buttonFrame tertiaryButton text-center" id="closeIdChild"
                         data-bs-dismiss="modal">Close</button>
                 <button type="button" id="ArchiveChildSubmit" class="btn primaryButton text-center submitDisable">Add
                     Fields</button>
             </div>
         </div>
     </div>
 </div>

 <!-- Archive Execution Edit -->
 <div class="modal fade " id="ArchiveEditPopUp" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
             <div class="modal-header modal-font-label">
                 <h5 class="modal-title ">Edit Input Fields</h5>
                 <button type="button" class="btn-close" id="ArchiveEditCloseId" data-bs-dismiss="modal"
                         aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <form name="PopUpform">
                     <div id="scrollbar">
                         <div class="row">
                             <div class="form-group">
                                 <div class="col-lg-8">
                                     <label class="control-label" for="ArchiveExecution">Task Group Label</label>
                                     <input type="text" class="form-control" id="ArchiveEditGrpLabel"
                                            name="ArchiveEditGrpLabel" required>
                                 </div>
                             </div>
                         </div><br />
                         <div class="row">
                             <div class="form-group">
                                 <div class="col-lg-8">
                                     <label class="control-label" for="ArchiveExecution">Task Name Label</label>
                                     <input type="text" class="form-control" id="ArchiveEditLabelId"
                                            name="ArchiveEditNameLabel" required>
                                 </div>
                             </div>
                         </div>
                         <br />
                         <input type="hidden" id="seqNumEditId" name="seqNumEditName" value="">
                         <input type="hidden" id="project_name" name="project_name" value="">
                         <input type="text" id="appln_name" name="appln_name" value="" style="display:none;">
                         <input type="text" id="servlet_name" name="servlet_name" value="" style="display:none;">
                     </div>
                 </form>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn buttonFrame tertiaryButton text-center" id="closeIdEdit"
                         data-bs-dismiss="modal">Close</button>
                 <button type="button" id="ArchiveEditSubmit"
                         class="btn primaryButton text-center submitEditDisable">Submit</button>
             </div>
         </div>
     </div>
 </div>


 <!-- Archive Execution Delete Popup -->

 <div class="modal fade" id="ArchiveDeletePopUp" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
             <div class="modal-header modal-font-label">
                 <h5 class="modal-title">Delete Field</h5>
                 <button type="button" class="btn-close" id="ArchiveDeleteClose" data-bs-dismiss="modal"
                         aria-label="Close"></button>
             </div>
             <div class="modal-body">
                 <form name="DeleteForm">
                     <div class="modal-body">
                         <p>Do you want to delete this Row permanently?</p>
                         <input type="hidden" id="ArchiveDeleteSeq" />
                     </div>
                 </form>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn  buttonFrame tertiaryButton text-center" id="closeIdDelete"
                         data-bs-dismiss="modal" aria-label="Close">No</button>
                 <button type="button" id="ArchiveDeleteSubmit"
                         class="btn primaryButton text-center submitDisableDelete">Yes</button>
             </div>
         </div>
     </div>
 </div>
 <!-- Archive Execution Remarks Popup -->
 <div class="modal fade" id="ArchiveRemarksPopUp" tabindex="-1" role="dialog">
     <div class="modal-dialog modal-dialog-centered" role="document">
         <div class="modal-content">
             <div class="modal-header modal-font-label">
                 <h5 class="modal-title ">Remarks</h5>
                 <button type="button" id="ArchiveRemarksClose" class="btn-close" data-bs-dismiss="modal"
                         aria-label="Close"></button><br>
             </div>
             <div class="modal-header bg-light ">
                 <h5 class="modal-title text-dark" id="remarksTaskGroup">Task Group: </h5>
                 <h5 class="modal-title text-dark" id="remarksTaskName">Task Name: </h5>
             </div>
             <div class="modal-body">
                 <form name="DeleteForm">
                     <div class="modal-body">
                         <div id="remarkPts" class="row changeText RemarksPoints" contenteditable="true"
                              spellcheck="false">
                         </div>
                         <input type="hidden" id="ArchiveRemarksSeq" />
                     </div>
                 </form>
             </div>
             <div class="modal-footer">
                 <button type="button" class="btn  buttonFrame tertiaryButton text-center" id="closeIdRemarks"
                         data-bs-dismiss="modal" aria-label="Close">Close</button>
             </div>
         </div>
     </div>
 </div>
<input type="button" id="updatedate" value="update" style="display:none;">
 <%@include file="Footer.jspf"%>

 <script>

     let scrollStickyFilterContainer =document.getElementById("Filter-container");

     // When the user scrolls down 20px from the top of the document, show the button
     window.onscroll = function() {scrollFunction()};

     function scrollFunction() {
         if (document.body.scrollTop > 40 || document.documentElement.scrollTop > 40) {
             scrollStickyFilterContainer.classList.add("top-scroll-lock");
         } else {
             scrollStickyFilterContainer.classList.remove("top-scroll-lock");
         }
     }
 </script>


<%-- <script src="js/toastr/toastr.min.js"></script>--%>
 <script src="js/notification/notification.js"></script>
 <script src="js/ArchiveExecutionDetails/ArchiveExecutionInfo/ArchiveExecutionSaveValidation.js"></script>
 <script src="js/ArchiveExecutionDetails/ArchiveExecutionInfo/ArchiveExecutionSave.js"></script>
 <script src="js/ArchiveExecutionDetails/ArchiveExecutionInfo/ArchiveExecutionAddAjaxCall.js"></script>
 <script src="js/ArchiveExecutionDetails/ArchiveExecutionInfo/ArchiveExecutionEdit.js"></script>
 <script src="js/ArchiveExecutionDetails/ArchiveExecutionInfo/ArchiveExecutionDeleteAjaxCall.js"></script>
 <script src="js/ArchiveExecutionDetails/ArchiveExecutionInfo/ArchiveExecutionRemarks.js"></script>



<script id ="scripttag"></script>
 <script type="text/javascript"
         src="js/date-picker/bootstrap-datepicker.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


 <script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

<script>
    $('#financeHint[data-toggle="tooltip"]').tooltip({
        animated : 'fade',
        placement : 'bottom',
        trigger : 'onClick'
    });

    $('#complianceHint[data-toggle="tooltip"]').tooltip({
        animated : 'fade',
        placement : 'bottom',
        trigger : 'onClick'
    });
</script>
    </body>
</html>
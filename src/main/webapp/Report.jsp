<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Report</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>D3Sixty - Report</title>
    <!-- ========== Select-picker css ========== -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css"
          integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q=="
          crossorigin="anonymous"
          referrerpolicy="no-referrer"/>

    <!-- ========== JQuery FILES ========== -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    .custom-show-entities {
        border: none !important;
        border-bottom-left-radius: 0 !important;
        border-bottom-right-radius: 0 !important;
        border-bottom: 1px solid black !important;
    }

    div.item-label {
        margin-right: -17px !important;
        margin-top: 9px !important;;
    }
</style>
<body>

<%@include file="Nav-Bar.jspf" %>
<div class="row m-0">
    <div class="col p-0">
        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);"
             aria-label="breadcrumb">
            <ol class="breadcrumb px-4 m-0 ">
                <li class="breadcrumb-item inactive my-3 text-light ">
                    <a href="OpportunityList.jsp" class="text-decoration-none breadcrumbtextinactive">Home</a>
                </li>
                <li class="breadcrumb-item inactive my-3 text-light ">
                    <a href="Governance_Home.jsp" class="text-decoration-none breadcrumbtextinactive">Governance</a>
                </li>
                <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Report</li>
            </ol>
        </nav>
    </div>
</div>
</div>


<div class="container-fluid m-0 mb-5 px-4">
    <div class="row my-3 ">
        <div class="col-8 col-md-4 d-md-flex justify-content-start my-3 my-md-0 ">
            <button type="button" class="btn primaryButton text-center" id="searchToggleButton"
                    data-bs-toggle="modal" data-bs-target="#searchModal">Filter
            </button>
            <a href="Report.jsp">
                <button type="button" id="ExitSearch" class="btn buttonFrame tertiaryButton text-center mx-1 w-auto">
                    Exit Search
                </button>
            </a>
        </div>
        <!-- For small screen display this export -->
        <div class="col-2 ms-auto col-md-0 my-3 d-flex justify-content-end d-md-none">
            <button type="button" class="btn primaryButton text-center" id="exportButton" data-bs-toggle="modal"
                    data-bs-target="#exportModal">Export
            </button>
        </div>

        <div class="col-12 col-md-4 d-flex justify-content-center ">
            <div class="mx-1 mt-1">
                <h6 class="mt-1">Report:</h6>
            </div>
            <div class="mx-1">
                <select class="form-control selectpicker " id="Report">
                    <option class='options' value="intakeReport1">Intake Report 1</option>
                    <option class='options' value="intakeReport2">Intake Report 2</option>
                    <option class='options' value="intakeReport3">Requirements</option>
                </select>
            </div>
        </div>
        <div class="col-2 col-md-4 d-none d-md-flex justify-content-end mx-4 mx-md-0 ">
            <button type="button" class="btn primaryButton text-center" id="exportButton" data-bs-toggle="modal"
                    data-bs-target="#exportModal">Export
            </button>
        </div>

    </div>
    <div class="card">
        <div class="card-header Card-Header" id="cd-header">Report</div>
        <div class="row mx-2  Card-Body">
        </div>
        <div class="table-responsive" id="Report_List_Div">
            <div id="overlay">
                <div class="cv-spinner">
                    <span class="spinner"></span>
                </div>
            </div>
            <table class="table table-bordered caption-top" id="admin_userslist">

            </table>
        </div>
        <div class="row d-flex justify-content-end m-2 mt-3" id="footer">
            <div class="col-auto pagination-entities mt-1 item-label">items per page:</div>
            <div class="col-auto mt-2 ">
                <select class="form-select form-select-sm custom-show-entities p-0" id="maxRows">
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="15">15</option>
                    <option value="20">20</option>
                    <option value="50">50</option>
                    <option value="70">70</option>
                    <option value="100">100</option>
                    <option value="5000">Show All</option>
                </select>
            </div>
            <div class="col-auto pagination-entities mt-2 mx-3" id="recordInfo"></div>
            <div class="col-auto mt-3 mt-sm-0">
                <ul class="pagination">
                    <li data-page="prev" class="page-link"><span> << <span>(current)</span></span></li>
                    <!--	Here the JS Function Will Add the Rows -->
                    <li data-page="next" id="prev" class="page-link"><span> >> <span
                            class="sr-only">(current)</span></span></li>
                </ul>
            </div>
        </div>
    </div>
</div>


<!-- Export -->
<div class="modal fade" id="exportModal" tabindex="-1" aria-labelledby="exportModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title " id="exportModalLabel">Export Options</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Add your export options here -->
                <label for="exportFormat">Select Export view:</label>
                <select class="form-control selectpicker" id="exportFormat">
                    <option value="currentView">Current View</option>
                    <option value="totalRecords">Total Records</option>
                    <!-- Add more options as needed -->
                </select>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn buttonFrame tertiaryButton text-center" data-bs-dismiss="modal">Close
                </button>
                <button type="button" class="btn primaryButton text-center" id="submitExport">Export</button>
            </div>
        </div>
    </div>
</div>

<!-- Search pop up -->
<div class="modal fade  card-font-label" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header  modal-font-label ">
                <h5 class="modal-title" id="searchModalLabel">Search Options</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Add your export options here -->
                <label for="SearchOptions">Select Search Column:</label>
                <select class="form-control mb-1" id="SearchOptions" onchange="handleColumnChange()">
                    <option value="Select">--Select--</option>
                    <!-- Add more options as needed -->
                </select>
                <label for="SearchOprerators" style="display:none;">Select Operator:</label>
                <select class="form-control mb-1" id="SearchOperators" style="display:none;">
                    <option value="Select" Selected>--Select--</option>
                    <option value="="> =</option>
                    <option value="<">
                        <
                    </option>
                    <option value="<=">
                        <=
                    </option>
                    <option value=">"> ></option>
                    <option value=">="> >=</option>
                    <option value="BETWEEN">BETWEEN</option>
                </select>
                <label for="lable3" style="display:none;">Select Input Value:</label>
                <select class="form-control mb-1" id="YesNoField" style="display:none;">
                    <option value="Select" Selected>--Select--</option>
                    <option value="yes"> YES</option>
                    <option value="no"> NO</option>
                </select>
                <label for="lable1" style="display:none;">Enter Search Value:</label>
                <label for="lable4" style="display:none;">Enter From Value:</label>
                <label for="lable5" style="display:none;">Enter From Date:</label>
                <input class='form-control datepicker1 mb-1' type="text" id="Searchinput1"
                       style="display:none;" placeholder="Search Value">
                <label for="lable2" style="display:none;">Enter To Value:</label>
                <label for="lable6" style="display:none;">Enter To Date:</label>
                <input class='form-control datepicker1 mb-1' type="text" id="Searchinput2"
                       style="display:none;" placeholder="Search Value">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn buttonFrame tertiaryButton text-center pull-left"
                        data-bs-dismiss="modal">Close
                </button>
                <button type="button" class="btn primaryButton text-center" id="submitSearch">Search</button>
                <button type="button" class="btn primaryButton text-center" id="resetButton">Reset</button>
            </div>
        </div>
    </div>
</div>
<%@include file="Footer.jspf" %>

<%--Show select tag dynamic --%>
<script>
    var select1 = document.getElementById("Report");
    var select2 = document.getElementById("maxRows");

    // Add an event listener to select1
    select1.addEventListener("change", function () {
        // Set the selected option in select2 to match select1
        select2.value = "5";
    });
</script>
<%--to erase the search element when the report is changed--%>
<script>
    var selectElement = document.getElementById("Report");
    var inputElement = document.getElementById("appFilter");

    // Add an event listener to the select element to detect changes
    selectElement.addEventListener("change", function () {
        // Clear the value of the input element when the select option changes
        inputElement.value = "";
    });
</script>

<!-- ========== Page data handling ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js"
        integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script type="text/javascript" src="js/reportJs/ReportDynamic.js"></script>
<!-- ========== Export ========== -->
<script type="text/javascript" src="js/reportJs/Download.js"></script>
<script type="text/javascript" src="js/reportJs/ExportToCSV.js"></script>
<!-- ========== Other JS ========== -->
<script src="js/notification/notification.js"></script>
<script src="js/navigation/navigation.js"></script>
<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

</body>
</html>
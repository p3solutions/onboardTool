<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Finance Module</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
          referrerpolicy="no-referrer" />
    <!-- ========== Toastr ========== -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    <link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

    <!-- ========== COMMON JS FILES ========== -->
<%--    <script src="js/jquery/jquery-2.2.4.min.js"></script>--%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>
    .add-finance-button{
       width: 110px !important;
    }
    /*.custom-show-entities {*/
    /*    box-shadow: none !important;*/
    /*    min-width: 50px !important;*/
    /*    border: none !important;*/
    /*    border-bottom-left-radius: 0 !important;*/
    /*    border-bottom-right-radius: 0 !important;*/
    /*    border-bottom: 1px solid black !important;*/
    /*}*/
    div.item-label{
        margin-right: -17px !important;
        margin-top: 9px !important; ;
    }

    .search-cancel-button{
        color: red !important;
    }
    span.btn1 {
        border: 1px solid #CED0D2 !important;
        border-radius: 0px 6px 6px 0px;
    }
    /*.form-control,.btn1{*/
    /*    color: #2A3F57;*/
    /*    font-family: 'Roboto';*/
    /*    font-size: 14px;*/
    /*    font-weight: 400;*/
    /*    letter-spacing: 0em;*/
    /*    text-align: left;*/
    /*    border: 1px solid #CED0D2;*/
    /*    border-top-left-radius: 6px !important;*/
    /*    border-bottom-left-radius: 6px !important;*/
    /*    border-top-right-radius: 0px !important;*/
    /*    border-bottom-right-radius: 0px !important;*/
    /*}*/
    span.clearSearch{
        font-family: 'Roboto';
        font-size: 14px;
        font-weight: 500;
    }
</style>
<body>
<%@include file="Nav-Bar.jspf" %>
<div class="row m-0">
    <div class="col p-0">
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
    <ol class="breadcrumb px-4 m-0 ">
        <li class="breadcrumb-item inactive my-3 text-light ">
            <a href="DashBoard.jsp" class="text-decoration-none breadcrumbtextinactive">Home</a>
        </li>
        <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Finance List</li>
    </ol>
</nav>
    </div>
</div>
</div>


<div class="container-fluid px-4 pt-4" id="Allowed">
    <button type="button" class="btn" id="deletepopup_btn" data-bs-toggle="modal" data-bs-target="#DeletePopUp"
            style="display: none;">Delete PopUp</button>
    <div class="row mb-3" >
        <div class="col-6 col-sm-4 col-md-3 col-lg-2 col-xl-2 col-xxl-1  d-flex justify-content-start">
            <div class="input-group"  id="ExitSearch">
                <span class=" px-2 form-control clearSearch">clear search</span>
                <span class="input-group-text btn1 btn search-cancel-button" ><i class="fa-solid fa-xmark"></i></span>
            </div>

        </div>
        <div class="col-3 col-sm-5 col-md-6 col-lg-7 col-xl-7 col-xxl-8 d-flex justify-content-start">

        </div>

        <div class="col-3 d-flex justify-content-end ">
            <a href="Finance.jsp" > <button type="button" id="add_user_btn" class=" btn primaryButton add-finance-button text-center"
                                           data-bs-toggle="modal" style="display: none;">Add Finance</button></a>
            <button type="button" class="btn primaryButton text-center mx-2 d-none d-md-block" id="searchToggleButton"
                    data-bs-toggle="modal" data-bs-target="#searchModal">Filter</button>
            <button type="button" class="btn primaryButton text-center d-none d-md-block" id="exportButton" data-bs-toggle="modal"
                    data-bs-target="#exportModal">Export</button>
        </div>
<%--        for small screen--%>
        <div class="col-12 my-3  d-md-none  mx-0" >
            <div class="d-flex justify-content-end">
                <button type="button" class="btn primaryButton text-center mx-2 " id="searchToggleButton"
                        data-bs-toggle="modal" data-bs-target="#searchModal">Filter</button>
                <button type="button" class="btn primaryButton text-center" id="exportButton" data-bs-toggle="modal"
                        data-bs-target="#exportModal">Export</button>
            </div>
        </div>
    </div>


    <div class="card mb-5">
        <div class="card-header Card-Header" id="cd-header">Finance Module</div>

        <div class="table-responsive" id="admin_userslist_div">
            <div id="overlay">
                <div class="cv-spinner">
                    <span class="spinner"></span>
                </div>
            </div>
            <table class="table table-bordered caption-top" id="admin_userslist">
                <thead class="Table-Header text-center">

                </thead>
                <tbody class="Table-Body text-center mx-5" id="AdminUserslist">

                </tbody>
            </table>
        </div>


        <div class="row d-flex justify-content-end m-2 mt-3" id="footer">
            <div class="col-auto Table-Body mt-1 item-label">Items per page:</div>
            <div class="col-auto mt-1 ">
                <select class="form-control selectpicker custom-show-entities p-0" id="maxRows">
                    <option class='options' value="5">5</option>
                    <option class='options' value="10">10</option>
                    <option class='options' value="15">15</option>
                    <option class='options' value="20">20</option>
                    <option class='options' value="50">50</option>
                    <option class='options' value="70">70</option>
                    <option class='options' value="100">100</option>
<%--                    <option value="5000">Show All</option>--%>
                </select>
            </div>
            <div class="col-auto Table-Body mt-2 mx-3"  id="recordInfo"></div>
            <div class="col-auto mt-3 mt-sm-0">
                <ul class="pagination">

                </ul>
            </div>
        </div>
    </div>
</div>



<div id="userBlocked">
    <div class="container d-flex align-items-center justify-content-center vh-100"
         style="font-size: 30px; color: grey;">
        <p>You don't have sufficient privilege to view this page. Please contact administrator </p>
    </div>
</div>
<!-- delete  -->
<div class="modal fade" id="DeletePopUp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label bg-danger">
                <h5 class="modal-title" id="exampleModalLabel">Delete Finance Information</h5>
                <button type="button" class="btn-close modal-close-btn" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p style="font-size: 14px;">Do you want to Delete this Finance Information Permanently?</p>
                        <input type="text" id="random_id" style="display: none;" />
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn dangerButtonCancel text-center" data-bs-dismiss="modal">No
                </button>
                <button type="button" class="btn dangerButton text-center" data-bs-dismiss="modal"
                        id="delete_submit">Yes
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Export -->
<div class="modal fade" id="exportModal" tabindex="-1" aria-labelledby="exportModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exportModalLabel">Export Options</h5>
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
                <button type="button" class="btn  tertiaryButton text-center"
                        data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn primaryButton text-center" id="submitExport">Export</button>
            </div>
        </div>
    </div>
</div>


<!-- Search pop up -->
<div class="modal fade" id="searchModal" tabindex="-1" aria-labelledby="searchModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="searchModalLabel">Search Options</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <label for="SearchOptions">Select Search Column:</label>
                <select class="form-control mb-1" id="SearchOptions" onchange="handleColumnChange()">
                    <option value="Select">--Select--</option>
                </select>
<%--                <br>--%>
                <label for="SearchOprerators" style="display:none;">Select Operator:</label>
                <select class="form-control mb-1" id="SearchOperators" style="display:none;">
                    <option value="Select" Selected>--Select--</option>
                    <option value="="> = </option>
                    <option value="<">
                        < </option>
                    <option value="<=">
                        <= </option>
                    <option value=">"> > </option>
                    <option value=">="> >= </option>
                    <option value="BETWEEN">BETWEEN</option>
                </select>
<%--                <br>--%>
                <label for="lable3" style="display:none;">Select Input Value:</label>
                <select class="form-control mb-1" id="YesNoField" style="display:none;">
                    <option value="Select" Selected>--Select--</option>
                    <option value="yes"> YES </option>
                    <option value="no"> NO </option>
                </select>
                <label for="lable1" style="display:none;">Enter Search Value:</label>
                <label for="lable4" style="display:none;">Enter From Value:</label>
                <label for="lable5" style="display:none;">Enter From Date:</label>
                <input class='form-control datepicker1 mb-1' type="text" id="Searchinput1"
                       style="display:none;" placeholder="Search Value">
<%--                <br>--%>
                <label for="lable2" style="display:none;">Enter To Value:</label>
                <label for="lable6" style="display:none;">Enter To Date:</label>
                <input class='form-control datepicker1 mb-1' type="text" id="Searchinput2"
                       style="display:none;" placeholder="Search Value">

            </div>
            <div class="modal-footer">
                <button type="button" class="btn  tertiaryButton text-center"
                        data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn primaryButton text-center" id="submitSearch">Search</button>
                <button type="button" class="btn primaryButton text-center" id="resetButton">Reset</button>
            </div>
        </div>
    </div>
</div>
<%@include file="Footer.jspf"%>

<script>
    $(document).ready(function () {
        userHide();
});


</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script src="js/navigation/navigation.js"></script>
<script src="js/Finance/Finance_list_retrive.js"></script>
<script src="js/Finance/FinanceListDeleteAjax.js"></script>

<!-- ========== Export ========== -->
<script src="js/Finance/CSVExport.js"></script>
<script src="js/Finance/ExportCSVView.js"></script>
<script src="js/Finance/Role_Check.js"></script>


<script src="js/notification/notification.js"></script>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>D3Sixty License Information</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>D3Sixty - License_Info</title>

    <!-- ========== JQUERY  FILES ========== -->
    <script src="js/jquery/jquery-2.2.4.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>
<style>
    .form-group {
        color: #474747;
        font-family: 'Roboto';
        font-size: 14px;
        font-weight: 400;
        line-height: 16px;
        letter-spacing: 0em;
        text-align: left;
    }
    .top-scroll-lock {
        background-color: #FFFFFF !important;
        box-shadow: 0px 2px 8px 0px #0000001A;
    }
</style>

<body>

<%@include file="Nav-Bar.jspf" %>
<div class="row m-0">
    <div class="col p-0">
        <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);"
             aria-label="breadcrumb">
            <ol class="breadcrumb px-4 m-0 ">
                <li class="breadcrumb-item inactive my-3 text-light "><a href="OpportunityList.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Home</a>
                </li>
                <li class="breadcrumb-item inactive my-3 text-light "><a href="Admin_Userslist.jsp"
                                                                         class="text-decoration-none breadcrumbtextinactive">Administration</a>
                </li>
                <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">License Information
                </li>
            </ol>
        </nav>
    </div>
</div>
<div class="row m-0">
    <div class="col p-0">
        <div id="Filter-container">
            <ul class="nav nav-underline mx-4 pt-3 pb-0 ">
                <li class="nav-item">
                    <a class="nav-link text-dark" aria-current="page" href="Admin_Userslist.jsp">User List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active " href="License_info.jsp">License Information</a>
                </li>
            </ul>
            <hr class="tab-shift m-0">
        </div>
    </div>
</div>
</div>

<div class="container-fluid px-4 mb-5">
    <button type="button" id="add_user_btn" class="btn primaryButton w-auto text-center my-md-4 my-2 "
            data-bs-toggle="modal" data-bs-target="#addlicenseModal" style="display: none">Update License
    </button>
    <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" data-bs-toggle="modal"
            data-bs-target="#EditPopUp" style="display: none;">Edit PopUp
    </button>
    <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" data-bs-toggle="modal"
            data-bs-target="#DeletePopUp" style="display: none;">Delete PopUp
    </button>

    <div class="card">
        <div class="card-header Card-Header" id="cd-header">License Information
        </div>
        <div class="table-responsive ">
            <table class="table m-0 table-bordered caption-top" id="license_info_table">
                <thead class="text-center Table-Header">
                <tr>
                    <th scope="col">Issue To</th>
                    <th scope="col">Issue Date</th>
                    <th scope="col">Valid Till</th>
                </tr>
                </thead>
                <div id="overlay" style="display: none;">
                    <div class="d-flex justify-content-center my-5">
                        <div class="spinner-border text-primary" role="status">
                            <span class="visually-hidden">Loading...</span>
                        </div>
                    </div>
                </div>
                <tbody class="text-center Table-Body" id="license_info_1">

                </tbody>
            </table>

        </div>
    </div>
</div>
<%@include file="Footer.jspf" %>
<!-- modal -->
<div class="modal fade" id="addlicenseModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Update License Information</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12">
                                <label class="control-label" for="formInput526" style="color:red;">Please Update
                                    your License Information</label>
                                <textarea class="form-control" id="license_info" name="license_info" rows="4"
                                          required></textarea>
                            </div>
                        </div>
                </form>
            </div>
            <div class="modal-footer px-0 pb-0">
                <button type="button" class="btn  tertiaryButton text-center"
                        data-bs-dismiss="modal">Close
                </button>
                <button type="button" class="btn primaryButton text-center w-auto" id="license_update_submit"
                        data-bs-dismiss="modal">Update License
                </button>
            </div>
        </div>
    </div>
</div>
<script>
    let scrollStickyFilterContainer = document.getElementById("Filter-container");
    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () {
        scrollFunction()
    };

    function scrollFunction() {
        if (document.body.scrollTop > 40 || document.documentElement.scrollTop > 40) {
            scrollStickyFilterContainer.classList.add("top-scroll-lock");
        } else {
            scrollStickyFilterContainer.classList.remove("top-scroll-lock");
        }
    }
</script>

<!-- ========== data manipulation JS files ========== -->
<script src="js/license/retrieve_license_info.js"></script>
<script src="js/license/update_license.js"></script>
<!-- ========== Other JS files ========== -->
<script src="js/notification/notification.js"></script>
<script src="js/navigation/navigation.js"></script>
<%--	<script src="js/paging/pagination.js"></script>--%>
<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">


</body>
</html>
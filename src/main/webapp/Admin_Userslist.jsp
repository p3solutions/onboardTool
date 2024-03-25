<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Users List</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>D3Sixty - Administration</title>
    <!-- ========== Page style ========== -->
    <link rel="stylesheet" href="./Bootstrap/Admin_userlist.css">
    <!-- ========== SELECT TAG IMPORT ========== -->
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
                <li class="breadcrumb-item inactive my-3 text-light ">
                    <a href="OpportunityList.jsp" class="text-decoration-none breadcrumbtextinactive">Home</a>
                </li>
                <li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Administration</li>
            </ol>
        </nav>
    </div>
</div>
<div class="row m-0">
    <div class="col p-0">
        <div id="Filter-container">
            <ul class="nav nav-underline mx-4 pt-3 pb-0 ">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="Admin_Userslist.jsp">User List</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-dark" href="License_info.jsp">License Information</a>
                </li>
            </ul>
            <hr class="tab-shift">
        </div>
    </div>
</div>
</div>
<div class="row m-0">
    <div class="col p-0">
        <div class="container-fluid px-4" id="Filter-container1">
            <div class="row mb-md-4 pt-1 mb-2">
                <div class="col-lg-4 col-xl-3 col-md-11 col-10 my-lg-0 ">
                    <div class="input-group ">
                                <span class="input-group-append btn1 btn search-button ">
                                    <i class="fa fa-search iconColor"></i>
                                </span>
                        <input class="form-control" type="search" placeholder="Search..." id="search-input">
                    </div>
                </div>
                <div class="col-1 px-0 mb-3 mb-lg-0">
                    <button type="button" style="display: none" id="add_user_btn" class="btn " href="#"
                            data-bs-toggle="modal"
                            data-bs-target="#adduserModal"><i
                            class="fa-solid fa-circle-plus fa-2xl addWaveIcon "></i></button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container-fluid px-4 mb-5">
    <button type="button" class="btn btn-primary pull-right" id="editpopup_btn" style="display: none;"
            data-bs-toggle="modal"
            data-bs-target="#EditPopUp">Edit PopUp
    </button>
    <button type="button" class="btn btn-primary pull-right" id="deletepopup_btn" style="display: none;"
            data-bs-toggle="modal"
            data-bs-target="#DeletePopUp">Delete PopUp
    </button>
    <div class="card">
        <div class="card-header Card-Header" id="cd-header">Users List</div>
        <div class="table-responsive" id="admin_userslist_div">
            <table class="table table-bordered caption-top" id="admin_userslist">
                <thead class="text-center Table-Header">
                <tr>
                    <th scope="col">UserName</th>
                    <th scope="col">FirstName</th>
                    <th scope="col">LastName</th>
                    <th scope="col">Email</th>
                    <th scope="col">Role</th>
                    <th class="useractionheader" style="display: none">Edit</th>
                    <th class="useractionheader" style="display: none">Delete</th>
                </tr>
                </thead>
                <div id="overlay">
                    <div class="cv-spinner">
                        <span class="spinner"></span>
                    </div>
                </div>
                <tbody class="text-center Table-Body" id="AdminUserslist">
                </tbody>
            </table>
        </div>
        <div class="row d-flex justify-content-end m-2 mt-3" id="footer">
            <div class="col-auto pagination-entities mt-1 item-label">Items per page:</div>
            <div class="col-auto mt-2 ">
                <select class="form-select form-select-sm custom-show-entities p-0" id="maxRows">
                    <option value="5">5</option>
                    <option value="10">10</option>
                    <option value="15">15</option>
                    <option value="20">20</option>
                    <option value="50">50</option>
                    <option value="70">70</option>
                    <option value="100">100</option>
<%--                    <option value="5000">Show All</option>--%>
                </select>
            </div>
            <div class="col-auto pagination-entities mt-2 mx-3" id="recordInfo"></div>
            <div class="col-auto mt-3 mt-sm-0">
                <ul class="pagination">
                    <li data-page="prev" class="page-link"><span> << </span></li>
                    <li data-page="next" class="page-link" id="prev"><span> >> <span
                            class="sr-only">(current)</span></span></li>
                </ul>
            </div>
        </div>
    </div>
</div>

<!-- add modal -->
<div class="modal fade" id="adduserModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog  modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title" id="exampleModalLabel">Add New User</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12 mb-2">
                                <label class="control-label" for="formInput526">UserName:</label>
                                <input type="text" class="form-control" id="uname" name="uname" required>
                            </div>
                            <div class="col-lg-12 mb-2">
                                <label class="control-label" for="formInput526">FirstName:</label>
                                <input type="text" class="form-control" id="ufname" name="fname" required>
                            </div>
                            <div class="col-lg-12 mb-2">
                                <label class="control-label" for="formInput526">LastName:</label>
                                <input type="text" class="form-control" id="ulname" name="lname" required>
                            </div>
                            <div class="col-lg-12 mb-2">
                                <label class="control-label" for="formInput526">E-Mail:</label>
                                <input type="text" class="form-control" id="u_email" name="u_email" required>
                            </div>
                            <div class="col-lg-12 mb-2">
                                <label class="control-label" for="formInput526">Password:</label>
                                <i class="fa fa-eye-slash icon" aria-hidden="true" id="u_pwd_togglePassword"></i>
                                <input type="password" class="form-control" id="u_pwd" name="u_pwd" required>
                            </div>
                            <div class="col-lg-12 mb-2">
                                <label class="control-label" for="formInput526">Confirm Password:</label>
                                <i class="fa fa-eye-slash icon" aria-hidden="true"
                                   id="conf_u_pwd_togglePassword"></i>
                                <input type="password" class="form-control" id="conf_u_pwd" name="conf_u_pwd"
                                       required>
                            </div>
                            <div class="col-lg-12 mb-2">
                                <label class="control-label" for="formInput526">Role/Group:</label>
                                <select class="selectpicker form-control mb-3" aria-label=".form-select-lg example"
                                        id="u_role" name="u_role" required>
                                    <option value="">Select</option>
                                    <option>D3SIXTY_SUPER_ADMIN</option>
                                    <option>D3SIXTY_ADMIN</option>
                                    <option>D3SIXTY_TECHNICAL_CONTRIBUTOR</option>
                                    <option>D3SIXTY_ARCHIVE_CONTRIBUTOR</option>
                                    <option>D3SIXTY_DECOMMISSION_CONTRIBUTOR</option>
                                    <option>D3SIXTY_FINANCE_CONTRIBUTOR</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn buttonFrame tertiaryButton text-center"
                        data-bs-dismiss="modal">Close
                </button>
                <button type="button" class="btn primaryButton text-center w-auto" id="add_usersubmit" data-dismiss="modal">Add
                    User
                </button>
            </div>
        </div>
    </div>
</div>
<!-- Edit Modal -->
<div class="modal fade" id="EditPopUp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label">
                <h5 class="modal-title " id="exampleModalLabel">Update User Details</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="PopUpform">
                    <div class="row">
                        <div class="form-group">
                            <div class="col-lg-12">
                                <label class="control-label" for="formInput526">Username:</label>
                                <input type="text" class="form-control mb-2 " id="uname_modify" name="uname" required>
                                <label class="control-label " for="formInput526">Firstname:</label>
                                <input type="text" class="form-control mb-2" id="ufname_modify" name="ufname" required>
                                <label class="control-label" for="formInput526">Lastname:</label>
                                <input type="text" class="form-control mb-2" id="ulname_modify" name="ulname" required>
                                <label class="control-label" for="formInput526">User E-Mail:</label>
                                <input type="text" class="form-control mb-2" id="u_email_modify" name="u_email"
                                       required>
                                <label class="control-label" for="formInput526">User Role:</label>
                                <select class="selectpicker form-control mb-3" aria-label=".form-select-lg example"
                                        id="u_role_modify" name="u_role" required>
                                    <option value="">Select</option>
                                    <option>D3SIXTY_SUPER_ADMIN</option>
                                    <option>D3SIXTY_ADMIN</option>
                                    <option>D3SIXTY_TECHNICAL_CONTRIBUTOR</option>
                                    <option>D3SIXTY_ARCHIVE_CONTRIBUTOR</option>
                                    <option>D3SIXTY_DECOMMISSION_CONTRIBUTOR</option>
                                    <option>D3SIXTY_FINANCE_CONTRIBUTOR</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <input type="text" id="random_id_modify" name="random_id" value="" style="display: none;">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn buttonFrame tertiaryButton text-center" data-bs-dismiss="modal">
                    Cancel
                </button>
                <button type="button" class="btn primaryButton text-center" id="update_submit">Update</button>

            </div>
        </div>
    </div>
</div>
<!-- Delete Modal -->
<div class="modal fade" id="DeletePopUp" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header modal-font-label bg-danger">
                <h5 class="modal-title" id="exampleModalLabel">Delete User</h5>
                <button type="button" class="btn-close modal-close-btn" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form name="DeleteForm">
                    <div class="modal-body">
                        <p>Do you want to Delete this User Permanently?</p>
                        <input type="text" id="random_id" style="display: none;"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer p-1">
                <button type="button" class="btn dangerButtonCancel text-center" data-bs-dismiss="modal">No
                </button>
                <button type="button" class="btn dangerButton text-center" data-bs-dismiss="modal"
                        id="delete_submit">Yes
                </button>
            </div>
        </div>
    </div>
</div>
<%@include file="Footer.jspf" %>
<script>
    let scrollStickyFilterContainer = document.getElementById("Filter-container");
    // let scrollStickyFilterContainer1 =document.getElementById("Filter-container1");
    // When the user scrolls down 20px from the top of the document, show the button
    window.onscroll = function () {
        scrollFunction()
    };

    function scrollFunction() {
        if (document.body.scrollTop > 40 || document.documentElement.scrollTop > 40) {
            scrollStickyFilterContainer.classList.add("top-scroll-lock");
            // scrollStickyFilterContainer1.classList.add("top-scroll-lock");
        } else {
            scrollStickyFilterContainer.classList.remove("top-scroll-lock");
            // scrollStickyFilterContainer1.classList.remove("top-scroll-lock");
        }
    }
</script>
<script>
    const togglePassword10 = document
        .querySelector('#conf_u_pwd_togglePassword');

    const password10 = document.querySelector('#conf_u_pwd');

    togglePassword10.addEventListener('click', () => {
        const type = password10
            .getAttribute('type') === 'password' ?
            'text' : 'password';

        password10.setAttribute('type', type);
        if (type == "password") {
            togglePassword10.classList.remove("fa-eye");
            togglePassword10.classList.add("fa-eye-slash");
        }
        if (type == "text") {
            togglePassword10.classList.remove("fa-eye-slash");
            togglePassword10.classList.add("fa-eye");

        }

    });
</script>

<script>
    const togglePassword11 = document
        .querySelector('#u_pwd_togglePassword');

    const password11 = document.querySelector('#u_pwd');

    togglePassword11.addEventListener('click', () => {
        const type = password11
            .getAttribute('type') === 'password' ?
            'text' : 'password';

        password11.setAttribute('type', type);
        if (type == "password") {
            togglePassword11.classList.remove("fa-eye");
            togglePassword11.classList.add("fa-eye-slash");
        }
        if (type == "text") {
            togglePassword11.classList.remove("fa-eye-slash");
            togglePassword11.classList.add("fa-eye");

        }

    });
</script>
<!-- ========== Select-picker JS FILES ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js"
        integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- ========== data manipulation JS FILES ========== -->
<script src="js/admin_modify_module/admin_retrieve_users.js"></script>
<script src="js/admin_modify_module/admin_add_user.js"></script>
<script src="js/admin_modify_module/DeleteAjaxCall.js"></script>
<script src="js/admin_modify_module/EditAjaxCall.js"></script>
<script src="js/admin_modify_module/admin_users_pagination.js"></script>
<!-- ========== Other JS FILES ========== -->
<script src="js/navigation/navigation.js"></script>
<script src="js/notification/notification.js"></script>
<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

</body>
</html>
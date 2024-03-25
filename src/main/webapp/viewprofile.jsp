<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>D3Sixty-View_Profile</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- ========== JQuery FILES ========== -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

</head>

<body>
<%@include file="Nav-Bar.jspf"%>

<div class="row m-0">
	<div class="col p-0">
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
<ol class="breadcrumb px-4 m-0 ">
		<li class="breadcrumb-item inactive my-3 text-light ">
			<a href="OpportunityList.jsp" class="text-decoration-none breadcrumbtextinactive">Home</a>
		</li>
		<li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">View Profile</li>
	</ol>
</nav>
	</div>
</div>
</div>
<div class="container-fluid p-0 m-0 px-3 mt-5">
	<div class="row my-3 ">
		<div class="col-12 d-flex justify-content-end">
			<button type="button" class="btn primaryButton text-center w-auto " data-bs-toggle="modal"
					data-bs-target="#changepwd">Change Password</button>
		</div>
	</div>
	<div class="card">
		<div class="card-header Card-Header" id="cd-header">
			Profile Details
		</div>
		<div class="table-responsive my-3 mx-2 mx-md-5" id="Report_List_Div">
			<div id="overlay">
				<div class="cv-spinner">
					<span class="spinner"></span>
				</div>
			</div>
			<table class="table table-bordered caption-top" id="admin_userslist">
				<tbody class="text-left" id="AdminUserslist">
				<tr>
					<td><label class="fw-bold">UserName</label></td>
					<td id="uname">

					</td>
				</tr>
				<tr>
					<td><label class="fw-bold">Email Address</label></td>
					<td id="u_email">

					</td>
				</tr>
				<tr>
					<td><label class="fw-bold">First Name</label></td>
					<td id="ufname">

					</td>
				</tr>
				<tr>
					<td><label class="fw-bold">Last Name</label></td>
					<td id="ulname">

					</td>
				</tr>
				<tr>
					<td><label class="fw-bold">Role</label></td>
					<td id="u_role">
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>

<%@include file="Footer.jspf"%>
<!-- ========== Other JS files ========== -->
<script src="js/admin_modify_module/admin_role.js"></script>
 	<script src="js/admin_modify_module/admin_add_user.js"></script>
	<script src="js/admin_modify_module/DeleteAjaxCall.js"></script>
	<script src="js/admin_modify_module/EditAjaxCall.js"></script>
	<script src="js/admin_modify_module/admin_users_pagination.js"></script>
 	<script src="js/admin_modify_module/view_profile.js"></script>
<script src="js/admin_modify_module/admin_role.js"></script>
<script src="js/admin_modify_module/changepwd.js"></script>
<script src="js/notification/notification.js"></script>
<script src="js/BindWave.js"></script>
<!-- ========== Toastr ========== -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

</body>
</html>
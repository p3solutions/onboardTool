<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Users List</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- ========== Toastr ========== -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">

	<!-- ========== COMMON JS FILES ========== -->
	<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<%--	<script src="js/admin_modify_module/view_profile.js"></script>--%>
</head>

<body>
<%@include file="Nav-Bar.jspf"%>

<div class="row m-0">
	<div class="col p-0">
<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
<ol class="breadcrumb px-4 m-0 ">
		<li class="breadcrumb-item inactive my-3 text-light ">
			<a href="#" class="text-decoration-none breadcrumbtextinactive">Home</a>
		</li>
		<li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">View Profile</li>
	</ol>
</nav>
	</div>
</div>
</div>
<div class="container-fluid p-0 m-0 px-3 mt-5 Card-Header">
	<div class="row my-3 mx-1">
		<div class="col-12 d-flex  justify-content-end">
			<button type="button" class="btn primaryButton text-center p-0" data-bs-toggle="modal"
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
			<table class="table table-bordered  table-hover caption-top" id="admin_userslist">
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


<%--<!-- Modal-->--%>

<%--<!-- version modal -->--%>
<%--<div class="modal fade " id="verModal1" tabindex="-1" aria-labelledby="exampleModalLabel"--%>
<%--	 aria-hidden="true">--%>
<%--	<div class="modal-dialog modal-dialog-centered">--%>
<%--		<div class="modal-content">--%>

<%--			<div class="modal-header bg-cardheadercolor">--%>
<%--				<h4 class="modal-title" id="exampleModalLabel">About</h4>--%>
<%--				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--			</div>--%>
<%--			<div class="modal-body">--%>
<%--				<form name="PopUpform">--%>
<%--					<div class="row">--%>
<%--						<div class="form-group">--%>
<%--							<div class="col-lg-12">--%>
<%--								<center>--%>
<%--									<img src="./images/D3-Logo.png">--%>
<%--								</center>--%>
<%--								<div class="col-lg-12">--%>
<%--									<center>--%>
<%--										<label class="versioninfo">Version : <%=versioninfo1%>--%>
<%--										</label>--%>
<%--									</center>--%>
<%--									<center>--%>
<%--										<label class="versioninfo">Copyright &copy; 2022 <a--%>
<%--												href="https://platform3solutions.com/">Platform 3--%>
<%--											Solutions.</a> All Rights Reserved.--%>
<%--										</label>--%>
<%--									</center>--%>
<%--									<center>--%>
<%--										<label class="versioninfo">Trademarks--%>
<%--											owned by Platform 3 Solutions </label>--%>
<%--									</center>--%>
<%--								</div>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</form>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>

<%--<!-- change password modal -->--%>
<%--<div class="modal fade card-font-label" id="changepwd" tabindex="-1" aria-labelledby="exampleModalLabel1"--%>
<%--	 aria-hidden="true">--%>
<%--	<div class="modal-dialog modal-dialog-centered">--%>
<%--		<div class="modal-content">--%>
<%--			<div class="modal-header">--%>
<%--				<h5 class="modal-title" id="exampleModalLabel1">Change Password</h5>--%>
<%--				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>--%>
<%--			</div>--%>
<%--			<div class="modal-body">--%>
<%--				<form name="PopUpform">--%>
<%--					<div class="row">--%>
<%--						<div class="form-group">--%>
<%--							<div class="col-lg-12 mb-2">--%>
<%--								<label class="control-label">Enter--%>
<%--									Current Password:</label> <i class="fa fa-eye-slash icon" aria-hidden="true"--%>
<%--																 id="prev_pwd_togglePassword"></i>--%>
<%--								<input type="password" class="form-control" id="prev_pwd" name="prev_pwd"--%>
<%--									   required/>--%>
<%--							</div>--%>
<%--							<div class="col-lg-12 mb-2">--%>
<%--								<label class="control-label">New--%>
<%--									Password:</label> <i class="fa fa-eye-slash icon" aria-hidden="true"--%>
<%--														 id="new_pwd_togglePassword"></i>--%>
<%--								<input type="password" class="form-control" id="new_pwd" name="new_pwd" required>--%>
<%--							</div>--%>
<%--							<div class="col-lg-12 mb-2">--%>
<%--								<label class="control-label">Confirm--%>
<%--									New Password:</label><i class="fa fa-eye-slash icon" aria-hidden="true"--%>
<%--															id="conf_new_pwd_togglePassword"></i>--%>
<%--								<input type="password" class="form-control" id="conf_new_pwd" name="conf_new_pwd"--%>
<%--									   required>--%>
<%--							</div>--%>
<%--							<div class="col-lg-12 mb-2" style="display: none;">--%>
<%--								<label class="control-label">Username:</label>--%>
<%--								<input type="text" class="form-control" id="user_Name" name="user_Name"--%>
<%--									   value="" required>--%>
<%--							</div>--%>
<%--							<div class="col-lg-12" style="display: none;">--%>
<%--								<label class="control-label">Auth--%>
<%--									Type:</label> <input type="text" class="form-control" id="auth_type"--%>
<%--														 name="auth_type"--%>
<%--														 value="<%=Encode.forHtmlAttribute(authtype8)%>" required>--%>
<%--							</div>--%>
<%--						</div>--%>
<%--					</div>--%>
<%--				</form>--%>
<%--			</div>--%>
<%--			<div class="modal-footer">--%>
<%--				<button type="button" class="btn buttonFrame tertiaryButton text-center" data-bs-dismiss="modal">--%>
<%--					Close--%>
<%--				</button>--%>
<%--				<button type="button" class="btn primaryButton text-center" id="change_PWD">Change--%>
<%--					Password--%>
<%--				</button>--%>
<%--			</div>--%>
<%--		</div>--%>
<%--	</div>--%>
<%--</div>--%>
<%--<script>--%>
<%--	$(document).ready(function () {--%>
<%--		console.log($('#auth_type').val());--%>
<%--		if ($('#auth_type').val() == "SSO") {--%>
<%--			$('.changepwwd').hide();--%>
<%--		}--%>
<%--	});--%>
<%--</script>--%>

<%--<script>--%>
<%--	const togglePassword = document--%>
<%--			.querySelector('#new_pwd_togglePassword');--%>

<%--	const password = document.querySelector('#new_pwd');--%>

<%--	togglePassword.addEventListener('click', () => {--%>
<%--		const type = password--%>
<%--				.getAttribute('type') === 'password' ?--%>
<%--				'text' : 'password';--%>

<%--		password.setAttribute('type', type);--%>
<%--		if (type == "password") {--%>
<%--			togglePassword.classList.remove("fa-eye");--%>
<%--			togglePassword.classList.add("fa-eye-slash");--%>
<%--		}--%>
<%--		if (type == "text") {--%>
<%--			togglePassword.classList.remove("fa-eye-slash");--%>
<%--			togglePassword.classList.add("fa-eye");--%>

<%--		}--%>

<%--	});--%>
<%--</script>--%>
<%--<script>--%>
<%--	const togglePassword1 = document--%>
<%--			.querySelector('#prev_pwd_togglePassword');--%>

<%--	const password1 = document.querySelector('#prev_pwd');--%>

<%--	togglePassword1.addEventListener('click', () => {--%>
<%--		const type = password1--%>
<%--				.getAttribute('type') === 'password' ?--%>
<%--				'text' : 'password';--%>

<%--		password1.setAttribute('type', type);--%>
<%--		if (type == "password") {--%>
<%--			togglePassword1.classList.remove("fa-eye");--%>
<%--			togglePassword1.classList.add("fa-eye-slash");--%>
<%--		}--%>
<%--		if (type == "text") {--%>
<%--			togglePassword1.classList.remove("fa-eye-slash");--%>
<%--			togglePassword1.classList.add("fa-eye");--%>

<%--		}--%>

<%--	});--%>
<%--</script>--%>
<%--<script>--%>
<%--	const togglePassword2 = document--%>
<%--			.querySelector('#conf_new_pwd_togglePassword');--%>

<%--	const password2 = document.querySelector('#conf_new_pwd');--%>

<%--	togglePassword2.addEventListener('click', () => {--%>
<%--		const type = password2--%>
<%--				.getAttribute('type') === 'password' ?--%>
<%--				'text' : 'password';--%>

<%--		password2.setAttribute('type', type);--%>
<%--		if (type == "password") {--%>
<%--			togglePassword2.classList.remove("fa-eye");--%>
<%--			togglePassword2.classList.add("fa-eye-slash");--%>
<%--		}--%>
<%--		if (type == "text") {--%>
<%--			togglePassword2.classList.remove("fa-eye-slash");--%>
<%--			togglePassword2.classList.add("fa-eye");--%>

<%--		}--%>

<%--	});--%>
<%--</script>--%>
<%@include file="Footer.jspf"%>
<script src="js/admin_modify_module/admin_role.js"></script>
	<script src="js/navigation/navigation.js"></script>
 	<script src="js/admin_modify_module/admin_add_user.js"></script>
	<script src="js/admin_modify_module/DeleteAjaxCall.js"></script>
	<script src="js/admin_modify_module/EditAjaxCall.js"></script>
	<script src="js/admin_modify_module/admin_users_pagination.js"></script>
	<!-- ========== Pagination ========== -->
 	<script src="js/admin_modify_module/view_profile.js"></script>
	<script src="js/notification/notification.js"></script>
<script src="js/admin_modify_module/admin_role.js"></script>
<script src="js/admin_modify_module/changepwd.js"></script>
<script src="js/notification/notification.js"></script>
<script src="js/BindWave.js"></script>
</body>
</html>
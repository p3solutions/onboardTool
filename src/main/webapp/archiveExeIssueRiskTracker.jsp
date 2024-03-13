<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- ========== COMMON STYLES ========== -->
<title>D3Sixty - Issue/Risk Tracker</title>

<%--<!-- ========== MODERNIZR ========== -->--%>

<script src="js/jquery/jquery-2.2.4.min.js"></script>
	<script src="js/common/email/emailAjaxCall.js"></script>
<script src="js/archiveExeRiskTracker/archiveExeIssueRiskTracker.js"></script>
<!-- ========== Pagination ========== -->
<%--<script src="js/paging/pagination.js"></script>--%>
	<!-- ========== SELECT TAG IMPORT ========== -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
		  referrerpolicy="no-referrer" />
<%--	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>--%>


</head>

<style>
	.form-control,.form-select{
		width: auto !important;
	}
	.tab-shift {
		position: relative;
		bottom: 33px;
	}
</style>

<body>

	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%
    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
    Date date = new Date();
    System.out.println("[INFO]-----" + formatter.format(date) + "-----Accessed IntakeArchiveRequirements JSP PAGE-----[INFO]"); %>
	<%@page language="java"%>
	<%@page import="java.sql.*"%>
	<%@ page import="onboard.DBconnection"%>


	<%
    try {
        HttpSession details = request.getSession();
        String roles = (String) details.getAttribute("role");
        String det = (String) session.getAttribute("theName");
        String idd = (String) session.getAttribute("appidd");
        String Opportunityname=(String)session.getAttribute("SelectedOpportunity");
        DBconnection d = new DBconnection();
        Connection conn = (Connection) d.getConnection();

%>

	<%@include file="Nav-Bar.jspf"%>
	<div class="row m-0">
		<div class="col p-0">
	<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
		<ol class="breadcrumb px-4 m-0 ">
			<li class="breadcrumb-item inactive my-3 text-light "><a href="DashBoard.jsp"
																	 class="text-decoration-none breadcrumbtextinactive">Home</a></li>
			<li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveExecutionDetails.jsp"
																	 class="text-decoration-none breadcrumbtextinactive">Archive Execution</a></li>
			<li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Issue/Risk Tracker</li>
		</ol>
	</nav>
		</div></div>
			<div class="row m-0">
				<div class="col p-0">
	<div>
		<ul class="nav nav-underline mx-4 py-3 ">
			<li class="nav-item">
				<a class="nav-link text-dark" aria-current="page" href="ArchiveExecutionDetails.jsp">Project Plan</a>
			</li>
			<li class="nav-item">
				<a class="nav-link active" href="archiveExeIssueRiskTracker.jsp">Issue/Risk Tracker</a>
			</li>

		</ul>
		<hr class="tab-shift">
	</div>
				</div></div></div>
	<form class="form-signin" name="loginForm" method="post">
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
										<div class="container-fluid px-3 my-4 mb-5">
											<div class="card">
												<div class="card-header Card-Header">
													Issue/Risk Tracker
												</div>
												<div class="card-body Card-Body" id="inputFieldsAssessment">
													<h6>App Issue</h6>
													<div class="table-responsive" id="inputFieldsRoles">
														<table id="trackerTable" class="table table-bordered ">
															<thead class="text-center Table-Header">
															<tr>
																<th scope="col">ACTION</th>
																<th scope="col">ID</th>
																<th scope="col">IMPACT</th>
																<th scope="col">TYPE</th>
																<th scope="col">DESCRIPTION</th>
																<th scope="col">START DATE</th>
																<th scope="col">RAISED BY</th>
																<th scope="col">ACTION/STATUS</th>
																<th scope="col">ASSIGNED TO</th>
																<th scope="col">RESOLVED</th>
																<th scope="col">EXPECTED DATE</th>
																<th scope="col">END DATE</th>
																<th scope="col">COMMENTS</th>
															</tr>
															</thead>
															<tbody id="AppIssue" class="text-center Table-Body align-middle">

															</tbody>
														</table>
													</div>
													<div class=" mt-3  border-none">
														<!-- pagenation (need to check)-->
														<div class="col-md-12 text-end mt-3">
															<ul class="pagination pagination-lg pager pagination-align"
																id="tracker_page">

															</ul>
														</div>
														<!-- end of pagination -->
														<div class="row">
															<div class="col-12 d-flex  justify-content-center p-2 ">
																<button type="submit" class="btn buttonFrame tertiaryButton text-center" onclick="location.href='ArchiveExecutionDetails.jsp';">Back</button>
																<button type="submit" id="AddIssue" class="btn primaryButton text-center mx-3">Add</button>
																<button type="submit" id="saveArchiveExeIssue" class="btn primaryButton text-center ">Save</button>
															</div>
														</div>
													</div>
												</div>
												<button type="button"
														class="btn btn-primary pull-right"
														id="ArchReqDeleteId" data-bs-toggle="modal"
														data-bs-target="#ArchiveDeletePopUp"
														style="display: none;">Delete PopUp</button>
											</div>
										</div>
		<%@include file="Footer.jspf"%>
										<script>
        function validateform9() {
            var f = document.loginForm;
            f.method = "post";
            f.action = 'ArchivalRequirements';
            f.submit();
        }
    </script>
										</form>


										<!-- modal -->
										<!-- Archive Req Intro Roles & Response Delete PopUp -->
										<div class="modal fade" id="ArchiveDeletePopUp" tabindex="-1" role="dialog">
											<div class="modal-dialog modal-dialog-centered" role="document">
												<div class="modal-content">
													<div class="modal-header modal-font-label">
														<h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
														<button type="button" id="ArchiveDeleteClose" class="btn-close"
																data-bs-dismiss="modal" aria-label="Close"></button>
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
														<button type="button" class="btn buttonFrame tertiaryButton text-center" id="closeIdDelete"
																data-bs-dismiss="modal" aria-label="Close">No</button>
														<button type="button" id="ArchiveDeleteSubmit"
																class="btn primaryButton text-center submitDisableDelete">Yes</button>
													</div>
												</div>
											</div>
										</div>

	<%
    } 
    catch (Exception e) {
    }
%>

	<!-- Active Icon Color changes  -->
	<script>
$(document).on('mouseenter','.active1', function(){
$('.activeIcon').css('color','#1565c0');
 
});
 
$(document).on('mouseleave','.active1', function(){
$('.activeIcon').css('color','#fff');
 
});
</script>
	<script src="js/notification/notification.js"></script>
	<script src="js/navigation/navigation.js"></script>
	<!-- ========== COMMON JS FILES ========== -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<!-- ========== THEME JS ========== -->
	<script id="scripttag"></script>
	<!-- ========== PAGE JS FILES ========== -->
	<script type="text/javascript"
		src="js/date-picker/bootstrap-datepicker.js"></script>
	<script type="text/javascript"
		src="js/date-picker/jquery.timepicker.js"></script>
	<script type="text/javascript" src="js/date-picker/datepair.js"></script>
	<script type="text/javascript" src="js/date-picker/moment.js"></script>
		<script id="scripttag"></script>

	<script type="text/javascript"
		src="js/Requirements/ArchiveRequirements/Introduction/ArchiveIntroSave.js"></script>

	<!-- ========== Toastr ========== -->
	<script
			src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link
			href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
			rel="stylesheet">

</body>
</html>
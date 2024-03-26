<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script
	src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/businessReqInfo/businessReqDataRetrieveAjaxCall.js"></script>
<script
	src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/funtionalReqInfo/archiveFunctionalReqDataRetrieveAjaxCall.js"></script>
<script
	src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqDataRetrieveAjaxCall.js"></script>
<script src="js/jquery/jquery-2.2.4.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/css/bootstrap-select.min.css" integrity="sha512-mR/b5Y7FRsKqrYZou7uysnOdCIJib/7r5QeJMFvLNHNhtye3xJp1TdJVPLtetkukFn227nKpXD9OjUc09lx97Q==" crossorigin="anonymous"
		  referrerpolicy="no-referrer" />
</head>
<style>
	.dropdown-item{
		cursor: pointer !important;
	}
	.table,tr,th{
		background-color: #f2f7fa !important;
		color: #474747 !important;
		font-size: 5px !important;
	}
	.dropdown-styles{
		padding-top: 10px !important;
		padding-bottom: 10px !important;
	}
	.dropdown-styles:hover{
		background-color: #d9edff !important;
		color: #474747 !important;
	}
</style>
<body>
	<%@ page import="java.text.SimpleDateFormat"%>
	<%@ page import="java.util.Date"%>
	<%
SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Date date = new Date();
System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Grid JSP PAGE-----[INFO]"); %>
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
else{
String name=(String)session.getAttribute("ID");
HttpSession details=request.getSession();
Connection con = null;
session.setAttribute("theName", name);
String roles=(String)details.getAttribute("role");
String OpportunityName = (String)details.getAttribute("SelectedOpportunity");
String s=OpportunityName;
System.out.println("Welcome"+OpportunityName);
int sumcount=0;
Statement st,st2;
try{
con=dBconnection.getConnection();
Statement st1;
%>


			<%@include file="Nav-Bar.jspf"%>
			<div class="row m-0">
				<div class="col p-0">
					<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%23f1f1f1'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
						<ol class="breadcrumb px-4 m-0 ">
							<li class="breadcrumb-item inactive my-3 text-light "><a href="DashBoard.jsp"
																					 class="text-decoration-none breadcrumbtextinactive">Home</a></li>
							<li class="breadcrumb-item inactive my-3 text-light "><a href="OpportunityGrid.jsp"
																					 class="text-decoration-none breadcrumbtextinactive"><%=Encode.forHtml(OpportunityName)%></a></li>
							<li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveDecommPage.jsp"
																					 class="text-decoration-none breadcrumbtextinactive">Requirements</a></li>
							<li class="breadcrumb-item inactive my-3 text-light "><a href="ArchiveRequirementsIntroDetails.jsp"
																					 class="text-decoration-none breadcrumbtextinactive">Introduction</a></li>
							<li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsLegacyDetails.jsp"
																					 class="text-decoration-none breadcrumbtextinactive">Legacy Application Info</a></li>
							<li class="breadcrumb-item inactive my-3 text-light "><a href="archiveRequirementsRetentionDetails.jsp"
																					 class="text-decoration-none breadcrumbtextinactive">Retention Details</a></li>
							<li class="breadcrumb-item active my-3 breadcrumbtextactive" aria-current="page">Business Requirements</li>
						</ol>
					</nav>
				</div></div></div>

			<%
}
catch(Exception e){
e.printStackTrace();
}
} %>

	<form class="form-signin" name="loginForm" method="post">
	<div class="container-fluid m-0 my-5 px-4">
		<div class="card">
			<!-- Business Requirements Table -->
			<div class="card-header Card-Header" id="cd-header">
				Business Requirements
			</div>
			<div class="card-body mx-4" id="inputFieldsBusiness">
				<div class="row changeText1 business " contenteditable='true'>
					<ul>
						<li>Each requirement must be marked as
							In-Scope or Out-of-Scope for this project, with
							additional information specific to each
							requirement if necessary.</li>
						<li>Requirement IDs are linked to test script
							IDs to ensure traceability from requirement to
							test execution. Requirement IDs may be formatted
							according to client needs.</li>
					</ul>
				</div>
			</div>
			<!-- Req in scope -->
			<div class="accordion m-3 " id="accordionExample">
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingOne">
						<button class="accordion-button" type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true"
								aria-controls="collapseOne">
							Requirement In Scope
						</button>
					</h2>
					<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne"
						 data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="table-responsive">
								<table class="table table-bordered ">
									<thead class="text-center ">
									<tr>
										<th scope="col">REQ IN-SCOPE(Y/N)</th>
										<th scope="col">DESCRIPTION</th>
										<th scope="col">ACTION</th>
									</tr>
									</thead>
									<tbody id="reqinscope" class="text-center align-middle">

									</tbody>
								</table>
								<div class="col-12 d-flex justify-content-center">
									<button type="submit" class="btn primaryButton text-center"
											id="SaveReqInScope">Save</button>
									<button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn"
											onclick="window.location.href='archiveRequirementsLegacyDetails.jsp';"
											style="display: none;"></button>
								</div>
							</div>
						</div>
					</div>
				</div>
<%--				Functional Requirements--%>
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingTwo">
						<button class="accordion-button collapsed " type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false"
								aria-controls="collapseTwo">
							Functional Requirements
						</button>
					</h2>
					<div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo"
						 data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="table-responsive">
								<table class="table table-bordered caption-top ">
									<caption class="text-dark">
										<h6>4.1.1 Data Requirements</h6>
									</caption>
									<thead class="text-center">
									<tr>
										<th scope="col">Req Id</th>
										<th scope="col">Req In-Scope Y/N</th>
										<th scope="col">Requirement Type</th>
										<th scope="col">Requirement</th>
										<th scope="col">Additional Info</th>
										<th scope="col">Action</th>
									</tr>
									</thead>
									<tbody id="DataReqId" class="text-center align-middle">

									</tbody>
								</table>
							</div>
							<div class="col-12 d-flex justify-content-center mb-4">
								<button class="btn secondaryButton text-center addClass mx-2" type="button"
										id="dataReqAdd">Add</button>
								<button type="submit" class="btn primaryButton text-center dataSaveClass"
										id="dataSaveReq" disabled="true">Save</button>
							</div>
							<div class="table-responsive">
								<table class="table table-bordered caption-top ">
									<caption class="text-dark">
										<h6>4.1.2 Retention and Legal
											Requirements</h6>
									</caption>
									<thead class="text-center">
									<tr>
										<th scope="col">Req Id</th>
										<th scope="col">Req In-Scope Y/N</th>
										<th scope="col">Requirement Type</th>
										<th scope="col">Requirement</th>
										<th scope="col">Additional Info</th>
										<th scope="col">Action</th>
									</tr>
									</thead>
									<tbody id="LegalReqId" class="text-center align-middle">

									</tbody>
								</table>
							</div>
							<div class="col-12 d-flex justify-content-center mb-4">
								<button class="btn secondaryButton text-center addClass mx-2" type="button"
										id="legalReqSaveAdd">Add</button>
								<button type="submit" class="btn primaryButton text-center dataSaveClass"
										id="legalReqSaveReq" disabled="true">Save</button>
							</div>
							<div class="table-responsive">
								<table class="table table-bordered caption-top ">
									<caption class="text-dark">
										<h6>4.1.3 Security Requirements</h6>
									</caption>
									<thead class="text-center">
									<tr>
										<th scope="col">Req Id</th>
										<th scope="col">Req In-Scope Y/N</th>
										<th scope="col">Requirement Type</th>
										<th scope="col">Requirement</th>
										<th scope="col">Additional Info</th>
										<th scope="col">Action</th>
									</tr>
									</thead>
									<tbody id="SecurityReqId" class="text-center align-middle">

									</tbody>
								</table>
							</div>
							<div class="col-12 d-flex justify-content-center mb-4">
								<button class="btn secondaryButton text-center addClass mx-2" type="button"
										id="securityReqAdd">Add</button>
								<button type="submit" class="btn primaryButton text-center dataSaveClass"
										id="securityReqSaveReq" disabled="true">Save</button>
							</div>
							<div class="table-responsive">
								<table class="table table-bordered caption-top ">
									<caption class="text-dark">
										<h6>4.1.4 Usability Requirements</h6>
									</caption>
									<thead class="text-center">
									<tr>
										<th scope="col">Req Id</th>
										<th scope="col">Req In-Scope Y/N</th>
										<th scope="col">Requirement Type</th>
										<th scope="col">Requirement</th>
										<th scope="col">Additional Info</th>
										<th scope="col">Action</th>
									</tr>
									</thead>
									<tbody id="UsabilityReqId" class="text-center align-middle">

									</tbody>
								</table>
							</div>
							<div class="col-12 d-flex justify-content-center mb-4">
								<button class="btn secondaryButton text-center addClass mx-2" type="button"
										id="UsabilityReqAdd">Add</button>
								<button type="submit" class="btn primaryButton text-center dataSaveClass"
										id="UsabilityReqSaveReq" disabled="true">Save</button>
							</div>
							<div class="table-responsive">
								<table class="table table-bordered caption-top ">
									<caption class="text-dark">
										<h6>4.1.5 Audit Requirements</h6>
									</caption>
									<thead class="text-center">
									<tr>
										<th scope="col">Req Id</th>
										<th scope="col">Req In-Scope Y/N</th>
										<th scope="col">Requirement Type</th>
										<th scope="col">Requirement</th>
										<th scope="col">Additional Info</th>
										<th scope="col">Action</th>
									</tr>
									</thead>
									<tbody id="AuditReqId" class="text-center align-middle">

									</tbody>
								</table>
							</div>
							<div class="col-12 d-flex justify-content-center mb-4">
								<button class="btn secondaryButton text-center addClass mx-2" type="button"
										id="auditReqAdd">Add</button>
								<button type="submit" class="btn primaryButton text-center dataSaveClass"
										id="auditReqSaveReq" disabled="true">Save</button>
							</div>
						</div>

					</div>
				</div>
				<!-- Screen Requirements -->
				<div class="accordion-item">
					<h2 class="accordion-header" id="headingThree">
						<button class="accordion-button collapsed " type="button"
								data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false"
								aria-controls="collapseThree">
							Screen Requirements
						</button>
					</h2>
					<div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree"
						 data-bs-parent="#accordionExample">
						<div class="accordion-body">
							<div class="table-responsive">
								<table class="table table-bordered ">
									<thead class="text-center">
									<tr>
										<th scope="col">Req Id</th>
										<th scope="col">Screen Display Name in Infoarchive</th>
										<th scope="col">Purpose</th>
										<th scope="col">Equivalent in the Legacy Application</th>
										<th scope="col">Action</th>
									</tr>
									</thead>
									<tbody id="screenReqInfo" class="text-center align-middle">

									</tbody>
								</table>
							</div>
							<div class="col-12 d-flex justify-content-center mb-4">
								<button class="btn secondaryButton text-center mx-2" type="button" data-bs-toggle="modal"
										data-bs-target="#screenReqAddPopUp">Add</button>
								<button type="submit" class="btn primaryButton text-center"
										id="saveScreenReqId">Save</button>
								<button type="button" class="btn btn-primary" id="OpportunityListbtn"
										onclick="window.location.href='archiveRequirementsLegacyDetails.jsp';"
										style="display: none;"></button>
							</div>
							<div class="table-responsive">
								<table class="table table-bordered ">
									<thead class="text-center ">
									<tr>
										<th scope="col">Req Id</th>
										<th scope="col">Search Form Name</th>
										<th scope="col">Search Field Name</th>
										<th scope="col">Field Format</th>
										<th scope="col">Data Type</th>
										<th scope="col">Date Retrieval Requirement</th>
										<th scope="col">Required Field</th>
										<th scope="col">Search Field Additional Information</th>
										<th scope="col">Action</th>
									</tr>
									</thead>
									<tbody id="searchFormInfo" class="text-center align-middle">

									</tbody>
								</table>
							</div>
							<div class="col-12 d-flex justify-content-center mb-4">
								<button class="btn secondaryButton text-center mx-2" type="button" data-bs-toggle="modal"
										data-bs-target="#searchFormAddPopUp">Add</button>
								<button type="submit" class="btn primaryButton text-center"
										id="saveSearchFormId">Save</button>
								<button type="button" class="btn btn-primary pull-right" id="OpportunityListbtn"
										onclick="window.location.href='archiveRequirementsLegacyDetails.jsp';"
										style="display: none;"></button>
							</div>
						</div>
					</div>
				</div>
			</div>
			<button type="button" class="btn btn-primary pull-right" id="DataDeleteId" data-bs-toggle="modal"
					data-bs-target="#DataDeletePopUp" style="display: none;">Delete
				PopUp</button>
			<button type="button" class="btn btn-primary pull-right" id="screenInfoDeleteId" data-bs-toggle="modal"
					data-bs-target="#screenInfoDeletePopUp" style="display: none;">Delete PopUp</button>
			<div class="row my-3 mx-1">
				<div class="col-12 d-flex justify-content-center">
					<button type="button" class="btn  tertiaryButton text-center mx-2"
							onclick="location.href='archiveRequirementsRetentionDetails.jsp';">Prev</button>
					<button type="submit" class="btn secondaryButton text-center" id="edit">Edit</button>
					<button type="submit" class="btn primaryButton text-center px-1 mx-2" id="complete"
							disabled="true">Complete</button>
					<button class="btn primaryButton text-center" id="busreqNext">
<%--						<a href="javascript:;" class="text-decoration-none text-reset">Next</a>--%>
						<a href="archiveReqAbbrevation.jsp" class="text-decoration-none text-reset">Next</a>

					</button>
				</div>
			</div>
		</div>
	</div>
<%--				<script>--%>
<%--        function validateform9() {--%>
<%--            var f = document.loginForm;--%>
<%--            f.method = "post";--%>
<%--            f.action = 'ArchivalRequirements';--%>
<%--            f.submit();--%>
<%--        }--%>
<%--    </script>--%>
				<%
       //     }
    //    }
    %>

	</form>
	<!-- Data Req Delete PopUp -->
	<div class="modal fade" id="DataDeletePopUp" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header modal-font-label">
					<h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
					<button type="button" id="DataDeleteClose" class="btn-close"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form name="DeleteForm">
						<div class="modal-body">
							<p>Do you want to delete this Row permanently?</p>
							<input type="hidden" id="DataDeleteSeq" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn  tertiaryButton text-center"
						id="closeDataIdDelete" data-bs-dismiss="modal" aria-label="Close">No</button>
					<button type="button" id="DataDeleteSubmit"
							class="btn primaryButton text-center submitDisableData" data-bs-dismiss="modal">Yes</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Screen Req Info Add Popup  -->
	<div class="modal fade" id="screenReqAddPopUp" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header modal-font-label">
					<h5 class="modal-title" id="exampleModalLabel">Add Input
						Fields</h5>
					<button type="button" id="screenReqAddClose" class="btn-close"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form name="PopUpform">
						<div class="row">
							<div class="form-group">
								<div class="col-lg-8">
									<label class="control-label" for="Legacy">Screen
										Display Name in Infoarchive:</label> <input type="text"
										class="form-control" id="screenReqAddId"
										name="screenReqAddName" required>
								</div>
							</div>
						</div>
						<br />
						<input type="text" id="screenReqAddSeqNum" name="" value=""
							style="display: none;" /> <input type="text"
							id="screenReqAddSection" name="" value="" style="display: none;" />
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn  tertiaryButton text-center"
						data-bs-dismiss="modal" id="closeIdScreenInfo" aria-label="Close">Cancel</button>
					<button type="button" id="screenReqAddSubmit"
							class="btn primaryButton text-center" data-bs-dismiss="modal">Submit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Search Form Add popup -->
	<div class="modal fade" id="searchFormAddPopUp" tabindex="-1" role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header modal-font-label">
					<h5 class="modal-title" id="exampleModalLabel">Add Input
						Fields</h5>
					<button type="button" id="searchFormAddClose" class="btn-close"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form name="PopUpform">
						<div class="row">
							<div class="form-group">
								<div class="col-lg-8">
									<label class="control-label" for="formInput526">Type:</label> <select
										id="searchFormTypesId" class="form-select"
										name="searchFormTypesName" required>
									</select>
								</div>
							</div>
						</div>
						<br /> <input type="text" id="searchFormAddSeqNum" name=""
							value="" style="display: none;" /> <input type="text"
							id="searchFormAddSection" name="" value="" style="display: none;" />
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn  tertiaryButton text-center"
						data-bs-dismiss="modal" id="closeIdsearchForm" aria-label="Close">Cancel</button>
					<button type="button" id="searchFormAddSubmit"
							class="btn primaryButton text-center" data-bs-dismiss="modal">Submit</button>
				</div>
			</div>
		</div>
	</div>
	<!-- Screen Req Info Delete PopUp -->
	<div class="modal fade" id="screenInfoDeletePopUp" tabindex="-1"
		role="dialog">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header modal-font-label">
					<h5 class="modal-title" id="exampleModalLabel">Delete Field</h5>
					<button type="button" id="screenInfoDeleteClose" class="btn-close"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form name="DeleteForm">
						<div class="modal-body">
							<p>Do you want to delete this Row permanently?</p>
							<input type="hidden" id="screenInfoDeleteSeq" />
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn  tertiaryButton text-center"
						id="closeScreenInfoDelete" data-bs-dismiss="modal"
						aria-label="Close">No</button>
					<button type="button" id="screenInfoDeleteSubmit"
							class="btn primaryButton text-center submitDisableScreenInfo"
							data-bs-dismiss="modal">Yes</button>
				</div>
			</div>
		</div>
	</div>
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
	<!-- ========== COMMON JS FILES ========== -->
<%--	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>--%>


	<script type="text/javascript" src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/businessReqInfo/businessReqInScopeToDoList.js"></script>
<%--	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>--%>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.14.0-beta2/js/bootstrap-select.min.js" integrity="sha512-FHZVRMUW9FsXobt+ONiix6Z0tIkxvQfxtCSirkKc5Sb4TKHmqq1dZa8DphF0XqKb3ldLu/wgMa8mT6uXiLlRlw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

	<!-- ========== PAGE JS FILES ========== -->
	<script src="js/notification/notification.js"></script>
	<script type="text/javascript"
		src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/businessReqInfo/businessReqSave.js"></script>
	<script type="text/javascript"
		src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/funtionalReqInfo/archiveFunctionalReqAddAjaxCall.js"></script>
	<script type="text/javascript"
		src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/funtionalReqInfo/archiveFunctionalReqDeleteAjaxCall.js"></script>
	<script type="text/javascript"
		src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/funtionalReqInfo/archiveFunctionalReqSaveAjaxCall.js"></script>
	<script
		src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqAddAjaxCall.js"></script>
	<script
		src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqSearchFormAddAjaxCall.js"></script>
	<script
		src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqEditDeleteAjaxCall.js"></script>
	<script
		src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqSaveAjaxCall.js"></script>
	<script
		src="js/Requirements/ArchiveRequirements/businessRequirementsDetails/screenReqInfo/screenReqSearchFormSaveAjaxCall.js"></script>
	<script src="js/navigation/navigation.js"></script>
	<!-- ========== Toastr ========== -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<link
		href="//cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css"
		rel="stylesheet">
</body>
</html>
var path = window.location.pathname;
var page = path.split("/").pop();

$(document).ready(function() {

	switchActiveModule();

});

function switchActiveModule() {
	switch (page) {
		case "OpportunityList.jsp":
		case "Intake-NewOpportunity.jsp":
		case "OpportunityGrid.jsp":
		case "IntakeOpportunity.jsp":
		case "IntakeTriage.jsp":
		case "archiveRequirementsLegacyDetails.jsp":
		case "IntakeTriageSummary.jsp":
		case "IntakeAssessment.jsp":
		case "IntakeStakeHolder.jsp":
		case "IntakeReviewDetails.jsp":
		case "IntakeApproval.jsp":
		case "ArchiveDecommPage.jsp":
		case "ArchiveRequirementsIntroDetails.jsp":
		case "archiveRequirementsRetentionDetails.jsp":
		case "ArchiveBusinessRequirements.jsp":
		case "archiveReqAbbrevation.jsp":
		case "archiveRequirementsDocumentRevisions.jsp":
		case "archiveRequirementsAddendum.jsp":
		case "archiveRequirementsReviewDetails.jsp":
		case "archiveRequirementsApprovalDetails.jsp":
		case "ArchiveExecutionDetails.jsp":
		case "archiveExeIssueRiskTracker.jsp":
			selectiveActiveIcon(0);
			break;
		/*case "Admin_Module_Send_Invites.jsp":
		case "Modify_Admin_Users_list.jsp":*/
		case "Admin_Userslist.jsp":
		case "License_info.jsp":
		
		/*case "Admin_Role_Details.jsp":*/
			selectiveActiveIcon(1);
			break;
		case "PhaseList.jsp":
		case "NewPhase.jsp":
		case "waveList.jsp":
		case "NewGovernance.jsp":
		case "GovernanceList.jsp":
		case "waveGrid.jsp":
		case "waveEdit.jsp":
		case "phaseEdit.jsp":
		case "applicationList.jsp":
		case "Governance_Home.jsp":
		case "ArchiveExecutionDetails_Governance.jsp":
			selectiveActiveIcon(2);
			break;
		case "DashBoard.jsp":
			selectiveActiveIcon(4);
			break;
		case "FinanceList.jsp":
		case "Finance.jsp":
		case "FinanceAdd.jsp":
			selectiveActiveIcon(3);
			break;
	}
}

function selectiveActiveIcon(index) {
	$(".moduleIcon").eq(index).addClass("selected");
	$(".moduleIcon i").eq(index).removeClass("iconColor");
	$(".moduleIcon i").eq(index).addClass("activeIcon");
	$(".moduleIcon a").eq(index).attr("id", "title");
	var iconLength = $(".moduleIcon").length;
	for (var i = 0; i < iconLength; i++) {
		if (i != index)
			$(".moduleIcon a").eq(i).addClass("iconColor1");
	}
}
$(document).on('mouseenter', '.selected', function() {

	$('.activeIcon').css('color', '#1565c0');
	var index = $(this).index('.selected');
	$('.selected').eq(index).css('background-color', '#f8f9fa');

});

$(document).on('mouseleave', '.selected', function() {

	$('.activeIcon').css('color', '#fff');
	var index = $(this).index('.selected');
	$('.selected').eq(index).css('background-color', '#1565c0');
	$('.selected a').eq(index).css('color', '#fff');
});
$(document).on('mouseenter', '.iconColor1', function() {
	var index = $(this).index('.iconColor1');
	$('.iconColor1').eq(index).css('background-color', '#f8f9fa');

});

$(document).on('mouseleave', '.iconColor1', function() {
	var index = $(this).index('.iconColor1')
	$('.iconColor1').eq(index).css('background-color', '#fff');

});
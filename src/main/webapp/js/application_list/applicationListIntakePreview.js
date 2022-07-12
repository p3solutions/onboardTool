var checkScope = false;
var checkRoles = false;
var number = 0;
var dependencyColumn = "";
var readOnlyValue = "";
var finalCheck;
var exportContent = [];
var JsonObject = [];
$(document).ready(function() {
	getDataWithPhaseAndWave();
});
$('#cancelwithphase').click(function(){
$('#applicationList').empty();
$("#phase-list" + number).empty();
$("#wave-list" + number).empty();
number = 0;
getDataWithPhaseAndWave();
});
function getDataWithPhaseAndWave() {
	$.ajax({
		url: "PlanAndPriorityWithinPhase",
		type: 'POST',
		dataType: "json",
		 beforeSend : function(){
         $('#overlay1').show();
  },
		success: function(data) {
			 $('#overlay1').hide();
			console.log(data);
			$.each(data[0], function(key, value) {
				var opportunityName = value.app_name;
				var opportunityId = value.Id;
				var phaseName = value.phaseName;
				var waveName = value.waveName;
				var disable = "disabled";
				var phaseOptions = "<option selected class='options Select' id='phase-list" + number + "' value='" + phaseName + "'>" + phaseName + "</option>"
				$.each(data[1][1][0], function(key, value) {
					phaseOptions += "<option class='phaseOptions options' value='" + value.phaseName + "'>" + value.phaseName + "</option>";
				});
				var waveOptions = "<option selected class='options Select' id='wave-list" + number + "' value='" + waveName + "'>" + waveName + "</option>"
				$.each(data[1][1][1], function(key, value) {
					var phaseList1 = ((value.phaseName).replaceAll(" ", "")).replaceAll("-", "");
					waveOptions += "<option class='options waveOptions " + phaseList1 + "' value='" + value.waveName + "'>" + value.waveName + "</option>";
				});
				var t_row = "<tr class='rowClass'>"
					+ "<td style='display: none;'><input type = 'text' class ='applicationId' " + disable + " style='width:100%; border:none; text-align:center; background-color: #fff;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + opportunityId + "'>" + opportunityId + "</td>"
					+ "<td><input type = 'text' class ='applicationName' value = '" + opportunityName + "'" + disable + " style='width:100%; border:none; text-align:center; background-color: #fff;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + opportunityName + "'></td>"
					+ "<td>" + "<select class='form-select phase' id='phase1' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;' " + disable + ">" +
					phaseOptions +
					"</select>" + "</td>"
					+ "<td>" + "<select class='form-select wave' id='wave1" + number + "' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;' " + disable + ">" +
					waveOptions +
					"</select>" + "</td>"
					+ "<td style='text-align:center;vertical-align: middle;'><span class='fa fa-pencil-square-o editpopup1' style='display:block;'></span>" +
					"</td>" +
					"<td><div class='col-md-4 dropdown'><img src='images/icons8-expand-arrow-25.png' class='dropdown-toggle' data-toggle='dropdown'></img>" +
					"<ul class='dropdown-menu' style = 'min-width: inherit;'>" +
					"<li><a  class='fa fa-edit EditRow' style='font-size: 19px; color: black;'>&nbsp;&nbsp;&nbsp;Edit</a></li>" +
					"<li><a  class='fa fa-trash DeleteRow' style='font-size: 18px; color: black;'>&nbsp;&nbsp;&nbsp;Delete</a></li>" +
					"</ul>" +
					"</div>" +
					"</td>" +
					"</tr>";
				$('#applicationList').append(t_row);
				number++;
			});
			noDataFoundWithphase(number);
			getPagination1('#appwithphase');
		}
	})
}
function noDataFoundWithphase(count1) {
	if (count1 < 1) {
		$("#notFound1").show();
	} else {
		$("#notFound1").empty();
		$("#notFound1").hide();
	}
}
$(document).on('change', '#phase1', function(j) {
	$(".waveOptions").hide();
	var phaseName = $(this).val();
	if (phaseName == "") {
		$("." + (phaseName.replaceAll(" ", "")).replaceAll("-", "")).show();
		$("#wave1" + j).val("");
	}
	else {
		$(".waveOptions").show();
	}
});
$(document).on('change', '.filter', function(j) {
	var phase = $("#phase1").val();
	var wave = $("#wave1" + j).val();
	filterAjaxCall(category, phase, wave);
});
function filterAjaxCall(category, phase, wave) {
	$.ajax({
		url: "OpportunityFilterListServlet",
		type: 'POST',
		dataType: "json",
		data: { wave: wave, category: category, phase: phase, bySearch: false },
		success: function(data) {
			console.log("Data:", data);
			if (!$.isArray(data)) {
				data = [data];
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}
$(document).on('click', '#saveApplicationList', function(e) {
	var validation = false;
	var JsonArray = [];
	for (var i = 0; i < $('.rowClass').length; i++) {
		var inputs = {};
		var appId = $('.applicationName').eq(i).val();
		var phaseId = $('.phase').eq(i).val();
		var waveId = $('.wave').eq(i).val();
		validation = true;
		inputs['appName'] = appId;
		inputs['phase'] = phaseId;
		inputs['wave'] = waveId;
		inputs['flag'] = "U";
		JsonArray.push(inputs);
	}
	if (validation) {
		console.log("JsonArray Retrieve--->", JsonArray);
		applicationListSaveAjaxcall(JsonArray);
		notification("success", "Updated successfully.", "Note:");
		$('#applicationList').empty();
		$("#phase-list" + number).empty();
		$("#wave-list" + number).empty();
		number = 0;
		getDataWithPhaseAndWave();
		
	} else {
		
		notification("warning", "No data available", "Warning");
	}
	e.preventDefault();
});
function applicationListSaveAjaxcall(JsonArray) {
	$.ajax({
		url: "PlanAndPrioritySaveServlet",
		type: 'POST',
		data: { JsonArray: JSON.stringify(JsonArray) },
		async: false,
		dataType: "json",
		success: function(data) {
			console.log("SAVE DATA:", data);
			JsonObject = data;
		},
		error: function(e) {
			console.log(e);
		}
	});
	return JsonObject;
}
$(document).on('click', '.EditRow', function(i) {
	var seqnum = $(this).index('.EditRow');
	var Disabled = $('.phase').eq(seqnum).is('[disabled]');
	if (Disabled) {
		disabledPropertyConfig(seqnum, false);
		$("#phase-list" + seqnum).empty().append('<option selected="selected" value="Select">Select</option>');
		$("#wave-list" + seqnum).empty().append('<option selected="selected" value="Select">Select</option>');
		notification("info", "Selected row is editable.", "Info");
	}
	else {
		disabledPropertyConfig(seqnum, true);
		notification("info", "Selected row is non editable", "Info");
	}
});
function disabledPropertyConfig(index, prop) {
	var fieldClass = ['phase', 'wave'];
	for (var i = 0; i < fieldClass.length; i++) {
		var checkrole = true;
		if (checkrole) {
			$("." + fieldClass[i]).eq(index).attr('disabled', '');
			$("." + fieldClass[i]).eq(index).attr('disabled', prop);
		}
	}
	if (prop == false)
		$(".phase").eq(index).focus();
}
/*function searchPhaseFunction(i) {
	$('#phaseSearch' + i).keyup(function() {
		$('#phaseResult' + i).html('');
		var searchField = $('#phaseSearch' + i).val();
		var expression = new RegExp(searchField, "i");
		$.ajax({
			type: "POST",
			url: "PlanAndPriorityWithoutPhaseWaveServlet",
			dataType: "json",
			success: function(data) {
				console.log(data);
				if (!$.isArray(data)) {
					data = [data];
				}
				$('#phaseResult' + i).empty();
				$.each(data[1][3][1], function(key, value) {
					if (value.phaseName.search(expression) != -1) {
						$('#phaseResult' + i).append('<li class="list-group-item link-class">' + value.phaseName + '</li>');
					}
				});
			}
		});
	});
	$('#phaseResult' + i).on('click', 'li', function() {
		var click_text = $(this).text();
		$('#phaseSearch' + i).val(click_text);
		$("#phaseResult" + i).html('');
	});
};
*/
/*function searchWaveFunction(i) {
	$('#waveSearch' + i).keyup(function() {
		$('#waveResult' + i).html('');
		var searchField = $('#waveSearch' + i).val();
		var expression = new RegExp(searchField, "i");
		$.ajax({
			type: "POST",
			url: "PlanAndPriorityWithoutPhaseWaveServlet",
			dataType: "json",
			success: function(data) {
				console.log(data);
				if (!$.isArray(data)) {
					data = [data];
				}
				$('#waveResult' + i).empty();
				$.each(data[1][3][1], function(key, value) {
					if (value.waveName.search(expression) != -1) {
						$('#waveResult' + i).append("<li class='list-group-item link-class filterWave'>" + value.waveName + "</li>");
						console.log(value.waveName);
					}
				});
			}
		});
	});
	$('#waveResult' + i).on('click', 'li', function() {
		var click_text = $(this).text();
		$('#waveSearch' + i).val(click_text);
		$("#waveResult" + i).html('');
	});
};*/
$(document).on('click', '.editpopup1', function() {
	var intakePreview = $(this).closest("tr");
	var demo = intakePreview.find("td:eq(0)").text();
	$('#demo').val(demo);
	$('#editpopup_btn').click();
	$.ajax({
		url: "planAndPriorityIntakePreviewDataRetrieveServlet",
		type: 'POST',
		dataType: "json",
		data: { demo: demo },
		success: function(data) {
			console.log("Data Retrieve Preview json array----->", data);
			exportContent = data;
			var inputs = {};
			$("#OpportunityInfoPreview").html("");
			$("#TriageInfoPreview").html("");
			$("#TriageSummInfoPreview").html("");
			$("#ApplicationInformationPreview").html("");
			$("#DataCharacteristicsPreview").html("");
			$("#ComplianceCharacteristicsPreview").html("");
			$("#ArchivalConsumptionPreview").html("");
			$("#ContractInformationPreview").html("");
			$("#StakeHolderInfoPreview").html("");
			for (var i = 0; i < data[0].length; i++) {
				var OppTag = "<pre style='font-family:verdana;font-size:100%;' class = 'OppInfoPreview'><b>" + data[0][i].LabelName + "</b> : " + data[0][i].Value + " </pre>";
				$("#OpportunityInfoPreview").append(OppTag);
			}
			var checkTriageDependency;
			for (var j = 0; j < data[1].length; j++) {
				var triageStyle = "";
				var column_name = data[1][j].ColumnName;
				var columnValue = data[1][j].Value;
				if (checkTriageDependency)
					triageStyle = "display:none;";
				var TriageTag = "<pre style='font-family:verdana;font-size:100%;" + triageStyle + "' class = 'TriageInfoPreview'><b>" + data[1][j].LabelName + "</b> : " + data[1][j].Value + " </pre>";
				checkTriageDependency = checkDependency(column_name, columnValue);
				$("#TriageInfoPreview").append(TriageTag);
			}
			for (var k = 0; k < data[2].length; k++) {
				var TriageSummTag = "<pre style='font-family:verdana;font-size:100%;' class = 'TriageSummInfoPreview'><b>" + data[2][k].LabelName + "</b> : " + data[2][k].Value + " </pre>";
				$("#TriageSummInfoPreview").append(TriageSummTag);
			}
			var checkAssessmentDependency;
			for (var l = 0; l < data[3].length; l++) {
				for (var m = 0; m < data[3][l].length; m++) {
					var assessmentStyle = "";
					var column_name = data[3][l][m].ColumnName;
					var columnValue = data[3][l][m].Value;
					var check = checkReadOnlyData(column_name);
					if (checkAssessmentDependency)
						assessmentStyle = "display:none;";
					if (check) {
						assessmentStyle = "";
					}
					else if (finalCheck) {
						finalCheck = false;
						assessmentStyle = "display:none;";
					}
					if (data[3][l][m].ColumnName == "AppDetails" && data[3][l][m].section == "ApplicationInformation" && data[3][l][m].Value == "Third Party")
						$("#ContractInformationPreview").show();
					var AssessmentTag = "<pre style='font-family:verdana;font-size:100%;" + assessmentStyle + "' class = 'AssessmentPreview'><b>" + data[3][l][m].LabelName + "</b> : " + data[3][l][m].Value + " </pre>";
					checkAssessmentDependency = checkDependency(column_name, columnValue);
					$("#" + data[3][l][m].section + "Preview").append(AssessmentTag);
				}
			}
			var table = "<table class='table table-bordered'>" +
				"<thead>" +
				"<tr>" +
				"<th>Name</th>" +
				"<th>Email</th>" +
				"<th>User Name</th>" +
				"<th>Role</th>" +
				"<th>Approval Status</th>" +
				"</tr>" +
				"</thead>" +
				"<tbody id = 'StakeHolder'>";
			for (var n = 1; n < data[4].length; n++) {
				// var stakeHolderTag = "<pre
				// style='font-family:verdana;font-size:100%;' class =
				// 'stakeHolderInfoPreview'><b>"+data[4][n].LabelName+"</b> :
				// "+data[4][n].Value+" </pre>";
				table += "<tr>" +
					"<td>" + data[4][n].name + "</td>" +
					"<td>" + data[4][n].emailId + "</td>" +
					"<td>" + data[4][n].username + "</td>" +
					"<td>" + data[4][n].role + "</td>" +
					"<td>" + data[4][n].intakeApproval + "</td>" +
					"</tr>";
			}
			table += "</tbody>" +
				"</table>";
			$("#StakeHolderInfoPreview").append(table);
			notification("info", "Review of previous details.", "Info");
			// var onclick_attr = $("#ReviewNextBtn").attr("onclick");
			$("#ReviewNextBtn").attr("onclick", "location.href='IntakeApproval.jsp?a_id=" + data[5].a_id + "';");
			$(".ReviewNextBtn").attr("onclick", "location.href='IntakeApproval.jsp?a_id=" + data[5].a_id + "';");
			if (data[5].checkRequestSign == 1) {
				$("#button_id").show();
			}
			else {
				$("#button_id").show();
			}
			var checkReviewPage = data[data.length - 1].CheckExistence;
			if (checkReviewPage == true) {
				$("#ReviewNextBtn").show();
				$("#ReviewPrevBtn").show();
				$("#button_id").show();
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
});
function dependencyKeyValuePair() {
	var inputs = {};
	// Triage Dependency
	inputs["rationalization_type"] = "Other";
	inputs["appPlatfrm"] = "Other";
	inputs["app_and_data_hosted"] = "Yes";
	inputs["compliance"] = "Yes";
	inputs["Financialdate"] = "Yes";
	inputs["TechincalDeterminingdate"] = "Yes";
	// Application Info Dependency
	inputs["AssessAppPlatform"] = "Others";
	inputs["ComplianceLegalDrivers"] = "Yes";
	inputs["BusinessDriversDrivers"] = "Yes";
	inputs["TechnicalDrivers"] = "Yes";
	inputs["SupportedApp"] = "No";
	// DataChar Dependency
	inputs["DataSetMainframe"] = "Yes";
	inputs["ReportGeneration"] = "Yes";
	// inputs["ReadonlyData"] = "Yes";
	// inputs["ReadonlyData"] = "No";
	inputs["UpDownStream"] = "Yes";
	// Archival Dependency
	inputs["legalhold"] = "Yes";
	inputs["specificpurgerequirements"] = "Yes";
	return inputs;
}
function dependencyKeyValueColumnPair() {
	var inputs = {};
	// Triage Dependency
	inputs["rationalization_type"] = "If_other_please_describe";
	inputs["appPlatfrm"] = "If_Other_describe";
	inputs["app_and_data_hosted"] = "vendor";
	inputs["compliance"] = "describe";
	inputs["Financialdate"] = "plsdescribe";
	inputs["TechincalDeterminingdate"] = "pls_describe";
	// Application Info Dependency
	inputs["AssessAppPlatform"] = "OtherPleaseDescribe";
	inputs["ComplianceLegalDrivers"] = "PleaseDescribe1";
	inputs["BusinessDriversDrivers"] = "PleaseDescribe2";
	inputs["TechnicalDrivers"] = "PleaseDescribe3";
	inputs["SupportedApp"] = "SupportApp";
	// DataChar Dependency
	inputs["DataSetMainframe"] = "plsprovideinfo";
	inputs["ReportGeneration"] = "plsprovidedetails";
	// inputs["ReadonlyData"] = "LastUpdateMade";
	// inputs["ReadonlyData"] = "ExpectedDate";
	inputs["UpDownStream"] = "plsdescribeStreams";
	// Archival Dependency
	inputs["legalhold"] = "ifanypleasedescribe";
	inputs["specificpurgerequirements"] = "describedetails";
	return inputs;
}
function checkDependency(ColumnName, Value) {
	var boolean = false;
	var inputs = dependencyKeyValuePair();
	var inputsValueColumn = dependencyKeyValueColumnPair();
	if (inputs.hasOwnProperty(ColumnName)) {
		if (inputs[ColumnName] == Value) {
			boolean = false;
			dependencyColumn = inputsValueColumn[ColumnName];
		}
		else {
			boolean = true;
			dependencyColumn = "";
		}
	}
	else if (ColumnName == "ReadonlyData") {
		finalCheck = true;
		dependencyColumn = "";
		if (Value == "Yes")
			readOnlyValue = "LastUpdateMade";
		else if (Value == "No")
			readOnlyValue = "ExpectedDate";
	}
	else {
		dependencyColumn = "";
	}
	return boolean;
}
function checkReadOnlyData(ColumnName) {
	var checkBoolean = false;
	if (ColumnName == readOnlyValue) {
		checkBoolean = true;
		readOnlyValue = "";
	}
	return checkBoolean;
}
$(document).on('click', '.DeleteRow', function() {
	var seqNum = $(this).index('.DeleteRow');
	$("#Sequence").val(seqNum);
	$("#deletepopup_btn").click();
});
$(document).on('click', '#DeleteSubmit', function() {
	var DeleteSeqNum = $("#Sequence").val();
	var JsonArray = [];
	var inputs = {};
	var appName = $(".applicationName").eq(DeleteSeqNum).val();
	var wave = $(".wave").eq(DeleteSeqNum).val();
	inputs['appName'] = appName;
	inputs['wave'] = wave;
	JsonArray.push(inputs);
	DeleteRowAjaxCall(JsonArray, DeleteSeqNum);
	$('#applicationListWithoutPhase').empty();
	getDataWithOutPhaseAndWave();
	$('#applicationList').empty();
	number = 0;
	getDataWithPhaseAndWave();
});
function DeleteRowAjaxCall(JsonArray, DeleteSeqNum) {
	$.ajax({
		url: "PlanAndPriorityDeleteServlet",
		type: 'POST',
		async: false,
		data: { JsonArray: JSON.stringify(JsonArray) },
		dataType: "json",
		success: function(data) {
			console.log("delete row --> ", data);
			JsonObject = data;
			$(".rowClass").eq(DeleteSeqNum).remove();
			notification("success", "Row deleted successfully.", "Note");
			/*window.setTimeout(function() { location.reload() }, 1000);*/
		},
		error: function(e) {
			console.log(e);
		}
	});
	return false;
}

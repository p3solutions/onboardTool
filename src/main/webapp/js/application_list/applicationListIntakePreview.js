var checkScope = false;
var checkRoles = false;
var number = 0;
var dependencyColumn = "";
var readOnlyValue = "";
var finalCheck;
var exportContent = [];
var JsonObject =[];
var num=0;

$(document).ready(function() {
	$.ajax({
		url: "PlanAndPriorityWithinPhase",
		type: 'POST',
		dataType: "json",
		success: function(data) {
			console.log(data);
			$.each(data[0], function(key, value) {
				var opportunityName = value.app_name;
				var opportunityId = value.Id;
				var phaseName = value.phaseName;
				var waveName = value.waveName;
				var readonly = "readonly";
				var disable = "disabled";
				
				var t_row = "<tr class='rowClass'>"
					+ "<td style='display: none;'><input type = 'text' class ='applicationId' " + disable + " style='width:100%; border:none; text-align:center; background-color: #fff;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + opportunityId + "'>"+opportunityId+"</td>"
					+ "<td><input type = 'text' class ='applicationName' value = '" + opportunityName + "'" + disable + " style='width:100%; border:none; text-align:center; background-color: #fff;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + opportunityName + "'></td>"

					+ "<td><input type = 'text' class ='phaseList' id='phaseSearch" + number + "' value = '" + phaseName + "'" + readonly + " style='width:100%; border:none; background-color: #fff; text-align:center;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + phaseName + "'><ul id='phaseResult" + number + "' class='list-group searchResult'></ul></td>"

					+ "<td><input type = 'text' class ='waveList' id='waveSearch" + number + "' value = '" + waveName + "'" + readonly + " style='width:100%; border:none; background-color: #fff; text-align:center;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + waveName + "'><ul id='waveResult" + number + "' class='list-group searchResult'></ul></td>"

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


			$(document).ready(function() {
				$('#appTable').DataTable();
			});


		}
	})
});

$(document).on('click', '#saveApplicationList', function(e) {
	var validation = false;
	var JsonArray = [];
	for (var i = 0; i < $('.rowClass').length; i++) {
		var inputs = {};
		var appId = $('.applicationName').eq(i).val();
		var phaseId = $('.phaseList').eq(i).val();
		var waveId = $('.waveList').eq(i).val();
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
		window.setTimeout(function(){location.reload()},1000);
	}
	else {
		notification("warning", "Please fill atleast one row fields.", "Warning");
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
			if (data) {
				notification("success", "Saved successfully.", "Note:");
			}
			else {
				notification("error", "Error occured while saving.", "Error:");
			}
		},
		error: function(e) {
			console.log(e);
		}
	});
}

$(document).on('click', '.EditRow', function() {
	var seqnum = $(this).index('.EditRow');
	var ReadOnly = $('.phaseList').eq(seqnum).is('[readonly]');
	if (ReadOnly) {
		ReadOnlyPropertyConfig(seqnum, false);
		notification("info", "Selected row is editable.", "Info");
		searchPhaseFunction(seqnum);
		searchWaveFunction(seqnum);
	}
	else {
		ReadOnlyPropertyConfig(seqnum, true);
		notification("info", "Selected row is non editable", "Info");
	}

});


function ReadOnlyPropertyConfig(index, prop) {
	var fieldClass = ['phaseList', 'waveList'];
	for (var i = 0; i < fieldClass.length; i++) {
		var checkrole = true;
		if (checkrole) {
			$("." + fieldClass[i]).eq(index).attr('Readonly', '');
			$("." + fieldClass[i]).eq(index).attr('Readonly', prop);
		}
	}
	if (prop == false)
		$(".phaseList").eq(index).focus();
}


function searchPhaseFunction(i) {
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


function searchWaveFunction(i) {
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
					/*var filterPhase = ((value.phaseName).replaceAll(" ", "")).replaceAll("-", "");*/
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
	
	
};

/*
$(document).on('change', '#phaseResult'+i, function(i) {
	$(".filterWave").hide();
	var phaseName = $(this).val();
	if (phaseName != "") {
		$("#" + (phaseName.replaceAll(" ", "")).replaceAll("-", "")).show();
		$("#waveResult"+i).val("");
	}
	else {
		$(".filterWave").show();
	}
});

$(document).on('change', '.filter', function(i) {
	var phase = $("#phaseResult"+i).val();
	var wave = $("#waveResult"+i).val();
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
*/


	$(document).on('click', '.editpopup1', function() {
		var intakePreview = $(this).closest("tr");
		var demo = intakePreview.find("td:eq(0)").text();
		$('#demo').val(demo);
		$('#editpopup_btn').click();
		
		$.ajax({
			url: "planAndPriorityIntakePreviewDataRetrieveServlet",
			type: 'POST',
			dataType: "json",
			data: {demo: demo},
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


function dependencyKeyValuePair(){
	
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

function dependencyKeyValueColumnPair(){
	
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


function checkDependency(ColumnName,Value){
	var boolean = false;
	
	var inputs = dependencyKeyValuePair();
	
	var inputsValueColumn = dependencyKeyValueColumnPair();
	
	if(inputs.hasOwnProperty(ColumnName)){
		
		if(inputs[ColumnName] == Value){
			boolean = false;
			dependencyColumn = inputsValueColumn[ColumnName];
		}
		else{
			boolean = true;
			dependencyColumn = "";
		}
		
	}
	else if(ColumnName == "ReadonlyData"){
		finalCheck = true;
		dependencyColumn = "";
		if(Value == "Yes")
			readOnlyValue = "LastUpdateMade";
		else if(Value == "No")
			readOnlyValue = "ExpectedDate";
	}
	else{
		dependencyColumn = "";
	}
	return boolean;
	
}
function checkReadOnlyData(ColumnName){
	
	var checkBoolean = false;
	
	if(ColumnName == readOnlyValue){
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
    //
   $(document).on('click', '#DeleteSubmit', function() {
		var DeleteSeqNum = $("#Sequence").val();
		var JsonArray = [];
		var inputs = {};
        var appName = $(".applicationName").eq(DeleteSeqNum).val();
        var wave = $(".waveList").eq(DeleteSeqNum).val();
        inputs['appName'] = appName;
		inputs['wave'] = wave;
		JsonArray.push(inputs);
        DeleteRowAjaxCall(JsonArray,DeleteSeqNum);
    });

function DeleteRowAjaxCall(JsonArray,DeleteSeqNum) {
    $.ajax({
        url: "PlanAndPriorityDeleteServlet",
        type: 'POST',
        async: false,
        data: {JsonArray: JSON.stringify(JsonArray)},
        dataType: "json",
        success: function(data) {
            console.log("delete row --> ", data);
            JsonObject = data;
             $(".rowClass").eq(DeleteSeqNum).remove();
            notification("success", "Row deleted successfully.", "Note");
           	window.setTimeout(function(){location.reload()},220);
        },
        error: function(e) {
            console.log(e);
        }
    });
    return false;
}

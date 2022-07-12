var checkScope = false;
var checkRoles = false;
var dependencyColumn = "";
var readOnlyValue = "";
var finalCheck;
var exportContent = [];
var JsonObject = [];
var num = 0;
$(document).ready(function() {
    $('#spinner').show();
    getDataWithOutPhaseAndWave();
    
});
$('#cancelwithoutphase').click(function(){
$('#applicationListWithoutPhase').empty();
getDataWithOutPhaseAndWave();
});
function getDataWithOutPhaseAndWave() {
    $.ajax({
        url: "PlanAndPriorityWithoutPhaseWaveServlet",
        type: 'POST',
        dataType: "json",
         beforeSend : function(){
         $('#overlay').show();
  },
        success: function(data) {
		$('#overlay').hide();
            console.log(data);
            var resourceOptions = "<option selected class='options Select' value=''>Select</option>"
            $.each(data[1][1][0], function(key, value) {
                resourceOptions += "<option class='options resourceOptions' value='" + value.resourcesList + "'>" + value.resourcesList + "</option>";
            });
            var phaseOptions = "<option selected class='options Select' value=''>Select</option>"
            $.each(data[1][3][0], function(key, value) {
                phaseOptions += "<option class='phaseOptions options' value='" + value.phaseName + "'>" + value.phaseName + "</option>";
            });
            var waveOptions = "<option selected class='options Select' value=''>Select</option>"
            $.each(data[1][3][1], function(key, value) {
                var phaseList1 = ((value.phaseName).replaceAll(" ", "")).replaceAll("-", "");
                waveOptions += "<option class='options waveOptions " + phaseList1 + "' value='" + value.waveName + "'>" + value.waveName + "</option>";
            });
            $.each(data[0][0], function(key, value) {
                var appName = value.appName;
                var appId = value.appId;
                var disable = "disabled";
                var t_row = "<tr class='rowClass1'>"
                    + "<td style='display: none;'><input type = 'text' class ='applicationId' " + disable + " style='width:100%; border:none; text-align:center; background-color: #fff;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + appId + "'>" + appId + "</td>"
                    + "<td><input type = 'text' class ='oppName' value = '" + appName + "'" + disable + " style='width:100%; border:none; text-align:center; background-color: #fff;' data-bs-toggle='tooltip' data-bs-placement='top' title='" + appName + "'></td>"
                    + "<td>" + "<select class='form-select phaseList' id='phase1' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
                    phaseOptions +
                    "</select>" + "</td>"
                    + "<td>" + "<select class='form-select waveList' id='wave1" + num + "' aria-label='Default select example' style='padding: 0.75 0 0 0.75rem;'>" +
                    waveOptions +
                    "</select>" + "</td>"
                    + "<td style='text-align:center;vertical-align: middle;'><span class='fa fa-pencil-square-o editpopup'style='display:block;'></span>" +
                    "</td>" +
                    "</tr>";
                $('#applicationListWithoutPhase').append(t_row);
                num++;
               
            });
            noDataFound(num);
            getPagination('#appwithoutphase');
        }
    })
}
function noDataFound(count) {
     if (count < 1) {
        $("#notFound").show();
    } else {
		$("#notFound").empty();
        $("#notFound").hide();
    }
}
$(document).on('click', '#saveApplicationList-1', function(e) {
    var JsonArray = [];
    var validation = false;
    var checkData = false;
    for (var i = 0; i < $('.rowClass1').length; i++) {
        var inputs = {};
        var appId = $('.oppName').eq(i).val();
        var phaseId = $('.phaseList').eq(i).val();
        var waveId = $('.waveList').eq(i).val();
        if ((phaseId != "") && (waveId != "")) {
            checkData = true;
        }
        validation=true;
        inputs['appName'] = appId;
        inputs['phase'] = phaseId;
        inputs['wave'] = waveId;
        inputs['flag'] = "S";
        JsonArray.push(inputs);
    }
    /*for (var j = 0; j < $('.rowClass1').length; j++) {
        var app = $('.oppName').eq(i).val();
        var phase = $('.phaseList').eq(i).val();
        var wave = $('.waveList').eq(i).val();
        if (phase != "" || phase != undefined && wave != "" || wave != undefined) {
            checkData = true;
            break;
        } 
    }*/
     if(checkData==false &&($('.rowClass1').length)>0){
            notification("warning", "Please select phase and wave for atleast one application.", "Warning");
}
    else if (validation==true && checkData==true) {
        console.log("JsonArray Retrieve--->", JsonArray);
        applicationListSaveAjaxFunction(JsonArray);
        notification("success", "Saved successfully.", "Note:");
        $('#applicationListWithoutPhase').empty();
		getDataWithOutPhaseAndWave();
		$('#applicationList').empty();
		$("#phase-list" + number).empty();
		$("#wave-list" + number).empty();
		number = 0;;
		getDataWithPhaseAndWave();
    } else {
        notification("warning", "No data available", "Warning");
        
    }
    e.preventDefault();
});
function applicationListSaveAjaxFunction(JsonArray) {
    $.ajax({
        url: "PlanAndPrioritySaveServlet",
        type: 'POST',
        data: { JsonArray: JSON.stringify(JsonArray) },
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("SAVE DATA:", data);
            JsonObject = data;
            /*if (data) {
                notification("success", "Saved successfully.", "Note:");
            }
            else {
                notification("error", "Error occured while saving.", "Error:");
            }*/
        },
        error: function(e) {
            console.log(e);
        }
    });
    return JsonObject;
}
$(document).on('change', '#phase1', function(j) {
    $(".waveOptions").hide();
    var phaseName = $(this).val();
    if (phaseName != "Select") {
        $("." + (phaseName.replaceAll(" ", "")).replaceAll("-", "")).show();
        $("#wave1" + j).val("Select");
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
$(document).on('click', '.editpopup', function() {
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

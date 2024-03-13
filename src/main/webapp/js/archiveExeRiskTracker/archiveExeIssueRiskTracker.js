var checkScope = false;
var checkRoles = false;
$(document).ready(function() {
    //archiveReqDataRetrieve();
    archiveExeIssueDataRetrieve();
    //checkNextButton();
    $(document).on('click', '#AddIssue', function() {
        var seqNum = $('.rowClass').length;
        archiveExeIssueAddAjaxCall(seqNum);
    });
    $(document).on('click', '.EditRow', function() {
        var seqNum = $(this).index(".EditRow");
        var nameReadOnly = $(".app_Id").eq(seqNum).attr("readonly");
        if (nameReadOnly) {
            var checkEdit = $(".ArchiveApproval").eq(seqNum).val();
            if (checkEdit != "true") {
                $(".app_Id").eq(seqNum).removeAttr("readonly");
                $(".impact").eq(seqNum).removeAttr("readonly");
                $(".type").eq(seqNum).removeAttr("readonly");
                $(".description").eq(seqNum).removeAttr("readonly");
                $(".start_date").eq(seqNum).removeAttr("readonly");
                $(".raised_by").eq(seqNum).removeAttr("readonly");
                $(".status").eq(seqNum).removeAttr("readonly");
                $(".assigned_to").eq(seqNum).removeAttr("readonly");
                $(".resolved").eq(seqNum).removeAttr("readonly");
                $(".exp_date").eq(seqNum).removeAttr("readonly");
                $(".end_date").eq(seqNum).removeAttr("readonly");
                $(".comments").eq(seqNum).removeAttr("readonly");
                notification("info", "Selected row is editable.", "Info:");
            }
            else
                notification("info", "Decision has taken already for this Issue", "Info:");
        }
        else {
            $(".app_Id").eq(seqNum).prop("readonly", true);
            $(".impact").eq(seqNum).prop("readonly", true);
            $(".type").eq(seqNum).prop("readonly", true);
            $(".description").eq(seqNum).prop("readonly", true);
            $(".start_date").eq(seqNum).prop("readonly", true);
            $(".raised_by").eq(seqNum).prop("readonly", true);
            $(".status").eq(seqNum).prop("readonly", true);
            $(".assigned_to").eq(seqNum).prop("readonly", true);
            $(".exp_date").eq(seqNum).prop("readonly", true);
            $(".end_date").eq(seqNum).prop("readonly", true);
            $(".comments").eq(seqNum).prop("readonly", true);
            notification("info", "Seleted row is non-editable.", "Info:");
        }
    });
    $(document).on('click', '.DeleteRow', function() {
        var seqNum = $(this).index('.DeleteRow') + 1;
        $('#ArchiveDeleteSeq').val(seqNum);
        $('#ArchReqDeleteId').click();
    });
    $(document).on('click', '#ArchiveDeleteSubmit', function() {
        $('.submitDisableDelete').attr('disabled', true);
        var seqNum = $('#ArchiveDeleteSeq').val();
        var app_Id = $(".app_Id").eq(seqNum - 1).val();
        console.log("seq num for delete " + seqNum);
        console.log("app_ID for delete " + app_Id);
        archiveReqDeleteAjaxCall(seqNum, app_Id);
        $('.submitDisableDelete').attr('disabled', false);
        $('#closeIdDelete').click();
    });
});
function archiveReqDeleteAjaxCall(seqNum, app_Id) {
    $.ajax({
        url: "ArchiveExeIssueDeleteServlet",
        type: 'POST',
        data: { seqNum: seqNum, app_Id: app_Id },
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("Delete Row Retrieve--->", data);
            if (data.DeleteStatus) {
                $('.rowClass').eq(seqNum - 1).remove();
                notification("success", "Selected row deleted Successfully.", "Note:");
            }
            else
                notification("error", "Error occurred while deleting the row.", "Error:");
        },
        error: function(e) {
            console.log(e);
        }
    });
}
function archiveExeIssueAddAjaxCall(seqNum) {
    $.ajax({
        url: "archiveExeIssueRiskAddServlet",
        type: 'POST',
        data: { seqNum: seqNum },
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("Add Row Retrieve--->", data);
            if (data.AddStatus) {
                var Row = "<tr class = 'rowClass'>" +
                    "<td>" +
                    "<div class=\"dropdown dropend\">" +
                    "<button class=\"btn btn-outline-light\" id=\"Drop-option\"" +
                    " data-bs-toggle=\"dropdown\" aria-expanded=\"false\"> " +
                    " <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
                    "</button>" +
                    "<ul class=\"dropdown-menu\" aria-labelledby=\"Drop-option\">" +
                    "<li><a class=\"dropdown-item dropdown-styles EditRow \"><i " +
                    "class=\"fa-solid fa-pencil iconColor  \"></i>&nbsp;&nbsp;&nbsp;Edit</a></li>" +
                    "<li>" +
                    "<hr class=\"dropdown-divider m-0\">" +
                    "</li>" +
                    "<li><a class=\"dropdown-item dropdown-styles DeleteRow\" data-bs-toggle=\"modal\" data-bs-target=\"#ArchiveDeletePopUp\"><i" +
                    " class=\"fa-solid fa-trash-can text-danger\"  ></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
                    "</li>" +
                    "</ul>" +
                    "</div>" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"text\" class=\"app_Id form-control \" value=''><input type='hidden' class='ArchiveApproval ' value='false'/>" +
                    "</td>" +
                    "<td>" +
                    "<select name=\"Impact\" id=\"\" class=\"selectpicker form-control impact\">" +
                    "<option class='high'  value='HIGH'>HIGH</option>" +
                    "<option class='medium'  value='MEDIUM' selected>MEDIUM</option>" +
                    "<option class='low'  value='LOW'>LOW</option>" +
                    "<option class='critical' value='CRITICAL'>CRITICAL</option>" +
                    "</select>" +
                    "</td>" +
                    "<td>" +
                    "<select name=\"Type\" id=\"\" class=\"selectpicker form-control type\">" +
                    "<option class='issue' value='ISSUE' selected>ISSUE</option>" +
                    "<option class='process' value='PROCESS'>PROCESS</option>" +
                    "<option class='risk' value='RISK'>RISK</option>" +
                    "<option class='scope' value='SCOPE'>SCOPE</option>" +
                    "<option class='task' value='TASK'>TASK</option>" +
                    "<option class='decision' value='DECISION'>DECISION</option>" +
                    "</select>" +
                    "</td>" +
                    "<td>" +
                    "<textarea  rows=\"3\" cols=\"30\" value='' class=\"form-control description\"></textarea>" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"date\" class=\"form-control start_date\" placeholder=\"mm/dd/yyyy\" value=''>" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"text\" class=\" form-control raised_by\" value=''>" +
                    "</td>" +
                    "<td>" +
                    "<textarea  value='' cols=\"30\" rows=\"3\" class=\"form-control status\"></textarea>" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"text\" class=\"form-control assigned_to\" value='' >" +
                    "</td>" +
                    "<td>" +
                    "<select name=\"Resolved\" id=\"\" class=\"selectpicker form-control resolved\">" +
                    "<option class='open' value='OPEN' selected>OPEN</option>" +
                    "<option class='inProgress' value='IN PROGRESS'>IN PROGRESS</option>" +
                    "<option class='completed' value='COMPLETED'>COMPLETED</option>" +
                    "<option class='cancelled' value='CANCELLED'>CANCELLED</option>" +
                    "</select>" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"date\" class=\"form-control exp_date\" placeholder='mm/dd/yyyy' value=''>" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"date\" class=\"form-control end_date\" placeholder='mm/dd/yyyy' value=''>" +
                    "</td>" +
                    "<td>" +
                    "<textarea cols=\"30\" rows=\"3\" class=\" form-control comments\" value=''></textarea>" +
                    "</td>" +
                    "</tr>";
                $("#AppIssue").append(Row);
                notification("success", "Row added Successfully.", "Note:");
                
            }
            else
                notification("error", "Error occurred while adding the row.", "Error:");
        },
        error: function(e) {
            console.log(e);
        }
    });
}
function archiveReqDataRetrieve() {
    $.ajax({
        url: "archiveReqIntroDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("Data Retrieve--->", data);
            if (data.checkData) {
                $('.Purpose').html(data.Purpose);
                $('.Scope').html(data.Scope);
                if (data.Scope != '')
                    checkScope = true;
                var assumptionList = data.Assumption.split("::");
                var assumptionValue = "";
                for (var i = 0; i < assumptionList.length; i++)
                    assumptionValue += "<li>" + assumptionList[i] + "</li>";
                $('.Assumption').find('ul').html('');
                $('.Assumption').find('ul').html(assumptionValue);
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
}
function archiveExeIssueDataRetrieve() {
    $.ajax({
        url: "archiveExeIssueTemplateServlet1",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("Table Retrieve--->", data);
            if (!$.isArray(data)) {
                data = [data];
            }
            $("#AppIssue").html("");
            //var checkValidation = false;
            var impactArray = ['HIGH', 'MEDIUM', 'LOW', 'CRITICAL'];
            var typeArray = ['ISSUE', 'PROCESS', 'RISK', 'TASK', 'DECISION'];
            var resolvedArray = ['OPEN', 'IN PROGRESS', 'COMPLETED', 'CANCELLED'];
            $.each(data, function(key, value) {
                var optionsImpact = "";
                for (var n = 0; n < impactArray.length; n++) {
                    var selected = (value.impact == impactArray[n]) ? "selected" : "";
                    optionsImpact += "<option value='" + impactArray[n] + "' " + selected + ">" + impactArray[n] + "</option>";
                }
                var optionsType = "";
                for (var n = 0; n < typeArray.length; n++) {
                    var selected = (value.type == typeArray[n]) ? "selected" : "";
                    optionsType += "<option value='" + typeArray[n] + "' " + selected + ">" + typeArray[n] + "</option>";
                }
                var optionsResolved = "";
                for (var n = 0; n < resolvedArray.length; n++) {
                    var selected = (value.resolved == resolvedArray[n]) ? "selected" : "";
                    optionsResolved += "<option value='" + resolvedArray[n] + "' " + selected + ">" + resolvedArray[n] + "</option>";
                }
                var Row = "<tr class = 'rowClass'>" +
                    "<td>" +
                    "<div class=\"dropdown dropend\">" +
                    "<button class=\"btn btn-outline-light\" id=\"Drop-option\"" +
                    " data-bs-toggle=\"dropdown\" aria-expanded=\"false\">" +
                    " <i class=\"fa-solid fa-ellipsis-vertical iconColor fa-lg \"></i>" +
                    "</button>" +
                    "<ul class=\"dropdown-menu\" aria-labelledby=\"Drop-option\">" +
                    "<li><a class=\"dropdown-item dropdown-styles EditRow\"><i" +
                    " class=\"fa-solid fa-pencil iconColor  \"></i>&nbsp;&nbsp;&nbsp;Edit</a></li>" +
                    "<li>" +
                    "<hr class=\"dropdown-divider m-0\">" +
                    "</li>" +
                    "<li><a class=\"dropdown-item dropdown-styles DeleteRow\" data-bs-toggle=\"modal\" data-bs-target=\"#ArchiveDeletePopUp\"><i" +
                    " class=\"fa-solid fa-trash-can text-danger\"  ></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
                    "</li>" +
                    "</ul>" +
                    "</div>" +
                    "</td>" +
                    "<td >" +
                    "<input type=\"text\" class=\"app_Id form-control \" value='" + value.IssueId + "' readonly >" +
                    "</td>" +
                    "<td>" +
                    "<select type='text'  class=\"selectpicker form-control impact\"  value='" + value.impact + "'>" +
                    optionsImpact +
                    "</select>" +
                    "</td>" +
                    "<td>" +
                    "<select type='text' class=\"selectpicker form-control type\" value='" + value.type + "'>" +
                    optionsType +
                    "</select>" +
                    "</td>" +
                    "<td>" +
                    "<textarea name=\"\" id='description' rows=\"3\" cols=\"30\" class=\"form-control description\" readonly>" + value.description + "</textarea>" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"date\" class=\"form-control start_date\"  placeholder='mm/dd/yyyy' value='" + value.start_date + "' readonly>" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"text\" class=\" form-control raised_by\"  value='" + value.raised_by + "' readonly>" +
                    "</td>" +
                    "<td>" +
                    "<textarea cols=\"30\" rows=\"3\" id='status' class=\"form-control status\" readonly> " + value.status + "</textarea>" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"text\" class=\"form-control assigned_to\" value='" + value.assigned_to + "' readonly>" +
                    "</td>" +
                    "<td>" +
                    "<select type=\"text\" class=\"selectpicker form-control resolved\" value='" + value.resolved + "'>" +
                    optionsResolved +
                    "</select>" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"date\" class=\"form-control exp_date\" placeholder='mm/dd/yyyy' value='" + value.exp_date + "' readonly >" +
                    "</td>" +
                    "<td>" +
                    "<input type=\"date\" class=\"form-control end_date\" placeholder='mm/dd/yyyy' value='" + value.end_date + "' readonly >" +
                    "</td>" +
                    "<td>" +
                    "<textarea id='comments'  cols=\"30\" rows=\"3\" class=\" form-control comments\" readonly>" + value.comments + "</textarea>" +
                    "</td>" +
                    "</tr>";
                $("#AppIssue").append(Row);
                // $('#AppIssue').selectpicker('refresh');

                if (checkFieldValues(value.role, value.name, value.email, value.username, value.priority))
                    checkRoles = true;
                //checkValidation = true;
                
            });
        },
        error: function(e) {
            console.log(e);
        }
    });
}
$(document).on('click', '#saveArchiveExeIssue', function(e) {
    var validation = false;
    var JsonArray = [];
    var appIdArray = [];
    var checkDuplicateRole = true;
    for (var i = 0; i < $('.rowClass').length; i++) {
        var inputs = {};
        var app_Id = $('.app_Id').eq(i).val();
        var impact = $('.impact').eq(i).val();
        var type = $('.type').eq(i).val();
        var description = $('.description').eq(i).val();
        var start_date = $('.start_date').eq(i).val();
        var raised_by = $('.raised_by').eq(i).val();
        var status = $('.status').eq(i).val();
        var assigned_to = $('.assigned_to').eq(i).val();
        var resolved = $('.resolved').eq(i).val();
        var exp_date = $('.exp_date').eq(i).val();
        var end_date = $('.end_date').eq(i).val();
        var comments = $('.comments').eq(i).val();
        //if(!appIdArray.includes(app_Id))
        // appIdArray.push(app_Id);
        //else
        checkDuplicateRole = true;
        //if(checkFieldValues(impact, name, emailId,username,priority_order_num))
        validation = true;
        inputs['seq_no'] = i + 1;
        inputs['app_Id'] = app_Id;
        inputs['impact'] = impact;
        inputs['type'] = type;
        inputs['description'] = description;
        inputs['start_date'] = start_date;
        inputs['raised_by'] = raised_by;
        inputs['status'] = status;
        inputs['assigned_to'] = assigned_to;
        inputs['resolved'] = resolved;
        inputs['exp_date'] = exp_date;
        inputs['end_date'] = end_date;
        inputs['comments'] = comments;
        JsonArray.push(inputs);
    }
    if (validation && checkDuplicateRole) {
        console.log("JsonArray Retrieve--->", JsonArray);
        archiveExeIssueSaveAjaxcall(JsonArray);
    }
    else {
        if (!validation)
            notification("warning", "Please fill atleast one row fields.", "Warning");
        if (!checkDuplicateRole)
            notification("warning", "Please provide unique roles.", "Warning");
        checkRoles = false;
    }
    e.preventDefault();
});
function checkFieldValues(role, name, emailId, username, priority_order_num) {
    var validationFlag = false;
    if ((role != '' && role != undefined && role != null) && (name != '' && name != undefined && name != null) &&
        (emailId != '' && emailId != undefined && emailId != null) && (username != '' && username != undefined && username != null)
        && (priority_order_num != '' && priority_order_num != undefined && priority_order_num != null))
        validationFlag = true;
    return validationFlag;
}
function archiveExeIssueSaveAjaxcall(JsonArray) {
    var checkAjax = false;
    $.ajax({
        url: "archiveExeIssueSaveServlet",
        type: 'POST',
        data: { JsonArray: JSON.stringify(JsonArray) },
        async: false,
        dataType: "json",
        success: function(data) {
            console.log("SAVE DATA:", data);
            JsonObject = data;
            if (data.SaveStatus) {
                notification("success", "Saved successfully.", "Note:");
                checkRoles = true;
            }
            else {
                notification("error", "Error occurred while saving.", "Error:");
                checkRoles = false;
            }
        },
        error: function(e) {
            console.log(e);
        }
    });
}


 

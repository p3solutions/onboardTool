
//--------------------------------------------Project Details Start---------------------------------------//
var arraySelected = [];

function getProjectName() {
    var select = $('#project_id_Select');
    select.empty();
    var project = $('#userProject').val();
    var userProject = [];
    if (project.includes(",")) {
        userProject = project.split(",");
    } else {
        userProject.push(project);
    }
    console.log('userProject', userProject);
    $.ajax({
        url: 'Admin_Module_Send_Invites',
        type: 'post',
        dataType: 'json',
        success: function (data) {
            $.each(data, function (key, value) {
                select.append('<option data-subtext="' + value + '">' + value + '</option>');
                arraySelected.push(value);
            });
            select.selectpicker('val', userProject);
            // $('#project_id_Select option').attr("selected", "selected");
            $('#project_id_Select').selectpicker('refresh');
        }
    });
    projectdetails_dropdown_Initial(userProject);
}
//--------------------------------------------Project Details End---------------------------------------//

//--------------------------------------------Application Details Start---------------------------------------//
$('#project_id_Select').on('changed.bs.select', function (e) {
    var selected = e.target.value;
    console.log("selected", selected)
});
var userApplication = [];
function projectdetails_dropdown_Initial(arrSelected) {
    var selected = $(this).find("option:selected");

    console.log("selected ---->", arrSelected);
    var  application = $('#application').val();
    console.log("testing------>",application);

    if (application.includes(",")) {
        userApplication = application.split(",");
    } else {
        userApplication.push(application);
    }
    var select = $('#projapp');
    select.empty();
    $.ajax({
        url: 'Admin_Module_Applications_Info',
        type: 'post',
        data: {proj: JSON.stringify(arrSelected)},
        dataType: 'json',
        success: function (data) {
            //console.log('sample---->',data);
            $.each(data, function (key, value) {
                console.log("admin_app_key--->", key);
                console.log("admin_app_value", value);
                select.append('<option data-subtext="' + value + '">' + value + '</option>');

            });
            select.selectpicker('val', userApplication);
            select.selectpicker('refresh');
        }
    });
}


$('#project_id_Select').on('change', function () {
    var arrSelected = [];
    var selected = $(this).find("option:selected");
    selected.each(function (idx, val) {
        arrSelected.push(val.value);
    });

    console.log("selected ", arrSelected);
    var select = $('#projapp');
    /* select.empty();*/
    $.ajax({
        url: 'Admin_Module_Applications_Info',
        type: 'post',
        data: {proj: JSON.stringify(arrSelected)},
        dataType: 'json',
        success: function (data) {
            /* if (data.length==0)
             {
                 select
                     .find('option')
                     .remove()
             }*/


            //console.log('sample---->',data);
            select.empty();
            $.each(data, function (key, value) {
                console.log("admin_app_key--->", key);
                console.log("admin_app_value", value);
                select.append('<option data-subtext="' + value + '">' + value + '</option>');
                //userApplication.push(value);
            });
            //$('#projapp option').attr("selected", "selected");
            select.selectpicker('val', userApplication);
            select.selectpicker('refresh');
        }
    });
});
//--------------------------------------------Application Details End---------------------------------------//


//--------------------------------------------Modify the User Start---------------------------------------//

$(document).ready(function () {
    $('#send_btn').click(function () {
        var uname = $('#uname').val();
        var fname = $('#fname').val();
        var lname = $('#lname').val();
        var email_val = $('#email_val').val();
        var project_id = $('#project_id_Select').val();
        var application_id = $('#projapp').val();
        var f = document.loginForm;
        f.method = "post";
        f.action = 'Update_User_registration?uname=' + uname + '&fname=' + fname + '&lname=' + lname + '&email_val=' + email_val + '&project_id=' + project_id + '&application_id=' + application_id + '&id=' + $('#userId').val();
        f.submit();

    });
});
//--------------------------------------------Modify the User End---------------------------------------//



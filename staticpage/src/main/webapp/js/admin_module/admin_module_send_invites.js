if (document.getElementById('send_invites_id').value == "R")
    checkk();


$(document).ready(function () {
    var select = $('#project_id_Select');
    select.empty();
    $.ajax({
        url: 'Admin_Module_Send_Invites',
        type: 'post',
        dataType: 'json',
        success: function (data) {
            $.each(data, function (key, value) {
                select.append('<option data-subtext="' + value + '">' + value + '</option>');
            });
            $('#project_id_Select').selectpicker('refresh');
        }
    });
});

$('#project_id_Select').on('changed.bs.select', function (e) {
    var selected = e.target.value;
    console.log("selected", selected)
});

$('#project_id_Select').on('change', function () {
    var selected = $(this).find("option:selected");
    var arrSelected = [];
    selected.each(function (idx, val) {
        arrSelected.push(val.value);
    });
    console.log("selected ", arrSelected);
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
                select.selectpicker('refresh');
            });
        }
    });
});
$(function () {
    $('.multiselect-ui').multiselect({
        includeSelectAllOption: true
    });
});


var arr = "";

function send_email() {

    var e = document.getElementById("dates-field2");
    for (i = 0; i < 9; i++) {
        if (e[i].selected == true) {
            arr = arr + (e[i].value);
        }
    }
    var msg = document.getElementById("message").value;
    var ffname = document.getElementById("fname").value;
    var llname = document.getElementById("lname").value;
    var email = document.getElementById("email_val").value;
    //var project = document.getElementById('project_id_Select').value;
    var project = $('#project_id_Select').val().toString();
    //var app = document.getElementById('projapp').value;
    var app = $('#projapp').val().toString();
    if (ffname === "" || llname === "" || arr === "") {
        BootstrapDialog.show({
            title: 'INFORMATION',
            message: 'Fill The Mandatory Fields',
            buttons: [{
                id: 'btn-ok',
                icon: 'glyphicon glyphicon-check',
                label: 'OK',
                cssClass: 'btn-primary',
                data: {
                    js: 'btn-confirm',
                    'user-id': '3'
                },
                autospin: false,
                action: function (dialogRef) {
                    dialogRef.close();
                }
            }]


        });
        return false;
    } else {
        if ((email.includes("@")) && (email.includes(".com"))) {

            var f = document.loginForm;
            f.method = "post";
            f.action = "Admin_Module_Send_Invites_Mail?roless=" + arr + "&mailid=" + email + "&message=" + msg + "&fname=" + ffname + "&lname=" + llname + "&project=" + project + "&application=" + app;
            f.submit();
        } else
            BootstrapDialog.show({
                title: 'INFORMATION',
                message: 'Invalid Email Address',
                buttons: [{
                    id: 'btn-ok',
                    icon: 'glyphicon glyphicon-check',
                    label: 'OK',
                    cssClass: 'btn-primary',
                    data: {
                        js: 'btn-confirm',
                        'user-id': '3'
                    },
                    autospin: false,
                    action: function (dialogRef) {
                        dialogRef.close();
                    }
                }]


            });
        return false;
    }
}


function checkk() {

    document.getElementById('fname').readOnly = true;
    document.getElementById('message').readOnly = true;
    document.getElementById('lname').readOnly = true;
    document.getElementById('dates-field2').disabled = true;
    document.getElementById('email_val').readOnly = true;
    document.getElementById('proj').readOnly = true;
    document.getElementById('send_btn').disabled = true;
}

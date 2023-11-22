
    $("#Submit").click(function (e) {
        e.preventDefault();
        var AppName = $("#appName").val();
        console.log("Application Name", AppName);

        // Declare variables
        var CheckExistance;
        var CheckAppname;
        var checkMandatory = true;
        var nameAttr = [];
        var jsonObj = [];
        var checkAjax1;

        if (AppName != "") {
            $(".InputField").each(function (i) {
                var inputs = {};
                var req = $(this).find(".required_fie").length;

                if (req) {
                    if ($(this).find("input").length) {
                        var val1 = $(this).find("input").val();
                        if (val1 == "") {
                            checkMandatory = false;
                        }
                    } else if ($(this).find("select").length) {
                        var val2 = $(this).find("select").val();
                        if (val2 == "") {
                            checkMandatory = false;
                        }
                    }
                }

                if ($(this).find("input").length) {
                    var type = $(this).find("input").attr("type");
                    if (type == 'radio') {
                        var nameRadio = $(this).find("input").attr("name");
                        var radioValue = $("input[name='" + nameRadio + "']:checked").val();
                        inputs["Name"] = nameRadio;
                        inputs["Value"] = radioValue;
                    } else if (type == 'checkbox') {
                        var nameCheckbox = $(this).find("input").attr("name");
                        var CheckboxValue = "";
                        $.each($("input[name='" + nameCheckbox + "']:checked"), function () {
                            CheckboxValue += $(this).val() + ",";
                        });
                        CheckboxValue = CheckboxValue.substring(0, CheckboxValue.length - 1);
                        inputs["Name"] = nameCheckbox;
                        inputs["Value"] = CheckboxValue;
                    } else {
                        var name1 = $(this).find("input").attr("name");
                        var val1 = $(this).find("input").val();
                        inputs["Name"] = name1;
                        inputs["Value"] = val1;
                        nameAttr.push(name1);
                    }
                } else if ($(this).find("select").length) {
                    var name2 = $(this).find("select").attr("name");
                    var val2 = $(this).find("select").val();
                    inputs["Name"] = name2;
                    inputs["Value"] = val2;
                    nameAttr.push(name2);
                }

                jsonObj.push(inputs);
            });

            console.log("name attr : ", nameAttr);
            console.log("Json Object : ", jsonObj);
            var JsonString = JSON.stringify(jsonObj);
            $('#Json_sample_id').val(JSON.stringify(jsonObj));

            var checkAjax;
            var validationCheck_json = AjaxCallUpdate(AppName, JsonString, checkMandatory, CheckExistance, CheckAppname, e);
            var checkExistance = validationCheck_json.Details_VALIDATION;
            var checkAppName = validationCheck_json.AppName_VALIDATION;

            if (checkExistance == true) {
                checkAjax1 = true;
                console.log("The details Are Inside the", checkAjax1);
                notification("warning", "Finance Details Already Exist For the Entered Application Name", "Warning");
            } else {
                checkAjax1 = false;
            }

            if (checkAppName == false) {
                checkAjax = false;
                notification("warning", "Application Name Does Not Exist.", "Warning");
            } else {
                checkAjax = true;
            }

            if (checkMandatory == false) {
                checkAjax = false;
                notification("warning", "Please fill all the mandatory fields.", "Warning");
            }

         if (checkMandatory == true && checkAjax1 == false && checkAjax == true) {
    notification("success", "Finance Details Are Entered successfully.", "Note");
    $("#Submit").click(function () {
       
        window.location.href = "Finance.jsp";
    });
}

        } else {
            notification("warning", "Please fill the application name field.", "Warning");
            return false;
        }
    });



    function AjaxCallUpdate(AppName, JsonString, checkMandatory, CheckAPPID, checkAppname, e) {
        e.preventDefault();
        var JsonObject = [];
        var checkAjax = false;
        $.ajax({
            url: "FinanceDetailsValidation",
            type: 'POST',
            data: { AppName: AppName, JsonString: JsonString, checkMandatory: checkMandatory },
            async: false,
            dataType: "json",
            success: function (data) {
                console.log("CREATE VALIDATION", data);
                JsonObject = data;
            },
            error: function (e) {
                console.log(e);
            }
        });
        return JsonObject;
    }

    function AlertBox() {
        notification("warning", "Please fill all Mandatory fields.", "Warning");
        return false;
    }


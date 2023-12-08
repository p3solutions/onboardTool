
    $("#Submit").click(function (e) {
        e.preventDefault();
        console.log("The Function is Called")
        var AppName = $("#appName").val();
        console.log("Application Name", AppName);
	var Id = sessionStorage.getItem('storedId');
	console.log("The value of Function",Id)
        // Declare variables
      
     
        var checkMandatory = true;
        var nameAttr = [];
        var jsonObj = [];
       
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

            
            var validationCheck_json = AjaxCallUpdate(Id, JsonString, checkMandatory );
          
             var checkMandatory= validationCheck_json.Mandatory_Validation;

           

            

            if (checkMandatory == false) {
                checkAjax = false;
                notification("warning", "Please fill all the mandatory fields.", "Warning");
            }

         if (checkMandatory == true ) {
			  window.location.href = "Finance.jsp";
	 notification("success", "Finance Details Are Entered successfully.", "Note");
	console.log("Hi bro any body is there")
    
   
       
   
}

        } else {
            notification("warning", "Please fill the application name field.", "Warning");
            return false;
        }
    });

   
    function AjaxCallUpdate(Id, JsonString, checkMandatory ) {
        
        var JsonObject = [];
        var checkAjax = false;
        $.ajax({
            url: "FinanceDetailsUpdateServlet",
            type: 'POST',
            data: { Id:Id, JsonString: JsonString, checkMandatory: checkMandatory },
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


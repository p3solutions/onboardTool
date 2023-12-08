

// Assuming you are using jQuery
$(document).ready(function () {
    // Add an input event listener to the input fields with specified column names
    $('input[name="cba"], input[name="softlicensecost"], input[name="infrastructurecostsavings"], input[name="costavoidance"], input[name="costarchive"]').on('input', function () {
        // Remove the dollar sign from the input value
        var valueWithoutDollarSign = $(this).val().replace(/\$/g, '');

        // Update the input value without the dollar sign
        $(this).val(valueWithoutDollarSign);
    });
});


$(document).ready(function () {

    // Retrieve data from sessionStorage
    var appId = sessionStorage.getItem("APPID");
    var appName = sessionStorage.getItem("APPNAME");
    var Title;
    if (appId && appName) {
        Title = "Edit Finance";
        // Use the retrieved data as needed, e.g., make an AJAX call to fetch additional data
        console.log("Retrieved APPID:", appId);
        console.log("Retrieved APPNAME:", appName);
        ajaxTemplateCall("Retrieve" , appId , appName);
        financeSetSessionAttribute1(appId,appName);

    } else {
        Title = "ADD Finance";
        console.log("APPID or APPNAME not found in sessionStorage.");
        ajaxTemplateCallNoData("Initial")
    }
    $("#sitetitle3").text(Title);
});
function header(Name){
    var cardHeader = document.getElementById('cd-header');
    if (cardHeader) {
        var additionalContent = document.createElement('span');
        additionalContent.textContent = Name+" ";

        cardHeader.insertBefore(additionalContent, cardHeader.firstChild);
    } else {
        console.error('Element with id "cd-header" not found');
    }
}
function financeSetSessionAttribute1(selectedId,selectedName) {
    // Add an AJAX call to send data to the server
    $.ajax({
        url: "FinanceSetSessionAttributeServlet", // Replace with your server-side endpoint
        type: "POST",
        data: {selectedId: selectedId,selectedName:selectedName },
        success: function (data) {
            // Handle success if needed
            $("#UploadFiles").attr('disabled',false);

        },
        error: function (error) {
            // Handle error if needed
        }
    });
}
function disableFields(){
    $("#financeappname").prop('disabled', true);
 //   $('#financeappname').disable();
    $("#phase").prop('disabled', true);
    $('#phase').disable();
    $("#cba").prop('disabled', true);
    $('#cba').disable();
    $("#status").prop('disabled', true);
    $('#status').disable();
}

$(document).ready(function(){



    $(document).on('click', '.editpopup', function () {
        $('#editpopup_btn').click();
        var seqnum=$(this).index('.editpopup');
        var prevLabel = $('.LabelName').eq(seqnum).html().split('<')[0];
        $("#LegacyLabelModify").val(prevLabel);
        //alert('seq_num in js file '+seqnum);
        $('#LegacySeqNum').val(seqnum);


        //alert('seq num field in js file'+$('#LegacySeqNum').val());

    });
//$('.deletepopup').click(function() {
    $(document).on('click', '.deletepopup', function () {
        $('#deletepopup_btn').click();
        var seqnum=$(this).index('.deletepopup');
        $('#LegacyDeleteSeq').val(seqnum);


    });
    $(document).on('change','#thirdpartyvendor',function()
    {
        if($(this).val()=="Internal")
            $("#locationcenter_Row").show();
        else
            $("#locationcenter_Row").hide();
    });

    $(document).on('change','input[name = dataloclaw]',function()
    {
        if($(this).val()=="Yes")
            $("#listcountry_Row").show();
        else
            $("#listcountry_Row").hide();
    });

});


function ajaxTemplateCallNoData(status){
    $.ajax({
        url: "FinanceAppDataRetrieve",
        type: 'POST',
        data:{Current: status},
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve json array----->",data);
            AddTemplateData = data;
            if (!$.isArray(data)) {
                data = [data];
                AddTemplateData=[data];
            }
            var dependencyValue="";
            $.each(data, function(key, value){
                /*console.log("FULL NAME " + value.Type);*/
                var manadatory="class='required_fie LabelName'";
                var disable_property = "disabled='disabled'";
                var seq_num =value.seq_num;
                var Type=value.Type;
                var ColumnName=value.ColumnName;
                var LabelName=value.LabelName;
                var delete_icon="<div class='deletepopup' style='display:none;'></div>";
                var Value=value.Value;


                if(value.mandatory=="No")
                {
                    manadatory="class = 'LabelName'";
                    disable_property = "";
                    delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
                }
                if(value.mandatory=="Yes" && value.umandatory=="Yes")
                {
                    //manadatory="class = 'LabelName'";
                    //disable_property = "";
                    delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
                }
                if (Type == "Text box") {
                    var template_check = "";
                    var inputtext = "<div class='form-group InputField' id ='" + ColumnName + "_Row'>\n" +
                        "<label class='control-label' for='archiveLegacy'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil ' style='float:right;display:none;'></span>\n";


                    if (ColumnName === 'cba'||ColumnName === 'softlicensecost'||ColumnName === 'infrastructurecostsavings'||ColumnName === 'costavoidance'||ColumnName === 'costarchive') {
                        inputtext = inputtext+"<input type='number' class='form-control' size='35' id='" + ColumnName + "' placeholder='$' name='" + ColumnName + "' value='" + Value + "' onkeypress='return isNumber(event)'" +
                            "</div>";
                    }
                    else if (ColumnName === 'status' || ColumnName === "projnum" || ColumnName === "phase" ) {
                        disable_property = "disabled='disabled'";
                        inputtext = inputtext + "<input type='text' " + disable_property + " class='form-control' size='35' id='" + ColumnName + "' placeholder='' name='" + ColumnName + "' value='" + Value + "'/>\n" +
                            "</div>";
                    }
                    else if (ColumnName === "softlicense") {
                        var inputtext1 = "<div class='form-group InputField' id ='" + ColumnName + "_Row'>\n" +
                            "<label class='control-label' for='archiveLegacy'>" + LabelName + "<span " + manadatory + "></span><span class='glyphicon glyphicon-pencil' style='float:right;display:none;'></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil ' style='float:right;display:none;'></span>\n";

                        inputtext1 = inputtext1 + "<input type='number' min='0' onkeypress='return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))' class='form-control' size='35' id='" + ColumnName + "' placeholder='' name='" + ColumnName + "' value='" + Value + "'/>\n" +
                            "</div>";
                    }
                    else {
                        inputtext = inputtext + "<input type='text' class='form-control' size='35' id='" + ColumnName + "' placeholder='' name='" + ColumnName + "' value='" + Value + "'/>\n" +
                            "</div>";
                    }
                    if (ColumnName === "softlicense") {
                        $('#inputFieldsAppInfo').append(inputtext1);
                    }else{
                        $('#inputFieldsAppInfo').append(inputtext);
                    }
                }
                else if(Type=="Datepicker")
                {
                    var inputdate="<div class='form-group InputField' id='"+ColumnName+"_Row'>" +
                        "<label class='control-label' for= 'archiveLegacy'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>\n" +
                        "<input type='text' onchange='dateChangeFunction(this.value)' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputdate);
                }
                else if(Type=="Dropdown")
                {
                    var template_check="";

                    var inputdrop= "<div class='form-group InputField' id = '"+ColumnName+"_Row'><label class='control-label' for= 'archiveLegacy'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
                        "<select style = 'width:100%;' class ='form-select' id='"+ColumnName+"'name='"+ColumnName+"'>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length);
                    var option=sub_option.split(",");
                    for(var i=0;i<option.length;i++) {
                        var select = "";
                        if(Value.includes(option[i])){
                            select = "selected";
                        }
                        inputdrop += "<option label='"+ option[i] + "' class='control-label' for= 'archiveLegacy' "+select+">" + option[i] + "</option>";
                    }
                    inputdrop +="</select></div>";
                    $('#inputFieldsAppInfo').append(inputdrop);
                }
                else if(Type=="Check box")
                {
                    var inputcheck= "<div class='form-group InputField'>"+
                        "<label class='control-label' for= 'archiveLegacy'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span><br/>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=Options.split(",");
                    var value_arr=Value.split(",");
                    for (var i=0; i<option.length; i++) {
                        var check = "";
                        var option_element=option[i];
                        if(value_arr.includes(option_element)){
                            check = "checked";
                        }
                        inputcheck += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;" +
                            option[i]+"</label><br/>";
                    }
                    inputcheck +="</div>";
                    $('#inputFieldsAppInfo').append(inputcheck);

                }
                else if(Type=="Radio box")
                {
                    var inputdrop= "<div class='form-group InputField'>"+
                        "<label class='control-label' for= 'archiveLegacy'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;' '></span><br/>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=Options.split(",");
                    for (var i=0; i<option.length; i++){
                        var check = "";
                        if(Value.includes(option[i])){
                            check = "checked";
                        }
                        inputdrop+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;"+
                            option[i]+"</label><br/>";
                    }
                    inputdrop +="</div>";
                    $('#inputFieldsAppInfo').append(inputdrop);

                }
                else if(Type=="file")
                {
                    inputfile="<div class='form-group InputField'>\n" +
                        "<label class='control-label' for='archiveLegacy'><div class='required_fie'>"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
                        "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputfile);

                }
                else if(Type=="Text area")
                {
                    var inputtext="<div class='form-group InputField'>\n" +
                        "<label class='control-label' for='archiveLegacy'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                        /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                        "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputtext);
                }
                else if(Type=="HiddenText")
                {
                    var style = (dependencyValue=="Internal")?"style='display:block;'":"style='display:none;'";//var style = (dependencyValue=="Internally Developed" || dependencyValue=="Yes")?"style='display:block;'":"style='display:none;'";
                    dependencyValue = "";
                    var inputtext="<div class='form-group InputField hiddenText1' id ='"+ColumnName+"_Row' "+style+">\n" +
                        "<label class='control-label' for='archiveLegacy'><div "+manadatory+">"+LabelName+"<div class='deletepopup' style='display:none;'></div><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' class='form-control hiddenText' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputtext);
                }

            });
            var ss=$('input[name = dataloclaw]:checked').val();
            console.log("Radio Value : ",ss);
            if(ss=="Yes")
                $("#listcountry_Row").show();
            else
                $("#listcountry_Row").hide();

            var s=$('#thirdpartyvendor').val();
            if(s=="Internal")
            {
                $('#locationcenter_Row').show();
            }
            if(s=="Third Party")
            {
                $('#locationcenter_Row').hide();
            }
            var script="<script>$('.datepicker1').datepicker({\n" +
                "format: \"mm/dd/yyyy\",\n"+
                "clearBtn:true,"+
                "autoclose: true,\n"+
                "orientation: 'bottom',"+
                "});<\/script>";

            $('#scripttag').append(script);
        },
        error: function (e) {
            console.log(e);
        }
    });
}

function dateChangeFunction(val) {
    if (!val.match('^((0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)?[0-9]{2})*$')) {
        notification("warning", "Date field should be in mm/dd/yyyy format", "Note:");
    }
}
function ajaxTemplateCall(status , Id , AppName){
    header(AppName);
    $.ajax({
        url: "FinanceAppDataRetrieve",
        type: 'POST',
        data:{Current: status, ID: Id, Opportunity:AppName},
        dataType: "json",
        success: function (data) {

            console.log("Data Retrieve json array----->",data);
            AddTemplateData = data;
            if (!$.isArray(data)) {
                data = [data];
                AddTemplateData=[data];
            }
            var dependencyValue="";
            $.each(data, function(key, value){
                /*console.log("FULL NAME " + value.Type);*/
                var manadatory="class='required_fie LabelName'";
                var disable_property = "disabled='disabled'";
                var seq_num =value.seq_num;
                var Type=value.Type;
                var ColumnName=value.ColumnName;
                var LabelName=value.LabelName;
                var delete_icon="<div class='deletepopup' style='display:none;'></div>";
                var Value=value.Value;

                if(value.mandatory=="No")
                {
                    manadatory="class = 'LabelName'";
                    disable_property = "";
                    delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
                }
                if(value.mandatory=="Yes" && value.umandatory=="Yes")
                {
                    delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
                }
                if (Type == "Text box") {
                    var template_check = "";
                    var inputtext = "<div class='form-group InputField' id ='" + ColumnName + "_Row'>\n" +
                        "<label class='control-label' for='archiveLegacy'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil ' style='float:right;display:none;'></span>\n";
                    if (ColumnName === 'cba'||ColumnName === 'softlicensecost'||ColumnName === 'infrastructurecostsavings'||ColumnName === 'costavoidance'||ColumnName === 'costarchive') {
                        inputtext = inputtext+"<input type='number' class='form-control' size='35' id='" + ColumnName + "' placeholder='$' name='" + ColumnName + "' value='" + Value + "' onkeypress='return isNumber(event)'" +
                            "</div>";
                    }
                    else if (ColumnName === 'status' || ColumnName === "projnum" || ColumnName === "phase" ) {
                        disable_property = "disabled='disabled'";
                        inputtext = inputtext + "<input type='text' " + disable_property + " class='form-control' size='35' id='" + ColumnName + "' placeholder='' name='" + ColumnName + "' value='" + Value + "'/>\n" +
                            "</div>";
                    }
                    else if (ColumnName === "softlicense") {
                        var inputtext1 = "<div class='form-group InputField' id ='" + ColumnName + "_Row'>\n" +
                            "<label class='control-label' for='archiveLegacy'>" + LabelName + "<span " + manadatory + "></span><span class='glyphicon glyphicon-pencil' style='float:right;display:none;'></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil ' style='float:right;display:none;'></span>\n";

                        inputtext1 = inputtext1 + "<input type='number' min='0' onkeypress='return (event.charCode !=8 && event.charCode ==0 || (event.charCode >= 48 && event.charCode <= 57))' class='form-control' size='35' id='" + ColumnName + "' placeholder='' name='" + ColumnName + "' value='" + Value + "'/>\n" +
                            "</div>";
                    }
                    else {
                        inputtext = inputtext + "<input type='text' class='form-control' size='35' id='" + ColumnName + "' placeholder='' name='" + ColumnName + "' value='" + Value + "'/>\n" +
                            "</div>";
                    }
                    if (ColumnName === "softlicense") {
                        $('#inputFieldsAppInfo').append(inputtext1);
                    }else{
                    $('#inputFieldsAppInfo').append(inputtext);
                    }
                }

                else if(Type=="Datepicker")
                {

                    var inputdate="<div class='form-group InputField' id='"+ColumnName+"_Row'>" +
                        "<label class='control-label' for= 'archiveLegacy'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>\n" +
                        "<input type='text' onchange='dateChangeFunction(this.value)' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputdate);



                }
                else if(Type=="Dropdown")
                {
                    var template_check="";

                    var inputdrop= "<div class='form-group InputField' id = '"+ColumnName+"_Row'><label class='control-label' for= 'archiveLegacy'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
                        "<select style = 'width:100%;' class ='form-select' id='"+ColumnName+"'name='"+ColumnName+"'>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length);
                    var option=sub_option.split(",");
                    for(var i=0;i<option.length;i++) {
                        var select = "";
                        if(Value.includes(option[i])){
                            select = "selected";
                        }
                        inputdrop += "<option label='"+ option[i] + "' class='control-label' for= 'archiveLegacy' "+select+">" + option[i] + "</option>";
                    }
                    inputdrop +="</select></div>";
                    $('#inputFieldsAppInfo').append(inputdrop);
                }
                else if(Type=="Check box")
                {
                    var inputcheck= "<div class='form-group InputField'>"+
                        "<label class='control-label' for= 'archiveLegacy'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span><br/>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=Options.split(",");
                    var value_arr=Value.split(",");
                    for (var i=0; i<option.length; i++) {
                        var check = "";
                        var option_element=option[i];
                        if(value_arr.includes(option_element)){
                            check = "checked";
                        }
                        inputcheck += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;" +
                            option[i]+"</label><br/>";
                    }
                    inputcheck +="</div>";
                    $('#inputFieldsAppInfo').append(inputcheck);

                }
                else if(Type=="Radio box")
                {
                    var inputdrop= "<div class='form-group InputField'>"+
                        "<label class='control-label' for= 'archiveLegacy'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;' '></span><br/>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=Options.split(",");
                    for (var i=0; i<option.length; i++){
                        var check = "";
                        if(Value.includes(option[i])){
                            check = "checked";
                        }
                        inputdrop+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;"+
                            option[i]+"</label><br/>";
                    }
                    inputdrop +="</div>";
                    $('#inputFieldsAppInfo').append(inputdrop);

                }
                else if(Type=="file")
                {
                    inputfile="<div class='form-group InputField'>\n" +
                        "<label class='control-label' for='archiveLegacy'><div class='required_fie'>"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
                        "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputfile);

                }
                else if(Type=="Text area")
                {
                    var inputtext="<div class='form-group InputField'>\n" +
                        "<label class='control-label' for='archiveLegacy'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                        /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                        "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputtext);
                }
                else if(Type=="HiddenText")
                {
                    var style = (dependencyValue=="Internal")?"style='display:block;'":"style='display:none;'";//var style = (dependencyValue=="Internally Developed" || dependencyValue=="Yes")?"style='display:block;'":"style='display:none;'";
                    dependencyValue = "";
                    var inputtext="<div class='form-group InputField hiddenText1' id ='"+ColumnName+"_Row' "+style+">\n" +
                        "<label class='control-label' for='archiveLegacy'><div "+manadatory+">"+LabelName+"<div class='deletepopup' style='display:none;'></div><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' class='form-control hiddenText' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputtext);
                }

            });
            /*var script="<script>$('.datepicker1').datepicker({\n" +
                "format: \"mm/dd/yyyy\",\n"+
                "autoclose: true\n"+
                "});<\/script>";*/
            var ss=$('input[name = dataloclaw]:checked').val();
            console.log("Radio Value : ",ss);
            if(ss=="Yes")
                $("#listcountry_Row").show();
            else
                $("#listcountry_Row").hide();

            var s=$('#thirdpartyvendor').val();
            if(s=="Internal")
            {
                $('#locationcenter_Row').show();
            }
            if(s=="Third Party")
            {
                $('#locationcenter_Row').hide();
            }
            var script="<script>$('.datepicker1').datepicker({\n" +
                "format: \"mm/dd/yyyy\",\n"+
                "clearBtn:true,"+
                "autoclose: true,\n"+
                "orientation: 'bottom',"+
                "});<\/script>";

            $('#scripttag').append(script);
        },
        error: function (e) {
            console.log(e);
        }

    });
}

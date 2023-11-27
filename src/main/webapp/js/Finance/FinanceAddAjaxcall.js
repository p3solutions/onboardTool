$('#Legacysubmit').click(function() {
    var app_name = $('#app_Name').val();
    var proj_name = "";
    var label_name = $('#Legacyaddlabel').val();
    var type = $('#Legacytypes').val();
    var mandatory = $('#Legacymandatory').val();
    if(mandatory=="No")
        var umandatory="No";
    if(mandatory=="Yes")
        var umandatory="Yes";
    var num = 1;
    var options = "";
    if (type == "Check box") {
        num = $('#Legacycheck_number').val();
        var length = $('.LegacyCheckClass').length;
        for (var i = 1; i <= length; i++) {
            var checklabel = $('#LegacyCheckBoxLabel' + i).val();
            options += checklabel + ",";
        }
    } else if (type == "Radio box") {
        num = $('#Legacyradio_number').val();
        var length = $('.LegacyRadioClass').length;
        for (var i = 1; i <= length; i++) {
            var radiolabel = $('#LegacyRadioLabel' + i).val();
            options += radiolabel + ",";
        }

    } else if (type == "Dropdown") {
        num = $('#Legacydrop_number').val();
        var length = $('.LegacyDropClass').length;
        for (var i = 1; i <= length; i++) {
            var drplabel = $('#LegacyDropdownLabel' + i).val();
            options += drplabel + ",";
        }

    }
    if(label_name != '' && type !='' && mandatory !='')
    {

        addAjaxCall(app_name,proj_name,label_name,type,mandatory,num,options,umandatory);
    }
    else{
        notification("warning","Please fill the value in fields.","Warning");
        //alert("Please fill the value in fields");
    }
    $("#Legacyclose").click();

});

function addAjaxCall(app_name,proj_name,label_name,type,mandatory,num,options,umandatory)
{
    var checkNotify = true;
    $.ajax({
        url: "FinanceAppAddServlet",
        type: 'post',
        async: false,
        data: {ApplicationName:app_name,ProjectName: proj_name,LabelName:label_name,Type:type,Mandatory:mandatory,Number:num,Options:options,umandatory:umandatory},
        dataType: "json",
        success: function (data) {
            var required = "";

            //var data = JSON.parse(obj.toString());
            console.log("data add---->",data);
            var num=data.Seq_Num;
            var required_field = "";
            var delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
            if (data.Mandatory == "Yes" && data.UMandatory == "Yes" ){
                required_field = "class = 'required_fie LabelName'";
                delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
            }
            if (data.LabelDuplicateCheck == "true")
            {
                checkNotify = false;
                notification("warning","Label name is already exist.","Warning");

            }
            else if(data.ColumnDuplicateCheck == "true")
            {
                checkNotify = false;
                notification("warning","Column name is already exist.","Warning");

            }
            else if(data.Type=="Text box")
            {
                var inputtext="<div class='form-group InputField' id = '"+data.ColumnName+"_Row'>"+
                    "<label class='control-label' for='archiveLegacy'><div "+required_field+">"+data.LabelName+delete_icon+"</div></label><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
                    "<input type='text' class='form-control' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
                    "</div>";

                $('#inputFieldsAppInfo').append(inputtext);
            }
            else if(data.Type=="Datepicker")
            {
                var inputdate="<div class='form-group InputField' id = '"+data.ColumnName+"_Row'>"+
                    "<label class='control-label' for= 'archiveLegacy'><div "+required_field+">"+data.LabelName+delete_icon+"</div></label><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
                    "<input type='text' class='form-control datepicker1' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
                    "</div>";
                $('#inputFieldsAppInfo').append(inputdate);
                var script="<script>$('.datepicker1').datepicker({\n" +
                    "format: \"mm/dd/yyyy\",\n" +
                    "autoclose: true\n" +
                    "});<\/script>";
                $('#scripttag').append(script);
            }
            else if(data.Type=="Radio box")
            {
                var input="";
                input+= "<div class='form-group InputField' id = '"+data.ColumnName+"_Row'>"+
                    "<label class='control-label' for= 'archiveLegacy'><div "+required_field+">"+data.LabelName+delete_icon+"</div></label><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span><br/>";
                var Options=data.Options;
                var sub_option = Options.substring(0, Options.length - 1);
                var option=sub_option.split(",");
                for (var i=0; i<option.length; i++){

                    input+= "<label class = 'control-label' for = 'archiveLegacy'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+data.ColumnName+num+"'/>&nbsp;&nbsp;"+
                        option[i]+"</label><br/>";

                }
                input +="</div>";
                $('#inputFieldsAppInfo').append(input);
            }
            else if(data.Type=="Check box")
            {
                var input="";
                input+= "<div class='form-group InputField' id = '"+data.ColumnName+"_Row'>"+
                    "<label class='control-label' for= 'archiveLegacy'><div "+required_field+">"+data.LabelName+delete_icon+"</div></label><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span><br/>";
                var Options=data.Options;
                var sub_option = Options.substring(0, Options.length - 1);
                var option=sub_option.split(",");
                for (var i=0; i<option.length; i++) {

                    input += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='" + data.ColumnName+num+"'/>&nbsp;&nbsp;" +
                        option[i] + "</label><br/>";
                }
                input +="</div>";
                $('#inputFieldsAppInfo').append(input);
            }
            else if(data.Type=="Dropdown")
            {
                var select="";
                select+= "<div class='form-group InputField' id = '"+data.ColumnName+"_Row'><label class='control-label' for= 'archiveLegacy'><div "+required_field+">"+data.LabelName+delete_icon+"</div></label><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
                    "<select style = 'width:100%;' name = "+data.ColumnName+num+">";
                var Options=data.Options;
                var sub_option = Options.substring(0, Options.length - 1);
                var option=sub_option.split(",");
                for(var i=0;i<option.length;i++) {
                    select += "<option label=" + option[i] + " class='control-label' for= 'archiveLegacy' >" + option[i] + "</option>";
                }
                select +="</select></div>";
                $('#inputFieldsAppInfo').append(select);
            }
            $('#Legacyaddlabel').val("");
            $('#Legacytypes').val("Text box");
            $(".Legacyhidefield").hide();
            $("#Legacycheck_number").val("");
            $("#Legacyradio_number").val("");
            $("#Legacydrop_number").val("");
            $("#Legacymandatory").val("Yes");
            $("#Legacyaddclose_id").click();


            if(checkNotify)
                notification("success","Field is added successfully to Archive Requirements.","Note");
            else
                notification("error","Field not added to Archive Requirements.","Error");
        },


        error: function (e) {
            console.log("legacy",e);
        }
    });

}
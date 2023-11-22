$('#submit').click(function() {
    var projname = "";
    var umandatory="";
    var appname = $('#appName').val();
    var labelname = $('#label').val();
    var columnname = $('#idname').val();
    var type = $('#types').val();
    var mandatory = $('#mandatory').val();
    if(mandatory=="Yes")
        umandatory="Yes";
    if(mandatory=="No")
        umandatory="No";
    var num = 1;
    var options = "";
    if (type == "Check box") {
        num = $('#number').val();
        var length = $('.checkclass').length;
        for (var i = 1; i <= length; i++) {
            var checklabel = $('#label' + i).val();
            options += checklabel + ",";
        }
    } else if (type == "Radio box") {
        num = $('#radio_number').val();
        var length = $('.radioclass').length;
        for (var i = 1; i <= length; i++) {
            var radiolabel = $('#Rlabel' + i).val();
            options += radiolabel + ",";
        }

    } else if (type == "Dropdown") {
        num = $('#drop_number').val();
        var length = $('.dropclass').length;
        for (var i = 1; i <= length; i++) {
            var drplabel = $('#drp_label' + i).val();
            options += drplabel + ",";
        }

    }
    if(labelname != '' && columnname !='' && type !='' && mandatory !='')
    {
        var checkNotify = true;
        $.ajax({
            url: "FinanceAppAddServlet",
            type: 'POST',
            data: {ApplicationName:appname,ProjectName: projname,LabelName:labelname,ColumnName:columnname,Type:type,Mandatory:mandatory,Number:num,Options:options,umandatory:umandatory},
            dataType: "json",
            success: function (data) {
                var required = "";
                console.log("data add---->",data);
                var num=data.Seq_Num;
                //cosole.log("length of editpopup class",$('.editpopup').length);
                var required_field = "";
                var delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
                if (data.Mandatory == "Yes" && data.UMandatory=="Yes"){
                    required_field = "class = 'required_fie'";
                    //delete_icon="<div class='deletepopup' style='display:none;'></div>";
                }
                if (data.LabelDuplicateCheck == "true")
                {
                    checkNotify = false;
                    notification("warning","Label name is already exist.","Warning");
                    //alert("Label name is already exist.");
                    return false;
                }
                else if(data.ColumnDuplicateCheck == "true")
                {
                    checkNotify = false;
                    notification("warning","Column name is already exist.","Warning");
                    //alert("Column name is already exist.");
                    return false;
                }
                else if(data.Type=="Text box")
                {
                    var inputtext="<div class='form-group InputField'>"+
                        "<label class='control-label' for='opportunity'><div "+required_field+">"+data.LabelName+delete_icon+"</div></label><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
                        "<input type='text' class='form-control' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
                        "</div>";

                    $('#inputFields').append(inputtext);
                }
                else if(data.Type=="Datepicker")
                {
                    var inputdate="<div class='form-group InputField'>"+
                        "<label class='control-label' for= 'opportuity'><div "+required_field+">"+data.LabelName+delete_icon+"</div></label><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
                        "<input type='text' class='form-control datepicker1' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
                        "</div>";
                    $('#inputFields').append(inputdate);
                    var script="<script>$('.datepicker1').datepicker({\n" +
                        "format: \"mm/dd/yyyy\",\n" +
                        "autoclose: true\n" +
                        "});<\/script>";
                    $('#scripttag').append(script);
                }
                else if(data.Type=="Radio box")
                {
                    var input="";
                    input+= "<div class='form-group InputField'>"+
                        "<label class='control-label' for= 'opportunity'><div "+required_field+">"+data.LabelName+delete_icon+"</div></label><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span><br/>";
                    var Options=data.Options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=sub_option.split(",");
                    for (var i=0; i<option.length; i++){

                        input+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+data.ColumnName+num+"'/>&nbsp;&nbsp;"+
                            option[i]+"</label><br/>";

                    }
                    input +="</div>";
                    $('#inputFields').append(input);
                }
                else if(data.Type=="Check box")
                {
                    var input="";
                    input+= "<div class='form-group InputField'>"+
                        "<label class='control-label' for= 'opportunity'><div "+required_field+">"+data.LabelName+delete_icon+"</div></label><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span><br/>";
                    var Options=data.Options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=sub_option.split(",");
                    for (var i=0; i<option.length; i++) {

                        input += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='" + data.ColumnName+num+"'/>&nbsp;&nbsp;" +
                            option[i] + "</label><br/>";
                    }
                    input +="</div>";
                    $('#inputFields').append(input);
                }
                else if(data.Type=="Dropdown")
                {
                    var select="";
                    select+= "<div class='form-group InputField'><label class='control-label' for= 'opportunity'><div "+required_field+">"+data.LabelName+delete_icon+"</div></label><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
                        "<select style = 'width:100%;' name = "+data.ColumnName+num+">";
                    var Options=data.Options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=sub_option.split(",");
                    for(var i=0;i<option.length;i++) {
                        if(option[i]!==""){
                            select += "<option label=" + option[i] + " class='control-label' for= 'opportunity' >" + option[i] + "</option>";
                        }
                        else{
                            select += "<option label=''class='control-label' for= 'triage' " + select + ">" + option[i] + "</option>";
                        }
                    }
                    select +="</select></div>";
                    $('#inputFields').append(select);
                }
                $('#label').val("");
                $('#idname').val("");
                $('#types').val("Text box");
                $('#number').val("");
                $('.hidefield').hide();
                $('#radio_number').val("");
                $('#drop_number').val("");
                $('#mandatory').val("Yes");
                $("#add_close_id").click();

                if(checkNotify)
                    notification("success","Field is added successfully.","Note");
                else
                    notification("error","Field not added.","Error");
            },


            error: function (e) {
                console.log(e);
            }
        });
    }

    else{
        notification("warning","Please fill the value in fields.","Warning");
        //alert("Please fill the value in fields");
        return false;

    }
});

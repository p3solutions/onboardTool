$(document).ready(function(){
    $.ajax({
        url: "IntakeTriageSummDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve json array----->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            var template_fields=['ideaNumber','DemandNumber','PrjNumber','PrjctTaskNumber','BigrockSumm','DenialReason'];
            $.each(data, function(key, value){
                /*console.log("FULL NAME " + value.Type);*/
                var manadatory="class='required_fie'";
                var disable_property = "disabled='disabled'";
                var seq_num =value.seq_num;
                var Type=value.Type;
                var ColumnName=value.ColumnName;
                var LabelName=value.LabelName;
                var CheckTemplateField =false;
                var delete_icon="<div class='deletepopupSummary' style='display:none;'></div>";
               // var delete_edit_icon="<div class='editpopupSummary deletepopupSummary' style='display:none;'></div>";
                var Value=value.Value;
                //var options=data[i].options.split(',');
                if(value.Mandatory=="No")
                {
                    manadatory="";
                    disable_property = "";
                    delete_icon = "<span class='glyphicon glyphicon-trash deletepopupSummary hidedeleteSummary' style='float:right;display:none;' ></span>";
                    //delete_edit_icon = "<span class='glyphicon glyphicon-trash deletepopupSummary hidedeleteSummary' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span>";
                }
                if(template_fields.includes(ColumnName)&&value.CheckExistance==true)
                {
                	
                	$("input[name='"+ColumnName+"_temp']").prop("checked",true);
                	
                }
               
                     
            	if(value.CheckExistance==true)
                if(Type=="Text box")
                {
                	var template_check=""; 
                    var inputtext="<div class='form-group InputFieldSummary' id ='"+ColumnName+"_SummaryRow'>\n" +
                        "<label class='control-label' for='TriageSummary'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#inputFieldsSummary').append(inputtext);
                  }
                else if(Type=="Datepicker")
                {
                	var template_check=""; 
                	
                    var inputdate="<div class='form-group InputFieldSummary' id='"+ColumnName+"_SummaryRow'>" +
                        "<label class='control-label' for= 'TriageSummary'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                        "</div>";
                    $('#inputFieldsSummary').append(inputdate);
                    }
                else if(Type=="Dropdown")
                {
                	var template_check=""; 
                    var inputdrop= "<div class='form-group InputFieldSummary' id = '"+ColumnName+"_SummaryRow'><label class='control-label' for= 'TriageSummary'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>"+
                        "<select style = 'width:100%;' class ='form-control' id='"+ColumnName+"'name='"+ColumnName+"'>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=Options.split(",");
                    for(var i=0;i<option.length;i++) {
                        var select = "";
                        if(Value.includes(option[i])){
                         select = "selected";
                        }
                        inputdrop += "<option label=" + option[i] + " class='control-label' for= 'opportunity' "+select+">" + option[i] + "</option>";
                    }
                    inputdrop +="</select></div>";
                    $('#inputFieldsSummary').append(inputdrop);
                }
                else if(Type=="Check box")
                {
                    var inputcheck= "<div class='form-group InputFieldSummary' id = '"+ColumnName+"_SummaryRow'>"+
                        "<label class='control-label' for= 'TriageSummary'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>";
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
                        inputcheck += "<label class = 'control-label' for = 'TriageSummary'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;" +
                            option[i]+"</label>";
                    }
                    inputcheck +="</div>";
                    $('#inputFieldsSummary').append(inputcheck);

                }
                else if(Type=="Radio box")
                {
                    var inputdrop= "<div class='form-group InputFieldSummary' id = '"+ColumnName+"_SummaryRow'>"+
                        "<label class='control-label' for= 'TriageSummary'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=Options.split(",");
                    for (var i=0; i<option.length; i++){
                        var check = "";
                        if(Value.includes(option[i])){
                            check = "checked";
                        }
                        inputdrop+= "<label class = 'control-label' for = 'TriageSummary'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;"+
                            option[i]+"</label>";
                    }
                    inputdrop +="</div>";
                    $('#inputFieldsSummary').append(inputdrop);

                }
                else if(Type=="file")
                {
                    inputfile="<div class='form-group InputFieldSummary' id = '"+ColumnName+"_SummaryRow'>\n" +
                        "<label class='control-label' for='TriageSummary'><div class='required_fie'>"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'' ></span></div></label>\n" +
                        "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                        "</div>";
                    $('#inputFieldsSummary').append(inputfile);

                }
                else if(Type=="Text area")
                {
                    var inputtext="<div class='form-group InputFieldSummary' id = '"+ColumnName+"_SummaryRow'>\n" +
                        "<label class='control-label' for='TriageSummary'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>\n" +
                        /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                         "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                        "</div>";
                    $('#inputFieldsSummary').append(inputtext);
                }

            });
            var script="<script>$('.datepicker1').datepicker({\n" +
                "format: \"mm/dd/yyyy\",\n"+
                "autoclose: true\n"+
                "});<\/script>";
            
            $('#scripttag').append(script);

        },
        error: function (e) {
            console.log(e);
        }

    });
    $(document).on('click', '.editpopupSummary', function () {
    	$('#editpopupSummary_btn').click();
    var seqnum=$(this).index('.editpopupSummary');
    //alert('seq_num in js file '+seqnum);
    $('#TriSummSeqNum').val(seqnum);
    //alert('seq num field in js file'+$('#seq_num').val());
    });
//$('.deletepopupSummary').click(function() 
$(document).on('click', '.deletepopupSummary', function () {
     $('#deletepopupSummary_btn').click();
    var seqnum=$(this).index('.deletepopupSummary');
    $('#TriSummSequence').val(seqnum);
    });
});
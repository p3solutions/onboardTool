$(document).on('change','#AppDetails',function()
{	
var value = $(this).val();
$("#AssessSection option[value='ContractInformation']").remove();
if(value=="Third Party")
{	         
	$("#ContractInformation").show();
	$("#AssessSection").append('<option value="ContractInformation">Contract Information</option>');
}
else
{
	$("#ContractInformation").hide();
	
}
/*$.ajax({
    url: "IntakeAssessmentContractInformationServlet",
    type: 'POST',
    async: false,
    data : {Value : value },
    dataType: "json",
    success: function (data) {
    	console.log("Json Array Contract Information :",data);
    	var InputFieldName = "inputFieldsContInfo";
    	 if(value=="Third Party")
    	{	         
        $.each(data, function(key, value){
            console.log("FULL NAME " + value.Type);
            var manadatory="class='required_fie'";
            var disable_property = "disabled='disabled'";
            var seq_num =value.seq_num;
            var Type=value.Type;
            var ColumnName=value.ColumnName;
            var LabelName=value.LabelName;
            var Section = value.section;
            
            var CheckTemplateField =false;
            var delete_icon="<div class='deletepopupAssessment "+Section+"_Delete' style='display:none;'></div>";
           // var delete_edit_icon="<div class='editpopupAssessment deletepopupAssessment' style='display:none;'></div>";
            var Value=value.Value;
            //var options=data[i].options.split(',');
            if(value.Mandatory=="No")
            {
                manadatory="";
                disable_property = "";
                delete_icon = "<span class='glyphicon glyphicon-trash deletepopupAssessment hidedeleteAssessment "+Section+"_Delete' style='float:right;display:none;' ></span>";
                //delete_edit_icon = "<span class='glyphicon glyphicon-trash deletepopupAssessment hidedeleteAssessment' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment' style='float:right;display:none;'></span>";
            }    
            if(Type=="Text box")
            {
            	var template_check=""; 
                var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id ='"+ColumnName+"_AssessmentRow'>\n" +
                    "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                    "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                    "</div>";
                $('#'+InputFieldName).append(inputtext);
              }
            else if(Type=="Datepicker")
            {
            	var template_check=""; 
            	
                var inputdate="<div class='form-group InputFieldAssessment "+Section+"' id='"+ColumnName+"_AssessmentRow'>" +
                    "<label class='control-label' for= 'Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                    "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                    "</div>";
                $('#'+InputFieldName).append(inputdate);
                }
            else if(Type=="Dropdown")
            {
            	var template_check=""; 
                var inputdrop= "<div class='form-group InputFieldAssessment "+Section+"' id = '"+ColumnName+"_AssessmentRow'><label class='control-label' for= 'Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>"+
                    "<select style = 'width:100%;' class ='form-control' id='"+ColumnName+"'name='"+ColumnName+"'>";
                var Options=value.options;
                var sub_option = Options.substring(0, Options.length - 1);
                var option=Options.split(",");
                for(var i=0;i<option.length;i++) {
                    var select = "";
                    if(Value.includes(option[i])){
                     select = "selected";
                    }
                    inputdrop += "<option label='" + option[i] + "' class='control-label' for= 'opportunity' "+select+">" + option[i] + "</option>";
                }
                inputdrop +="</select></div>";
                $('#'+InputFieldName).append(inputdrop);
            }
            else if(Type=="Check box")
            {
                var inputcheck= "<div class='form-group InputFieldAssessment "+Section+"' id = '"+ColumnName+"_AssessmentRow'>"+
                    "<label class='control-label' for= 'Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>";
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
                    inputcheck += "<label class = 'control-label' for = 'Assessment'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;" +
                        option[i]+"</label>";
                }
                inputcheck +="</div>";
                $('#'+InputFieldName).append(inputcheck);

            }
            else if(Type=="Radio box")
            {
                var inputdrop= "<div class='form-group InputFieldAssessment "+Section+"' id = '"+ColumnName+"_AssessmentRow'>"+
                    "<label class='control-label' for= 'Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>";
                var Options=value.options;
                var sub_option = Options.substring(0, Options.length - 1);
                var option=Options.split(",");
                for (var i=0; i<option.length; i++){
                    var check = "";
                    if(Value.includes(option[i])){
                        check = "checked";
                    }
                    inputdrop+= "<label class = 'control-label' for = 'Assessment'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;"+
                        option[i]+"</label>";
                }
                inputdrop +="</div>";
                $('#'+InputFieldName).append(inputdrop);

            }
            else if(Type=="file")
            {
                inputfile="<div class='form-group InputFieldAssessment "+Section+"' id = '"+ColumnName+"_AssessmentRow'>\n" +
                    "<label class='control-label' for='Assessment'><div class='required_fie'>"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'' ></span></div></label>\n" +
                    "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                    "</div>";
                $('#'+InputFieldName).append(inputfile);

            }
            else if(Type=="Text area")
            {
                var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id = '"+ColumnName+"_AssessmentRow'>\n" +
                    "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                    "<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                     "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                    "</div>";
                $('#'+InputFieldName).append(inputtext);
            }
            else if(Type =="RadioBoxDependencyYes")
            {
            	RadioBoxDependencyYesCount++;
            	var inputdrop= "<div class='form-group InputFieldAssessment "+Section+"' id = '"+ColumnName+"_AssessmentRow'>"+
                "<label class='control-label' for= 'Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>";
            var Options=value.options;
            var sub_option = Options.substring(0, Options.length - 1);
            var option=Options.split(",");
            for (var i=0; i<option.length; i++){
                var check = "";
                if(Value.includes(option[i])){
                    check = "checked";
                }
                inputdrop+= "<label class = 'control-label' for = 'Assessment'><input type='radio' class = 'form-comtrol RadioBoxDependencyYesClass' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='DepedencyTextBoxYes"+RadioBoxDependencyYesCount+"' "+check+"/>&nbsp;&nbsp;"+
                    option[i]+"</label>";
            }
            inputdrop +="</div>";
            $('#'+InputFieldName).append(inputdrop);
            }
            else if(Type =="TextBoxDependencyYes")
            {
            	var template_check=""; 
                var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id ='DepedencyTextBoxYes"+RadioBoxDependencyYesCount+"' style='display:none;'>\n" +
                    "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                    "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                    "</div>";
                $('#'+InputFieldName).append(inputtext);
            }
            else if(Type=="RadioBoxDependencyNo")
            {
            	RadioBoxDependencyNoCount++;
            	var inputdrop= "<div class='form-group InputFieldAssessment "+Section+"' id = '"+ColumnName+"_AssessmentRow'>"+
                "<label class='control-label' for= 'Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>";
            var Options=value.options;
            var sub_option = Options.substring(0, Options.length - 1);
            var option=Options.split(",");
            for (var i=0; i<option.length; i++){
                var check = "";
                if(Value.includes(option[i])){
                    check = "checked";
                }
                inputdrop+= "<label class = 'control-label' for = 'Assessment'><input type='radio' class = 'form-comtrol RadioBoxDependencyNoClass' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"'  value = '"+option[i]+"' name='DepedencyTextBoxNo"+RadioBoxDependencyNoCount+"' "+check+"/>&nbsp;&nbsp;"+
                    option[i]+"</label>";
                
            }
            inputdrop +="</div>";
            $('#'+InputFieldName).append(inputdrop);

            }
            else if(Type=="TextBoxDependencyNo")
            {
            	var template_check=""; 
                var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id ='DepedencyTextBoxNo"+RadioBoxDependencyNoCount+"' style='display:none;'>\n" +
                    "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                    "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                    "</div>";
                $('#'+InputFieldName).append(inputtext);
            }
        });
        var script="<script>$('.datepicker1').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "autoclose: true\n"+
            "});<\/script>";
        
        $('#scripttag').append(script); 	
        $("#ContractInformation").show();
       }
        else
       {
         $("#ContractInformation").hide();
       }
    },
    error: function (e) {
        console.log(e);
    }
});
*/
});
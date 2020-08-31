/*Common Functionality is followed for all the hide and show in Assessment module(Ex:Textbox,Radiobox,Datepicker)*/

$(document).ready(function(){
	AssessmentDataRetrieveAjaxCall();
   $(document).on('change', '#ReadonlyData_AssessmentRow', function (){
    if($("input[type='radio'][name='ReadonlyData']:checked").val()=="Yes"){
	$("#LastUpdateMade_AssessmentRow").show();
	 $("#ExpectedDate_AssessmentRow").hide();
	 }
    else {
    $("#LastUpdateMade_AssessmentRow").hide();
    $("#ExpectedDate_AssessmentRow").show();}
    });
        $(document).on('change', '.RadioBoxDependencyNoClass', function () {
    	var nameattr= $(this).attr('name');
    	var value =$(this).val();
    	$("#"+nameattr).hide();
    	if(value=="No")
    	{
    	  $("#"+nameattr).show();
    	}
    });
        $(document).on('change', '#AssessAppPlatform', function () {
        	var value =$(this).val();
        	$("#OtherPleaseDescribe_AssessmentRow").hide();
        	if(value=="Others")
        	{
        	  $("#OtherPleaseDescribe_AssessmentRow").show();
        	}
        });
    $(document).on('change', '.RadioBoxDependencyYesClass', function () {
    	var nameattr= $(this).attr('name');
    	var value =$(this).val();
    	$("#"+nameattr).hide();
    	if(value=="Yes")
    	{
    	  $("#"+nameattr).show();
    	}
    }); $(document).on('click', '.editpopupAssessment', function () {
    	$('#editpopupAssess_btn').click();
    var seqnum=$(this).index('.editpopupAssessment');
    var ClassAttr = $(this).attr('class');
    
    var ClassNames =ClassAttr.split(" ");
    
    var className = ClassNames[ClassNames.length-1];
    
    var SectionSeqNum = $(this).index('.'+className);
    
    var Section = className.substring(0,className.lastIndexOf('_')); 
    
    $('#AssessSeqNum').val(SectionSeqNum);
    $('#EditSection').val(Section);
    //alert(" Seq Num : "+SectionSeqNum+" Section Name : "+Section);
    });
//$('.deletepopupAssessment').click(function() 
$(document).on('click', '.deletepopupAssessment', function () {
     $('#deletepopupAssess_btn').click();
    var AssessmentSeqNum=$(this).index('.deletepopupAssessment');
    
    var ClassAttr = $(this).attr('class');
    
    var ClassNames =ClassAttr.split(" ");
    
    var className = ClassNames[ClassNames.length-1];
    
    var SectionSeqNum = $(this).index('.'+className);
    
    var Section = className.substring(0,className.lastIndexOf('_')); 
    
    $('#AssessSequence').val(SectionSeqNum);
    $('#DeleteSection').val(Section);
    });

});
function AssessmentDataRetrieveAjaxCall()
{
	$.ajax({
        url: "IntakeAssessmentDataRetrieve",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve Assessment json array----->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            var RadioBoxDependencyNoCount = 0;
            var YesColumnName ="";
            var RadioBoxDependencyYesCount = 0;
            var NoColumnName ="";
            var checkThirdParty = false;
            var SECTION = ['inputFieldsAppInfo','inputFieldsDataChar','inputFieldsComplianceChar','inputFieldsArchivConsump','inputFieldsContInfo'];
            for(var SectionIndex =0; SectionIndex < data.length;SectionIndex++)
            {
            	var InputFieldName = SECTION[SectionIndex];
            	$("#"+InputFieldName).html("");
            	var RadioYesValue = "";
            	var RadioNoValue = "";
            	var HideShow = "";
            	var readonlyColumnname = "style:display:none";
            $.each(data[SectionIndex], function(key, value){
                /*console.log("FULL NAME " + value.Type);*/
                var manadatory="class='required_fie'";
                var disable_property = "disabled='disabled'";
                var seq_num =value.seq_num;
                var Type=value.Type;
                var ColumnName=value.ColumnName;
                
                var LabelName = value.LabelName;
                var Section = value.section;
                
                var CheckTemplateField =false;
                var delete_icon="<div class='deletepopupAssessment "+Section+"_Delete' style='display:none;'></div>";
               // var delete_edit_icon="<div class='editpopupAssessment deletepopupAssessment' style='display:none;'></div>";
                var Value=value.Value;
                
                if(Section=="ApplicationInformation"&&ColumnName=="AssessAppPlatform")
                {
                  	HideShow = (Value=="Others")?"":"style='display:none;'";
                }
                if(Section=="DataCharacteristics"&&ColumnName=="ReadonlyData"){
                	
                	if(Value=="Yes"){
                		readonlyColumnname = "LastUpdateMade";
                	}
                	else if(Value=="No"){
                		readonlyColumnname = "ExpectedDate";
                	}
                }
                
               
                //var options=data[i].options.split(',');
                if(value.Mandatory=="No")
                {
                    manadatory="";
                    disable_property = "";
                    delete_icon = "<span class='glyphicon glyphicon-trash deletepopupAssessment hidedeleteAssessment "+Section+"_Delete' style='float:right;display:none;' ></span>";
                    //delete_edit_icon = "<span class='glyphicon glyphicon-trash deletepopupAssessment hidedeleteAssessment' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment' style='float:right;display:none;'></span>";
                }
                if(ColumnName == "AppDetails")
                {
                	if(Value=="Third Party")
                	  checkThirdParty =true;
                }
                if(Section == "ContractInformation")
                {
                	if(checkThirdParty)
                	$("#ContractInformation").show();
                }
                if(Type=="Text box")
                {
                	var template_check=""; 
                    var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id ='"+ColumnName+"_AssessmentRow'"+HideShow+">\n" +
                        "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#'+InputFieldName).append(inputtext);
                    HideShow = "";
                 }
                else if(Type=="Datepicker")
                {
                	var template_check=""; 
                	
                    var inputdate="<div class='form-group InputFieldAssessment "+Section+"' id='"+ColumnName+"_AssessmentRow' >" +
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
                        /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                         "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                        "</div>";
                    $('#'+InputFieldName).append(inputtext);
                }
                else if(Type =="RadioBoxDependencyYes")
                {
                	YesColumnName = ColumnName;
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
                    inputdrop+= "<label class = 'control-label' for = 'Assessment'><input type='radio' class = 'form-comtrol RadioBoxDependencyYesClass' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='DepedencyTextBoxYes"+YesColumnName+"' "+check+"/>&nbsp;&nbsp;"+
                        option[i]+"</label>";
                }
                inputdrop +="</div>";
                RadioYesValue = Value;
                $('#'+InputFieldName).append(inputdrop);
                }
                else if(Type =="TextBoxDependencyYes")
                {
                	var hideshow = (RadioYesValue=="Yes")? "":"style='display:none;'";
                	var template_check=""; 
                    var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id ='DepedencyTextBoxYes"+YesColumnName+"' "+hideshow+">\n" +
                        "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+"<div class='deletepopupAssessment "+Section+"_Delete' style='display:none;'></div><span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#'+InputFieldName).append(inputtext);
                }
                else if(Type =="DatepickerDependencyYes")
                {
                	var hideshow = (RadioYesValue=="Yes")? "":"style='display:none;'";
                	var template_check=""; 
                    var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id ='DepedencyTextBoxYes"+RadioBoxDependencyYesCount+"' "+hideshow+">\n" +
                        "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+"<div class='deletepopupAssessment "+Section+"_Delete' style='display:none;'></div><span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' Class='form-control datepicker1 hasDatepicker' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#'+InputFieldName).append(inputtext);
                }
				
                else if(Type=="RadioBoxDependencyNo")
                {
                	NoColumnName =  ColumnName;
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
                    inputdrop+= "<label class = 'control-label' for = 'Assessment'><input type='radio' class = 'form-comtrol RadioBoxDependencyNoClass' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"'  value = '"+option[i]+"' name='DepedencyTextBoxNo"+NoColumnName+"' "+check+"/>&nbsp;&nbsp;"+
                        option[i]+"</label>";
                    
                }
                inputdrop +="</div>";
                RadioNoValue = Value;
                $('#'+InputFieldName).append(inputdrop);
	
                }
                else if(Type=="TextBoxDependencyNo")
                {
                	var hideshow = (RadioNoValue=="No")? "" :"style='display:none;'";
                	var template_check=""; 
                    var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id ='DepedencyTextBoxNo"+NoColumnName+"' "+hideshow+">\n" +
                        "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+"<div class='deletepopupAssessment "+Section+"_Delete' style='display:none;'></div><span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#'+InputFieldName).append(inputtext);
                }
				
                else if(Type=="DatepickerDependencyNo")
                {
                	var hideshow = (RadioNoValue=="No")? "" :"style='display:none;'";
                	var template_check=""; 
                    var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id ='DepedencyTextBoxNo"+RadioBoxDependencyNoCount+"' "+hideshow+">\n" +
                        "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+"<div class='deletepopupAssessment "+Section+"_Delete' style='display:none;'></div><span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' Class='form-control datepicker1 hasDatepicker' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#'+InputFieldName).append(inputtext);
                }
                else if(Type=="TextAreaFile")
                {
                	var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id = '"+ColumnName+"_AssessmentRow'>\n" +
                    "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                    /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                     "<textarea class='form-control' name='"+ColumnName+"_text' id='"+ColumnName+"'>"+Value+"</textarea>"+
                     "<input type='file' name='"+ColumnName+"_file' accept='image/!*' id ='choosen_file_name'>\n" +
                    "</div>";
                $('#'+InputFieldName).append(inputtext);
                }
                 else if(Type=="DatepickerDependency")
                {
                	var template_check=""; 
                	var hideshow = (ColumnName==readonlyColumnname)? "":"style='display:none;'";
                    var inputdate="<div class='form-group InputFieldAssessment "+Section+"' id='"+ColumnName+"_AssessmentRow' "+hideshow+">" +
                        "<label class='control-label' for= 'Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                        "</div>";
                    $('#'+InputFieldName).append(inputdate);
                    }
                /* else if(Type=="HiddenText")
         		{
         		var visibility = checkVisibility?"style ='display:block';":"style ='display:none';";
                 var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id ='"+ColumnName+"_AssessmentRow' "+visibility+">\n" +
                     "<label class='control-label' for='triage'><div "+manadatory+">"+LabelName+"</div><div class='edit deletealert'></div></label>\n" +
                     "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                     "</div>";
                 $('#'+InputFieldName).append(inputtext);
                 checkVisibility= false;
         		}*/
               });
          }
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
	
}

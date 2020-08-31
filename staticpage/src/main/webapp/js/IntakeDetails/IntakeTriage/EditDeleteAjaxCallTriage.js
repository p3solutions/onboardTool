    $('#TriageEditSubmit').click(function(){
    	var Label=$("#TriageLabelModify").val();
    	var Mandatory = $("#TriageEditMandatory").val();
    	var Seq_Num=$('#TriageEditSeqNum').val();
    	if (Label !='')
    	{
    		
    	$.ajax({
            url: "IntakeTriageEditServlet",
            type: 'POST',
            data : {seq_num:Seq_Num,label:Label,Mandatory:Mandatory},
            dataType: "json",
            success: function (data) {
            	
            	//alert("success");
            	console.log("Modify data : "+data.seq_no);
            	var index = data.seq_no - 1;
            	var updated_label_name = data.label_name;
            	var previous_label_name =data.previous_label_name;
            	if(data.mandatory==true)
            		{
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first").addClass("required_fie");
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first .hidedel").remove();
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first").append("<div class='deletealert' style='display:none;'></div>");
            		}
            	else
            		{
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first").removeClass("required_fie");
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first .deletealert").remove();
            			$(".Inputvalue").eq(index).find("label[for =triage] div:first").append("<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;'></span>");
            		}
            	var html = $(".Inputvalue").eq(index).find("label[for =triage]").html();
            	var html1 =html.replace(previous_label_name,updated_label_name);
            	
            	console.log("HTML "+html1);
            	$(".Inputvalue").eq(index).find("label[for =triage]:first").html(html1);
            	$("#TriageLabelModify").val("");
            	$("#TriageEditClose").click();
            	$('.hidepen').hide();
            	//$('#Record_No').val(data.RandomNumber);
            },
            error: function (e) {
                console.log(e);
            }
        });
    	}
    	else {
    		
    		alert("Please fill the value in field");
    	}
    });
    $('#TriageDeleteSubmit').click(function(){
    	
    	var Seq_Num=$('#sequenceTriageDelete').val();
    	var check = TriageDeleteAjax(Seq_Num);
    	if(check)
    	{
    		$("#OpportunityListbtn").click();
    	}
    	
    });
    
    function TriageDeleteAjax(Seq_Num)
    {
    	$.ajax({
            url: "IntakeTriageDeleteServlet",
            type: 'POST',
            async: false,
            data : {seq_num:Seq_Num},
            dataType: "json",
            success: function (data) {
            	
            	console.log("index"+data[0].index);
            	var index = data[0].index;
            	$(".Inputvalue").eq(index).remove();
            	$("#TriageDeleteClose").click();
            	$('.hidedel').hide();
             	   var rowCount =  0;
             	   var YesColumnName = "";
             	   var NoColumnName = "";
             	   $.each(data[1], function(key, value){
                        /*console.log("FULL NAME " + value.Type);*/
             		   console.log("assessment add or delete: "+value);
             		   if(rowCount != 0 )
             	      {
             	       var InputFieldName = "inputFieldsAppInfo";
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
                            var inputtext="<div class='form-group InputFieldAssessment "+Section+"' id ='"+ColumnName+"_AssessmentRow' style='display:none;'>\n" +
                                "<label class='control-label' for='Assessment'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>\n" +
                                "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                                "</div>";
                            $('#'+InputFieldName).append(inputtext);
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
                        else if(Type =="RadioBoxDependencyYes")
                        {
                     	  YesColumnName=ColumnName;
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
                        else if(Type=="RadioBoxDependencyNo")
                        {
                        	NoColumnName=ColumnName;
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
             	     }
             		else if(rowCount == 0)
             		{
             		  var AssessmentDeleteColumnNames = value.split(",");
             		  for(var i = 0; i <  AssessmentDeleteColumnNames.length; i++)
             		  {
             			$("#"+AssessmentDeleteColumnNames[i]+"_AssessmentRow").remove();  
                         $("#DepedencyTextBoxYes"+AssessmentDeleteColumnNames[i]).remove();
                         $("#DepedencyTextBoxNo"+AssessmentDeleteColumnNames[i]).remove();
             	       }
             		}
             		   rowCount++;
                    });
            },
            error: function (e) {
                console.log(e);
            }
        });
    	return true;
    }
    
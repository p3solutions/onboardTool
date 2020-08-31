function validateTriage(){
	$(".submitDisable").attr("disabled", true);
	$(".hidepen").hide();
	$(".hidedel").hide();
	var selected_seq = [];
	var selected_index = "";
	console.log("class total length"+$(".Template_Values").length);
	$(".Template_Values").each(function(i) {
		   if (this.checked) {
		       //alert("Checkbox at index " + i + " is checked.");
		       selected_seq.push(""+(i+1)+"");
		       selected_index += (i+1)+",";
		   }
		});
	selected_index = selected_index.substring(0,selected_index.length-1)
	$.ajax({
        url: "IntakeDetailsTriageAddTemplateFields",
        type: 'POST',
        data : {Selected_Index:selected_index},
        dataType: "json",
        success: function (data) {
        	console.log("data add template ; ",data);
        	if (!$.isArray(data)) {
        		data = [data];
                
            }
        	for(var PageIndex=0;PageIndex<data.length;PageIndex++)
        	{
           if(PageIndex == 0)
           {
        	var index = 0;
        	$.each(data[0], function(key, value)
            {
            	if(index!=0)
            	{
            		console.log("FULL NAME " + value.Type);
                    var manadatory="class='required_fie'";
                    var disable_property = "disabled='disabled'";
                    var Type=value.Type;
                    var ColumnName=value.ColumnName;
                    var LabelName=value.LabelName;
                    var Value=value.Value;
                    var delete_edit_icon="<div class='edit deletealert' style='display:none;'></div>";
                    //var options=AddTemplateData[i].options.split(',');
                    if(value.Mandatory=="No")
                    {
                        manadatory="";
                        disable_property = "";
                        delete_edit_icon = "<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span>";
                    }
                    if(Type=="Text box")
                    {
                        var inputtext="<div class='form-group Inputvalue' id ='"+ColumnName+"_Row'>\n" +
                            "<label class='control-label' for='triage'><div "+manadatory+">"+LabelName+delete_edit_icon+"</div></label>\n" +
                            "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                            "</div>";
                        if(!$('#'+ColumnName).length){
                        $('#inputValue').append(inputtext);
                         }
                        }
                    else if(Type=="Datepicker")
                    {
                        var inputdate="<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>" +
                            "<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+delete_edit_icon+"</div></label>\n" +
                            "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                            "</div>";
                        if(!$('#'+ColumnName).length){
                        $('#inputValue').append(inputdate);
                        }
                    }
                    else if(Type=="Dropdown")
                    {
                        var inputdrop= "<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>" + 
							"<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+delete_edit_icon+"</div></label>\n"+
                            "<select style = 'width:100%;' class ='form-control' id = '"+ColumnName+"' name='"+ColumnName+"'>";
                        var Options=value.options;
                        //var sub_option = Options.substring(0, Options.length - 1);
                        var option=Options.split(",");
                        for(var i=0;i<option.length;i++) {
                            var select = "";
                            if(Value.includes(option[i])){
                             select = "selected";
                            }
                            inputdrop += "<option label=" + option[i] + " class='control-label' for= 'triage' "+select+">" + option[i] + "</option>";
                        }
                        inputdrop +="</select></div>";
                        if(!$('#'+ColumnName).length){
                        $('#inputValue').append(inputdrop);
                        }
                      }
                    else if(Type=="Check box")
                    {
                        var inputcheck= "<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>"+
                            "<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>";
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
                            inputcheck += "<label class = 'control-label' for = 'triage'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>" +
                                option[i]+"</label>";
                        }
                        inputcheck +="</div>";
                        $('#inputValue').append(inputcheck);

                    }
                    else if(Type=="Radio box")
                    {
                        var inputdrop= "<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>"+
                            "<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;' '></span></div></label>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=Options.split(",");
                        for (var i=0; i<option.length; i++){
                            var check = "";
                            if(Value.includes(option[i])){
                                check = "checked";
                            }
                            inputdrop+= "<label class = 'control-label' for = 'triage'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;"+
                                option[i]+"</label>";
                        }
                        inputdrop +="</div>";
                        $('#inputValue').append(inputdrop);

                    }
                    else if(Type=="file")
                    {
                        inputfile="<div class='form-group Inputvalue'>\n" +
                            "<label class='control-label' for='triage'><div class='required_fie'>"+LabelName+"<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'' ></span></div></label>\n" +
                            "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                            "</div>";
                        $('#inputValue').append(inputfile);

                    }
                    else if(Type=="Text area")
                    {
                        var inputtext="<div class='form-group Inputvalue'>\n" +
                            "<label class='control-label' for='triage'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>\n" +
                            "<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                             "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                            "</div>";
                        $('#inputValue').append(inputtext);
                    }
                    else if(Type=="HiddenText")
            		{
            		var template_check=""; 
                    var inputtext="<div class='form-group Inputvalue' id ='"+ColumnName+"_Row' style ='display:none';>\n" +
                        "<label class='control-label' for='triage'><div "+manadatory+">"+LabelName+"</div><div class ='edit deletealert'></div></label>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#inputValue').append(inputtext);
            		}
            	}
            	
            	else
            	{
            		var indexValue = value;
            	  var index_no = indexValue.split(",");
            	  for(var i=0;i<index_no.length;i++)
            		  {
            	        console.log("index",index_no);
            	        $("#"+index_no[i]+"_Row").remove();
            	        //$(".Inputvalue").eq(index_no[i]-1).remove();
            		  }
            	}
            	index++;
        	});
           }
           else if(PageIndex == 1)
            {
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
 
        	}
           }
           
        	var script="<script>$('.datepicker1').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "autoclose: true\n"+
            "});<\/script>";
        //$('#scripttag').html("");
        $('#scripttag').append(script);
        for(var i = 0; i<$(".inputValue").length;i++)
    	{
    	  var exist = $(".Inputvalue").eq(i).find("input").length;
    	  if($(".inputValue").eq(i).find("input").length)
    	 {
    		var name = $(".Inputvalue").eq(i).find("input").attr("name");
    		 if(name.startsWith("TriageAddInfo"))
    		 {
    			 $(".inputValue").eq(i).find("input").attr("name","TriageAddInfo"+(i+1));
    		 }
         } 
    	else if($(".Inputvalue").eq(i).find("select").length)
         {
    		var name = $(".Inputvalue").eq(i).find("select").attr("name");
   		   if(name.startsWith("TriageAddInfo"))
   		   {
   			 $(".inputValue").eq(i).find("select").attr("name","TriageAddInfo"+(i+1));
   		   }
    	 }
    		
    	}
        
        	$("#triage_temp_close_id").click();
        	$(".submitDisable").attr("disabled", false);
        },
        error: function (e) {
            console.log(e);
        }
    });
} 
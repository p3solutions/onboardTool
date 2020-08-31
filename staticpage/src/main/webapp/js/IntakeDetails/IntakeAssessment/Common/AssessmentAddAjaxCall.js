$('#AssessAddSubmit').click(function() {	    	
	        var labelname = $('#AssessLabel').val();
	        var AssessmentSection = $("#AssessSection").val();
	       // var columnname = $('#idname').val();
	        var type = $('#AssessTypes').val();
	        var mandatory = $('#AssessMandatory').val();
	        var num = 1;
	        var options = "";
	        if (type == "Check box") {
	            num = $('#AssessCheckNumber').val();
	            var length = $('.AssessCheckClass').length;
	            for (var i = 1; i <= length; i++) {
	                var checklabel = $('#AssessCLabel' + i).val();
	                options += checklabel + ",";
	            }
	        } else if (type == "Radio box") {
	            num = $('#AssessRadioNumber').val();
	            var length = $('.AssessRadioClass').length;
	            for (var i = 1; i <= length; i++) {
	                var radiolabel = $('#AssessRLabel' + i).val();
	                options += radiolabel + ",";
	            }

	        } else if (type == "Dropdown") {
	            num = $('#AssessDropNumber').val();
	            var length = $('.AssessDropClass').length;
	            for (var i = 1; i <= length; i++) {
	                var drplabel = $('#AssessDLabel' + i).val();
	                options += drplabel + ",";
	            }

	        }
	      if(labelname != '' && type !='' && mandatory !=''&& AssessmentSection!='')
	      {
	    	  var checkNotify = true;
	        $.ajax({
	            url: "IntakeAssessmentAddFeatureServlet",
	            type: 'POST',
	            async:false,
	            data: {LabelName:labelname,Type:type,Mandatory:mandatory,Number:num,Options:options,Section:AssessmentSection},
	            dataType: "json",
	            success: function (data) {
	                var required = "";
	                console.log("data add---->",data);
	                var Section = data.section;
	                var InputFieldNameKV = []; 
	                InputFieldNameKV["ApplicationInformation"]= "inputFieldsAppInfo";
	                InputFieldNameKV["DataCharacteristics"]= "inputFieldsDataChar";
	                InputFieldNameKV["ComplianceCharacteristics"]="inputFieldsComplianceChar";
	                InputFieldNameKV["ArchivalConsumption"]="inputFieldsArchivConsump";
	                InputFieldNameKV["ContractInformation"]= "inputFieldsContInfo";
	                var InputFieldName =InputFieldNameKV[Section];
	                var num=data.Seq_Num;
	               // console.log("lentgth")
	                var required_field = "";
	                var delete_icon = "<span class='glyphicon glyphicon-trash deletepopupAssessment hidedeleteAssessment "+Section+"_Delete' style='float:right;display:none;' ></span>";
	                if (data.Mandatory == "Yes"){
	                    required_field = "class = 'required_fie'";
	                    delete_icon="<div class='deletepopupAssessment "+Section+"_Delete' style='display:none;'></div>";
	                }
	                if (data.LabelDuplicateCheck == true)
	                {
	                	checkNotify = false;
	                	notification("warning","Label name is already exist.","Warning");
	                    //alert("Label name is already exist.");
	                }
	                else if(data.Type=="Text box")
	               {
	                    var inputtext="<div class='form-group InputFieldAssessment "+Section+"'>"+
	                        "<label class='control-label' for='Assessment'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>"+
	                        "<input type='text' class='form-control' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
	                        "</div>";
	                    
	                    $('#'+InputFieldName).append(inputtext);
	                }
	                else if(data.Type=="Datepicker")
	                {
	                    var inputdate="<div class='form-group InputFieldAssessment "+Section+"'>"+
	                        "<label class='control-label' for= 'Assessment'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>"+
	                        "<input type='text' class='form-control datepicker1' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
	                        "</div>";
	                    $('#'+InputFieldName).append(inputdate);
	                    var script="<script>$('.datepicker1').datepicker({\n" +
	                        "format: \"mm/dd/yyyy\",\n" +
	                        "autoclose: true\n" +
	                        "});<\/script>";
	                    $('#scripttag').append(script);
	                }
	                else if(data.Type=="Radio box")
	                {
	                    var input="";
	                    input+= "<div class='form-group InputFieldAssessment "+Section+"'>"+
	                        "<label class='control-label' for= 'Assessment'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for (var i=0; i<option.length; i++){

	                        input+= "<label class = 'control-label' for = 'Assessment'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+data.ColumnName+num+"'/>&nbsp;&nbsp;"+
	                            option[i]+"</label>";

	                    }
	                    input +="</div>";
	                    $('#'+InputFieldName).append(input);
	                }
	                else if(data.Type=="Check box")
	                {
	                    var input="";
	                    input+= "<div class='form-group InputFieldAssessment "+Section+"'>"+
	                        "<label class='control-label' for= 'Assessment'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for (var i=0; i<option.length; i++) {

	                        input += "<label class = 'control-label' for = 'Assessment'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='" + data.ColumnName+num+"'/>&nbsp;&nbsp;" +
	                            option[i] + "</label>";
	                    }
	                    input +="</div>";
	                    $('#'+InputFieldName).append(input);
	                }
	                else if(data.Type=="Dropdown")
	                {
	                    var select="";
	                    select+= "<div class='form-group InputFieldAssessment "+Section+"'><label class='control-label' for= 'Assessment'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupAssessment hidepencilAssessment "+Section+"_Edit' style='float:right;display:none;'></span></div></label>"+
	                        "<select style = 'width:100%;' name = "+data.ColumnName+num+">";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for(var i=0;i<option.length;i++) {
	                        select += "<option label=" + option[i] + " class='control-label' for= 'Assessment' >" + option[i] + "</option>";
	                    }
	                    select +="</select></div>";
	                    $('#'+InputFieldName).append(select);
	                }
	                $('#AssessLabel').val("");
	                $('#AssessTypes').val("Text box");
	                $(".AssessHideField").hide();
	                $("#AssessCheckNumber").val("");
	                $("#AssessRadioNumber").val("");
	                $("#AssessDropNumber").val("");
	                $("#AssessMandatory").val("Yes");
	                $("#AssessSection").val("ApplicationInformation");
	                
	              
	             
	              if(checkNotify){
	            	  notification("success","Field is added successfully to " +Section+".","Note");
	            	  $("#AssessAddCloseId").click();
	              }
	              else
	            	  notification("error","Field not added to " +Section+".","Error");
	              
	            },
	        
	       
	            error: function (e) {
	                console.log(e);
	            }
	        });
	      }
	      
	      else{
	    	  notification("warning","Please fill the value in fields.","Warning");
	        	//alert("Please fill the value in fields");
	        	
	        }
	        });

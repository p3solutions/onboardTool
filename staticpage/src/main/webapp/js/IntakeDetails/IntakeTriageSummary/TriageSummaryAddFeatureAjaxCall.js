$('#TriSummSubmit').click(function() {
	    	
	        var labelname = $('#TriSummLabel').val();
	       // var columnname = $('#idname').val();
	        var type = $('#TriSummTypes').val();
	        var mandatory = $('#TriSummMandatory').val();
	        var num = 1;
	        var options = "";
	        if (type == "Check box") {
	            num = $('#TriSummNumber').val();
	            var length = $('.TriSummCheckClass').length;
	            for (var i = 1; i <= length; i++) {
	                var checklabel = $('#TriSummCLabel' + i).val();
	                options += checklabel + ",";
	            }
	        } else if (type == "Radio box") {
	            num = $('#TriSummRadioNbr').val();
	            var length = $('.TriSummRadioClass').length;
	            for (var i = 1; i <= length; i++) {
	                var radiolabel = $('#TriSummRLabel' + i).val();
	                options += radiolabel + ",";
	            }

	        } else if (type == "Dropdown") {
	            num = $('#TriSummDropNbr').val();
	            var length = $('.TriSummDropClass').length;
	            for (var i = 1; i <= length; i++) {
	                var drplabel = $('#TriSummDLabel' + i).val();
	                options += drplabel + ",";
	            }

	        }
	      if(labelname != '' && type !='' && mandatory !='')
	      {
	    	  var checkNotify = true;
	        $.ajax({
	            url: "IntakeTriageSummaryAddFeatureServlet",
	            type: 'POST',
	            async:false,
	            data: {LabelName:labelname,Type:type,Mandatory:mandatory,Number:num,Options:options},
	            dataType: "json",
	            success: function (data) {
	                var required = "";
	                console.log("data add---->",data);
	                var num=data.Seq_Num;
	               // console.log("lentgth")
	                var required_field = "";
	                var delete_icon = "<span class='glyphicon glyphicon-trash deletepopupSummary hidedeleteSummary' style='float:right;display:none;' ></span>";
	                if (data.Mandatory == "Yes"){
	                    required_field = "class = 'required_fie'";
	                    delete_icon="<div class='deletepopupSummary' style='display:none;'></div>";
	                }
	                if (data.LabelDuplicateCheck == "true")
	                {
	                	checkNotify = false;
	                	notification("warning","Label name is already exist.","Warning");
	                    //alert("Label name is already exist.");
	                }
	                else if(data.Type=="Text box")
	               {
	                    var inputtext="<div class='form-group InputFieldSummary'>"+
	                        "<label class='control-label' for='TriageSummary'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>"+
	                        "<input type='text' class='form-control' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
	                        "</div>";
	                    
	                    $('#inputFieldsSummary').append(inputtext);
	                }
	                else if(data.Type=="Datepicker")
	                {
	                    var inputdate="<div class='form-group InputFieldSummary'>"+
	                        "<label class='control-label' for= 'TriageSummary'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>"+
	                        "<input type='text' class='form-control datepicker1' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
	                        "</div>";
	                    $('#inputFieldsSummary').append(inputdate);
	                    var script="<script>$('.datepicker1').datepicker({\n" +
	                        "format: \"mm/dd/yyyy\",\n" +
	                        "autoclose: true\n" +
	                        "});<\/script>";
	                    $('#scripttag').append(script);
	                }
	                else if(data.Type=="Radio box")
	                {
	                    var input="";
	                    input+= "<div class='form-group InputFieldSummary'>"+
	                        "<label class='control-label' for= 'TriageSummary'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for (var i=0; i<option.length; i++){

	                        input+= "<label class = 'control-label' for = 'TriageSummary'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+data.ColumnName+num+"'/>&nbsp;&nbsp;"+
	                            option[i]+"</label>";

	                    }
	                    input +="</div>";
	                    $('#inputFieldsSummary').append(input);
	                }
	                else if(data.Type=="Check box")
	                {
	                    var input="";
	                    input+= "<div class='form-group InputFieldSummary'>"+
	                        "<label class='control-label' for= 'TriageSummary'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for (var i=0; i<option.length; i++) {

	                        input += "<label class = 'control-label' for = 'TriageSummary'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='" + data.ColumnName+num+"'/>&nbsp;&nbsp;" +
	                            option[i] + "</label>";
	                    }
	                    input +="</div>";
	                    $('#inputFieldsSummary').append(input);
	                }
	                else if(data.Type=="Dropdown")
	                {
	                    var select="";
	                    select+= "<div class='form-group InputFieldSummary'><label class='control-label' for= 'TriageSummary'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopupSummary hidepencilSummary' style='float:right;display:none;'></span></div></label>"+
	                        "<select style = 'width:100%;' name = "+data.ColumnName+num+">";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for(var i=0;i<option.length;i++) {
	                        select += "<option label=" + option[i] + " class='control-label' for= 'TriageSummary' >" + option[i] + "</option>";
	                    }
	                    select +="</select></div>";
	                    $('#inputFieldsSummary').append(select);
	                }
	                $('#TriSummLabel').val("");
	                $('#TriSummTypes').val("Text box");
	                $(".hidefield").hide();
	                $("#TriSummNumber").val("");
	                $("#TriSummRadioNbr").val("");
	                $("#TriSummDropNbr").val("");
	                $("#TriSummMandatory").val("Yes");
	                
	              $("#TriageSummAddCloseId").click();
	             
	              if(checkNotify)
	            	  notification("success","Field is added successfully to Triage Summary.","Note");
	              else
	            	  notification("error","Field not added to Triage Summary.","Error");
	              
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

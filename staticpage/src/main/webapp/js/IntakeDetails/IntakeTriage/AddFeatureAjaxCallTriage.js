$('#submitTriage').click(function() {
	    	var projname = "";
	    	var appname = $('#appName').val();
	        var labelname = $('#Triagelabel').val();
	        //var columnname = $('#idname').val();
	        var type = $('#Triagetypes').val();
	        var mandatory = $('#Triagemandatory').val();
	        var num = 1;
	        var options = "";
	        if (type == "Check box") {
	            num = $('#TriageNumber').val();
	            var length = $('.TriageCheckClass').length;
	            for (var i = 1; i <= length; i++) {
	                var checklabel = $('#TriageCheckBoxLabel' + i).val();
	                options += checklabel + ",";
	            }
	        } else if (type == "Radio box") {
	            num = $('#TriageRadioNumber').val();
	            var length = $('.TriageRadioClass').length;
	            for (var i = 1; i <= length; i++) {
	                var radiolabel = $('#TriageRadioLabel' + i).val();
	                options += radiolabel + ",";
	            }

	        } else if (type == "Dropdown") {
	            num = $('#TriageDropNumber').val();
	            var length = $('.TriageDropClass').length;
	            for (var i = 1; i <= length; i++) {
	                var drplabel = $('#TriageDrodownpLabel' + i).val();
	                options += drplabel + ",";
	            }

	        }
	      if(labelname != '' && type !='' && mandatory !='')
	      {
	    	  var checkNotify = true;
	        $.ajax({
	            url: "IntakeTriageAddServlet",
	            type: 'POST',
	            data: {ApplicationName:appname,ProjectName: projname,LabelName:labelname,Type:type,Mandatory:mandatory,Number:num,Options:options},
	            dataType: "json",
	            success: function (data) {
	                var required = "";
	                console.log("data add---->",data);
	                var num=data.Seq_Num;
	               // console.log("lentgth")
	                var required_field = "";
	                var delete_icon = "<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span>";
	                if (data.Mandatory == "Yes"){
	                    required_field = "class = 'required_fie'";
	                    delete_icon="<div class='deletealert' style='display:none;'></div>";
	                }
	                if (data.LabelDuplicateCheck == "true")
	                {
	                	checkNotify = false;
	                	notification("warning","Label name is already exist.","Warning");
	                   // alert("Label name is already exist.");
	                }
	                else if(data.ColumnDuplicateCheck == "true")
	                	{
	                	checkNotify = false;
	                	notification("warning","Column name is already exist.","Warning");
	                	//alert("Column name is already exist.");
	                	}
	                else if(data.Type=="Text box")
	               {
	                    var inputtext="<div class='form-group Inputvalue' id = '"+data.ColumnName+"_Row'>"+
	                        "<label class='control-label' for='triage'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>"+
	                        "<input type='text' class='form-control' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
	                        "</div>";
	                    
	                    $('#inputValue').append(inputtext);
	                }
	                else if(data.Type=="Datepicker")
	                {
	                    var inputdate="<div class='form-group Inputvalue' id = '"+data.ColumnName+"_Row'>"+
	                        "<label class='control-label' for= 'triage'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>"+
	                        "<input type='text' class='form-control datepicker1' id='"+data.LabelName+"' placeholder='"+data.LabelName+"' name='"+data.ColumnName+num+"'/>"+
	                        "</div>";
	                    $('#inputValue').append(inputdate);
	                    var script="<script>$('.datepicker1').datepicker({\n" +
	                        "format: \"mm/dd/yyyy\",\n" +
	                        "autoclose: true\n" +
	                        "});<\/script>";
	                    $('#scripttag').append(script);
	                }
	                else if(data.Type=="Radio box")
	                {
	                    var input="";
	                    input+= "<div class='form-group Inputvalue' id = '"+data.ColumnName+"_Row'>"+
	                        "<label class='control-label' for= 'triage'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for (var i=0; i<option.length; i++){

	                        input+= "<label class = 'control-label' for = 'triage'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+data.ColumnName+num+"'/>&nbsp;&nbsp;"+
	                            option[i]+"</label>";

	                    }
	                    input +="</div>";
	                    $('#inputValue').append(input);
	                }
	                else if(data.Type=="Check box")
	                {
	                    var input="";
	                    input+= "<div class='form-group Inputvalue' id = '"+data.ColumnName+"_Row'>"+
	                        "<label class='control-label' for= 'triage'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for (var i=0; i<option.length; i++) {

	                        input += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='" + data.ColumnName+num+"'/>&nbsp;&nbsp;" +
	                            option[i] + "</label>";
	                    }
	                    input +="</div>";
	                    $('#inputValue').append(input);
	                }
	                else if(data.Type=="Dropdown")
	                {
	                    var select="";
	                    select+= "<div class='form-group Inputvalue' id = '"+data.ColumnName+"_Row'><label class='control-label' for= 'triage'><div "+required_field+">"+data.LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>"+
	                        "<select style = 'width:100%;' name = "+data.ColumnName+num+">";
	                    var Options=data.Options;
	                    var sub_option = Options.substring(0, Options.length - 1);
	                    var option=sub_option.split(",");
	                    for(var i=0;i<option.length;i++) {
	                        select += "<option label=" + option[i] + " class='control-label' for= 'triage' >" + option[i] + "</option>";
	                    }
	                    select +="</select></div>";
	                    $('#inputValue').append(select);
	                }
	                $('#Triagelabel').val("");
	                $('#Triagetypes').val("Text box");
	                $(".TriageHideField").hide();
	                $("#TriageNumber").val("");
	                $("#TriageRadioNumber").val("");
	                $("#TriageDropNumber").val("");
	                $("#Triagemandatory").val("Yes");
	              $("#add_Triage_close_id").click();
	             
	              
	              if(checkNotify)
	            	  notification("success","Field is added successfully to Triage.","Note");
	              else
	            	  notification("error","Field not added to Triage.","Error");
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

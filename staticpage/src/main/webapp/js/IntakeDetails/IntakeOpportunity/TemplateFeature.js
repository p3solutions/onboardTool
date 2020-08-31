function validateForm(){
	$(".submitDisable").attr("disabled", true);
	$(".hidepencil").hide();
	$(".hidedelete").hide();
	var selected_seq = [];
	var selected_index = "";
	console.log("class total length"+$(".Template_Field").length);
	$(".Template_Field").each(function(i) {
		   if (this.checked) {
		       //alert("Checkbox at index " + i + " is checked.");
		       selected_seq.push(""+(i+1)+"");
		       selected_index += (i+1)+",";
		   }
		});
	selected_index = selected_index.substring(0,selected_index.length-1)
	$.ajax({
        url: "IntakeDetailsOpportunityAddTemplateFields",
        type: 'POST',
        data : {Selected_Index:selected_index},
        dataType: "json",
        success: function (data) {
        	console.log("data add template ; ",data);
        	if (!$.isArray(data)) {
        		data = [data];
                
            }
        	var index = 0;
        	$.each(data, function(key, value)
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
                    var delete_edit_icon="<div class='editpopup deletepopup' style='display:none;'></div>";
                    //var options=AddTemplateData[i].options.split(',');
                    if(value.Mandatory=="No")
                    {
                        manadatory="";
                        disable_property = "";
                        delete_edit_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>";
                    }
                    if(Type=="Text box")
                    {
                        var inputtext="<div class='form-group InputField' id ='"+ColumnName+"_Row'>\n" +
                            "<label class='control-label' for='opportunity'><div "+manadatory+">"+LabelName+delete_edit_icon+"</div></label>\n" +
                            "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                            "</div>";
                        if(!$('#'+ColumnName).length){
                        $('#inputFields').append(inputtext);
                         }
                        }
                    else if(Type=="Datepicker")
                    {
                        var inputdate="<div class='form-group InputField' id = '"+ColumnName+"_Row'>" +
                            "<label class='control-label' for= 'opportunity'><div "+manadatory+">"+LabelName+delete_edit_icon+"</div></label>\n" +
                            "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                            "</div>";
                        if(!$('#'+ColumnName).length){
                        $('#inputFields').append(inputdate);
                        }
                    }
                    else if(Type=="Dropdown")
                    {
                        var inputdrop= "<div class='form-group InputField' id = '"+ColumnName+"_Row'><label class='control-label' for= 'opportunity'><div "+manadatory+">"+LabelName+delete_edit_icon+"</div></label>"+
                            "<select style = 'width:100%;' class ='form-control' id = '"+ColumnName+"' name='"+ColumnName+"'>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=sub_option.split(",");
                        for(var i=0;i<option.length;i++) {
                            var select = "";
                            if(Value.includes(option[i])){
                             select = "selected";
                            }
                            inputdrop += "<option label=" + option[i] + " class='control-label' for= 'opportunity' "+select+">" + option[i] + "</option>";
                        }
                        inputdrop +="</select></div>";
                        if(!$('#'+ColumnName).length){
                        $('#inputFields').append(inputdrop);
                        }
                      }
                    else if(Type=="Check box")
                    {
                        var inputcheck= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
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
                            inputcheck += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>" +
                                option[i]+"</label>";
                        }
                        inputcheck +="</div>";
                        $('#inputFields').append(inputcheck);

                    }
                    else if(Type=="Radio box")
                    {
                        var inputdrop= "<div class='form-group'>"+
                            "<label class='control-label' for= 'formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;'  onclick=''></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;' '></span></div></label>";
                        var Options=value.options;
                        var sub_option = Options.substring(0, Options.length - 1);
                        var option=Options.split(",");
                        for (var i=0; i<option.length; i++){
                            var check = "";
                            if(Value.includes(option[i])){
                                check = "checked";
                            }
                            inputdrop+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>"+
                                option[i]+"</label>";
                        }
                        inputdrop +="</div>";
                        $('#inputFields').append(inputdrop);

                    }
                    else if(Type=="file")
                    {
                        inputfile="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div class='required_fie'>"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
                            "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                            "</div>";
                        $('#inputFields').append(inputfile);

                    }
                    else if(Type=="Text area")
                    {
                        var inputtext="<div class='form-group'>\n" +
                            "<label class='control-label' for='formInput198'><div "+manadatory+">"+LabelName+"<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                            "<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                             "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                            "</div>";
                        $('#inputFields').append(inputtext);
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
            	        //$(".InputField").eq(index_no[i]-1).remove();
            		  }
            	}
            	index++;
        	});
        	var script="<script>$('.datepicker1').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "autoclose: true\n"+
            "});<\/script>";
        //$('#scripttag').html("");
        $('#scripttag').append(script);
        for(var i = 0; i<$(".InputField").length;i++)
    	{
    	  var exist = $(".InputField").eq(i).find("input").length;
    	  if($(".InputField").eq(i).find("input").length)
    	 {
    		var name = $(".InputField").eq(i).find("input").attr("name");
    		 if(name.startsWith("OpportunityAddInfo"))
    		 {
    			 $(".InputField").eq(i).find("input").attr("name","OpportunityAddInfo"+(i+1));
    		 }
         } 
    	else if($(".InputField").eq(i).find("select").length)
         {
    		var name = $(".InputField").eq(i).find("select").attr("name");
   		   if(name.startsWith("OpportunityAddInfo"))
   		   {
   			 $(".InputField").eq(i).find("select").attr("name","OpportunityAddInfo"+(i+1));
   		   }
    	 }
    		
    	}
        
        	$("#temp_close_id").click();
        	$(".submitDisable").attr("disabled", false);
        },
        error: function (e) {
            console.log(e);
        }
    });
}
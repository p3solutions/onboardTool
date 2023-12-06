//var Id="D3S592T30BPGT"; // Define a variable outside the click event handler

  
$(document).on('click', '.editpopup', function() {
    $('#editpopup_btn').click();
    var currentRow = $(this).closest("tr");
    var Id = currentRow.find("td:eq(15)").text(); // Store the Id value
    sessionStorage.setItem('storedId', Id);
    console.log("the id value",Id);
    window.location.href = 'FinanceUpdate.jsp';
});
 $(document).on('click', '.deletepopup', function () {
    $('#deletepopup_btn').click();
   
    var currentRow=$(this).closest("tr");
    var Id=currentRow.find("td:eq(15)").text();
    $('#Id').val(Id);
    console.log("The value of Function",Id)
    $('#DeletePopUp').on('shown.bs.modal', function () {
    });
    });

$(document).ready(function(){
	var Id = sessionStorage.getItem('storedId');
	console.log("The value of Function",Id)
    $.ajax({
        url: "TableDetailEditServlet",
        type: 'POST',
        data: { Id: Id },
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve json array----->",data);
            console.log("Data Retrieve json array----->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            var template_fields=['ProjectNumber',];
            $.each(data, function(key, value){
             
                var manadatory="class='required_fie'";
              
                var Type=value.Type;
                var ColumnName=value.ColumnName;
                var LabelName=value.LabelName;
             
                var delete_icon="<div class='deletepopup' style='display:none;'></div>";
               // var delete_edit_icon="<div class='editpopup deletepopup' style='display:none;'></div>";
             
               $("#appName").prop("disabled", true);
                $("#Status").prop("disabled", true);
            $("#Phase").prop("disabled", true);
                             $("#ProjectNumber").prop("disabled", true);
   
                var Value=value.Value;
               
            	 if(value.Mandatory=="Yes" && value.UMandatory=="Yes")
                {
				  
                   delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
                    //delete_edit_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>";
                }
                //var options=data[i].options.split(',');
                if(value.Mandatory=="No")
                {
                    manadatory="";
                    disable_property = "";
                    delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
                    //delete_edit_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>";
                }
                if(template_fields.includes(ColumnName))
                {
                	
                	$("input[name='"+ColumnName+"_temp']").prop("checked",true);
                	
                }
               
                     
            	
                if(Type=="Text box")
                {
                	var template_check=""; 
                    var inputtext="<div class='form-group InputField' id ='"+ColumnName+"_Row'>\n" +
                        "<label class='control-label' for='opportunity'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#FinanceInput1').append(inputtext);
                  }
                else if(Type=="Datepicker")
                {
                	var template_check=""; 
                	
                    var inputdate="<div class='form-group InputField' id='"+ColumnName+"_Row'>" +
                        "<label class='control-label' for='opportunity'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>\n" +
                        "<input type='text' onchange='dateChangeFunction(this.value)' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                        "</div>";
                    $('#FinanceInput1').append(inputdate);
                    }
                else if(Type=="Dropdown")
                {
                	var template_check=""; 
                    var inputdrop= "<div class='form-group InputField' id = '"+ColumnName+"_Row'><label class='control-label' for='opportunity'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>"+
                        "<select style = 'width:100%;' class ='form-select mb-3' id='"+ColumnName+"'name='"+ColumnName+"'>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length);
                    var option=sub_option.split(",");
                    for(var i=0;i<option.length;i++) {
                        var select = "";
                        if(Value.includes(option[i])){
                         select = "selected";
                        }
                        inputdrop += "<option label='" + option[i] + "' class='control-label' for= 'opportunity' "+select+">" + option[i] + "</option>";
                    }
                    inputdrop +="</select></div>";
                    $('#FinanceInput1').append(inputdrop);
                }
                else if(Type=="Check box")
                {
                    var inputcheck= "<div class='form-group InputField'  id = '"+ColumnName+"_Row'>"+
                        "<label class='control-label' for='formInput198'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span><br/>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=Options.split(",");
                    var value_arr=Value.split(",");
                    for (var i=0; i<option.length; i++) {
                        var check = "";
                        var br = (option.length==option.length-1)?"":"<br/>";
                        var option_element=option[i];
                        if(value_arr.includes(option_element)){
                            check = "checked";
                        }
                        inputcheck += "<label class = 'control-label' for = 'opportunity'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;" +
                            option[i]+"</label>"+br;
                    }
                    inputcheck +="</div>";
                    $('#FinanceInput1').append(inputcheck);

                }
                else if(Type=="Radio box")
                {
                    var inputdrop= "<div class='form-group InputField' id = '"+ColumnName+"_Row'>"+
                        "<label class='control-label' for='formInput198'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span><br/>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=Options.split(",");
                    for (var i=0; i<option.length; i++){
                        var check = "";
                        var br = (option.length==option.length-1)?"":"<br/>";
                        if(Value.includes(option[i])){
                            check = "checked";
                        }
                        inputdrop+= "<label class = 'control-label' for = 'opportunity'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;"+
                            option[i]+"</label>"+br;
                    }
                    inputdrop +="</div>";
                    $('#FinanceInput1').append(inputdrop);

                }
                else if(Type=="file")
                {
                    inputfile="<div class='form-group InputField' id = '"+ColumnName+"_Row'>\n" +
                        "<label class='control-label' for='opportunity'><div class='required_fie'>"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
                        "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                        "</div>";
                    $('#FinanceInput1').append(inputfile);

                }
               else  if ( Type == "TextAreaFile") {
    var inputHtml = "<div class='form-group'>\n" +
        "<label class='control-label' for='" + ColumnName + "'><div " + manadatory + ">" + LabelName + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n";
    inputHtml += "<input type='file' name='" + ColumnName + "_file' accept='image/*' id='choosen_file_name' multiple>\n";
  
  /*      inputHtml += "<textarea class='form-control' name='" + ColumnName + "_text' id='" + ColumnName + "'>" + Value + "</textarea>\n" +
            "<input type='file' name='" + ColumnName + "_file' accept='image/*' id='choosen_file_name'>\n"; */
                
                    inputHtml += "</div>";
    
    $('#FinanceInput1').append(inputHtml);
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
    
    
  
});

function dateChangeFunction(val) {
	if (!val.match('^((0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)?[0-9]{2})*$')) {
		notification("warning", "Date field should be in mm/dd/yyyy format", "Note:");
	}
}
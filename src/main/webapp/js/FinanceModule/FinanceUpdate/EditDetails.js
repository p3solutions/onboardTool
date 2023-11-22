

var Id="D3SKH2H7T8HK7"; // Define a variable outside the click event handler

$(document).on('click', '.editpopup', function() {
    $('#editpopup_btn').click();
    var currentRow = $(this).closest("tr");
    var Id = currentRow.find("td:eq(13)").text(); // Store the Id value
    console.log("the id value",Id);
    window.location.href = 'FinanceUpdate.jsp';
});

// Now you can use the 'editPopupId' variable elsewhere in your code
// for example, when the user clicks on 'editpopup_btn'



$(document).ready(function(){
	console.log("The value of Function",Id)
    $.ajax({
        url: "EditTableDetailServlet",
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
                /*console.log("FULL NAME " + value.Type);*/
                var manadatory="class='required_fie'";
                var disable_property = "disabled='disabled'";
                var seq_num =value.seq_num;
                var Type=value.Type;
                var ColumnName=value.ColumnName;
                var LabelName=value.LabelName;
                var CheckTemplateField =false;
                var delete_icon="<div class='deletepopup' style='display:none;'></div>";
               // var delete_edit_icon="<div class='editpopup deletepopup' style='display:none;'></div>";
                var Value=value.Value;
                if(LabelName=="APM ID")
            	{
                	$("#Record_No").val(Value);
            	}
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
                else if(Type=="TextAreaFile")
                {
                    var inputtext="<div class='form-group'>\n" +
                        "<label class='control-label' for='formInput198'>"+LabelName+"<span "+manadatory+"></span></label>"+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div>\n" +
                        /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                         "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                        "</div>";
                    $('#FinanceInput1').append(inputtext);
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

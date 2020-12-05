$(document).ready(function(){
    $.ajax({
        url: "archiveLegacyAppDataRetrieve",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve json array----->",data);
            AddTemplateData = data;
            if (!$.isArray(data)) {
                data = [data];
                AddTemplateData=[data];
            }
           var dependencyValue="";
            $.each(data, function(key, value){
                /*console.log("FULL NAME " + value.Type);*/
            	var manadatory="class='required_fie LabelName'";
                var disable_property = "disabled='disabled'";
                var seq_num =value.seq_num;
                var Type=value.Type;
                var ColumnName=value.ColumnName;
                var LabelName=value.LabelName;
                var delete_icon="<div class='deletepopup' style='display:none;'></div>";
                var Value=value.Value;
                if(ColumnName=="thirdpartyvendor" || ColumnName == "listcountry")
            	{
                	dependencyValue = Value;
                	if(Value=="Internally Developed")
                		Value="Internal";
            	}
                //var options=data[i].options.split(',');
                if(value.mandatory=="No")
                {
                	manadatory="class = 'LabelName'";
                    disable_property = "";
                    delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
                }
                if(Type=="Text box")
                { 
                	
                    var inputtext="<div class='form-group InputField' id ='"+ColumnName+"_Row'>\n" +
                        "<label class='control-label' for='archiveLegacy'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputtext);
                    
             
                }
                else if(Type=="Datepicker")
                {
                	
                    var inputdate="<div class='form-group InputField' id='"+ColumnName+"_Row'>" +
                        "<label class='control-label' for= 'archiveLegacy'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputdate);
                    
                		
                   
                }
                else if(Type=="Dropdown")
                {
                	var template_check=""; 
                	
                    var inputdrop= "<div class='form-group InputField' id = '"+ColumnName+"_Row'><label class='control-label' for= 'archiveLegacy'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>"+
                        "<select style = 'width:100%;' class ='form-control' id='"+ColumnName+"'name='"+ColumnName+"'>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=sub_option.split(",");
                    for(var i=0;i<option.length;i++) {
                        var select = "";
                        if(Value.includes(option[i])){
                         select = "selected";
                        }
                        inputdrop += "<option label='"+ option[i] + "' class='control-label' for= 'archiveLegacy' "+select+">" + option[i] + "</option>";
                    }
                    inputdrop +="</select></div>";
                    $('#inputFieldsAppInfo').append(inputdrop);
                   }
                else if(Type=="Check box")
                {
                    var inputcheck= "<div class='form-group InputField'>"+
                        "<label class='control-label' for= 'archiveLegacy'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>";
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
                        inputcheck += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;" +
                            option[i]+"</label>";
                    }
                    inputcheck +="</div>";
                    $('#inputFieldsAppInfo').append(inputcheck);

                }
                else if(Type=="Radio box")
                {
                    var inputdrop= "<div class='form-group InputField'>"+
                        "<label class='control-label' for= 'archiveLegacy'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;' '></span></div></label>";
                    var Options=value.options;
                    var sub_option = Options.substring(0, Options.length - 1);
                    var option=Options.split(",");
                    for (var i=0; i<option.length; i++){
                        var check = "";
                        if(Value.includes(option[i])){
                            check = "checked";
                        }
                        inputdrop+= "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id="+option[i]+(i+1)+"' placeholder ='"+option[i]+"' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;"+
                            option[i]+"</label>";
                    }
                    inputdrop +="</div>";
                    $('#inputFieldsAppInfo').append(inputdrop);

                }
                else if(Type=="file")
                {
                    inputfile="<div class='form-group InputField'>\n" +
                        "<label class='control-label' for='archiveLegacy'><div class='required_fie'>"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
                        "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputfile);

                }
                else if(Type=="Text area")
                {
                    var inputtext="<div class='form-group InputField'>\n" +
                        "<label class='control-label' for='archiveLegacy'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                        /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                         "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                        "</div>";
                    $('#inputFieldsAppInfo').append(inputtext);
                }
                else if(Type=="HiddenText")
                {
                	var style = (dependencyValue=="Internally Developed" || dependencyValue=="Yes")?"style='display:block;'":"style='display:none;'";
                	dependencyValue = ""; 
                	var inputtext="<div class='form-group InputField hiddenText1' id ='"+ColumnName+"_Row' "+style+">\n" +
                     "<label class='control-label' for='archiveLegacy'><div "+manadatory+">"+LabelName+"<div class='deletepopup' style='display:none;'></div><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div></label>\n" +
                     "<input type='text' class='form-control hiddenText' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                     "</div>";
                 $('#inputFieldsAppInfo').append(inputtext);
                }

            });
            
            /*var script="<script>$('.datepicker1').datepicker({\n" +
                "format: \"mm/dd/yyyy\",\n"+
                "autoclose: true\n"+
                "});<\/script>";*/
            
            var script="<script>$('.datepicker1').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "clearBtn:true,"+
            "autoclose: true,\n"+
            "orientation: 'bottom',"+
            "});<\/script>";
            
            $('#scripttag').append(script);
        },
        error: function (e) {
            console.log(e);
        }
    });
    $(document).on('click', '.editpopup', function () {
    	$('#editpopup_btn').click();
    var seqnum=$(this).index('.editpopup');
    var prevLabel = $('.LabelName').eq(seqnum).html().split('<')[0];
    $("#LegacyLabelModify").val(prevLabel);
    //alert('seq_num in js file '+seqnum);
    $('#LegacySeqNum').val(seqnum);
    
    //alert('seq num field in js file'+$('#LegacySeqNum').val());
    
    });
//$('.deletepopup').click(function() {
$(document).on('click', '.deletepopup', function () {
     $('#deletepopup_btn').click();
    var seqnum=$(this).index('.deletepopup');
    $('#LegacyDeleteSeq').val(seqnum);
    

});
$(document).on('change','#thirdpartyvendor',function()
{
	if($(this).val()=="Internal")
		$("#locationcenter_Row").show();
	else
		$("#locationcenter_Row").hide();
});

$(document).on('change','input[name = dataloclaw]',function()
		{
			if($(this).val()=="Yes")
				$("#listcountry_Row").show();
			else
				$("#listcountry_Row").hide();
		});

});
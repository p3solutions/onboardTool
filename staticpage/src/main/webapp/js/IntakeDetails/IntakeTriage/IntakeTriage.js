$(document).ready(function(){
    $.ajax({
        url: "IntakeTriageDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve json array----->",data);
           // console.log("Data Retrieve json array----->",data);
            if (!$.isArray(data)) {
                data = [data];
            }
            var DepedentColumnName =['vendor','describe','plsdescribe','pls_describe'];
            var checkVisibility= false;
            var template_values=['appId','appName','appDesc','appOwner','busOwner','devOwner','billing_Code','biling_Segment','busUnit','segment_contact','logic_Grp','Preliminary_CBA','funding_Avl','prgFunder','PrjInfo','Decom_date','infrastructure_impact','nmbr_of_infrastructure_components','archival_Sol','Status','decomAnalyst','rationalization_type','If other_please describe','appPlatfrm','If Other_please describe ','app_and_data_hosted','vendor','compliance','describe','Financialdate','plsdescribe','TechincalDeterminingdate','pls_describe','useforArchival','highlevelapplicationdata','ideaNmbr','DemandNmbr','PrjNmbr','PrjctTaskNmbr','Bigrock','DenialRsn'];
            var YesNoDependencyColumnName =['rationalization_type','appPlatfrm','app_and_data_hosted','compliance','Financialdate','TechincalDeterminingdate'];
            $.each(data, function(key, value){
                /*console.log("FULL NAME " + value.Type);*/
                var manadatory="class='required_fie'";
                var disable_property = "disabled='disabled'";
                var seq_num =value.seq_num;
                var Type=value.Type;
                var ColumnName=value.ColumnName;
                var LabelName=value.LabelName;
                var CheckTemplateField =false;
                var delete_icon="<div class='deletealert' style='display:none;'></div>";
               // var delete_edit_icon="<div class='edit deletealert' style='display:none;'></div>";
                var Value=value.Value;
                if(LabelName=="APM ID")
            	{
                	$("#Record_No").val(Value);
            	}
                //var options=data[i].options.split(',');
                if(value.Mandatory=="No")
                {
                    manadatory="";
                    disable_property = "";
                    delete_icon = "<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span>";
                    //delete_edit_icon = "<span class='glyphicon glyphicon-trash deletealert hidedel' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span>";
                }
                /*if(template_values.includes(ColumnName))
                {
                	
                	$("input[name='"+ColumnName+"_temp']").prop("checked",true);
                	
                }*/
                
               if(YesNoDependencyColumnName.includes(ColumnName))
            	{
            	     if(Value=="Other"||Value=="Others"||Value=="Yes")
            	    	 checkVisibility= true; 
            	}
                     
            	if(value.checkexsistent==true)
            		{
            	if(Type=="Text box")
                {
                	var template_check=""; 
                    var inputtext="<div class='form-group Inputvalue' id ='"+ColumnName+"_Row'>\n" +
                        "<label class='control-label' for='triage'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#inputValue').append(inputtext);
                  }
                else if(Type=="Datepicker")
                {
                	var template_check=""; 
                	
                    var inputdate="<div class='form-group Inputvalue' id='"+ColumnName+"_Row'>" +
                        "<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>\n" +
                        "<input type='text' Class='form-control datepicker1' id='"+ColumnName+"' placeholder='mm/dd/yyyy' name='"+ColumnName+"' value='"+Value+"'/>" +
                        "</div>";
                    $('#inputValue').append(inputdate);
                    }
                else if(Type=="Dropdown")
                {
                	var template_check=""; 
                    var inputdrop= "<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'><label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>"+
                        "<select style = 'width:100%;' class ='form-control' id='"+ColumnName+"'name='"+ColumnName+"'>";
                    var Options=value.options;
                    //var sub_option = Options.substring(0, Options.length);
                    var option=Options.split(",");
                    for(var i=0;i<option.length;i++) {
                        var select = "";
                        if(Value.includes(option[i])){
                         select = "selected";
                        }
                        inputdrop += "<option label=" + option[i] + " class='control-label' for= 'triage' "+select+">" + option[i] + "</option>";
                    }
                    inputdrop +="</select></div>";
                    $('#inputValue').append(inputdrop);
                }
                else if(Type=="Check box")
                {
                    var inputcheck= "<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>"+
                        "<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>";
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
                        inputcheck += "<label class = 'control-label' for = 'triage'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '"+option[i]+"' name='"+ColumnName+"' "+check+"/>&nbsp;&nbsp;" +
                            option[i]+"</label>";
                    }
                    inputcheck +="</div>";
                    $('#inputValue').append(inputcheck);

                }
                else if(Type=="Radio box")
                {
                    var inputdrop= "<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>"+
                        "<label class='control-label' for= 'triage'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>";
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
                    inputfile="<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>\n" +
                        "<label class='control-label' for='triage'><div class='required_fie'>"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'' ></span></div></label>\n" +
                        "<input type='file' name='"+ColumnName+"' accept='image/!*' id ='choosen_file_name'>\n" +
                        "</div>";
                    $('#inputValue').append(inputfile);

                }
                else if(Type=="Text area")
                {
                    var inputtext="<div class='form-group Inputvalue' id = '"+ColumnName+"_Row'>\n" +
                        "<label class='control-label' for='triage'><div "+manadatory+">"+LabelName+delete_icon+"<span class='glyphicon glyphicon-pencil edit hidepen' style='float:right;display:none;'></span></div></label>\n" +
                        /*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
                         "<textarea class='form-control' name='"+ColumnName+"' id='"+ColumnName+"'>"+Value+"</textarea>"+
                        "</div>";
                    $('#inputValue').append(inputtext);
                }
            	else if(Type=="HiddenText")
            		{
            		var visibility = checkVisibility?"style ='display:block';":"style ='display:none';";
                    var inputtext="<div class='form-group Inputvalue' id ='"+ColumnName+"_Row' "+visibility+">\n" +
                        "<label class='control-label' for='triage'><div "+manadatory+">"+LabelName+"</div><div class='edit deletealert'></div></label>\n" +
                        "<input type='text' class='form-control' size='35' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +
                        "</div>";
                    $('#inputValue').append(inputtext);
                    checkVisibility= false;
            		}
            	if(!DepedentColumnName.includes(ColumnName))
            		$("#"+ColumnName+"_temp").prop( "checked", true );
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
    $(document).on('click', '.edit', function () {
    	$('#editpopup_btn1').click();
    var seqnum=$(this).index('.edit');
    console.log($('.Inputvalue').eq(seqnum).find('.required_fie').length);
    $('.Inputvalue').eq(seqnum).find('.required_fie').length;
    if($('.Inputvalue').eq(seqnum).find('label:first .required_fie').length)
    {
    	$("#TriageEditMandatory option[value='No']").remove();
    }
   else
    {
    	$("#TriageEditMandatory option[value='No']").remove();
    	$("#TriageEditMandatory").append("<option value='No'>No</option>");	
    }
    	//alert('seq_num in js file '+seqnum);
    $('#TriageEditSeqNum').val(seqnum);
    //alert('seq num field in js file'+$('#seq_num').val());
   /* $('#edit').on('shown.bs.modal', function () {
    });*/
    });
//$('.deletealert').click(function() 
$(document).on('click', '.deletealert', function () {
     $('#deletepopup_btn1').click();
    var seqnum=$(this).index('.deletealert');
    $('#sequenceTriageDelete').val(seqnum);
   /* $('#DeleteTriagePopUp').on('shown.bs.modal', function () {
    });*/
});
$(document).on('change', '#rationalization_type', function () {
    if($(this).val()=="Other")
	$("#If_other_please_describe_Row").show();
    else
    $("#If_other_please_describe_Row").hide();
});
$(document).on('change', '#appPlatfrm', function () {
    if($(this).val()=="Others")
	$("#If_Other_describe_Row").show();
    else
    $("#If_Other_describe_Row").hide();
});
$(document).on('change', 'input[name=app_and_data_hosted]', function () {
    if($(this).val()=="Yes")
	$("#vendor_Row").show();
    else
    $("#vendor_Row").hide();
});
$(document).on('change', 'input[name=compliance]', function () {
    if($(this).val()=="Yes")
	$("#describe_Row").show();
    else
    $("#describe_Row").hide();
});
$(document).on('change', 'input[name=Financialdate]', function () {
    if($(this).val()=="Yes")
	$("#plsdescribe_Row").show();
    else
    $("#plsdescribe_Row").hide();
});
$(document).on('change', 'input[name=TechincalDeterminingdate]', function () {
    if($(this).val()=="Yes")
	$("#pls_describe_Row").show();
    else
    $("#pls_describe_Row").hide();
});
});
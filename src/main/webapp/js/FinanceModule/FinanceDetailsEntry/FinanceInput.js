$(function() {
	$("#creation_date").datepicker();
 
});
 
var AddTemplateData;
$(document).ready(function() {
	$.ajax({
		url: "FinanceDataRetrivalServlet",
		type: 'POST',
		dataType: "json",
		success: function(data) {
			console.log("Data Retrieve json array----->", data);
			AddTemplateData = data;
			console.log("AddTemplateData", AddTemplateData);
			if (!$.isArray(data)) {
				data = [data];
				AddTemplateData = [data];
				console.log("Data Retrieve json array----->", data);
			}
 
			$.each(data, function(key, value) {
 
				var manadatory = "class='required_fie'";
				var disable_property = "disabled='disabled'";
				var seq_num = value.seq_num;
				var Type = value.Type;
				var ColumnName = value.ColumnName;
				var LabelName = value.LabelName;
				var delete_icon = "<div class='deletepopup' style='display:none;'></div>";
				var Value = value.Value;
				if (value.Mandatory == "No") {
					manadatory = "";
					disable_property = "";
					delete_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span>";
				}
				if (Type == "Text box"){
					var template_check = "";
					if (seq_num <= 16) {
						var inputtext = "<div class='form-group InputField' id ='" + ColumnName + "_Row'>\n" +
							"<label class='control-label' for='opportunity'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>\n";
 var formatter = new Intl.NumberFormat('en-US', {
								
							});
							
 if (ColumnName == 'License Cost') {
    console.log("I am into it");
    var inputtext = "<div class='form-group InputField' id='" + ColumnName + "_Row'>\n" +
        "<label class='control-label' for='opportunity'>" + LabelName +
        "<span " + manadatory + "></span>" +
        "<span class='info-icon' title='It is software and licensing part of CBA.' style='margin-left: 5px;'>&#9432;</span></label>" +
        delete_icon +
        "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>\n" +
        "</div>";
        "<input type='text' class='form-control' size='35' id='" + ColumnName + "' placeholder='' name='" + ColumnName +  "' onkeypress='return isNumber(event)'" +
								"</div>";

}if (ColumnName == 'Phase') {
    console.log("I am into it");
    var inputtext = "<div class='form-group InputField' id='" + ColumnName + "_Row'>\n" +
        "<label class='control-label' for='opportunity'>" + LabelName +
        "<span " + manadatory + "></span>" +
        "<span class='info-icon' title='Phase gets populated once assigned application is assigned to a phase in governance module.' style='margin-left: 5px;'>&#9432;</span></label>" +
        delete_icon +
        "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>\n" +
        "</div>";

}
						
						if (ColumnName == 'InfraCost' || ColumnName == 'Avoidance_Cost' || ColumnName == 'Archive_Cost' || ColumnName == 'CBA') {
 	
							
							
							inputtext = "<div class='form-group InputField' id ='" + ColumnName + "_Row'>\n" +
								"<label class='control-label' for='opportunity'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>\n" +
								"<input type='text' class='form-control' size='35' id='" + ColumnName + "' placeholder='' name='" + ColumnName + "' value='" + Value + "' onkeypress='return isNumber(event)'" +
								"</div>";
						}  
else { 
	console.log("The name is mine");
							inputtext += "<input type='text' class='form-control' size='35' id='" + ColumnName + "' placeholder='' name='" + ColumnName + "' value='" + Value + "'/>\n";
						}
 
						inputtext += "</div>";
						$('#FinanceInput').append(inputtext);
						template_check = "checked";
					}
 
					var TemplateField = "<div class='row'>" +
						"<div class='col-md-1'>" +
						"<input type='checkbox' id='" + ColumnName + "_temp' name='" + ColumnName + "_temp' class = 'Template_Field' value='' " + disable_property + " " + template_check + ">" +
						"</div>" +
						"<div class='col-md-2'>" +
						"<label class='control-label' for='opportunity'>" + LabelName + "</label>" +
						"</div>" +
						"<div class='col-md-6'>" +
						"<input type='text' class='form-control' size='35' id='" + ColumnName + "_temp1'  name='" + ColumnName + "'>" +
						"</div>" +
						"</div></br>";
					$('#TemplateFields').append(TemplateField);
				}
 
				else if (Type == "Datepicker") {
					var template_check = "";
					if (seq_num <= 16) {
						var inputdate = "<div class='form-group InputField' id='" + ColumnName + "_Row'>" +
							"<label class='control-label' for='opportunity'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>\n" +
							"<input type='text' onchange='dateChangeFunction(this.value)' Class='form-control datepicker1' id='" + ColumnName + "' placeholder='mm/dd/yyyy' name='" + ColumnName + "' value='" + Value + "'/>" +
							"</div>";
						$('#FinanceInput').append(inputdate);
						template_check = "checked";
					}
					var TemplateField = "<div class='row'>" +
						"<div class='col-md-1'>" +
						"<input type='checkbox' id='" + ColumnName + "_temp' name='" + ColumnName + "_temp' class = 'Template_Field' value='' " + disable_property + " " + template_check + ">" +
						"</div>" +
						"<div class='col-md-2'>" +
						"<label class='control-label' for='opportunity'>" + LabelName + "</label>" +
						"</div>" +
						"<div class='col-md-6'>" +
						"<input type='text' class='form-control datepicker1' size='35' id='" + ColumnName + "_temp1'  placeholder='mm/dd/yyyy' name='" + ColumnName + "'>" +
						"</div>" +
						"</div></br>";
					$('#TemplateFields').append(TemplateField);
				}
				else if (Type == "Dropdown") {
					var template_check = "";
					if (seq_num <= 16) {
						var inputdrop = "<div class='form-group InputField' id = '" + ColumnName + "_Row'><label class='control-label' for='opportunity'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>" +
							"<select style = 'width:100%;' class ='form-select mb-3' id='" + ColumnName + "'name='" + ColumnName + "'>";
						var Options = value.options;
						var sub_option = Options.substring(0, Options.length);
						var option = sub_option.split(",");
						for (var i = 0; i < option.length; i++) {
							var select = "";
							if (Value !== "") {
								if (Value.includes(option[i])) {
									select = "selected";
								}
							}
							if (option[i] !== "") {
								inputdrop += "<option label=" + option[i] + " class='control-label' for= 'triage' " + select + ">" + option[i] + "</option>";
							}
							else {
								inputdrop += "<option label=''class='control-label' for= 'triage' " + select + ">" + option[i] + "</option>";
							}
						}
						inputdrop += "</select></div>";
						$('#FinanceInput').append(inputdrop);
						template_check = "checked";
					}
					var TemplateField = "<div class='row'>" +
						"<div class='col-md-1'>" +
						"<input type='checkbox' id='" + ColumnName + "_temp' name='" + ColumnName + "' class = 'Template_Field' value='' " + disable_property + " " + template_check + ">" +
						"</div>" +
						"<div class='col-md-2'>" +
						"<label class='control-label' for='opportunity'>" + LabelName + "</label>" +
						"</div>" +
						"<div class='col-md-6'>" +
						"<select style = 'width:100%;' class ='form-select' id ='" + ColumnName + "_temp1' name='" + ColumnName + "_temp'>";
					var Options1 = value.options;
					var sub_option1 = Options1.substring(0, Options1.length - 1);
					var option1 = sub_option1.split(",");
					for (var i = 0; i < option1.length; i++) {
						var select1 = "";
						if (Value !== "") {
							if (Value.includes(option1[i])) {
								select1 = "selected";
							}
						}
						if (option1[i] !== "") {
							TemplateField += "<option label=" + option1[i] + " class='control-label' for= 'opportunity' " + select1 + ">" + option1[i] + "</option>";
						}
						else {
							TemplateField += "<option label=''class='control-label' for= 'triage' " + select1 + ">" + option1[i] + "</option>";
						}
					}
					TemplateField += "</select>" +
						"</div>" +
						"</div></br>";
					$('#TemplateFields').append(TemplateField);
				}
				else if (Type == "Check box") {
					var inputcheck = "<div class='form-group'>" +
						"<label class='control-label' for='formInput198'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span><br/>";
					var Options = value.options;
					var sub_option = Options.substring(0, Options.length - 1);
					var option = Options.split(",");
					var value_arr = Value.split(",");
					for (var i = 0; i < option.length; i++) {
						var check = "";
						var option_element = option[i];
						if (value_arr.includes(option_element)) {
							check = "checked";
						}
						inputcheck += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '" + option[i] + "' name='" + ColumnName + "' " + check + "/>&nbsp;&nbsp;" +
							option[i] + "</label><br/>";
					}
					inputcheck += "</div>";
					$('#FinanceInput').append(inputcheck);
 
				}
				else if (Type == "Radio box") {
					var inputdrop = "<div class='form-group'>" +
						"<label class='control-label' for='formInput198'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span><br/>";
					var Options = value.options;
					var sub_option = Options.substring(0, Options.length - 1);
					var option = Options.split(",");
					for (var i = 0; i < option.length; i++) {
						var check = "";
						if (Value.includes(option[i])) {
							check = "checked";
						}
						inputdrop += "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '" + option[i] + "' name='" + ColumnName + "' " + check + "/>&nbsp;&nbsp;" +
							option[i] + "</label><br/>";
					}
					inputdrop += "</div>";
					$('#FinanceInput').append(inputdrop);
 
				}
 
				else if (Type == "TextAreaFile") {
					var inputHtml = "<div class='form-group'>\n" +
						"<label class='control-label' for='" + ColumnName + "'><div " + manadatory + ">" + LabelName + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
						"<div class='container fileClass'>\n" +
						"<div class='fileClass'>\n" +
						"<label for='upload'>\n" +
						"<input type='file' id='financefileUpload' multiple></label>\n" +
						"</div>\n" +
						"<div class='financefiles fileClass'>\n" +
						"<h6>\n" +
						"<b>Files Selected</b>\n" +
						"</h6>\n" +
						"<ul id='FinanceFileList'></ul>\n" +
						"</div>\n" +
						"</div>\n" +
						"</div>";
					console.log("inputHtml", inputHtml);
					$('#FinanceInput').append(inputHtml);
					$("#financefileUpload").change(function(e) {
						let files = $("#financefileUpload")[0].files;
						let filesArr = Array.from(files);
						console.log("fileUpload");
						updateState({ files: files, filesArr: filesArr });
						renderFileList();
					});
					$(".financefiles").on("click", "li > i", function(e) {
						console.log("files");
						let key = $(this)
							.parent()
							.attr("key");
						let curArr = state.filesArr;
						curArr.splice(key, 1);
						updateState({ filesArr: curArr });
						renderFileList();
					});
					$("#financefileUpload").change(function(e) {
						let files = $("#financefileUpload")[0].files;
						let filesArr = Array.from(files);
						console.log("fileUpload");
						updateState({ files: files, filesArr: filesArr });
						renderFileList();
					});
 
 
					$(document).on("#FinanceUploadFiles", function(e) {
						e.preventDefault();
						console.log(state);
						renderFileList();
					});
				}
 
 
				else if (Type == "file") {
 
					inputfile = "<div class='form-group'>\n" +
						"<label class='control-label' for='formInput198'><div class='required_fie'>" + LabelName + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
						"<input type='file' name='" + ColumnName + "' accept='image/!*' id ='choosen_file_name'>\n" +
						"</div>";
					$('#FinanceInput').append(inputfile);
 
				}
				else if (Type == "Text area") {
					var inputtext = "<div class='form-group'>\n" +
						"<label class='control-label' for='formInput198'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_icon + "<span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span></div>\n" +
						/*"<input type='text' class='form-control' id='"+ColumnName+"' placeholder='' name='"+ColumnName+"' value='"+Value+"'/>\n" +*/
						"<textarea class='form-control' name='" + ColumnName + "' id='" + ColumnName + "'>" + Value + "</textarea>" +
						"</div>";
					$('#inputFields').append(inputtext);
				}
 
			});
			var script = "<script>$('.datepicker1').datepicker({\n" +
				"format: \"mm/dd/yyyy\",\n" +
				"autoclose: true\n" +
				"});<\/script>";
 
			$('#scripttag').append(script);
			var styleRight = ".editpopup{float:right}";
			$("<style>").text(".editpopup {float:right; }").appendTo("head");
		},
		error: function(e) {
			console.log(e);
		}
	});
	let state = {};
 
	function updateState(newState) {
		state = { ...state, ...newState };
		console.log(state);
	}
 
	function renderFileList() {
		console.log("render");
		let fileMap = state.filesArr.map((file, index) => {
			let suffix = "bytes";
			let size = file.size;
			if (size >= 1024 && size < 1024000) {
				suffix = "KB";
				size = Math.round(size / 1024 * 100) / 100;
			} else if (size >= 1024000) {
				suffix = "MB";
				size = Math.round(size / 1024000 * 100) / 100;
			}
 
			return `<li key='${index}'>${file.name} </li>`;
		});
		$("#FinanceFileList").html(fileMap);
	}
	$(document).on('click', '.editpopup', function() {
		$('#editpopup_btn').click();
		var seqnum = $(this).index('.editpopup');
		//alert('seq_num in js file '+seqnum);
		$('#seq_num').val(seqnum);
		//alert('seq num field in js file'+$('#seq_num').val());
		$('#EditPopUp').on('shown.bs.modal', function() {
		});
	});
	//$('.deletepopup').click(function() {
	$(document).on('click', '.deletepopup', function() {
		$('#deletepopup_btn').click();
		var seqnum = $(this).index('.deletepopup');
		$('#sequence1').val(seqnum);
		$('#DeletePopUp').on('shown.bs.modal', function() {
		});
 
	});
 
});
function validateForm(e) {
 
	var umandatory = "";
	var templateMandatory = $('#templmandatory').val();
	if (templateMandatory == "Yes")
		umandatory = "Yes";
	if (templateMandatory == "No")
		umandatory = "No";
 
	$(".submitDisable").attr("disabled", true);
	$(this).prop('disabled', true);
	$(".hidepencil").hide();
	$(".hidedelete").hide();
	var selected_seq = [];
	var selected_index = "";
	console.log("class total length" + $(".Template_Field").length);
	$(".Template_Field").each(function(i) {
		if (this.checked) {
			//alert("Checkbox at index " + i + " is checked.");
			selected_seq.push("" + (i + 1) + "");
			selected_index += (i + 1) + ",";
		}
	});
	selected_index = selected_index.substring(0, selected_index.length - 1)
	$.ajax({
		url: "Finance",
		type: 'POST',
		data: { Selected_Index: selected_index, templateMandatory: templateMandatory, umandatory: umandatory },
		dataType: "json",
		success: function(data) {
			console.log("data add template ; ", data);
			if (!$.isArray(data)) {
				data = [data];
 
			}
			var index = 0;
			$.each(data, function(key, value) {
				if (index != 0) {
					console.log("FULL NAME " + value.Type);
					var manadatory = "class='required_fie'";
					var disable_property = "disabled='disabled'";
					var Type = value.Type;
					var ColumnName = value.ColumnName;
					var LabelName = value.LabelName;
					var Value = value.Value;
					var delete_edit_icon = "<div class='editpopup deletepopup' style='display:none;'></div>";
					//var options=AddTemplateData[i].options.split(',');
					if (value.Mandatory == "Yes" && value.UMandatory == "Yes") {
						delete_edit_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>";
					}
					if (value.Mandatory == "No") {
						manadatory = "";
						disable_property = "";
						delete_edit_icon = "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>";
					}
					if (Type == "Text box") {
						var inputtext = "<div class='form-group InputField' id ='" + ColumnName + "_Row'>\n" +
							"<label class='control-label' for='opportunity'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_edit_icon + "\n" +
							"<input type='text' class='form-control' size='35' id='" + ColumnName + "' placeholder='' name='" + ColumnName + "' value='" + Value + "'/>\n" +
							"</div>";
						if (!$('#' + ColumnName).length) {
							$('#inputFields').append(inputtext);
						}
					}
					else if (Type == "Datepicker") {
						var inputdate = "<div class='form-group InputField' id='" + ColumnName + "_Row'>" +
							"<label class='control-label' for='opportunity'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_edit_icon + "\n" +
							"<input type='text' Class='form-control datepicker1' id='" + ColumnName + "' placeholder='mm/dd/yyyy' name='" + ColumnName + "' value='" + Value + "'/>" +
							"</div>";
						if (!$('#' + ColumnName).length) {
							$('#inputFields').append(inputdate);
						}
					}
					else if (Type == "Dropdown") {
						var inputdrop = "<div class='form-group InputField' id = '" + ColumnName + "_Row'><label class='control-label' for='opportunity'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_edit_icon + "" +
							"<select style = 'width:100%;' class ='form-select mb-3' id='" + ColumnName + "'name='" + ColumnName + "'>";
						var Options = value.options;
						var sub_option = Options.substring(0, Options.length - 1);
						var option = sub_option.split(",");
						for (var i = 0; i < option.length; i++) {
							var select = "";
							if (Value !== "") {
								if (Value.includes(option[i])) {
									select = "selected";
								}
							}
							if (option[i] !== "") {
								inputdrop += "<option label=" + option[i] + " class='control-label' for= 'opportunity' " + select + ">" + option[i] + "</option>";
							}
							else {
								inputdrop += "<option label=''class='control-label' for= 'triage' " + select + ">" + option[i] + "</option>";
							}
 
						}
						inputdrop += "</select></div>";
						if (!$('#' + ColumnName).length) {
							$('#FinanceInput').append(inputdrop);
						}
					}
					else if (Type == "Check box") {
						var inputcheck = "<div class='form-group'>" +
							"<label class='control-label' for='formInput198'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_edit_icon + "<br/>";
						var Options = value.options;
						var sub_option = Options.substring(0, Options.length - 1);
						var option = Options.split(",");
						var value_arr = Value.split(",");
						for (var i = 0; i < option.length; i++) {
							var check = "";
							var option_element = option[i];
							if (value_arr.includes(option_element)) {
								check = "checked";
							}
							inputcheck += "<label class = 'control-label' for = 'fromInput198'><input type='checkbox' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '" + option[i] + "' name='" + ColumnName + "' " + check + "/>" +
								option[i] + "</label><br/>";
						}
						inputcheck += "</div>";
						$('#FinanceInput').append(inputcheck);
 
					}
					else if (Type == "Radio box") {
						var inputdrop = "<div class='form-group'>" +
							"<label class='control-label' for='formInput198'>" + LabelName + "<span " + manadatory + "></span></label>" + delete_edit_icon + "<br/>";
						var Options = value.options;
						var sub_option = Options.substring(0, Options.length - 1);
						var option = Options.split(",");
						for (var i = 0; i < option.length; i++) {
							var check = "";
							if (Value.includes(option[i])) {
								check = "checked";
							}
							inputdrop += "<label class = 'control-label' for = 'fromInput198'><input type='radio' class = 'form-comtrol' id=" + option[i] + (i + 1) + "' placeholder ='" + option[i] + "' value = '" + option[i] + "' name='" + ColumnName + "' " + check + "/>" +
								option[i] + "</label><br/>";
						}
						inputdrop += "</div>";
						$('#FinanceInput').append(inputdrop);
 
					}
					else if (Type == "file") {
						inputfile = "<div class='form-group'>\n" +
							"<label class='control-label' for='formInput198'><div class='required_fie'>" + LabelName + "<span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'' ></span></div></label>\n" +
							"<input type='file' name='" + ColumnName + "' accept='image/!*' id ='choosen_file_name'>\n" +
							"</div>";
						$('#FinanceInput').append(inputfile);
 
					}
					else if (Type == "Text area") {
						var inputtext = "<div class='form-group'>\n" +
							"<label class='control-label' for='formInput198'>" + LabelName + "<span " + manadatory + "></span></label><span class='glyphicon glyphicon-trash deletepopup hidedelete' style='float:right;display:none;' ></span><span class='glyphicon glyphicon-pencil editpopup hidepencil' style='float:right;display:none;'></span>\n" +
							"<input type='text' class='form-control' id='" + ColumnName + "' placeholder='' name='" + ColumnName + "' value='" + Value + "'/>\n" +
							"<textarea class='form-control' name='" + ColumnName + "' id='" + ColumnName + "'>" + Value + "</textarea>" +
							"</div>";
						$('#FinanceInput').append(inputtext);
					}
 
				}
				else {
					var indexValue = value;
					var index_no = indexValue.split(",");
					for (var i = 0; i < index_no.length; i++) {
						console.log("index", index_no);
						$("#" + index_no[i] + "_Row").remove();
						//$(".InputField").eq(index_no[i]-1).remove();
					}
				}
				index++;
			});
			var script = "<script>$('.datepicker1').datepicker({\n" +
				"format: \"mm/dd/yyyy\",\n" +
				"autoclose: true\n" +
				"});<\/script>";
			//$('#scripttag').html("");
			$('#scripttag').append(script);
 
 
			for (var i = 0; i < $(".InputField").length; i++) {
				var exist = $(".InputField").eq(i).find("input").length;
				if ($(".InputField").eq(i).find("input").length) {
					var name = $(".InputField").eq(i).find("input").attr("name");
					if (name.startsWith("OpportunityAddInfo")) {
						$(".InputField").eq(i).find("input").attr("name", "OpportunityAddInfo" + (i + 1));
					}
				}
				else if ($(".InputField").eq(i).find("select").length) {
					var name = $(".InputField").eq(i).find("select").attr("name");
					if (name.startsWith("OpportunityAddInfo")) {
						$(".InputField").eq(i).find("select").attr("name", "OpportunityAddInfo" + (i + 1));
					}
				}
 
			}
			$("#temp_close_id").click();
			$(".submitDisable").attr("disabled", false);
			notification("success", "Template fields are reflected.", "Note");
		},
		error: function(e) {
			console.log(e);
		}
	});
}
 
function dateChangeFunction(val) {
	if (!val.match('^((0?[1-9]|1[012])[- /.](0?[1-9]|[12][0-9]|3[01])[- /.](19|20)?[0-9]{2})*$')) {
		notification("warning", "Date field should be in mm/dd/yyyy format", "Note:");
	}
}
function isNumber(evt) {
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode
	if (charCode != 46 && charCode > 31
&& (charCode < 48 || charCode > 57))
		return false;
 
	return true;
}
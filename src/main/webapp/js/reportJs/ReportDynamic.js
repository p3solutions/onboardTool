
$(document).ready(function() {
	$("#ExitSearch").hide();
	var selectedOption = "intakeReport1";
	var currentReport = "intakeReport1";
	var isSearching = false;
	var currentPage = 1;
	var tempcolumnName;
	var tempOperators;
	var tempsearchValue1;
	var tempsearchValue2;
	var tempyesnofiled;
	var temptype;

	fetchColumn();
	ajaxcall(currentReport, 1);
	$("#cd-header").text("Intake Report 1");

	$("#Report").change(function() {
		currentReport = $(this).val();
	});
	$("#resetButton").click(function() {
		SearchResetForm();
	});
	// default max row
	$('#maxRows').on('change', function() {
		if (isSearching) {
			var maxRow = $(this).val();
			currentPage = 1;
			reportAdvanceSearchData(currentReport, tempcolumnName, tempOperators, tempsearchValue1, tempsearchValue2, tempyesnofiled, maxRow, currentPage,temptype);
		} else {
			$("#ExitSearch").hide();
			currentPage = 1;
			ajaxcall(currentReport, currentPage);
		}
	});

	// Event listener for pagination click
	$('.pagination').on('click', 'li', function() {
		var pageNum = $(this).attr('data-page');
		if (pageNum === 'prev' || pageNum === 'next') {
			currentPage = (pageNum === 'prev') ? currentPage - 1 : currentPage + 1;
		} else {
			currentPage = parseInt(pageNum);
		}

		if (isSearching) {
			reportAdvanceSearchData(currentReport, tempcolumnName, tempOperators, tempsearchValue1, tempsearchValue2, tempyesnofiled, $('#maxRows').val(), currentPage,temptype);
		} else {
			$("#ExitSearch").hide();
			ajaxcall(currentReport, currentPage);
		}

	});

	function clearTable() {
		$("#admin_userslist").empty();
	}

	$("#Report").change(function() {
		$("#ExitSearch").hide();
		// filterIcon.hide();
		selectedOption = $(this).val();
		var reportTitle;

		// Update currentReport variable
		currentReport = selectedOption;

		// To show the name in the jsp report name
		if (selectedOption === "intakeReport1") {
			reportTitle = "Intake Report 1";
		} else if (selectedOption === "intakeReport2") {
			reportTitle = "Intake Report 2";
		} else if (selectedOption === "intakeReport3") {
			reportTitle = "Requirements"
		} else {
			reportTitle = "Report"
		}
		$("#cd-header").text(reportTitle);
		clearTable();
		ajaxcall(selectedOption, 1);
	});

	$("#submitSearch").on("click", function() {
		$("#ExitSearch").show();
		validateForm();
		//currentReport =  $("#Report").val();

		// Get the selected values from the first dropdown, second dropdown, and input field
		//selectedColumn = $("#SearchOptions").val();
		//secondSelectedColumn = $("#SecondSearchOptions").val(); // Add this line
		//searchValue = $("#advanceSearch").val();
		//condition = $('input[name="condition"]:checked').val();

		//reportAdvanceSearchData(currentReport,selectedColumns,searchValue,condition,$('#maxRows').val(),1)
	});

	function ajaxcall(selectedOption, page) {
		console.log('Fetching data for page:', page);
		var maxRows = parseInt($('#maxRows').val());

		$.ajax({
			url: "ReportServlet",
			type: 'POST',
			data: { selectedOption: selectedOption, page: page, maxRows: maxRows },
			dataType: "json",
			beforeSend: function() {
				$('#overlay').show();
			},
			success: function(data) {
				$('#overlay').hide();
				fetchColumn();

				console.log("Data retrieved:", data);

				if (data.length <= 0) {
					console.log("data Less :", data.length);
					var Nodata = '<div style="text-align: center; font-weight: bold;">No Record Found</div>';
					$("#admin_userslist").html(Nodata);
				} else {
					if (data.error) {
						// Handle the error
						$("#admin_userslist").html("Error: " + data.error);
					} else {
						clearTable();
						RecordAppendRowFunction(data.data);
						updatePaginationReport(data.total, page);
					}
				}
			},
		});
	}

	function updatePaginationReport(totalRecords, currentPage) {
		var maxRows = parseInt($('#maxRows').val());
		var totalPages = Math.ceil(totalRecords / maxRows);
		var startRecord = (currentPage - 1) * maxRows + 1;
		var endRecord = Math.min(currentPage * maxRows, totalRecords);

		var paginationContainer = $('.pagination');
		paginationContainer.empty();
		if (currentPage > 1) {
			paginationContainer.append('<li data-page="prev"><span> << <span class="sr-only">(current)</span></span></li>');
		}
		for (var i = 1; i <= totalPages; i++) {
			paginationContainer.append(
				'<li data-page="' + i + '">\
            <span>' + i + '</span>\
        </li>'
			);
		}
		if (currentPage < totalPages) {
			paginationContainer.append('<li data-page="next"><span> >> <span class="sr-only">(current)</span></span></li>');
		}

		paginationContainer.find('[data-page="' + currentPage + '"]').addClass('active');

		// Display record information
		var recordInfo = $('#recordInfo');
		recordInfo.html('Showing ' + startRecord + ' to ' + endRecord + ' of ' + totalRecords + ' records');

		limitPagging();
	}

	function limitPagging() {
		if ($('.pagination li').length > 7) {
			if ($('.pagination li.active').attr('data-page') <= 3) {
				$('.pagination li:gt(5)').hide();
				$('.pagination li:lt(5)').show();
				$('.pagination [data-page="next"]').show();
			} if ($('.pagination li.active').attr('data-page') > 3) {
				$('.pagination li:gt(0)').hide();
				$('.pagination [data-page="next"]').show();
				for (let i = (parseInt($('.pagination li.active').attr('data-page')) - 2); i <= (parseInt($('.pagination li.active').attr('data-page')) + 2); i++) {
					$('.pagination [data-page="' + i + '"]').show();

				}

			}
		}
	}

	function RecordAppendRowFunction(data) {
		if (data.length > 0) {
			var headers = Object.keys(data[0]);

			// Add table headers
			var headerRow = "<thead>" + "<tr>";
			$.each(headers, function(index, header) {
				headerRow += "<th style='color: black; background-color: #d7e9f7; font-weight: bold;'>";
				headerRow += header;
				headerRow += "</th>";
			});
			headerRow += "</tr>" + "</thead>";
			$("#admin_userslist").append(headerRow);

			$.each(data, function(key, value) {
				var row = "<tbody>" + "<tr>";
				$.each(headers, function(index, header) {
					// Check if the value is undefined, replace it with an empty string
					var cellValue = value[header] !== undefined ? value[header] : '';
					row += "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for='' style='color: dimgrey;'>" + cellValue + "</label></td>";
				});
				row += "</tr>" + "</tbody>";

				$("#admin_userslist").append(row);
			});

		}
	}

	function reportAdvanceSearchData(currentReport, ColumnName, Operators, SearchValue1, SearchValue2, Yesnofiled, MaxRows, page,type) {
		console.log("Say Hi");
		console.log("SelectedReport:", currentReport);
		console.log("columnName:", ColumnName);
		console.log("Operators:", Operators);
		console.log("searchValue1:", SearchValue1);
		console.log("searchValue2:", SearchValue2);
		console.log("yesnofiled:", Yesnofiled);
		console.log("Page:", page);
		console.log("maxRows:", MaxRows);
		console.log("tyoe :",type);
		$.ajax({
			url: "Report_Advance_Search_Servlet",
			method: 'POST',
			data: JSON.stringify({
				SelectedReport: currentReport || "", // Use an empty string if it's null or undefined
				columnName: ColumnName || "",
				Operators: Operators || "",
				searchValue1: SearchValue1 || "",
				searchValue2: SearchValue2 || "",
				yesnofiled: Yesnofiled || "",
				Page: page || 1, 
				maxRows: MaxRows || 5, 
				Type : type
			}),
			contentType: "application/json",
			dataType: "json",
			beforeSend: function() {
				$('#overlay').show();
			},
			success: function(data) {
				console.log("Search Data :", data);
				$('#overlay').hide();
				isSearching = true;
				if (data.length <= 0) {
					console.log("data Less :", data.length);
					var Nodata = '<div style="text-align: center; font-weight: bold;">No Record Found</div>';
					$("#admin_userslist").html(Nodata);
				}
				else {
					console.log("Search Results", data);
					clearTable();
					RecordAppendRowFunction(data.data);
					updatePaginationReport(data.total, page);
				}
				
			},
		});
	}
	function fetchColumn() {
		$.ajax({
			url: "Report_Search_FieldName",
			method: "POST",
			data: { SelectedReport: currentReport },
			dataType: "json",
			beforeSend: function() {
				$('#overlay').show();
			},
			success: function(data) {
				$('#overlay').hide();
				console.log("Search Results", data);
				populateDropdown(data.data);
			},
		});
	}

	function cleardropdown() {
		var dropdown = $('#SearchOptions');
		dropdown.empty();
		dropdown.append('<option value="Select">--Select--</option>');
	}
	function populateDropdown(columnNames) {
    cleardropdown();
    var dropdown = $('#SearchOptions');

    // Clear existing options
    dropdown.empty();
    dropdown.append('<option value="Select" selected>--Select--</option>');

    // Populate the dropdown with column names, excluding "Application Id Gen"
    for (var i = 0; i < columnNames.length; i++) {
        // Skip "Application Id Gen"
        if (columnNames[i].Field === "Application Id Gen") {
            continue;
        }

        var option = $('<option></option>');
        option.val(columnNames[i].Field);
        option.text(columnNames[i].Field);
        dropdown.append(option);
    }
}

	function SearchResetForm() {
		document.getElementById('SearchOptions').value = 'Select';
		document.getElementById('SearchOperators').value = 'Select';
		document.getElementById('YesNoField').value = 'Select';
		document.getElementById('Searchinput1').value = '';
		document.getElementById('Searchinput2').value = '';
		document.getElementById('SearchOperators').style.display = 'none';
		document.querySelector('label[for="SearchOprerators"]').style.display = 'none';
		document.querySelector('label[for="lable3"]').style.display = 'none';
		document.getElementById('YesNoField').style.display = 'none';
		document.querySelector('label[for="lable1"]').style.display = 'none';
		document.getElementById('Searchinput1').style.display = 'none';
		document.querySelector('label[for="lable2"]').style.display = 'none';
		document.querySelector('label[for="lable4"]').style.display = 'none';
		document.querySelector('label[for="lable5"]').style.display = 'none';
		document.querySelector('label[for="lable6"]').style.display = 'none';
		document.getElementById('Searchinput2').style.display = 'none';
	}




	function validateForm() {
		console.log("ValidateForm");
		const columnName = document.getElementById('SearchOptions').value;
		const Operators = document.getElementById('SearchOperators').value;
		const yesnofiled = document.getElementById('YesNoField').value;
		const searchValue1 = document.getElementById('Searchinput1').value;
		const searchValue2 = document.getElementById('Searchinput2').value;
		var coltype;
		const showError = (message) => {
			notification("warning", message, "Warning:");
			return false;
		};

		const isValid = () => {
			const columnType = getColumnType(columnName);
			
			coltype = columnType;
			if (columnName === 'Select') {
				return showError("Select a column name");
			}
			if (columnName !== 'Select' && columnType === 'text' && searchValue1 === '') {
				return showError("Enter Search Value!");
			}
			if (columnName !== 'Select' && yesnofiled === 'Select' && columnType === 'yesno') {
				return showError("Select Input Value!");
			}
			if (columnName !== 'Select' && Operators === 'Select' && columnType === 'date') {
				return showError("Select Operator!");
			}
			if (columnName !== 'Select' && Operators === 'Select' && columnType === 'number') {
				return showError("Select Operator!");
			}
			if (Operators !== 'Select' && columnType === 'number' && Operators !== 'BETWEEN' && !/^\d+$/.test(searchValue1) && validateInput(searchValue1)) {
				return showError("Enter a Number values");
			}
			if (Operators !== 'Select' && columnType === 'number' && Operators === 'BETWEEN' && !/^\d+$/.test(searchValue1) && !/^\d+$/.test(searchValue2) && searchValue2 === '' && searchValue1 === '') {
				return showError("Enter a Number values in both input fileds ");
			}

			if (Operators !== 'Select' && columnType === 'date' && Operators === 'BETWEEN' && !isValidDate(searchValue1) && !isValidDate(searchValue2)) {
				return showError("Enter a valid date in mm/dd/yyyy format in Both input Fileds");
			}
			if (Operators !== 'Select' && columnType === 'date' && Operators !== 'BETWEEN' && !isValidDate(searchValue1)) {
				return showError("Enter a valid date in mm/dd/yyyy format");
			}
			return true;
		};
		if (isValid()) {
			console.log("Global Report Name : ", currentReport);
			var page = 1;
			tempcolumnName = columnName;
			console.log("tempcolumnName", tempcolumnName);
			tempOperators = Operators;
			console.log("tempOperators", tempOperators);
			tempsearchValue1 = searchValue1;
			console.log("tempsearchValue1 : ", tempsearchValue1);
			tempsearchValue2 = searchValue2;
			console.log("tempsearchValue2 ", tempsearchValue2);
			tempyesnofiled = yesnofiled;
			console.log(tempyesnofiled);
			temptype = coltype;
			console.log("ColumnType",temptype);
			reportAdvanceSearchData(currentReport, columnName, Operators, searchValue1, searchValue2, yesnofiled, 5, page,coltype);
			SearchResetForm();
			closeModal();
			notification("success", "Search successfully.", "Note:");

		}
	}
	function closeModal() {
    var closeButton = document.querySelector('#searchModal .btn-close');
    if (closeButton) {
        closeButton.click();
    }
}
	function isValidDate(dateString) {
		const dateRegex = /^\d{2}\/\d{2}\/\d{4}$/;
		if (!dateRegex.test(dateString)) {
			return false;
		}

		const [month, day, year] = dateString.split('/').map(Number);
		const date = new Date(year, month - 1, day);

		return (
			date.getFullYear() === year &&
			date.getMonth() === month - 1 &&
			date.getDate() === day
		);
	}

});
function isNumber(evt) {
	evt = (evt) ? evt : window.event;
	var charCode = (evt.which) ? evt.which : evt.keyCode
	if (charCode != 46 && charCode > 31
		&& (charCode < 48 || charCode > 57))
		return false;

	return true;
}
function getColumnType(columnName) {
	console.log("Sysout");
	const columnTypeMap = {
		'Creation Date': 'date',
		'Project Decommission Date': 'date',
		'Read Only Date': 'date',
		'Target Date': 'date',
		'Readonly Date': 'date',
		'Read Only Date': 'date',
		'Total Data Size': 'number',
		'Unstructured Data In GB': 'number',
		'Structured Data In GB': 'number',
		'Unstructured Data files': 'number',
		'Structured Data Number of tables': 'number',
		'Database Server Name': 'number',
		'Number of Infrastructure Components': 'number',
		'Preliminary CBA': 'number',
		'Funding Available': 'yesno',
		'Infrastructure Impact': 'yesno',
		'Archival Solution': 'yesno',
		'Big Rock': 'yesno',
		'Funding Available': 'yesno',
		'Encryption': 'yesno',
		'Data Masking': 'yesno',
		'Funding Available': 'yesno',
		'Funding Available': 'yesno'
	};

	const trimmedColumnName = columnName.trim();

	return columnTypeMap[trimmedColumnName] || 'text';
}
function handleColumnChange() {
	var columnSelect = document.getElementById('SearchOptions');
	var operatorLabel = document.querySelector('label[for="SearchOprerators"]');
	var operatorSelect = document.getElementById('SearchOperators');
	var value1Label = document.querySelector('label[for="lable1"]');
	var value1Input = document.getElementById('Searchinput1');
	var value2Label = document.querySelector('label[for="lable2"]');
	var value2Input = document.getElementById('Searchinput2');
	var value3Label = document.querySelector('label[for="lable3"]');
	var value3Input = document.getElementById('YesNoField');
	var value4Label = document.querySelector('label[for="lable4"]');
	var value5Label = document.querySelector('label[for="lable5"]');
	var value6Label = document.querySelector('label[for="lable6"]');

	// Reset values and visibility
	operatorSelect.value = 'Select';
	value1Input.value = '';
	value2Input.value = '';
	value3Input.value = 'Select';
	value1Input.style.display = 'none';
	value2Input.style.display = 'none';
	operatorLabel.style.display = 'none';
	value1Label.style.display = 'none';
	value2Label.style.display = 'none';
	value3Label.style.display = 'none';
	value3Input.style.display = 'none';
	value4Label.style.display = 'none';
	value5Label.style.display = 'none';
	value6Label.style.display = 'none';
	if (columnSelect.value === 'Select') {
		var columnType = getColumnType(columnSelect.value);
		operatorLabel.style.display = 'none';
		operatorSelect.style.display = 'none';
		value1Label.style.display = 'none';
		value1Input.style.display = 'none';
		value2Label.style.display = 'none';
		value2Input.style.display = 'none';
		value3Label.style.display = 'none';
		value3Input.style.display = 'none';
		value4Label.style.display = 'none';
		value5Label.style.display = 'none';
		value6Label.style.display = 'none';
	} else {
		var columnType = getColumnType(columnSelect.value);
		console.log("columnType Hi :", columnType);
		if (columnType === 'date' && operatorSelect !== 'null') {
			operatorLabel.style.display = 'block';
			operatorSelect.style.display = 'block';
			value1Label.style.display = 'none';
			value1Input.style.display = 'none';
			value2Label.style.display = 'none';
			value2Input.style.display = 'none';
			value3Label.style.display = 'none';
			value3Input.style.display = 'none';
			value4Label.style.display = 'none';
			value5Label.style.display = 'none';
			value6Label.style.display = 'none';
		} else if (columnType === 'number' && operatorSelect !== 'null') {
			operatorLabel.style.display = 'block';
			operatorSelect.style.display = 'block';
			value1Label.style.display = 'none';
			value1Input.style.display = 'none';
			value2Label.style.display = 'none';
			value2Input.style.display = 'none';
			value3Label.style.display = 'none';
			value3Input.style.display = 'none';
			value4Label.style.display = 'none';
			value5Label.style.display = 'none';
			value6Label.style.display = 'none';
		} else if (columnType === 'text' && operatorSelect !== 'null') {
			value1Input.setAttribute("type", "text");
			value1Input.setAttribute("placeholder", "Enter Text values");
			operatorLabel.style.display = 'none';
			operatorSelect.style.display = 'none';
			value1Label.style.display = 'block';
			value1Input.style.display = 'block';
			value2Label.style.display = 'none';
			value2Input.style.display = 'none';
			value3Label.style.display = 'none';
			value3Input.style.display = 'none';
			value4Label.style.display = 'none';
			value5Label.style.display = 'none';
			value6Label.style.display = 'none';
		} else if (columnType === 'yesno' && operatorSelect !== 'null') {
			operatorLabel.style.display = 'none';
			operatorSelect.style.display = 'none';
			value1Label.style.display = 'none';
			value1Input.style.display = 'none';
			value2Label.style.display = 'none';
			value2Input.style.display = 'none';
			value3Label.style.display = 'block';
			value3Input.style.display = 'block';
			value4Label.style.display = 'none';
			value5Label.style.display = 'none';
			value6Label.style.display = 'none';
		}
		else {
			// For other columns, show operator and value1
			console.log("sauy");
			value1Input.setAttribute("type", "text");
			value1Input.setAttribute("placeholder", "Searchs");
			operatorLabel.style.display = 'none';
			operatorSelect.style.display = 'none';
			value1Label.style.display = 'none';
			value1Input.style.display = 'none';
			value2Label.style.display = 'none';
			value2Input.style.display = 'none';
			value3Label.style.display = 'none';
			value3Input.style.display = 'none';
			value4Label.style.display = 'none';
			value5Label.style.display = 'none';
			value6Label.style.display = 'none';
		}
	}

	// Show/hide value2 input and label based on operator selection is between
	operatorSelect.addEventListener('change', function() {
		// Set the type of value2 input based on the column type
		if (operatorSelect.value === 'Select') {
			console.log("Null for operatorSelect");
			value1Input.style.display = 'none';
			value1Label.style.display = 'none';
			value2Input.style.display = 'none';
			value2Label.style.display = 'none';
			value3Label.style.display = 'none';
			value3Input.style.display = 'none';
			value4Label.style.display = 'none';
			value5Label.style.display = 'none';
			value6Label.style.display = 'none';
		}
		else if (columnType === 'date' && operatorSelect.value === 'BETWEEN') {
			console.log("Between Date");
			value1Input.setAttribute("type", "text");
			value1Input.setAttribute("pattern", "\\d{2}/\\d{2}/\\d{4}");
			value1Input.setAttribute("placeholder", "mm/dd/yyyy");
			value1Label.style.display = 'none';
			value1Input.style.display = 'block';
			value2Input.setAttribute("type", "text");
			value2Input.setAttribute("pattern", "\\d{2}/\\d{2}/\\d{4}");
			value2Input.setAttribute("placeholder", "mm/dd/yyyy");
			value2Input.style.display = 'block';
			value2Label.style.display = 'none';
			value3Label.style.display = 'none';
			value3Input.style.display = 'none';
			value4Label.style.display = 'none';
			value5Label.style.display = 'block';
			value6Label.style.display = 'block';
		} else if (columnType === 'date' && operatorSelect.value !== 'BETWEEN') {
			console.log("Between Not Date");
			value1Input.setAttribute("type", "text");
			value1Input.setAttribute("pattern", "\\d{2}/\\d{2}/\\d{4}");
			value1Input.setAttribute("placeholder", "mm/dd/yyyy");
			value1Input.style.display = 'block';
			value1Label.style.display = 'block';
			value2Input.style.display = 'none';
			value2Label.style.display = 'none';
			value3Label.style.display = 'none';
			value3Input.style.display = 'none';
			value4Label.style.display = 'none';
			value5Label.style.display = 'none';
			value6Label.style.display = 'none';
		} else if (columnType === 'number' && operatorSelect.value !== 'BETWEEN') {
			console.log("Between Not Number");
			value1Input.setAttribute("onkeypress", "return isNumber(event)");
			value1Input.setAttribute("type", "number");
			value1Input.setAttribute("placeholder", "");
			value1Input.style.display = 'block';
			value1Label.style.display = 'block';
			value2Input.style.display = 'none';
			value2Label.style.display = 'none';
			value3Label.style.display = 'none';
			value3Input.style.display = 'none';
			value4Label.style.display = 'none';
			value5Label.style.display = 'none';
			value6Label.style.display = 'none';
		} else if (columnType === 'number' && operatorSelect.value === 'BETWEEN') {
			console.log("Between Number");
			value1Input.setAttribute("onkeypress", "return isNumber(event)");
			value2Input.setAttribute("onkeypress", "return isNumber(event)");
			value1Input.setAttribute("type", "number");
			value1Input.setAttribute("placeholder", "");
			value2Input.setAttribute("type", "number");
			value2Input.setAttribute("placeholder", "");
			value4Label.style.display = 'block';
			value1Input.style.display = 'block';
			value1Label.style.display = 'none';
			value2Input.style.display = 'block';
			value2Label.style.display = 'block';
			value3Label.style.display = 'none';
			value3Input.style.display = 'none';
			value5Label.style.display = 'none';
			value6Label.style.display = 'none';
		}
		else {

		}
	});
}


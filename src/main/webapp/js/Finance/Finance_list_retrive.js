
    $(document).ready(function () {
        userHide();
        $("#ExitSearch").hide();
        SearchValidation();
        FinanceSearchDropdown();

        var isSearching = false;
        var currentPage = 1; // Default page number
       	var tempcolumnName;
		var tempOperators;
		var tempsearchValue1;
		var tempsearchValue2;
		var tempyesnofiled;
		var temptype;

        var appId = sessionStorage.getItem("APPID");
        var appName = sessionStorage.getItem("APPNAME");
        // Check if data exists
        if (appId && appName) {
            // Remove the specific item from sessionStorage
            sessionStorage.removeItem('APPID');
            sessionStorage.removeItem('APPNAME');
            fetchData(1);
        }
        else {
            fetchData(currentPage);
        }

        // Event listener for the maxRows dropdown change
        $('#maxRows').on('change', function () {
            var maxRow = $(this).val();
            console.log(isSearching);
            if (isSearching) {
                currentPage = 1;
              //  searchData(currentSearchColumn, currentSearchTerm, maxRow, currentPage);
               advanceSearchData(tempcolumnName, tempOperators, tempsearchValue1, tempsearchValue2, tempyesnofiled, maxRow, currentPage,temptype);

            } else {
                fetchData(1); // Fetch data for the first page when the row count changes
            }
        });

        // Event listener for pagination click
        $('.pagination').on('click', 'li', function () {
            console.log('Pagination Clicked');
            var pageNum = $(this).attr('data-page');

            if (pageNum === 'prev' || pageNum === 'next') {
                currentPage = (pageNum === 'prev') ? currentPage - 1 : currentPage + 1;
            } else {
                currentPage = parseInt(pageNum);
            }

            if (isSearching) {
                advanceSearchData(tempcolumnName, tempOperators, tempsearchValue1, tempsearchValue2, tempyesnofiled, $('#maxRows').val(), currentPage,temptype);
            } else {
                fetchData(currentPage);
            }
        });
        $("#submitSearch").on("click", function () {
            $("#ExitSearch").show();
			validateForm();

        });
        function fetchData(page) {
            console.log('Fetching data for page:', page);
            var maxRows = parseInt($('#maxRows').val());

            $.ajax({
                url: "Retrieve_Finance_list_Servlet",
                type: 'POST',
                data: { page: page, maxRows: maxRows },
                dataType: "json",
                beforeSend: function () {
                    $('#overlay').show();
                },
                success: function (data) {
                    $('#overlay').hide();

                    console.log("Users List Retrieve", data);
                    clearTable();
                    appendRowFunction(data.data);
                    updatePagination(data.total, page);
                },
            });
        }
        function advanceSearchData(ColumnName, Operators, SearchValue1, SearchValue2, Yesnofiled, MaxRows, page,type){
            $.ajax({
                url: "Finance_Advance_Search_servlet",
                method: "POST",
                data: JSON.stringify({ // Use an empty string if it's null or undefined
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
                beforeSend: function () {
                    $('#overlay').show();
                },
                success: function (data) {
                    $('#overlay').hide();
                    isSearching = true;
                    console.log("Search Results", data);
                    clearTable();
                    appendRowFunction(data.data);
                    updatePagination(data.total, page);
                },
            });
            selectedColumns = [];
        }
        function populateDropdown(selectElement, options) {
            selectElement.empty();
            selectElement.append('<option value="Select">--Select--</option>');
            $.each(options, function (index, option) {
                selectElement.append('<option value="' + option + '">' + option + '</option>');
            });
        }

        function FinanceSearchDropdown() {
            $('#searchModal').on('show.bs.modal', function (e) {
                var headers = [];

                $("#admin_userslist thead th").each(function () {
                    headers.push($(this).text());
                });

                var selectOptions = $("#SearchOptions");
                selectOptions.empty(); // Clear existing options
                selectOptions.append('<option value="Select">--Select--</option>');
                $.each(headers, function (index, header) {
                    if (header !== 'Action') {
                        // Exclude "Action" column from the dropdown options
                        selectOptions.append('<option value="' + header + '">' + header + '</option>');
                    }
                });

                $('input[name="condition"]').change(function () {
                    var selectedValue = $('input[name="condition"]:checked').val();
                    $("#SecondSearchOptions, #SecondSearchOptionsLabel").remove();
                    if (selectedValue === "OR" || selectedValue === "AND") {
                        // Create a new select dropdown with options excluding the selected option
                        var secondSelectOptions = headers.filter(function (header) {
                            return header !== $("#SearchOptions").val() && header !== 'Action';
                        });

                        // Create a new select dropdown element
                        var secondSelect = $('<select class="form-control" id="SecondSearchOptions"></select>');

                        // Create a new label for the second dropdown
                        var secondSelectLabel = $('<label for="SecondSearchOptions" id="SecondSearchOptionsLabel">Select Second Search Column:</label>');

                        // Append the new label and select dropdown to the modal body
                        $("#searchModal .modal-body").append(secondSelectLabel);
                        $("#searchModal .modal-body").append(secondSelect);

                        // Populate the new select dropdown with options
                        populateDropdown(secondSelect, secondSelectOptions);
                    }
                });
            });
        }


        function clearTable() {
            $("#admin_userslist").empty();
        }

        function appendRowFunction(data) {
            if (data.length > 0) {
                var headers = Object.keys(data[0]);

                // Add table headers
                var headerRow = "<thead class='text-center Table-Header'>" + "<tr>";
                $.each(headers, function (index, header) {
                    if (header === 'ID') {
                        // If the header is 'ID', skip the current iteration (skip the column)
                        return; // Skip to the next iteration of the inner loop
                    }
                    headerRow += "<th>"
                    headerRow += header;
                    headerRow += "</th>";
                });
                headerRow += "<th>Edit</th>";
                headerRow += "<th>Delete</th>";
                headerRow += "</tr>" + "</thead>";
                $("#admin_userslist").append(headerRow);

                $.each(data, function (key, value) {
                    var row = "<tbody class='text-center Table-Body'>" + "<tr>";

                    $.each(headers, function (index, header) {
                        if (header === 'ID') {
                            // If the header is 'ID', skip the current iteration (skip the column)
                            return; // Skip to the next iteration of the inner loop
                        }
                            row += "<td>" + value[header] + "</td>";

                    });

                    // Append the column for 'ID'
                    row += "<td>";
                    row += "<span class='fa-solid fa-pencil iconColor edit-icon' data-id='" + value.ID + "' data-finance='" + value['Application Name'] + "'></span>";
                    row += "</td>";
                    row += "<td>";
                    row += "<span class='fa-solid fa-trash-can text-danger delete-icon' data-id='" + value.ID + "' data-finance='" + value['Application Name'] + "'></span>";
                    row += "</td>";

                    row += "</tr>" + "</tbody>";

                    $("#admin_userslist").append(row);
                });


                // Add click event handler for the edit icon
                $(".edit-icon").on("click", function () {
                    var id = $(this).data("id");
                    var finance = $(this).data("finance");

                    // Set the ID and app name in sessionStorage (you can use localStorage or cookies as well)
                    sessionStorage.setItem("APPID", id);
                    sessionStorage.setItem("APPNAME", finance);

                    // Redirect to the edit page
                    window.location.href = "Finance.jsp";

                });

                // Add click event handler for the delete icon
                $(".delete-icon").on("click", function () {
                    var id = $(this).data("id");

                    // Set data for the delete confirmation modal
                    $("#random_id").val(id);
                    var checkID= $("#random_id").val();
                    console.log(checkID);

                    // Trigger the click event of the hidden deletepopup_btn
                    $("#deletepopup_btn").trigger("click");
                });
            }
        }
        function updatePagination(totalRecords, currentPage) {
            var maxRows = parseInt($('#maxRows').val());
            var totalPages = Math.ceil(totalRecords / maxRows);
            var startRecord = (currentPage - 1) * maxRows + 1;
            var endRecord = Math.min(currentPage * maxRows, totalRecords);

            var paginationContainer = $('.pagination');
            paginationContainer.empty();
            if(currentPage > 1){
                paginationContainer.append('<li data-page="prev" class="page-link"><span> << <span class="sr-only">(current)</span></span></li>');
            }
            for (var i = 1; i <= totalPages; i++) {
                paginationContainer.append(
                    '<li data-page="' + i + '" class="page-link">\
                <span>' + i + '</span>\
            </li>'
                );
            }
            if(currentPage < totalPages){
                paginationContainer.append('<li data-page="next" class="page-link"><span> >> <span class="sr-only">(current)</span></span></li>');
            }

            paginationContainer.find('[data-page="' + currentPage + '"]').addClass('active');

            // Display record information
            var recordInfo = $('#recordInfo');
            // recordInfo.html('Showing ' + startRecord + ' to ' + endRecord + ' of ' + totalRecords + ' records');
            recordInfo.html(startRecord + ' - ' + endRecord + ' of ' + totalRecords);
            limitPagging();
        }

        function limitPagging(){
            // alert($('.pagination li').length)

            if($('.pagination li').length > 7 ){
                if( $('.pagination li.active').attr('data-page') <= 3 ){
                    $('.pagination li:gt(5)').hide();
                    $('.pagination li:lt(5)').show();
                    $('.pagination [data-page="next"]').show();
                }if ($('.pagination li.active').attr('data-page') > 3){
                    $('.pagination li:gt(0)').hide();
                    $('.pagination [data-page="next"]').show();
                    for( let i = ( parseInt($('.pagination li.active').attr('data-page'))  -2 )  ; i <= ( parseInt($('.pagination li.active').attr('data-page'))  + 2 ) ; i++ ){
                        $('.pagination [data-page="'+i+'"]').show();

                    }

                }
            }
        }
        $("#add_user_btn").show();
        function SearchValidation(){
            var searchTerm = $("#advanceSearch").val();
            var radioSelectedValue = $('input[name="condition"]:checked').val();

            // Initial validation
            $('#submitSearch').hide();

            $('#SearchOptions, #advanceSearch, #SecondSearchOptions').on('change input change', function () {
                var selectedOption = $('#SearchOptions').val();
                var selectedOption2 = $('#SecondSearchOptions').val();
                if (radioSelectedValue === ""){
                    if (selectedOption !== "" && searchTerm !== "") {
                        $('#submitSearch').show();

                    } else {
                        $('#submitSearch').hide();
                    }
                }
                else if (selectedOption !== "" && searchTerm !== "" && selectedOption2 !== ""){
                    $('#submitSearch').show();
                }
                else{
                    $('#submitSearch').hide();
                }

            });

            // Advance search input change event
            $('#advanceSearch').on('input', function () {
                searchTerm = $(this).val();

                // Trigger change event for SearchOptions
                $('#SearchOptions').trigger('change');
            });

            $('input[name="condition"]').change(function () {
                radioSelectedValue = $(this).val();

                // Trigger change event for SearchOptions
                $('#SearchOptions').trigger('change');
            });
        }

        // Add this function to your existing script
        
        $("#resetButton").on("click", function () {
            SearchResetForm();
        });
        $("#ExitSearch").click(function() {
            // Redirect to another page when the icon is clicked
            window.location.href = "FinanceList.jsp";
        });
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
			advanceSearchData(columnName, Operators, searchValue1, searchValue2, yesnofiled, 5, page,coltype);
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
		'Contract end date': 'date',
		'Cost Avoidance': 'number',
		'Cost Archive': 'number',
		'Total CBA': 'number',
		'Software and Licensing(cost Saving) ': 'number',
		'Funding approved': 'yesno',
		'Software and Licensing': 'yesno'
		
	};

	const trimmedColumnName = columnName.trim();

	return columnTypeMap[trimmedColumnName] || 'text';
}

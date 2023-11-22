var globalreportname = null;
var globalpage = null;
console.log("golbalPage : "+globalpage);
$(document).ready(function () {
	// Event listener for pagination click
    $('.pagination').on('click', 'li', function () {
        console.log('Pagination Clicked'); // Add this line
        var pageNum = $(this).attr('data-page');
        gglobalpage = pageNum;
        if (pageNum === 'prev' || pageNum === 'next') {
            var currentPage = parseInt($('.pagination li.active').attr('data-page'));
            pageNum = (pageNum === 'prev') ? currentPage - 1 : currentPage + 1;
        }
        fetchsearchvalue(columnName,searchValue,globalreportname,globalpage);
    });
});
function getcategoryValue(category) {
    globalreportname = category;
}

function showSearchPopup() {
    var popup = document.getElementById('searchPopup');
    var overlaySearch = document.getElementById('overlaySearch');
    popup.classList.add('active');
    overlaySearch.classList.add('active');

    // Call the AJAX function when the popup is shown
    fetchColumn(globalreportname); // Adjust category as needed
}

function validateForm(event) {
	event.preventDefault();
    console.log("Submit Clicked");
    var columnName = document.getElementById('columnName').value;
    console.log("columnName : ",columnName);
    var searchValue = document.getElementById('searchValue').value;
    console.log("searchValue : ",searchValue);
    var warningMessage = document.getElementById('warningMessage');

    // Reset the warning message
    warningMessage.innerText = '';
    warningMessage.style.display = 'none';

    var isValid = true;

    if (columnName === 'null') {
        // Show a warning message for selecting "Select" in the dropdown
        //warningMessage.innerText = 'Select a column name';
        //warningMessage.style.display = 'block';
        //setTimeout(function () {
            // Hide the warning message after 3 seconds
        //    warningMessage.style.display = 'none';
        //}, 3000);
       
        notification("warning","Select a column name","Warning:")
        isValid = false;
    } else if (searchValue === '') {
        // Show an error message for empty search value
        //warningMessage.innerText = 'Enter a value in the search box';
        //warningMessage.style.display = 'block';
        //warningMessage.style.backgroundColor = 'red';
        //		warningMessage.style.color = 'white';
       // 		setTimeout(function () {
            // Hide the warning message after 3 seconds
          //  warningMessage.style.display = 'none';
        //}, 3000);
        notification("warning","Enter a value in the search box","Warning:")
        isValid = false;
    } else  {
        // Check data type and apply specific validation
        var columnType = getColumnType(columnName);
			
        if (columnType === 'number') {
			console.log("columnType : ",columnType);
            // If the column type is 'number', validate for integer values
            if (!/^\d+$/.test(searchValue)) {
				
                // Show an error message for invalid integer
                //warningMessage.innerText = 'Enter a valid integer';
                //warningMessage.style.display = 'block';
                //warningMessage.style.backgroundColor = 'red';
        		//warningMessage.style.color = 'white';
        		//setTimeout(function () {
            // Hide the warning message after 3 seconds
            //warningMessage.style.display = 'none';
        //}, 3000);
        		notification("error","Enter a Numbers Only","Error:")
        		
                isValid = false;
            }
        } else if (columnType === 'text') {
            // If the column type is 'date', add date validation logic if needed
            // Add date validation logic here
        }
    }

    if (isValid) {
        // If all validations pass, show a success message
        //warningMessage.innerText = 'Search successful!';
        //warningMessage.style.display = 'block';
        //warningMessage.style.backgroundColor = 'green';
        //warningMessage.style.color = 'white';
        //warningMessage.style.border = '1px solid black';
        //setTimeout(function () {
            // Hide the warning message after 3 seconds
           // warningMessage.style.display = 'none';
        //}, 3000);
        notification("success","Search successfully.","Note:");
        fetchsearchvalue(columnName,searchValue,globalreportname,globalpage);
        closeSearchPopup();
    }

    return isValid;
}


function closeSearchPopup() {
    var popup = document.getElementById('searchPopup');
    var overlaySearch = document.getElementById('overlaySearch');
    popup.classList.remove('active');
    overlaySearch.classList.remove('active');
}


function fetchColumn(category) {
	console.log("globalreportname : ",category);
    $.ajax({
        url: "Search_servlet_Report_Generation",
        type: 'POST',
        data: { category: category }, // Convert data to JSON string
        dataType: "json",
        beforeSend: function () {
            $('#overlay').show();
        },
        success: function (data) {
            $('#overlay').hide();
            console.log("columnName", data);
            cleardropdown();

            // Populate the dropdown with column names
            populateDropdown(data.data);
            
            // Add code to handle the data received from the server
        }
    });
}

function fetchsearchvalue(columnName,searchValue,globalreportname,globalpage){
	console.log("fetchsearchvalue");
	var maxRows = parseInt($('#maxRows').val());
	    $.ajax({
        url: "Search_servlet_Report_Generation",
        type: 'POST',
        data: { category: globalreportname,columnName:columnName,searchValue:searchValue,page :globalpage, maxRows:maxRows }, // Convert data to JSON string
        dataType: "json",
        beforeSend: function () {
            $('#overlay').show();
        },
        success: function (data) {
                $('#overlay').hide();
                getcategoryValue(category);
                console.log("Users List Retrieve", data);
                clearTable();
                appendRowFunction(data.data);
                updatePagination(data.total, page);
            }
    });
	
}
function clearTable() {
        $("#dynamicHeader").empty();
    }
    
function updatePagination(totalRecords, currentPage) {
        var maxRows = parseInt($('#maxRows').val());
        var totalPages = Math.ceil(totalRecords / maxRows);
 
        var paginationContainer = $('.pagination');
        paginationContainer.empty();
 
        paginationContainer.append('<li data-page="prev"><span> << <span class="sr-only">(current)</span></span></li>');
 
        for (var i = 1; i <= totalPages; i++) {
            paginationContainer.append(
                '<li data-page="' + i + '">\
<span>' + i + '</span>\
</li>'
            );
        }
 
        paginationContainer.append('<li data-page="next"><span> >> <span class="sr-only">(current)</span></span></li>');
 
 
        paginationContainer.find('[data-page="' + currentPage + '"]').addClass('active');
    }
function appendRowFunction(data) {
        if (data.length > 0) {
            var headers = Object.keys(data[0]);
 
            // Add table headers
            var headerRow = "<thead>" + "<tr>";
            $.each(headers, function (index, header) {
                headerRow += "<th>" + header + "</th>";
            });
            // Add two icons for the "Action" header
            headerRow += "</tr>" + "</thead>";
            $("#dynamicHeader").append(headerRow);
 
            // Add table rows
            $.each(data, function (key, value) {
                var row = "<tbody>" + "<tr>";
                $.each(headers, function (index, header) {
                    row += "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>" + value[header] + "</label></td>";
                });
                row += "</tr>" + "</tbody>";
 
                $("#dynamicHeader").append(row);
            });
 
            // Add click event handler for the edit icon
            
 
            // Add click event handler for the delete icon
           
        }
    }
function cleardropdown() {
    var dropdown = $('#columnName');
    dropdown.empty();
    dropdown.append('<option value="null">--Select--</option>');
}


function populateDropdown(columnNames) {
    var dropdown = $('#columnName');

    // Populate the dropdown with column names
    for (var i = 0; i < columnNames.length; i++) {
        var option = $('<option></option>');
        option.val(columnNames[i].Field);
        option.text(columnNames[i].Field);
        dropdown.append(option);
    }
}
function toggleSearchValueField() {
    var columnNameSelect = document.getElementById("columnName");
    var searchValueLabel = document.getElementById("searchValueLabel");
    var searchValueInput = document.getElementById("searchValue");

    if (columnNameSelect.value !== "null") {
        searchValueLabel.classList.remove("hidden");
        var columnType = getColumnType(columnNameSelect.value);
        searchValueInput.setAttribute("type", columnType);

        searchValueInput.classList.remove("hidden");
    } else {
        searchValueLabel.classList.add("hidden");
        searchValueInput.classList.add("hidden");
    }
}
function getColumnType(columnName) {
    // Mapping column names to data types\

    const columnTypeMap = {
        'Creation_Date': 'date',
        'Project_Decomission_Date': 'date',
        'Data_Read_only_State': 'date',
        'Target_Date': 'date',
        'Readonly_Date': 'date',
        'What_is_the_read_only_date': 'date',
        'What_is_the_total_data_size': 'number',
        'Structured_Data_In_GB': 'number',
        'Structured_Data_Number_of_tables': 'number',
        'Unstructured_Data_In_GB': 'number',
        'Unstructured_Data_files': 'number',
        'Database_Server_Name': 'number',
        'Number_of_Infrastructure_Components': 'number',
        'Preliminary_CBA': 'number',
        'Application_Id': 'number'
    };

    const trimmedColumnName = columnName.trim();
    
    return columnTypeMap[trimmedColumnName] || 'text';
}

// Optionally, you can add an event listener to the columnNameSelect
// to update the visibility whenever the dropdown changes
document.getElementById("columnName").addEventListener("change", toggleSearchValueField);



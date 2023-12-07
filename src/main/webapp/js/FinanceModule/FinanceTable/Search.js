var gcolname = null;
var opera=null;
var gsvalue = null;
var searchflag=false;
var pageNum = null;

function showSearchPopup() {
	console.log("The  values");
	  var column = document.getElementById("Column");
	column.classList.remove("hidden");
	  var columnName = document.getElementById("columnName");
	columnName.classList.remove("hidden");
    var searchValueInput = document.getElementById("searchValue");
    var searchValueLabel = document.getElementById("searchValueLabel");
   searchValueLabel .classList.add("hidden");
    searchValueInput.classList.add("hidden");
    var popup = document.getElementById('searchPopup');
    var overlaySearch = document.getElementById('overlaySearch');
    popup.classList.add('active');
    overlaySearch.classList.add('active');
     toggleSearchValueField();
    fetchColumn(); 
   
}

function validateForm(event) {
    event.preventDefault();
    
    const columnName = document.getElementById('columnName').value;
    const searchValue = document.getElementById('searchValue').value;

    const showError = (message) => {
        notification("warning", message, "Warning:");
        return false;
    };

    const isValid = () => {
        const columnType = getColumnType(columnName);

        if (columnName === 'null') {
            return showError("Select a column name");
        }

        if (searchValue === '') {
            return showError("Enter a value in the search box");
        }

        if (columnType === 'number' && !/^\d+$/.test(searchValue)) {
            return showError("Enter numbers only");
        }

        if (columnType === 'date' && !isValidDate(searchValue)) {
            return showError("Enter a valid date in mm/dd/yyyy format");
        }

        return true;
    };

    if (isValid()) {
		gcolname = columnName;
		gsvalue = searchValue;
        fetchsearchvalue(columnName, searchValue, pageNum);
        closeSearchPopup();
        searchflag = true;
		sendsearchfunctionvalue(searchflag);
        notification("success", "Search successfully.", "Note:");
		 document.getElementById('columnName').value = null;
    	document.getElementById('searchValue').value = '';
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
function closeSearchPopup() {
    var popup = document.getElementById('searchPopup');
    var overlaySearch = document.getElementById('overlaySearch');
    document.getElementById('columnName').value = null;
    document.getElementById('searchValue').value = '';
    popup.classList.remove('active');
    overlaySearch.classList.remove('active');
    
}


function fetchColumn() {
	console.log("I am back");
    $.ajax({
        url: "TableDetailsSearchServlet",
        type: 'POST',
        dataType: "json",
        beforeSend: function () {
            $('#overlay').show();
        },
        success: function (data) {
            $('#overlay').hide();
            console.log("Users List Retrieve",data);
            //cleardropdown();
            populateDropdown(data.data);
            
            
        }
    });
}

function fetchsearchvalue(columnName,Operator,searchValue,pageNum){
	console.log("columnName value in ajax : ",columnName);
	console.log("searchValue value in ajax : ",searchValue);
	console.log("pageNum : ",pageNum);
	console.log("say Hi");
	if(pageNum === null || pageNum === undefined){
		pageNum=1;
	}
	console.log("pageNum : ",pageNum);
	
	var maxRows = $('#maxRows').val();
	    $.ajax({
        url: "TableDetailsSearchServlet",
        type: 'POST',
        data: { columnName:columnName,searchValue:searchValue,page :pageNum, maxRows:maxRows }, // Convert data to JSON string
        dataType: "json",
        beforeSend: function () {
            $('#overlay').show();
        },
        success: function (data) {
                $('#overlay').hide();
                //getcategoryValue(category);
                console.log("Users List Retrieve", data);
                clearTable();
                searchappendRowFunction(data.data);
                searchupdatePagination(data.total, pageNum);
            }
    });
	
}
function goBack() {
		searchflag = false;
        window.location.href = 'Finance.jsp';
    }
function clearTable() {
        $("#FinanceDetails").empty();
    }
    
function searchupdatePagination(totalRecords, currentPage) {
    var maxRows = parseInt($('#maxRows').val());
    var totalPages = Math.ceil(totalRecords / maxRows);
	var paginationContainer1 = $('.pagination');
	paginationContainer1.empty();
    var paginationContainer = $('.Searchpagination');
    paginationContainer.empty();
    
	 paginationContainer.append('<li onclick="goBack()"><span>Back<span class="sr-only">(current)</span></span></li>');
	 
    if (totalPages > 1) { // Only show pagination if there is more than one page
        if (currentPage > 1) {
            paginationContainer.append('<li data-page="prev"><span> << <span class="sr-only">(current)</span></span></li>');
        }

        var startPage = Math.max(1, currentPage - 3); // Display up to 3 pages before the current page
        var endPage = Math.min(totalPages, startPage + 6); // Display up to 6 pages in total

        for (var i = startPage; i <= endPage; i++) {
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
    }
}

function searchappendRowFunction(data) {
        if (data.length > 0) {
            var headers = Object.keys(data[0]);
 
            // Add table headers
            var headerRow = "<thead>" + "<tr>";
            $.each(headers, function (index, header) {
	if (header === "Id") {
            		headerRow += "<th style='text-align:center;vertical-align: middle;display:none;'><label class='control-label' for=''>" + header + "</th>";
        		}
        		else{
					headerRow +="<th style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+ header + "</th>";
				}
	
              
            });
            headerRow += "<th style='text-align: center; ; vertical-align: middle; width: 15%;' class='useractionheader'>Action</th>";
            // Add two icons for the "Action" header
            headerRow += "</tr>" + "</thead>";
            $("#FinanceDetails").append(headerRow);
 
            // Add table rows
            $.each(data, function (key, value) {
                var row = "<tbody>" + "<tr>";
                $.each(headers, function (index, header) {
                    if (header === "Id") {
                    row += "<td style='text-align:center;vertical-align: middle;display:none;'><label class='control-label' for=''>" + value[header] + "</label></td>";
                	}
                	else{
					row += "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>" + value[header] + "</label></td>";
					}
                });
                row+= "<td class='useraction' style='text-align:center;vertical-align: middle;display:;'><span class='glyphicon glyphicon-pencil editpopup'id='editpopup"+ Id +"'style='display:block;margin-left:-22px;'></span><span class='glyphicon glyphicon-trash deletepopup' style='float:right;display:block;margin-top:-13px;'></span>"+
                  "</td>";
                row += "</tr>" + "</tbody>";
 
                $("#FinanceDetails").append(row);
            });
        }
         else if(data.length <= 0){
			console.log("data Less :",data.length);
            var Nodata = '<div style="text-align: center; font-weight: bold;">No Record Found</div>';
    		$("#FinanceDetails").html(Nodata);
		}
    }
function cleardropdown() {
    var dropdown = $('#columnName');
    dropdown.empty();
    dropdown.append('<option value="null" selected>--Select--</option>');
}


function populateDropdown(columnNames) {
    var dropdown = $('#columnName');
console.log("Dropdown ",dropdown)
    // Clear existing options
    dropdown.empty();
	dropdown.append('<option value="null" selected>--Select--</option>');
  for (var i = 0; i < columnNames.length; i++) {
    // Check if the column name is "Id"
    if (columnNames[i].Field !== "Id") {
        var option = $('<option></option>');
        option.val(columnNames[i].Field);
        option.text(columnNames[i].Field);
        dropdown.append(option);
    }
}
}

function toggleSearchValueField() {
	
    var columnNameSelect = document.getElementById("columnName");
    var searchValueInput = document.getElementById("searchValue");
    var searchValueLabel = document.getElementById("searchValueLabel");

    // Clear any existing date picker when the column is changed
    clearDatePicker(searchValueInput);

    // Hide Add button, radio buttons, and search value fields initially
    hideAddButton();
    hideRadioButtons();
    hideSearchValueField();

    if (columnNameSelect.value !== null && columnNameSelect.value !== "null") {
        searchValueLabel.classList.remove("hidden");

        var columnType = getColumnType(columnNameSelect.value);

        if (columnType === 'date' || columnNameSelect.value === 'Contract_End_Date') {
            // If the column type is 'date' or the column name is 'Contract_Date'
            searchValueInput.setAttribute("type", "text");
            searchValueInput.setAttribute("placeholder", "Select a date");
            attachDatePicker(searchValueInput); // Attach date picker
        } else if (columnType === 'number') {
            searchValueInput.setAttribute("type", "number");
            searchValueInput.setAttribute("placeholder", "");
        } else if (columnType === 'text') {
            searchValueInput.setAttribute("type", "text");
            searchValueInput.setAttribute("placeholder", "");
        }

        searchValueInput.classList.remove("hidden");

      
        toggleAddButton(columnType);
    } else {
        searchValueLabel.classList.add("hidden");
        searchValueInput.classList.add("hidden");

       
        hideRadioButtons();
        hideAddButton();
    }
}

function toggleAddButton(columnType) {
    console.log("Function called");
    var addButton = document.getElementById("addButton");

  
    if (columnType === 'number' || columnType === 'date' || columnType === 'text') {
        addButton.classList.remove("hidden");
    } else {
      
        hideAddButton();
    }

   
    addButton.addEventListener("click", function () {

        toggleRadioButton(columnType);
              
      
    });
}

function toggleRadioButton(columnType) {
    var andRadio = document.getElementById("andRadio");
    var  orRadio = document.getElementById("orRadio");
   var andLabel= document.getElementById("andLabel");
    var orLabel = document.getElementById("orLabel");
 var column = document.getElementById("Column");
	column.append();
    if (columnType === 'number' || columnType === 'date'||columnType === 'text' ) {
       andLabel.classList.remove("hidden");
        andRadio.classList.remove("hidden");
         orLabel.classList.remove("hidden");
        orRadio.classList.remove("hidden");
       
    } else {
        // Hide radio buttons and Add button if the column type is not 'number' or 'date'
        hideRadioButtons();
      
    }
}

function hideAddButton() {
    var addButton = document.getElementById("addButton");
    addButton.classList.add("hidden");
}

function hideRadioButtons() {
    var andRadio = document.getElementById("andRadio");
    var orRadio = document.getElementById("orRadio");
     var andLabel = document.getElementById("andLabel");
    var orLabel = document.getElementById("orLabel");
    
    andRadio.classList.add("hidden");
    orRadio.classList.add("hidden");
     andLabel.classList.add("hidden");
    orLabel.classList.add("hidden");
}

function hideSearchValueField() {
    var searchValueLabel = document.getElementById("searchValueLabel");
    var searchValueInput = document.getElementById("searchValue");

    searchValueLabel.classList.add("hidden");
    searchValueInput.classList.add("hidden");
}

function attachDatePicker(inputElement) {
    
    $(inputElement).datepicker();
}

function clearDatePicker(inputElement) {
    
    $(inputElement).datepicker("destroy");
}



function getColumnType(columnName) {
    // Mapping column names to data types\

    const columnTypeMap = {
		'':'',
	'Project_Number':'number',
	'Phase':'text',
	'Application_Name':'text',
	'Software_and_Licensing	':'text',
	'Cost Savings($)':'number',
	'Contract_Date':'date',
	'Comments':'text',
	'scope_of_infrastructure':'text',
	'infrastructure_Cost_Savings	':'number',
	'Cost_Avoidance':'number',
	'Cost_of_Archive':'number',
	'Total CBA':'number',
	'Funding_approval':'text',
	'Funding_type':'text',
	'Status':'number'
    };

    const trimmedColumnName = columnName.trim();
    
    return columnTypeMap[trimmedColumnName] || 'text';
}
document.getElementById("columnName").addEventListener("change", toggleSearchValueField());


$(document).ready(function () {
    SearchValidation();
    ReportSearchDropdown();
    var filterIcon = $('<span>').addClass('glyphicon glyphicon-filter').attr('id', 'ExitSearch');
    filterIcon.css('display', 'none');

    var selectedOption = "intakeReport1";
    var currentReport = "intakeReport1";
    var isSearching = false;
    var currentPage = 1;
    var selectedColumns;
    var selectedColumn ;
    var secondSelectedColumn ; // Add this line
    var searchValue ;
    var condition ;
    var tempColumnArray;
    var tempSelectedColumn;
    var tempSecondSelectedColumn;
    var tempSearchValue;
    var tempCondition;

    ajaxcall(currentReport,1);
    $("#cd-header").text("Intake Report 1");
    $('#cd-header').append(filterIcon);

    $("#Report").change(function () {
        currentReport = $(this).val();
    });

    // default max row
    $('#maxRows').on('change', function () {
        if (isSearching) {
            var maxRow = $(this).val();
            currentPage = 1;
            reportAdvanceSearchData(currentReport,tempColumnArray,tempSearchValue,tempCondition,maxRow,currentPage);
        } else {
            currentPage = 1;
            ajaxcall(currentReport, currentPage);
        }
    });

    // Event listener for pagination click
    $('.pagination').on('click', 'li', function () {
        var pageNum = $(this).attr('data-page');
        if (pageNum === 'prev' || pageNum === 'next') {
            currentPage = (pageNum === 'prev') ? currentPage - 1 : currentPage + 1;
        } else {
            currentPage = parseInt(pageNum);
        }

        if (isSearching) {
           reportAdvanceSearchData(currentReport,tempColumnArray,tempSearchValue,tempCondition,$('#maxRows').val(),currentPage);
        } else {
            ajaxcall(currentReport,currentPage);
        }

    });

    function clearTable() {
        $("#admin_userslist").empty();
    }
    $("#Report").change(function () {
        filterIcon.hide();
        selectedOption = $(this).val();
        var reportTitle;
        // To show the name in the jsp report name
        if (selectedOption === "intakeReport1") {
            reportTitle = "Intake Report 1"
        } else if (selectedOption === "intakeReport2") {
            reportTitle = "Intake Report 2"
        } else if (selectedOption === "intakeReport3") {
            reportTitle = "Intake Report 3"
        } else {
            reportTitle = "Report"
        }
        $("#cd-header").text(reportTitle);
        $('#cd-header').append(filterIcon);
        clearTable();
        ajaxcall(selectedOption,1);
    });

    $("#submitSearch").on("click", function () {
        filterIcon.show();
        // Get the selected values from the first dropdown, second dropdown, and input field
        selectedColumn = $("#SearchOptions").val();
        secondSelectedColumn = $("#SecondSearchOptions").val(); // Add this line
        searchValue = $("#advanceSearch").val();
        condition = $('input[name="condition"]:checked').val();

        // Validate the selected values (customize as needed)
        if (selectedColumn === "" || searchValue === "") {
            alert("Please select a column, enter a search value, and choose a condition.");
            return;
        }
        // Add selected columns to the array
        selectedColumns = [selectedColumn, secondSelectedColumn];
        reportAdvanceSearchData(currentReport,selectedColumns,searchValue,condition,$('#maxRows').val(),1)
         tempColumnArray= selectedColumns;
         tempSelectedColumn = selectedColumn;
         tempSecondSelectedColumn = secondSelectedColumn;
         tempSearchValue = searchValue;
         tempCondition = condition;
        SearchResetForm();
    });

function ajaxcall(selectedOption,page) {
    console.log('Fetching data for page:', page);
    var maxRows = parseInt($('#maxRows').val());

    $.ajax({
            url: "ReportServlet",
            type: 'POST',
            data: {selectedOption: selectedOption,  page: page, maxRows: maxRows },
            dataType: "json",
            beforeSend: function () {
                $('#overlay').show();
            },
            success: function (data) {
                $('#overlay').hide();
                ReportSearchDropdown();
                console.log("Data retrieved:", data);

                if (data.error) {
                    // Handle the error
                    $("#admin_userslist").html("Error: " + data.error);
                } else {
                   clearTable();
                    if (selectedOption === "intakeReport1") {
                        RecordAppendRowFunction(data.data);
                        updatePaginationReport(data.total, page);
                    } else if (selectedOption === "intakeReport2") {
                        RecordAppendRowFunction(data.data);
                        updatePaginationReport(data.total, page);
                    } else if (selectedOption === "intakeReport3") {
                        RecordAppendRowFunction(data.data);
                        updatePaginationReport(data.total, page);
                    } else {
                        // Handle other cases or provide a default action
                        console.log("Unknown option is selected");
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
    if(currentPage > 1){
        paginationContainer.append('<li data-page="prev"><span> << <span class="sr-only">(current)</span></span></li>');
    }
    for (var i = 1; i <= totalPages; i++) {
        paginationContainer.append(
            '<li data-page="' + i + '">\
            <span>' + i + '</span>\
        </li>'
        );
    }
    if(currentPage < totalPages){
        paginationContainer.append('<li data-page="next"><span> >> <span class="sr-only">(current)</span></span></li>');
    }

    paginationContainer.find('[data-page="' + currentPage + '"]').addClass('active');

    // Display record information
    var recordInfo = $('#recordInfo');
    recordInfo.html('Showing ' + startRecord + ' to ' + endRecord + ' of ' + totalRecords + ' records');

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

//
// function RecordAppendRowFunction(data) {
//     if (data.length > 0) {
//         var headers = Object.keys(data[0]);
//
//         // Add table headers
//         var headerRow = "<thead>" + "<tr>";
//         $.each(headers, function (index, header) {
//             headerRow += "<th style='color: black; font-weight: bold;'>";
//             headerRow += header;
//           //  headerRow += `<i class="fa fa-search search-Icon" data-column="${header}" data-placeholder="Search ${header}" data-title="${header}"></i>`;
//             headerRow += "</th>";
//         });
//         headerRow += "</tr>" + "</thead>";
//         $("#admin_userslist").append(headerRow);
//
//         $.each(data, function (key, value) {
//             var row = "<tbody>" + "<tr>";
//             $.each(headers, function (index, header) {
//                 row += "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for='' style='color: dimgrey;'>" + value[header] + "</label></td>";
//             });
//             row += "</tr>" + "</tbody>";
//
//             $("#admin_userslist").append(row);
//         });
//
//     }
// }

    function RecordAppendRowFunction(data) {
        if (data.length > 0) {
            var headers = Object.keys(data[0]);

            // Add table headers
            var headerRow = "<thead>" + "<tr>";
            $.each(headers, function (index, header) {
                headerRow += "<th style='color: black; font-weight: bold;'>";
                headerRow += header;
                headerRow += "</th>";
            });
            headerRow += "</tr>" + "</thead>";
            $("#admin_userslist").append(headerRow);

            $.each(data, function (key, value) {
                var row = "<tbody>" + "<tr>";
                $.each(headers, function (index, header) {
                    // Check if the value is undefined, replace it with an empty string
                    var cellValue = value[header] !== undefined ? value[header] : '';
                    row += "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for='' style='color: dimgrey;'>" + cellValue + "</label></td>";
                });
                row += "</tr>" + "</tbody>";

                $("#admin_userslist").append(row);
            });
        }
    }

    function reportAdvanceSearchData(selectedReport,selectedColumns,searchValue,condition,maxRows,page){
        $.ajax({
            url: "Report_Advance_Search_Servlet",
            method: "POST",
            data: {
                SelectedReport: selectedReport,
                column: selectedColumns,
                searchTerm: searchValue,
                condition: condition,
                maxRows: maxRows,
                page: page
            },
            dataType: "json",
            beforeSend: function () {
                $('#overlay').show();
            },
            success: function (data) {
                $('#overlay').hide();
                isSearching = true;
                console.log("Search Results", data);
                clearTable();
                RecordAppendRowFunction(data.data);
                updatePaginationReport(data.total, page);
            },
        });
        selectedColumns = [];
    }
    function SearchResetForm() {
        // Reset the form elements
        document.getElementById('SearchOptions').value = '';
        document.getElementById('SecondSearchOptions').value = '';
        document.getElementById('advanceSearch').value = '';
        document.getElementById('and').checked = false;
        document.getElementById('or').checked = false;

        // Remove SecondSearchOptions and its label
        $('#SecondSearchOptions, #SecondSearchOptionsLabel').remove();
    }


    $("#resetButton").on("click", function () {
        SearchResetForm();
    });
    function populateDropdown(selectElement, options) {
        selectElement.empty();
        selectElement.append('<option value="">----------------Select------------------</option>');
        $.each(options, function (index, option) {
            selectElement.append('<option value="' + option + '">' + option + '</option>');
        });
    }
    function ReportSearchDropdown(){
        var selectedColumns = [];
        $('#searchModal').on('show.bs.modal', function (e) {

            var headers = [];
            // Extract headers from the table
            $("#admin_userslist thead th").each(function () {
                headers.push($(this).text());
            });
            // Populate the select dropdown in the modal
            var selectOptions = $("#SearchOptions");
            selectOptions.empty(); // Clear existing options
            selectOptions.append('<option value="">----------------Select------------------</option>');
            $.each(headers, function (index, header) {
                selectOptions.append('<option value="' + header + '">' + header + '</option>');
            });

            // Event handler for radio button click
            $('input[name="condition"]').change(function () {
                var selectedValue = $('input[name="condition"]:checked').val();
                $("#SecondSearchOptions, #SecondSearchOptionsLabel").remove();
                if (selectedValue === "OR" || selectedValue === "AND") {
                    // Create a new select dropdown with options excluding the selected option
                    var secondSelectOptions = headers.filter(function (header) {
                        return header !== $("#SearchOptions").val();
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

    $("#ExitSearch").click(function() {
        // Reset back to the same report by making an AJAX call
        console.log("exit search button clicked");
        ajaxcall(currentReport, currentPage);

        // Optionally, you can also reset other search-related variables if needed
        isSearching = false;
        selectedColumns = [];
        selectedOption = currentReport;

        filterIcon.hide();
    });

});



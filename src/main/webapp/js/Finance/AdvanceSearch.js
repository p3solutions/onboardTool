$(document).ready(function () {
    var searchTerm = $("#advanceSearch").val();
    var radioSelectedValue = $('input[name="condition"]:checked').val();

    // Initial validation
    $('#submitSearch').hide();

    $('#SearchOptions, #advanceSearch, #SecondSearchOptions').on('input change input', function () {
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
});
$(document).ready(function () {
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

    // Event handler for the "Search" button click
    $("#submitSearch").on("click", function () {
        // Get the selected values from the first dropdown, second dropdown, and input field
        var selectedColumn = $("#SearchOptions").val();
        var secondSelectedColumn = $("#SecondSearchOptions").val(); // Add this line
        var searchValue = $("#advanceSearch").val();
        var condition = $('input[name="condition"]:checked').val();

        // Validate the selected values (customize as needed)
        if (selectedColumn === "" || searchValue === "") {
            alert("Please select a column, enter a search value, and choose a condition.");
            return;
        }
        // Add selected columns to the array
        selectedColumns.push(selectedColumn, secondSelectedColumn);
        var maxRows = parseInt($('#maxRows').val());
        var page = 1;
        // Assuming you have an AJAX call here to send the search parameters
        $.ajax({
            url: "Finance_Advance_Search_servlet",
            method: "POST",
            data: { column: selectedColumns, searchTerm: searchValue,condition: condition, maxRows: maxRows, page: page },
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
            error: function (error) {
                // Handle the error response from the server
                console.error("Search error:", error);
            }
        });

        // Close the modal (assuming you are using Bootstrap modal)
        $("#searchModal").modal("hide");

        // Clear the array for the next search
        selectedColumns = [];
    });
});
function populateDropdown(selectElement, options) {
    selectElement.empty();
    selectElement.append('<option value="">----------------Select------------------</option>');
    $.each(options, function (index, option) {
        selectElement.append('<option value="' + option + '">' + option + '</option>');
    });
}


    $(document).ready(function () {
        $("#ExitSearch").hide();
        SearchValidation();
        FinanceSearchDropdown();

        var isSearching = false;
        var selectedColumns;
        var currentSearchColumn;
        var currentSearchTerm;
        var currentPage = 1; // Default page number
        var selectedColumn ;
        var secondSelectedColumn ; // Add this line
        var searchValue ;
        var condition ;
        var tempColumnsArray;
        var tempSelectedColumn;
        var tempSecondSelectedColumn;
        var tempSearchValue;
        var tempCondition;

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
               advanceSearchData(tempColumnsArray,tempSearchValue,tempCondition,maxRow,currentPage);

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
                advanceSearchData(tempColumnsArray,tempSearchValue,tempCondition,$('#maxRows').val(),currentPage);
            } else {
                fetchData(currentPage);
            }
        });
        $("#submitSearch").on("click", function () {
            $("#ExitSearch").show();
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
            advanceSearchData(selectedColumns,searchValue,condition,$('#maxRows').val(),1)
            tempColumnsArray = selectedColumns;
            tempSelectedColumn = selectedColumn;
            tempSecondSelectedColumn = secondSelectedColumn;
            tempSearchValue = searchValue;
            tempCondition = condition;

            console.log(tempSelectedColumn);
            console.log(tempSearchValue);
            console.log(tempCondition);
            console.log(tempColumnsArray);
           resetForm();

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
        function advanceSearchData(selectedColumns,searchValue,condition,maxRows,page){
            $.ajax({
                url: "Finance_Advance_Search_servlet",
                method: "POST",
                data: {
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
                    appendRowFunction(data.data);
                    updatePagination(data.total, page);
                },
            });
            selectedColumns = [];
        }
        function populateDropdown(selectElement, options) {
            selectElement.empty();
            selectElement.append('<option value="">----------------Select------------------</option>');
            $.each(options, function (index, option) {
                selectElement.append('<option value="' + option + '">' + option + '</option>');
            });
        }
        function FinanceSearchDropdown(){
            var selectedColumns = [];
            $('#searchModal').on('show.bs.modal', function (e) {

                var headers = [];

                $("#admin_userslist thead th").each(function () {
                    headers.push($(this).text());
                });

                var selectOptions = $("#SearchOptions");
                selectOptions.empty(); // Clear existing options
                selectOptions.append('<option value="">----------------Select------------------</option>');
                $.each(headers, function (index, header) {
                    selectOptions.append('<option value="' + header + '">' + header + '</option>');
                });


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



        function clearTable() {
            $("#admin_userslist").empty();
        }
        function appendRowFunction(data) {
            if (data.length > 0) {
                var headers = Object.keys(data[0]);

                // Add table headers
                var headerRow = "<thead>" + "<tr>";
                $.each(headers, function (index, header) {
                    headerRow += "<th style='color: black; font-weight: bold;'>";
                    headerRow += header;
                    headerRow += "</th>";
                });
                headerRow += "<th>Action</th>";
                headerRow += "</tr>" + "</thead>";
                $("#admin_userslist").append(headerRow);

                $.each(data, function (key, value) {
                    var row = "<tbody>" + "<tr>";
                    $.each(headers, function (index, header) {
                        row += "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>" + value[header] + "</label></td>";
                    });
                    row += "<td style='text-align:center;vertical-align: middle;'><i class='fa fa-edit edit-icon' data-id='" + value.ID + "' data-finance='" + value.FinanceAppName + "'></i> <i class='fa fa-trash delete-icon' data-id='" + value.ID + "' data-finance='" + value.FinanceAppName + "'></i></td>";
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
        function resetForm() {
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
            //resetForm();
        });

    });


$(document).ready(function () {
    $("#ExitSearch").hide();

    var selectedOption = "intakeReport1";
    var currentReport = "intakeReport1";
    var isSearching = false;
    var currentPage = 1;
    var selectedColumns;
    var selectedColumn ;
    var secondSelectedColumn ;
    var searchValue ;
    var condition ;
    var tempColumnArray;
    var tempSearchValue;
    var tempCondition;
    fetchColumn();
    ajaxcall(currentReport,1);
    $("#cd-header").text("Intake Report 1");

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
            $("#ExitSearch").hide();
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
            $("#ExitSearch").hide();
            ajaxcall(currentReport,currentPage);
        }

    });

    function clearTable() {
        $("#admin_userslist").empty();
    }

    $("#Report").change(function () {
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

    $("#submitSearch").on("click", function () {
        $("#ExitSearch").show();
        currentReport =  $("#Report").val();

        // Get the selected values from the first dropdown, second dropdown, and input field
        selectedColumn = $("#SearchOptions").val();
        secondSelectedColumn = $("#SecondSearchOptions").val(); // Add this line
        searchValue = $("#advanceSearch").val();
        condition = $('input[name="condition"]:checked').val();

        reportAdvanceSearchData(currentReport,selectedColumns,searchValue,condition,$('#maxRows').val(),1)
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
                fetchColumn();

                console.log("Data retrieved:", data);

                if(data.length <= 0){
                    console.log("data Less :",data.length);
                    var Nodata = '<div style="text-align: center; font-weight: bold;">No Record Found</div>';
                    $("#admin_userslist").html(Nodata);
                }else{
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

    function RecordAppendRowFunction(data) {
        if (data.length > 0) {
            var headers = Object.keys(data[0]);

            // Add table headers
            var headerRow = "<thead>" + "<tr>";
            $.each(headers, function (index, header) {
                headerRow += "<th style='color: black; background-color: #d7e9f7; font-weight: bold;'>";
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
           if(data.length <= 0){
                    console.log("data Less :",data.length);
                    var Nodata = '<div style="text-align: center; font-weight: bold;">No Record Found</div>';
                    $("#admin_userslist").html(Nodata);
                }
                else{
                console.log("Search Results", data);
                clearTable();
                RecordAppendRowFunction(data.data);
                updatePaginationReport(data.total, page);
           }
            },
        });
    }
    function fetchColumn(){
        $.ajax({
            url: "Report_Search_FieldName",
            method: "POST",
            data: {SelectedReport: currentReport},
            dataType: "json",
            beforeSend: function () {
                $('#overlay').show();
            },
            success: function (data) {
                $('#overlay').hide();
                isSearching = true;
                console.log("Search Results", data);
                populateDropdown(data.data);
            },
        });
    }

    // function fetchColumn() {
    //     var currentSearchReport =$("#Report").val();
    //     $.ajax({
    //         url: "Report_Search_FieldName",
    //         type: 'POST',
    //         data: { SelectedReport: currentSearchReport}, // Convert data to JSON string
    //         dataType: "json",
    //         beforeSend: function () {
    //             $('#overlay').show();
    //         },
    //         success: function (data) {
    //             $('#overlay').hide();
    //             console.log("columnName", data);
    //             cleardropdown();
    //             populateDropdown(data.data);
    //         }
    //     });
    // }
    function cleardropdown() {
        var dropdown = $('#SearchOptions');
        dropdown.empty();
        dropdown.append('<option value="null">--Select--</option>');
    }
    function populateDropdown(columnNames) {
        var dropdown = $('#SearchOptions');

        // Clear existing options
        dropdown.empty();
        dropdown.append('<option value="" selected>--Select--</option>');
        // Populate the dropdown with column names
        for (var i = 0; i < columnNames.length; i++) {
            var option = $('<option></option>');
            option.val(columnNames[i].Field);
            option.text(columnNames[i].Field);
            dropdown.append(option);
        }
    }
});



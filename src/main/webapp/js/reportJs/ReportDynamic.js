var currentReport = "intakeReport1" ;
$(document).ready(function () {

    ajaxcall(currentReport,1);
    $("#cd-header").text("Intake Report 1");


    $("#Report").change(function () {
        currentReport = $(this).val();
    });


    // default max row
    $('#maxRows').on('change', function () {
        ajaxcall(currentReport,1); // Fetch data for the first page when the row count changes
    });

    // Event listener for pagination click
    $('.pagination').on('click', 'li', function () {
        console.log('Pagination Clicked');
        var pageNum = $(this).attr('data-page');
        if (pageNum === 'prev' || pageNum === 'next') {
            var currentPage = parseInt($('.pagination li.active').attr('data-page'));
            pageNum = (pageNum === 'prev') ? currentPage - 1 : currentPage + 1;
        }
        ajaxcall(currentReport,pageNum);
    });

    function clearTable() {
        $("#admin_userslist").empty();
    }
    $("#Report").change(function () {
        var selectedOption = $(this).val();
        var reportTitle;
        // To show the name in the jsp report name
        if (selectedOption === "intakeReport1") {
            reportTitle = "Intake Report 1"
        } else if (selectedOption === "intakeReport2") {
            reportTitle = "Intake Report 2"
        } else if (selectedOption === "intakeReport3") {
            reportTitle = "Intake Report 3"
        } else {
            reportTitle = "Report "
        }
        $("#cd-header").text(reportTitle);
        clearTable();
        ajaxcall(selectedOption,1);

    });

//search function on report
// to store the search column name temporarily
    var activeSearchColumn;
// Event listener for search icon click
    $('body').on('click', '.search-Icon', function () {
        console.log('Search icon clicked');
        var column = $(this).data('column');
        var placeholder = $(this).data('placeholder');
        var title = $(this).data('title');

        // Update the placeholder and title
        $('#appFilter').attr('placeholder', placeholder);
        $('#title2').text(title);

        activeSearchColumn = column;

    });
    $("#appFilter").on("input", function () {
        var column = activeSearchColumn;
        console.log(column);
        var searchTerm = $(this).val().toLowerCase();
        console.log(activeSearchColumn);
        console.log(searchTerm)
        searchData(column, searchTerm, currentReport);
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


function RecordAppendRowFunction(data) {
    if (data.length > 0) {
        var headers = Object.keys(data[0]);

        // Add table headers
        var headerRow = "<thead>" + "<tr>";
        $.each(headers, function (index, header) {
            headerRow += "<th>";
            headerRow += header;
            headerRow += `<i class="fa fa-search search-Icon" data-column="${header}" data-placeholder="Search ${header}" data-title="${header}"></i>`;
            headerRow += "</th>";
        });
        headerRow += "</tr>" + "</thead>";
        $("#admin_userslist").append(headerRow);

        $.each(data, function (key, value) {
            var row = "<tbody>" + "<tr>";
            $.each(headers, function (index, header) {
                row += "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>" + value[header] + "</label></td>";
            });
            //row += "<td style='text-align:center;vertical-align: middle;'><i class='fa fa-edit edit-icon' data-id='" + value.ID + "' data-finance='" + value.FinanceAppName + "'></i> <i class='fa fa-trash delete-icon' data-id='" + value.ID + "' data-finance='" + value.FinanceAppName + "'></i></td>";
            row += "</tr>" + "</tbody>";

            $("#admin_userslist").append(row);
        });

    }
}

function searchData(column, searchTerm , selectedReport) {
    var maxRows = parseInt($('#maxRows').val());
    var page = 1;
    $.ajax({
        url: "Report_Search_Servlet",
        type: 'POST',
        data: { column: column, searchTerm: searchTerm, maxRows: maxRows, page: page, SelectedReport: selectedReport},
        dataType: "json",
        beforeSend: function () {
            $('#overlay').show();
        },
        success: function (data) {
            $('#overlay').hide();

            console.log("Search Results", data);
            clearTable();
            RecordAppendRowFunction(data.data);
            updatePaginationReport(data.total, page);
        },
    });
}
});



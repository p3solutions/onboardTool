$(document).ready(function () {
    var isSearching = false;
    var currentSearchColumn;
    var currentSearchTerm;
    var currentPage = 1; // Default page number

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

        if (isSearching) {
            currentPage = 1;
            searchData(currentSearchColumn, currentSearchTerm, maxRow, currentPage);
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
            searchData(currentSearchColumn, currentSearchTerm, $('#maxRows').val(), currentPage);
        } else {
            fetchData(currentPage);
        }
    });

    // Event listener for search icon click
    $('#admin_userslist').on('click', '.search-Icon', function () {
        console.log('Search icon clicked');
        var column = $(this).data('column');
        var placeholder = $(this).data('placeholder');
        var title = $(this).data('title');

        // Update the placeholder and title
        $('#AppFilter').attr('placeholder', placeholder);
        $('#title2').text(title);

        currentSearchColumn = column;
        isSearching = true;
    });

    $("#AppFilter").on("input", function () {
        var column = currentSearchColumn;
        console.log(column);
        var searchTerm = $(this).val().toLowerCase();
        console.log(searchTerm);
        currentSearchTerm = searchTerm;
        searchData(column, searchTerm, $('#maxRows').val(), currentPage);
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

    function searchData(column, searchTerm, maxRows, page) {
        $.ajax({
            url: "Finance_List_Search_Servlet",
            type: 'POST',
            data: { column: column, searchTerm: searchTerm, maxRows: maxRows, page: page },
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
                headerRow += "<th>";
                headerRow += header;
                headerRow += `<i class="fa fa-search search-Icon" data-column="${header}" data-placeholder="Search ${header}" data-title="${header}"></i>`;
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
});

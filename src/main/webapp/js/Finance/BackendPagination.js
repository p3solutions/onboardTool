$(document).ready(function () {
    // Initial data fetch
    fetchData(1);
 
    // Event listener for the maxRows dropdown change
    $('#maxRows').on('change', function () {
        fetchData(1); // Fetch data for the first page when the row count changes
    });
 
    // Event listener for pagination click
    $('.pagination').on('click', 'li', function () {
        console.log('Pagination Clicked'); // Add this line
        var pageNum = $(this).attr('data-page');
        if (pageNum === 'prev' || pageNum === 'next') {
            var currentPage = parseInt($('.pagination li.active').attr('data-page'));
            pageNum = (pageNum === 'prev') ? currentPage - 1 : currentPage + 1;
        }
        fetchData(pageNum);
    });
 
    function fetchData(page) {
        console.log('Fetching data for page:', page); // Add this line
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
 
    function clearTable() {
        $("#admin_userslist").empty();
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
            headerRow += "<th>Action</th>";
            headerRow += "</tr>" + "</thead>";
            $("#admin_userslist").append(headerRow);
 
            // Add table rows
            $.each(data, function (key, value) {
                var row = "<tbody>" + "<tr>";
                $.each(headers, function (index, header) {
                    row += "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>" + value[header] + "</label></td>";
                });
                // Add two icons for each row
                row += "<td style='text-align:center;vertical-align: middle;'><i class='fa fa-edit edit-icon' data-id='" + value.ID + "' data-finance='" + value.FinanceAppName + "'></i> <i class='fa fa-trash delete-icon' data-id='" + value.ID + "' data-finance='" + value.FinanceAppName + "'></i></td>";
                row += "</tr>" + "</tbody>";
 
                $("#admin_userslist").append(row);
            });
 
            // Add click event handler for the edit icon
            $(".edit-icon").on("click", function () {
                var id = $(this).data("id");
                var finance = $(this).data("finance");
 
                // Send id and finance to the servlet for editing
                $.ajax({
                    url: "Edit_Servlet",
                    type: 'POST',
                    data: { id: id, finance: finance },
                    success: function (response) {
                        // Handle the response from the servlet
                        console.log("Edit response", response);
                        // You may want to refresh the table or update the UI based on the response
                    },
                });
            });
 
            // Add click event handler for the delete icon
            $(".delete-icon").on("click", function () {
                var id = $(this).data("id");
                var finance = $(this).data("finance");
 
                // Send id and finance to the servlet for deletion
                $.ajax({
                    url: "Delete_Servlet",
                    type: 'POST',
                    data: { id: id, finance: finance },
                    success: function (response) {
                        // Handle the response from the servlet
                        console.log("Delete response", response);
                        // You may want to refresh the table or update the UI based on the response
                    },
                });
            });
        }
    }
});
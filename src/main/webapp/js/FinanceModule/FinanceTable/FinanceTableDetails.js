$(document).ready(function(){	 
	fetchfinaceData(1);
	$('#maxRows').on('change', function () {
		console.log("maxRows");
        fetchfinaceData(1); // Fetch data for the first page when the row count changes
    });
    $('.pagination').on('click', 'li', function () {
        console.log('Pagination Clicked'); // Add this line
        var pageNum = $(this).attr('data-page');
        if (pageNum === 'prev' || pageNum === 'next') {
            var currentPage = parseInt($('.pagination li.active').attr('data-page'));
            pageNum = (pageNum === 'prev') ? currentPage - 1 : currentPage + 1;
        }
        fetchfinaceData(pageNum);
    });

});
function fetchfinaceData(page) {
        console.log('Fetching data for page:', page); // Add this line
        var maxRows = parseInt($('#maxRows').val());
        $.ajax({
            url: "FinanceTableDetailsServlet",
            type: 'POST',
            data: {page: page, maxRows: maxRows},
            dataType: "json",
            beforeSend: function () {
                $('#overlay').show();
            },
            success: function (data) {
                $('#overlay').hide();
                AddAndEdit();
                console.log("Users List Retrieve", data);
                clearTable();
                appendRowFunctionfinance(data.data);
                updatePaginationfinance(data.total, page);
            },
        });
    }

 
function clearTable() {
        $("#FinanceDetails").empty();
    }
function appendRowFunctionfinance(data){
  
    if (data.length > 0) {
            var headers = Object.keys(data[0]);
            // Add table headers
            var headerRow = "<thead>" + "<tr>";
            $.each(headers, function (index, header) {
               if (header === "Id") {
            		headerRow += "<th style='text-align:center;vertical-align: middle;display:none;width:auto'><label class='control-label' for=''>" + header + "</th>";
        		}
        		else{
					headerRow +="<th style='text-align:center;vertical-align: middle;width:auto'><label class='control-label ' for=''>"+ header + "</th>";
				}
	
              
            });
            headerRow += "<th style='text-align: center; display: none; vertical-align: middle; width:auto;' class='useractionheader'>Action</th>";
            headerRow += "</tr>" + "</thead>";
            $("#FinanceDetails").append(headerRow);
            // Add table rows
            $.each(data, function (key, value) {
                var row = "<tbody>" + "<tr>";
                $.each(headers, function (index, header) {
                   if (header === "Id") {
                    row += "<td style='text-align:center;vertical-align: middle;display:none;width:auto'><label class='control-label' for=''>" + value[header] + "</label></td>";
                	}
                	else{
					row += "<td style='text-align:center;vertical-align: middle;width:auto'><label class='control-label' for=''>" + value[header] + "</label></td>";
					}
                });
                row+= "<td class='useraction' style='text-align:center;vertical-align: middle;display:none;width:auto'><span class='glyphicon glyphicon-pencil editpopup'id='editpopup"+ Id +"'style='display:block;margin-left:-22px;'></span><span class='glyphicon glyphicon-trash deletepopup' style='float:right;display:block;margin-top:-13px;'></span>"+
                  "</td>";
                row += "</tr>" + "</tbody>";
                $("#FinanceDetails").append(row);
            });
            // Add click event handler for the edit icon

            // Add click event handler for the delete icon
        }
}
function updatePaginationfinance(totalRecords, currentPage) {
    var maxRows = parseInt($('#maxRows').val());
    var totalPages = Math.ceil(totalRecords / maxRows);
 
    var paginationContainer = $('.pagination');
    paginationContainer.empty();
 
    if (currentPage > 1) {
        paginationContainer.append('<li data-page="prev"><span> << <span class="sr-only">(current)</span></span></li>');
    }
 
    var startPage = Math.max(1, currentPage - 1); // Display up to 3 pages before the current page
    var endPage = Math.min(totalPages, startPage + 2); // Display up to 6 pages in total
 
    for (var i = startPage; i <= endPage; i++) {
        paginationContainer.append('<li data-page="' + i + '">\<span>' + i + '</span>\</li>');
    }
 
    if (currentPage < totalPages) {
        paginationContainer.append('<li data-page="next"><span> >> <span class="sr-only">(current)</span></span></li>');
    }
 
    paginationContainer.find('[data-page="' + currentPage + '"]').addClass('active');
}
var searchvalue=null;
console.log("searchvalue : ",searchvalue);

function sendsearchfunctionvalue(searchflag){
	searchvalue = searchflag;
	console.log("searchvalue function :",searchvalue);
}

$(document).ready(function () {
	
	fetchData(1);
	var category = "Intake";
    $("#category").change(function () {
         category = $(this).val();
        console.log("category : ", category);
        fetchData(1);
        searchvalue=false;
    });  
    $('#maxRows').on('change', function () {
		if(searchvalue === true){
        console.log("maxRows true")
        fetchsearchvalue(gcolname,gsvalue,pageNum);
        }
        else{
		fetchData(1); 
		}
        
    });
    $('.pagination').on('click', 'li', function () {
        var pageNum = $(this).attr('data-page');
        if (pageNum === 'prev' || pageNum === 'next') {
            var currentPage = parseInt($('.pagination li.active').attr('data-page'));
            pageNum = (pageNum === 'prev') ? currentPage - 1 : currentPage + 1;
        }
        fetchData(pageNum);
    });
    $('.Searchpagination').on('click', 'li', function () {
        console.log('Pagination Clicked'); // Add this line
        var pageNum = $(this).attr('data-page');
        if (pageNum === 'prev' || pageNum === 'next') {
            var currentPage = parseInt($('.Searchpagination li.active').attr('data-page'));
            pageNum = (pageNum === 'prev') ? currentPage - 1 : currentPage + 1;
        }
        fetchsearchvalue(gcolname,gsvalue,pageNum);
    });
    function fetchData(page) {
        console.log('Fetching data for page:', page); // Add this line
        var maxRows = parseInt($('#maxRows').val());
        
        category = category || "Intake";
        
        $.ajax({
            url: "Compliance",
            type: 'POST',
            data: {page: page, maxRows: maxRows, category: category},
            dataType: "json",
            beforeSend: function () {
                $('#overlay').show();
            },
            success: function (data) {
                $('#overlay').hide();
                console.log("Users List Retrieve", data);
                $("#dynamicHeader").empty();
                appendRowFunction(data.data);
                updatePagination(data.total, page);
            },
        });
    }
 

function updatePagination(totalRecords, currentPage) {
    var maxRows = parseInt($('#maxRows').val());
    var totalPages = Math.ceil(totalRecords / maxRows);

    var paginationContainer = $('.Searchpagination');
    paginationContainer.empty();
     var paginationContainer = $('.pagination');
    paginationContainer.empty();

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
        }
        else if(data.length <= 0){
			console.log("data Less :",data.length);
            var Nodata = '<div style="text-align: center; font-weight: bold;">No Record Found</div>';
    		$("#dynamicHeader").html(Nodata);
		}
    }
});

function makeAjaxRequest(category) {
    $.ajax({
        url: "Compliance",
        type: 'POST',
        data: { category: category},
        dataType: "json",
        beforeSend: function () {
            $('#overlay').show();
        },
        success: function (data) {
            $('#overlay').hide();
            globalCategory = category;
            console.log("globalCategory : ",globalCategory);
            console.log("Data retrieved:", data);
            console.log("category 2", category);
            filterfunction(data, category);

 

            if (data.error) {
                $("#dynamicHeader").html("Error: " + data.error);
            } else {
                var tableHtml = constructTable(data);
                var table = tableHtml;
                console.log("tableHtml----1213-", table);
                table = getPaginationcom(table);
                $("#dynamicHeader").html(tableHtml);
                getPaginationcom('#dynamicHeader');
            }
        },
    });
}

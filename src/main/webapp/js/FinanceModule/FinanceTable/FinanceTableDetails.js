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
    /*$.ajax({
        url: "FinanceTableDetailsServlet",
        type: 'POST',
        dataType: "json",
        beforeSend : function(){
         $('#overlay').show();
  },
        success: function(data) {
		$('#overlay').hide();
            console.log("FinanceDetails : ",data);
            AddAndEdit()
            if (!$.isArray(data)) {
                data = [data];
            }
            appendRowFunction(data);
            },
    });*/
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
    /*$.each(data, function(key, value){
	    var Project_Number = value.Project_Number;
        var Phase = value.Phase;
        var Application_Name = value.Application_Name;
        var Software_and_Licensing = value.Software_and_Licensing;
        var Contract_Date = value.Contract_Date;
        var scope_of_infrastructure = value.scope_of_infrastructure;
        var infrastructure_Cost_Savings = value.infrastructure_Cost_Savings;
        var Cost_Avoidance = value.Cost_Avoidance;   
        var Cost_of_Archive = value.Cost_of_Archive;
        var CBA = value.CBA;
        var Funding_approval = value.Funding_approval;
        var Funding_type = value.Funding_type;
        var Status = value.Status;
        var Id = value.Id;
        var row = "<tr>"+
                "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>"+Project_Number+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Phase+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Application_Name+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Software_and_Licensing+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Contract_Date+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+scope_of_infrastructure+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+infrastructure_Cost_Savings+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Cost_Avoidance+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Cost_of_Archive+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+CBA+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Funding_approval+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Funding_type+"</label>" +
                 "</td>"+
                 "<td style='text-align:center;vertical-align: middle;'><label class='control-label ' for=''>"+Status+"</label>" +
                 "</td>"+
                  "<td style='text-align:center;vertical-align: middle;display:none;'><label class='control-label ' for=''>"+Id+"</label>" +
                 "</td>"+
                  "<td class='useraction' style='text-align:center;vertical-align: middle;display:none;'><span class='glyphicon glyphicon-pencil editpopup'id='editpopup"+ Id +"'style='display:block;margin-left:-22px;'></span><span class='glyphicon glyphicon-trash deletepopup' style='float:right;display:block;margin-top:-13px;'></span>"+
                  "</td>"+
                  "</tr>";
                 console.log("row :  ",row);
                  $("#FinanceDetails").append(row);

    }); */
    if (data.length > 0) {
            var headers = Object.keys(data[0]);
            // Add table headers
            var headerRow = "<thead>" + "<tr>";
            $.each(headers, function (index, header) {
                headerRow += "<th>" + header + "</th>";
            });
            headerRow += "<th style='text-align: center; display: none; vertical-align: middle; width: 15%;' class='useractionheader'>Action</th>";
            headerRow += "</tr>" + "</thead>";
            $("#FinanceDetails").append(headerRow);
            // Add table rows
            $.each(data, function (key, value) {
                var row = "<tbody>" + "<tr>";
                $.each(headers, function (index, header) {
                    row += "<td style='text-align:center;vertical-align: middle;'><label class='control-label' for=''>" + value[header] + "</label></td>";
                });
                row+= "<td class='useraction' style='text-align:center;vertical-align: middle;display:none;'><span class='glyphicon glyphicon-pencil editpopup'id='editpopup"+ Id +"'style='display:block;margin-left:-22px;'></span><span class='glyphicon glyphicon-trash deletepopup' style='float:right;display:block;margin-top:-13px;'></span>"+
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
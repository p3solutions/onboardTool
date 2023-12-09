$(document).ready(function () {
    // Event listener for button click
  $(document).on('click', '#Exportwholedata', function () {
    console.log('Button Clicked');
    var reportname = document.getElementById('category').value;
    fetchexportdata(reportname);  
});

    function fetchexportdata(reportname) {
        console.log('Export data for page:', reportname);
        $.ajax({
            url: "ReportExportServlet",
            type: 'POST',
            data: { reportname: reportname },
            dataType: "json",
            beforeSend: function () {
                console.log('Before sending AJAX request');
                $('#overlay').show();
            },
            success: function (data) {
                console.log("Export data:", data);
                exportToCSV(data);
                closeexportPopup();
                $('#overlay').hide();
            }
        });
    }
});

function showexportPopup() {
    var popup = document.getElementById('myModal');
    var overlaySearch = document.getElementById('overlaySearch');
    popup.classList.add('active');
    overlaySearch.classList.add('active');
}
function closeexportPopup() {
    var popup = document.getElementById('myModal');
    var overlaySearch = document.getElementById('overlaySearch');
    popup.classList.remove('active');
    overlaySearch.classList.remove('active');
    
}

function exportToCSV(jsonArray) {
    var filename = document.getElementById('category').value; // Get the selected value from the dropdown

    var csvContent = "data:text/csv;charset=utf-8,";

    // Extract headers from the first object in the array
    const headers = Object.keys(jsonArray[0]);

    // Build CSV content
    csvContent += headers.join(',') + "\r\n";

    jsonArray.forEach(function (obj) {
        var row = headers.map(key => {
            // Escape commas in values
            var value = obj[key].includes(',') ? `"${obj[key]}"` : obj[key];
            return value;
        }).join(',');

        csvContent += row + "\r\n";
    });

   

 function getFormattedDate() {
        const today = new Date();
        const day = String(today.getDate()).padStart(2, '0');
        const month = String(today.getMonth() + 1).padStart(2, '0'); // Month is zero-based
        const year = today.getFullYear();

        return `${day}/${month}/${year}`;
    }

    var formattedDate = getFormattedDate();
    console.log("Formatted Date:", formattedDate);

    var encodedUri = encodeURI(csvContent);
    var link = document.createElement("a");

    link.setAttribute("href", encodedUri);
   link.setAttribute("download", filename+"("+ formattedDate +") .csv"); // Set the filename based on the formatted date

    document.body.appendChild(link);
    link.click();
}

function exportdatatocsv() {
	closeexportPopup();
    var filename = document.getElementById('category').value; // Get the selected value from the dropdown

    var table = document.querySelector('.table');
    var data = [];

    for (var i = 0; i < table.rows.length; i++) {
        var row = table.rows[i];
        var rowData = [];

        for (var j = 0; j < row.cells.length; j++) {
            rowData.push(row.cells[j].textContent.trim());
        }

        data.push(rowData);
    }

    var csvContent = "data:text/csv;charset=utf-8,";

    data.forEach(function(rowArray) {
        var row = rowArray.join(",");
        csvContent += row + "\r\n";
    });

    function getFormattedDate() {
        const today = new Date();
        const day = String(today.getDate()).padStart(2, '0');
        const month = String(today.getMonth() + 1).padStart(2, '0'); // Month is zero-based
        const year = today.getFullYear();

        return `${day}/${month}/${year}`;
    }

    var formattedDate = getFormattedDate();
    console.log("Formatted Date:", formattedDate);

    var encodedUri = encodeURI(csvContent);
    var link = document.createElement("a");

    link.setAttribute("href", encodedUri);
    link.setAttribute("download", filename+"("+ formattedDate +") +.csv"); // Set the filename based on the formatted date

    document.body.appendChild(link);
    link.click();
}

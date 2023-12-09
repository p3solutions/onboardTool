function exportToCSV() {
        // Get the table element
        var table = document.querySelector('.table');

        // Create an empty array to store the data
        var data = [];

        // Iterate through the rows and cells of the table
        var rows = table.querySelectorAll('tr');
        rows.forEach(function (row) {
            var rowData = [];
            var cells = row.querySelectorAll('td');
            cells.forEach(function (cell) {
                rowData.push(cell.textContent.trim());
            });
            data.push(rowData.join(','));
        });

        // Create a CSV string
        var csvContent = "data:text/csv;charset=utf-8," + data.join('\n');

        // Create a data URI for the CSV content
        var encodedUri = encodeURI(csvContent);

        // Create a link element and trigger the download
        var link = document.createElement("a");
        link.setAttribute("href", encodedUri);
        link.setAttribute("download", "table_data.csv");
        document.body.appendChild(link);

        // Simulate a click on the link to trigger the download
        link.click();
    }
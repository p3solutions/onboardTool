$(document).ready(function () {
    // Event listener for the download button
    $('#submitExport').on('click', function () {
        var decision = $('#exportFormat').val();
        var FileName = "Finance Module"
        if (decision==="totalRecords"){
            console.log("The Export on total records is in progress");
            $.ajax({
                url: "FinanceExport",
                type: 'POST',
                dataType: "json",
                success: function (data) {
                    // Convert JSON data to CSV format
                    var csvContent = convertJsonToCsv(data);

                    // Create a Blob from the CSV data
                    var blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });

                    // Create a download link for the Blob
                    var a = document.createElement("a");
                    a.href = URL.createObjectURL(blob);
                    a.download = FileName + ".csv"; // Use the dynamic filename

                    // Trigger a click event on the link to start the download
                    a.click();
                }
            });
        }
        else if(decision==="currentView"){
            exportToCSVFinance();
            console.log("The Export on Current View is in progress");
        }
        else {
            console.log("The Export progress is interrupted");
        }
    });

    // Function to convert JSON data to CSV format
    function convertJsonToCsv(jsonData) {
        var csvRows = [];

        // Header row
        var headers = Object.keys(jsonData[0]);
        csvRows.push(headers.join(','));

        // Data rows
        jsonData.forEach(function (row) {
            var values = headers.map(function (header) {
                return row[header];
            });
            csvRows.push(values.join(','));
        });

        return csvRows.join('\n');
    }
});

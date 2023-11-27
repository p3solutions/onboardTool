$(document).ready(function () {
    // Event listener for the download button
    $('#exportButton').on('click', function () {
        var dynamicFileName =$('#Report').val();
        $.ajax({
            url: "ReportExport",
            type: 'POST',
            data: { selectedOption: dynamicFileName}, // Adjust parameters as needed
            dataType: "json",
            success: function (data) {
                // Convert JSON data to CSV format
                var csvContent = convertJsonToCsv(data);

                // Create a Blob from the CSV data
                var blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });

                // Create a download link for the Blob
                var a = document.createElement("a");
                a.href = URL.createObjectURL(blob);
                a.download = dynamicFileName + ".csv"; // Use the dynamic filename

                // Trigger a click event on the link to start the download
                a.click();
            }
        });
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

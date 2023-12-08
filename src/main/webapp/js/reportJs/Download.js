// $(document).ready(function () {
//     // Event listener for the download button
//     $('#submitExport').on('click', function () {
//         var decision = $('#exportFormat').val();
//         var dynamicFileName =$('#Report').val();
//         if (decision==="totalRecords"){
//             console.log("The Export on total records is in progress");
//         $.ajax({
//             url: "ReportExport",
//             type: 'POST',
//             data: { selectedOption: dynamicFileName}, // Adjust parameters as needed
//             dataType: "json",
//             success: function (data) {
//                 // Convert JSON data to CSV format
//                 var csvContent = convertJsonToCsv(data);
//
//                 // Create a Blob from the CSV data
//                 var blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });
//
//                 // Create a download link for the Blob
//                 var a = document.createElement("a");
//                 a.href = URL.createObjectURL(blob);
//                 a.download = dynamicFileName + ".csv"; // Use the dynamic filename
//
//                 // Trigger a click event on the link to start the download
//                 a.click();
//             }
//         });
//         }
//         else if(decision==="currentView"){
//             exportToCSV();
//             console.log("The Export on Current View is in progress");
//         }
//         else {
//             console.log("The Export progress is interrupted");
//         }
//     });
//
//     // Function to convert JSON data to CSV format
//     function convertJsonToCsv(jsonData) {
//         var csvRows = [];
//
//         // Header row
//         var headers = Object.keys(jsonData[0]);
//         csvRows.push(headers.join(','));
//
//         // Data rows
//         jsonData.forEach(function (row) {
//             var values = headers.map(function (header) {
//                 return row[header];
//             });
//             csvRows.push(values.join(','));
//         });
//
//         return csvRows.join('\n');
//     }
// });
$(document).ready(function () {
    // Event listener for the download button
    $('#submitExport').on('click', function () {
        var decision = $('#exportFormat').val();
        var dynamicFileName = $('#Report').val();
        var downloadNameElement = document.getElementById("cd-header");
        var downloadName = downloadNameElement.textContent;

        if (decision === "totalRecords") {
            console.log("The Export on total records is in progress");
            $.ajax({
                url: "ReportExport",
                type: 'POST',
                data: { selectedOption: dynamicFileName }, // Adjust parameters as needed
                dataType: "json",
                success: function (data) {
                    // Convert JSON data to CSV format
                    var csvContent = convertJsonToCsv(data);

                    // Create a Blob from the CSV data
                    var blob = new Blob([csvContent], { type: 'text/csv;charset=utf-8;' });

                    // Create a download link for the Blob
                    var a = document.createElement("a");

                    // Generate dynamic file name with current date
                    var currentDate = new Date();
                    var formattedDate = (currentDate.getMonth() + 1).toString().padStart(2, '0') +
                        '/' +
                        (currentDate.getDate()).toString().padStart(2, '0') +
                        '/' +
                        currentDate.getFullYear();

                    a.href = URL.createObjectURL(blob);
                        a.download = downloadName + '_' + formattedDate + ".csv"; // Use the dynamic filename with date

                    // Trigger a click event on the link to start the download
                    a.click();
                }
            });
        } else if (decision === "currentView") {
            exportToCSV();
            console.log("The Export on Current View is in progress");
        } else {
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

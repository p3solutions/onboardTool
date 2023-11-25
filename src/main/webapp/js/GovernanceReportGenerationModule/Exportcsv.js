$(document).ready(function () {
    // Event listener for button click
  $(document).on('click', '#exportbutton', function () {
    console.log('Button Clicked');
    var reportname = document.getElementById('category').value;
    fetchexportdata(reportname);
});

    function fetchexportdata(reportname) {
        console.log('Export data for page:', reportname);
        $.ajax({
            url: "ExportReportgenerationservletGovernance",
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
                $('#overlay').hide();
            }
        });
    }
});


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

    var encodedUri = encodeURI(csvContent);
    var link = document.createElement("a");

    link.setAttribute("href", encodedUri);
    link.setAttribute("download", filename + ".csv"); // Set the filename based on the dropdown value

    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
}


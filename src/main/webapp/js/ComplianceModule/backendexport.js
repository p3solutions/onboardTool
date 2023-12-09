$(document).ready(function () {
    // Event listener for button click
    $(document).on('click', '#Exportwholedata', function () {
        console.log('Button Clicked');
        console.log('Before calling fetchExportData');

        var reportname = document.getElementById('category').value;
        fetchExportData(reportname);
    });

    function fetchExportData(reportname) {
        console.log('Export data for page:', reportname);
        $.ajax({
            url: "Intake_report_export_servlet",
            type: 'POST',
            data: { reportname: reportname },
            dataType: "json",
            success: function (data) {
                console.log("Export data:", data);
                exportToCSV(data, reportname);
                $('#overlay').hide();
            },
        });
    }

    function exportToCSV(data, reportname) {
        // Convert data to CSV content
        const csvContent = convertDataToCSV(data);

        // Get the current date in MMDDYYYY format
        const currentDate = new Date().toLocaleDateString('en-US', { month: '2-digit', day: '2-digit', year: 'numeric' }).replace(/\//g, '');

        // Set the response headers for CSV file download
        const csvData = "data:text/csv;charset=utf-8," + encodeURIComponent(csvContent);

        const link = document.createElement("a");

        if (link.download !== undefined) {
            // Include the current date in the filename
            const filename = reportname + '_' + currentDate + '_data.csv';

            link.setAttribute("href", csvData);
            link.setAttribute("download", filename);
            link.style.visibility = 'hidden';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);
        }
    }

    function convertDataToCSV(data) {
        // Your logic to convert data to CSV content goes here
        // For example, assuming data is an array of objects:
        if (Array.isArray(data)) {
            // For array of objects
            const headers = Object.keys(data[0]).join(',');
            const rows = data.map(obj => Object.values(obj).join(','));
            return headers + '\n' + rows.join('\n');
        } else if (typeof data === 'string') {
            // If the server directly returns CSV content
            return data;
        } else {
            console.error('Unsupported data format for CSV export');
            return '';
        }
    }
});

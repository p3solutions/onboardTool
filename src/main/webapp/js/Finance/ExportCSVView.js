function exportToCSVFinance() {

	// Get the table element by its ID
	var table = document.getElementById("admin_userslist");
	var downloadNameElement = document.getElementById("cd-header");
	var downloadName = downloadNameElement.textContent;
	// Create an empty CSV string
	var csvContent = "";
	// Loop through each row in the table
	for (var i = 0; i < table.rows.length; i++) {
		var row = table.rows[i];
		// Loop through each cell in the row
		for (var j = 0; j < row.cells.length - 1; j++) {
			// Add the cell value to the CSV string
			csvContent += row.cells[j].textContent + ",";
		}
		// Add a new line character after each row
		csvContent += "\n";

	}

	// Generate dynamic file name with the current date

	var currentDate = new Date();

	var formattedDate =

		(currentDate.getMonth() + 1).toString().padStart(2, '0') +

		'/' +

		(currentDate.getDate()).toString().padStart(2, '0') +

		'/' +

		currentDate.getFullYear();

	// Create a Blob object containing the CSV data

	var blob = new Blob([csvContent], { type: "text/csv" });

	// Create a download link for the Blob

	var a = document.createElement("a");

	a.href = URL.createObjectURL(blob);

	a.download = downloadName + '_' + formattedDate + ".csv";

	// Trigger a click event on the link to start the download

	a.click();

}


$(document).ready(function() {
    $("#search").on("keyup", function() {
        var searchText = $(this).val().toLowerCase();

        $("table tbody tr").each(function() {
            var row = $(this);
            var text = row.text().toLowerCase();
            
            if (text.includes(searchText)) {
                row.show();
            } else {
                row.hide();
            }
        });
    });
});

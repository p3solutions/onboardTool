$(document).on('keyup focus', '#financeappname', function () {
    var inputText = $(this).val();
    console.log("check the name");
    console.log(inputText);
    if (inputText.trim() === "") {
        // If the input box is empty, clear the suggestion dropdown & the data empty
        clearSuggestionDropdown();
        clearDropdownStyles();
    } else {
        fetchSuggestions(inputText);
    }

    function fetchSuggestions(inputText) {
        $.ajax({
            url: "AppNameFilterServlet",
            type: "POST",
            data: {name: inputText},
            success: function (data) {
                displaySuggestions(data);
            }
        });
    }

    function clearSuggestionDropdown() {
        $("#suggestionDropdown").empty();
    }

    function displaySuggestions(suggestions) {
        enableDropdownStyles();
        var suggestionDropdown = $("#suggestionDropdown");
        suggestionDropdown.empty();

        if (suggestions.length > 0) {
            var ul = $("<ul class='dropdown suggestionEnabled'></ul>");

            for (var i = 0; i < suggestions.length; i++) {
                var suggestion = suggestions[i];
                var li = $("<li class='suggestion'>" + suggestion.Application_Name + "</li>");

                li.on('click', function () {
                    var selectedName = suggestion.Application_Name;
                    var selectedId = suggestion.Id;
                    //setting the value to session in jsp
                    $("#selectedName").val(selectedName);
                    $("#selectedId").val(selectedId);
                    console.log("check the application name & Id");
                    console.log(selectedName);
                    console.log(selectedId);
                    // end of setting session attribute
                    $("#financeappname").val(selectedName);
                    var nameIn = $("#financeappname").val();
                    suggestionDropdown
                    suggestionDropdown.empty();
                    clearDropdownStyles();
                    if (selectedName === nameIn) {
                        // ajaxCall(selectedId,selectedName); // to fetch the phase and other details
                        financeSetSessionAttribute(selectedId,selectedName);
                        ajaxTemplateCallNoData("Retrieve");
                        ajaxscrcall(selectedId);
                        $("#financeappname").prop('disabled', true);
                        $('#financeappname').disable();
                    }
                });
                ul.append(li);
            }
            suggestionDropdown.append(ul);
        //    enableDropdownStyles();
        }
        $("#phase").prop('disabled', true);
        $('#phase').disable();
    }
function disableFields(){
    $("#financeappname").prop('disabled', true);
    $('#financeappname').disable();
    $("#phase").prop('disabled', true);
    $('#phase').disable();
    $("#cba").prop('disabled', true);
    $('#cba').disable();
    $("#status").prop('disabled', true);
    $('#status').disable();
}

    function financeSetSessionAttribute(selectedId,selectedName) {
        // Add an AJAX call to send data to the server
        $.ajax({
            url: "FinanceSetSessionAttributeServlet", // Replace with your server-side endpoint
            type: "POST",
            data: {selectedId: selectedId,selectedName:selectedName },
            success: function (data) {
                // Handle success if needed
                $("#UploadFiles").attr('disabled',false);
            },
            error: function (error) {
                // Handle error if needed
            }
        });
    }

    function enableDropdownStyles() {

            $('#suggestionDropdown').show();
            var inputPosition = $("#financeappname").position();
            $('#suggestionDropdown').css({
                position: "absolute",
                top: inputPosition.top + $("#financeappname").outerHeight(),
                left: inputPosition.left,
                background: "white", // Set plain white background
            });

    }
    function clearDropdownStyles() {
        var dropdown = document.getElementById('suggestionDropdown');
      //  dropdown.classList.remove('suggestionEnabled');
      //  dropdown.classList.remove('suggestionEnabled1');
    }

});
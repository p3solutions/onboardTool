$(document).on('keyup focus', '#financeappname', function () {
    var inputText = $(this).val();
    console.log("check the name");
    console.log(inputText);
    if (inputText.trim() === "") {
        // If the input box is empty, clear the suggestion dropdown & the data empty
        clearSuggestionDropdown();
    } else {
        fetchSuggestions(inputText);
    }

    function fetchSuggestions(inputText) {
        $.ajax({
            url: "AppNameFilterServlet",
            type: "POST",
            data: {name: inputText},
            success: function (data) {
                console.log("AppNameFilter data : ")
                console.log(data)
                displaySuggestions(data);
            }
        });
    }

    function clearSuggestionDropdown() {

        $("#suggestionDropdown").removeClass("financeSuggestionScrollBar");
        $("#suggestionDropdown").empty();
    }

    function displaySuggestions(suggestions) {
        var suggestionDropdown = $("#suggestionDropdown");
        suggestionDropdown.empty();

        if (suggestions.length > 0) {
            for (var i = 0; i < suggestions.length; i++) {
                (function (suggestion) {
                    var suggestionText = suggestion.Application_Name;
                    var suggestionId = suggestion.Id;

                    var suggestionElement = $("<div class='suggestion'>" + suggestionText + "</div>");
                    suggestionElement.on('click', function () {
                        $(".hidden-contents").show();
                        $("#inputFieldsRoles").show();
                        var selectedName = suggestionText;
                        var selectedId = suggestionId;

                        // Set values to session in JSP
                        $("#selectedName").val(selectedName);
                        $("#selectedId").val(selectedId);

                        console.log("Check the application name & Id");
                        console.log(selectedName);
                        console.log(selectedId);
                        // End of setting session attribute

                        $("#financeappname").val(selectedName);
                        financeSetSessionAttribute(selectedId, selectedName);

                        $("#suggestionDropdown").removeClass("financeSuggestionScrollBar");
                        $("#suggestionDropdown").hide();
                        $("#financeappname").prop('disabled', true);
                    });

                    // Highlight matching letters
                    var inputText = $("#financeappname").val();
                    var startIndex = suggestionText.toLowerCase().indexOf(inputText.toLowerCase());
                    var highlightedText = suggestionText.substring(0, startIndex) +
                        "<Strong>" + suggestionText.substring(startIndex, startIndex + inputText.length) + "</Strong>" +
                        suggestionText.substring(startIndex + inputText.length);
                    suggestionElement.html(highlightedText);

                    suggestionDropdown.append(suggestionElement);
                })(suggestions[i]);
            }

            enableDropdownStyles();
        }
    }


    function financeSetSessionAttribute(selectedId,selectedName) {
        // Add an AJAX call to send data to the server
        $.ajax({
            url: "FinanceSetSessionAttributeServlet", // Replace with your server-side endpoint
            type: "POST",
            data: {selectedId: selectedId,selectedName:selectedName },
            success: function (data) {
                ajaxTemplateCallNoData("Retrieve");
                ajaxscrcall(selectedId);
                // Handle success if needed
                $("#UploadFiles").attr('disabled',false);
            },
            error: function (error) {
                // Handle error if needed
            }
        });
    }

    function enableDropdownStyles() {
        var suggestionDropdown = $('#suggestionDropdown');
        suggestionDropdown.addClass("financeSuggestionScrollBar");
        suggestionDropdown.show();

        // var inputPosition = $("#financeappname").position();
        var inputWidth = $("#financeappname").outerWidth();
        suggestionDropdown.css({
            // top: inputPosition.top + $("#financeappname").outerHeight(),
            // left: inputPosition.left,
            // background: "white",
            width: inputWidth + "px"
            // zIndex: 1000
        });
    }
});
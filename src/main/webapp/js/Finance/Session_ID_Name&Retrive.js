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
    //    enableDropdownStyles();
        var suggestionDropdown = $("#suggestionDropdown");
        suggestionDropdown.empty();

        if (suggestions.length > 0) {
            var ul = $("<ul>");

            for (var i = 0; i < suggestions.length; i++) {
                (function (suggestion) {
                var suggestion = suggestions[i];
                var li = $("<li class='suggestion'>" + suggestion.Application_Name + "</li>");

                li.on('click', function () {
                    $("#inputFieldsRoles").show();
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
                    // suggestionDropdown
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
                })(suggestions[i]);
            }
            enableDropdownStyles();
            suggestionDropdown.append(ul);

        }

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
        var suggestionDropdown = $('#suggestionDropdown');
        suggestionDropdown.show();

        var inputPosition = $("#financeappname").position();

        suggestionDropdown.css({
            position: "absolute",
            top: inputPosition.top + $("#financeappname").outerHeight(),
            left: inputPosition.left,
            background: "white", // Set plain white background
            zIndex: 1000 // Adjust the z-index value as needed to overlay above other content
        });
    }

    function clearDropdownStyles() {
        var dropdown = document.getElementById('suggestionDropdown');
      //  dropdown.classList.remove('suggestionEnabled');
      //  dropdown.classList.remove('suggestionEnabled1');
    }

});
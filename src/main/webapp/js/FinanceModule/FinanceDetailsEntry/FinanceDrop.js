
var selectedData = null;
var data = null; 
var Id = null;
var filteredId = null; 
var selectedValue=null;
$(document).on('keyup', '#appName', function () {
    var typingTimer;
    var doneTypingInterval = 500;
    var minCharsToFetch = 2;

    // Adding a click event listener for the suggestions
    $(document).on("click", "#suggestionsContainer ul li", function () {
        // Retrieve the selected value from the clicked suggestion
         selectedValue = $(this).text();
console.log("The selected value now",selectedValue);
        // Update the input field and disable it
        $("#appName").val(selectedValue);
        $("#appName").prop("disabled", true);

        // Store the selected data (value and filtered id) globally
        filteredId = getFilteredId(selectedValue, data);
        selectedData = { value: selectedValue, Id: filteredId };

        console.log("The selected value: ", selectedValue);
        console.log("The selected data: ", selectedData);
        console.log("The filtered ID: ", filteredId);

       if(filteredId!=null){
	sendFilteredIdToBackend(filteredId,selectedValue);

}
        
        // Clear suggestions after selection
        $("#suggestionsContainer").empty();
    });

    $("#appName").on("input", function (e) {
        clearTimeout(typingTimer);
        var appNameValue = $(this).val();

        // Check if the entered text has reached the minimum characters required
        if (appNameValue.length >= minCharsToFetch) {
            typingTimer = setTimeout(function () {
                sendAppNameToBackend(appNameValue);
            }, doneTypingInterval);
        } else {
            // Clear suggestions if the entered text is less than the minimum
            var suggestionsContainer = $("#suggestionsContainer");
            suggestionsContainer.empty();
        }
    });

    function sendAppNameToBackend(appNameValue) {
        $.ajax({
            url: "FinanceAppNameDropdownServlet", 
            type: 'POST',
            data: { appName: appNameValue },
            dataType: "json",
            success: function (responseData) {
              
                data = responseData;
                handleBackendResponse();
            },
            error: function (error) {
                console.error("Error:", error);
            }
        });
    }







    function handleBackendResponse() {
        var suggestionsContainer = $("#suggestionsContainer");
        suggestionsContainer.empty();

        if (data && data.length > 0) {
            var ul = $("<ul>");
            data.forEach(function (obj) {
              
                var li = $("<li>").html("<strong>" + obj.value + "</strong>").data("id", obj.id);
                ul.append(li);
            });

           
            var inputPosition = $("#appName").position();
            suggestionsContainer.css({
                position: "absolute",
                top: inputPosition.top + $("#appName").outerHeight(),
                left: inputPosition.left,
                background: "white", 
            });

            suggestionsContainer.append(ul);
        }
    }

   
    function getFilteredId(selectedValue, data) {
      
        if (data) {
            console.log("the value inside filter", data)
            console.log("the value inside filter", selectedValue)
           
            var matchingObject = data.find(function (obj) {
                return obj.value === selectedValue;
            });

          
            filteredId = matchingObject ? matchingObject.Id : null;
            console.log("It comes to if", filteredId );
            sessionStorage.setItem('filteredId', filteredId);
            return filteredId;

        } else {
            console.error("Data is not defined.");

            console.log("It comes to else");
            return null;
            
        }
    }
    $("#SelectedId").val(filteredId)
    
});
function sendFilteredIdToBackend(filteredId, selectedValue) {
   console.log("The value inside backend function",selectedValue)
    $.ajax({
        url: "FinancePhaseDropServlet", 
        type: 'POST',
        data: {  selectedValue: selectedValue,filteredId: filteredId },
        dataType: "json",
        success: function (responseData) {
           
            console.log("responseData", responseData);
			
			
 		
 			
 			 var ProjectNumber = responseData[0].Project_Number;
          var applicationStatus =responseData[0].Application_Status;
		  var phaseStatus = responseData[0].Phase_Status;

           
            console.log("applicationStatus", applicationStatus);
            console.log("phaseStatus", phaseStatus);

           
            $("#Status").val(applicationStatus).prop("disabled", true);
           $("#ProjectNumber").val(ProjectNumber).prop("disabled", true);
 $("#Phase").val(phaseStatus).prop("disabled", true);
        },
        error: function (error) {
            console.error("Error:", error);
        }
    });
}
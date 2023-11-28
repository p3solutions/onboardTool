$(document).ready(function () {
    $('#submitSearch').hide();
    // to check whether the condition is selected
    var selectedRadioButton = document.querySelector('input[name="condition"]:checked');

    if (selectedRadioButton) {
        console.log(selectedRadioButton.value + ' is selected');
        $('#submitSearch').show();
    } else {
        console.log('No option is selected');
        $('#submitSearch').hide();
    }
    var flag =false;
    $('#SearchOptions').on('change', function () {
    //     var value =$(this).val();
    // if (value === "currentView") {
    //
    //      $('#submitSearch').hide();
    //     console.log(value+" Button value")
    // }
    // else{
    //     $('#submitSearch').show();
    // }





    });


});
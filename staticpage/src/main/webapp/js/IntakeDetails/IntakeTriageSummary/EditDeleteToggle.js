$('#DeleteSummary').click(function()
    {
        $(".hidepencilSummary").hide();
        $(".hidedeleteSummary").toggle();
    });
    $('#EditSummary').click(function()
    {
        $(".hidedeleteSummary").hide();
        $(".hidepencilSummary").toggle();
    });
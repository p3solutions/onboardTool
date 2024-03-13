$(document).ready(function(){5
    var url_string=window.location.href;
    var modulecategory=url_string.substr(url_string.indexOf("=") + 1)
    console.log("Module Category",modulecategory);
    $(document).on('click', '.addClass', function(){
        var index = $(this).index('.addClass');
        $(".myDropdown").eq(index).hide();
        var oppName = $('.oppName').eq(index).val();
        $('#oppNameId').val(oppName);
        $('#existWaveSeqNum').val(index);
        $('#addWaveBtnId').click();
        $('#overlay').hide();
        $('#Scroll-Button').hide();
        $('#phase').selectpicker();
        $('#wave').selectpicker();
        $('#existWaveTypesId').selectpicker();

    });
    if(modulecategory!="Intake" && modulecategory!="Apps" )
    {
        $.ajax({
            url: "OpportunityListServlet",
            type: 'POST',
            dataType: "json",
            success: function (data) {
                $('#overlay').hide();
                console.log("Data OpportunityList", data);
                if (!$.isArray(data)) {
                    data = [data];
                }
                var options;
                $.each(data[0], function(key, value){
                    options += "<option class='options'>"+value+"</option>";

                });
                $('#existWaveTypesId').html(options);
                $('#existWaveTypesId').selectpicker('refresh');

                var i = 1;
                $.each(data[2], function(key, value){
                    var opportunityName = value.OpportunityName;
                    var OpportunityId = value.OpportunityId;
                    var checkWave = value.CheckWave;
                    var Appdesc = value.AppDesc;
                    var optionWave = " ";
                    if(checkWave || data[0].length == 0)
                        optionWave = "display:none;";
                    var li_element ="<div class=\"col\">" +
                        "<div class=\"card\">" +
                        "<div class=\"row\">" +
                        "<div class=\"col-9 mt-3 m-auto\">" +
                        "<h5 class=\"card-title AppCardTitle\">"+opportunityName+"</h5>" +
                        "</div>" +
                        "<div class=\"col-1 mt-2 m-auto\">" +
                        "<div class=\" d-flex justify-content-end\">" +
                        "<a class=\"btn btn-outline-none addClass \" style = '"+optionWave+"'>" +
                        "<i class=\"fa-solid fa-circle-plus fa-xl addWaveIcon Card-Icon \"></i></a>" +
                        "<button type=\"button\" class=\"Card-Icon btn btn-outline-none border-0 dropdown-toggle-split\"" +
                        " data-bs-toggle=\"dropdown\" aria-expanded=\"false\">" +
                        "<i class=\"fa-solid fa-ellipsis-vertical fa-lg \"></i>" +
                        "</button>" +
                        "<ul class=\"dropdown-menu p-0\">" +
                        "<li><a class=\"dropdown-item dropdown-styles\"  onClick=\"edit('"+OpportunityId+"','"+opportunityName+"')\" >" +
                        "<i class= 'fa-solid fa-pencil iconColor'></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
                        "</li>" +
                        "<li>" +
                        "<hr class=\"dropdown-divider m-0\">" +
                        "</li>" +
                        "<li><a class=\"dropdown-item dropdown-styles deleteClass\" " +
                        ">" +
                        "<i class=\"fa-solid fa-trash-can text-danger\"></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
                        "</li>" +
                        "</ul>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "<input type = 'hidden' class = 'oppName' value = '"+opportunityName+"'>"+
                        "<input type = 'hidden' class = 'oppId' value = '"+OpportunityId+"'>"+
                        "<div class=\"row card-text col-11 mt-3 m-auto AppCardBody scrollbar\">" +Appdesc+
                        "</div>" +
                        "</div>" +
                        "</div>";
                    $('#ul_id').append(li_element);
                    i++;

                    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                    var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
                        return new bootstrap.Tooltip(tooltipTrigger)
                    });

                });
                var phaseOptions ="<option class='options All' value='All'>Select Phase</option>"
                $.each(data[3][0], function(key, value){
                    phaseOptions += "<option class='phaseOptions options' value='"+value.phaseName+"'>"+value.phaseName+"</option>";
                });
                $('#phase').html(phaseOptions);
                $('#phase').selectpicker('refresh');
                var waveOptions ="<option class='options All' value='All'>Select Wave</option>"
                $.each(data[3][1], function(key, value){

                    waveOptions += "<option class='options waveOptions' value='"+value.waveName+"'>"+value.waveName+"</option>";
                });
                $('#wave').html(waveOptions);
                $('#wave').selectpicker('refresh');
                $('#title_id').html("Number of Opportunities &nbsp;("+(i-1)+")");
            },
            error: function (e) {
                console.log(e);
            }
        });

    }
    if(modulecategory=="Apps")
    {  var category="Apps";
        $("#category").val(category);
        $.ajax({
            url: "AppFilterListServlet",
            type: 'POST',
            dataType: "json",
            success: function (data) {
                $('#overlay').hide();
                console.log("Data OpportunityList", data);
                if (!$.isArray(data)) {
                    data = [data];
                }
                $.each(data[0], function(key, value){
                    var options = "<option>"+value+"</option>";
                    $('#existWaveTypesId').append(options);
                });
                var i = 1;
                $.each(data[2], function(key, value){
                    var opportunityName = value.OpportunityName;
                    var OpportunityId = value.OpportunityId;
                    var checkWave = value.CheckWave;
                    var Appdesc = value.AppDesc;
                    var optionWave = " ";
                    if(checkWave || data[0].length == 0){
                        optionWave = "display:none;";
                    }
                    var li_element ="<div class=\"col\">" +
                        "<div class=\"card\">" +
                        "<div class=\"row\">" +
                        "<div class=\"col-9 mt-3 m-auto\">" +
                        "<h5 class=\"card-title AppCardTitle\">"+opportunityName+"</h5>" +
                        "</div>" +
                        "<div class=\"col-1 mt-2 m-auto\">" +
                        "<div class=\" d-flex justify-content-end\">" +
                        "<a class=\"btn btn-outline-none addClass \" style = '"+optionWave+"'>" +
                        "<i class=\"fa-solid fa-circle-plus fa-xl addWaveIcon Card-Icon \"></i></a>" +
                        "<button type=\"button\" class=\"Card-Icon btn btn-outline-none border-0 dropdown-toggle-split\"" +
                        "data-bs-toggle=\"dropdown\" aria-expanded=\"false\">" +
                        "<i class=\"fa-solid fa-ellipsis-vertical fa-lg \"></i>" +
                        "</button>" +
                        "<ul class=\"dropdown-menu p-0\">" +
                        "<li><a class=\"dropdown-item dropdown-styles\"  onClick=\"edit('"+OpportunityId+"','"+opportunityName+"')\" >" +
                        "<i class= 'fa-solid fa-pencil iconColor'></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
                        "</li>" +
                        "<li>" +
                        "<hr class=\"dropdown-divider m-0\">" +
                        "</li>" +
                        "<li><a class=\"dropdown-item dropdown-styles deleteClass\" " +
                        ">" +
                        "<i class=\"fa-solid fa-trash-can text-danger\"></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
                        "</li>" +
                        "</ul>" +
                        "</div>" +
                        "</div>" +
                        "</div>" +
                        "<input type = 'hidden' class = 'oppName' value = '"+opportunityName+"'>"+
                        "<input type = 'hidden' class = 'oppId' value = '"+OpportunityId+"'>"+
                        "<div class=\"row card-text col-11 mt-3 m-auto AppCardBody scrollbar\">" +Appdesc+
                        "</div>" +
                        "</div>" +
                        "</div>";
                    $('#ul_id').append(li_element);
                    i++;

                    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
                    var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
                        return new bootstrap.Tooltip(tooltipTrigger)
                    });

                });
                var phaseOptions ="<option class='options All' value='All' >Select Phase</option>"
                $.each(data[3][0], function(key, value){
                    phaseOptions += "<option class='phaseOptions options' value='"+value.phaseName+"'>"+value.phaseName+"</option>";
                });
                $('#phase').html(phaseOptions);
                $('#phase').selectpicker('refresh');
                var waveOptions ="<option class='options All' value='All' >Select Wave</option>"
                $.each(data[3][1], function(key, value){

                    waveOptions += "<option class='options waveOptions' value='"+value.waveName+"'>"+value.waveName+"</option>";
                });
                $('#wave').html(waveOptions);
                $('#wave').selectpicker('refresh');
                $('#title_id').html("Number of Opportunities &nbsp;("+(i-1)+")");
            },
            error: function (e) {
                console.log(e);
            }
        });
    }
});
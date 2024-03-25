$(document).ready(function()
{	var url_string=window.location.href;
	var modulecategory=url_string.substr(url_string.indexOf("=") + 1)
	if(modulecategory=="Intake")
    {
	var category = "Intake";
    var phases = "All";
    var waves = "All";
    filterAjaxCall(category,phases,waves);
    $("#category").val(category);
    $("#phase").val(phases);
    $("#wave").val(waves);
	}
    
});
$(document).on('change','#phase',function(){
var phaseName = $(this).val();
if(phaseName=="All")
{
	BindWaveAll();
    $("#wave").val("All");
}
if(phaseName!="All")
    {
  	BindWave();
    $("#wave").val("All");
    }
});
$(document).on('change','.filter',function(){
    var category = $("#category").val();
    var phase = $("#phase").val();
    var wave = $("#wave").val();
    filterAjaxCall(category,phase,wave);
});
function filterAjaxCall(category,phase,wave)
{
    $.ajax({
        url: "OpportunityFilterListServlet",
        type: 'POST',
        dataType: "json",
        data:{wave:wave,category:category,phase:phase,bySearch:false},
        success: function (data) {
            console.log("Data:", data);
             if (!$.isArray(data)) {
                 data = [data];
             }  
             getAppList(data);
            $('#overlay').hide();
        },
        error: function (e) {
            console.log(e);
        }
});
}
function getAppList(data)
{
    $('#ul_id').html("");
     var i = 1;
     $.each(data, function(key, value){
         var opportunityName = value.OpportunityName; 
         var OpportunityId = value.OpportunityId; 
         var checkWave = value.CheckWave;
         var Appdesc = value.AppDesc;
         var optionWave = "";
         if(checkWave || data.length == 0)
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
        "<li><a class=\"dropdown-item dropdown-styles deleteClass\" >"+
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
}
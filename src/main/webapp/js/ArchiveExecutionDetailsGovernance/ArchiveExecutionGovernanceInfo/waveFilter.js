$(document).ready(function(){
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
        
    });
     if(modulecategory!="Intake")
    { 
     $.ajax({
            url: "OpportunityListServlet",
            type: 'POST',
            dataType: "json",
            success: function (data) {
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
                     var optionWave = "";
                     if(checkWave || data[0].length == 0)
                         optionWave = "display:none;";   
                var li_element ="<li class='opportunityCard'>"+
                                "<div class='drophide'>"+
                                "<i class = 'fal fa-ellipsis-v dropbtn dropClass' style='font-size:35px;margin-left:5px; margin-top:0.5%; position:absolute; width:90%; top:0px;'>"+
                                "<div class='dropdown-content myDropdown' style = 'float:right;'>"+
                                "<a class = 'options' style = 'text-align:left;' href='#' onClick=\"edit('"+OpportunityId+"','"+opportunityName+"')\";>Edit</a>"+
                                "<a class = 'options addClass' style = 'text-align:left;"+optionWave+"' href='#'>Add to Wave</a>"+
                                "<a class = 'options deleteClass' style = 'text-align:left;' href='#'>Delete</a>"+
                                "</div>"+
                                "</i>"+
                                "<input type = 'hidden' class = 'oppName' value = '"+opportunityName+"'>"+
                                "<input type = 'hidden' class = 'oppId' value = '"+OpportunityId+"'>"+
                                "</div>"+
                                "<h3 class='cbp-vm-title left-col primary' style='margin-top:1.5%;' name='name' data-bs-toggle='tooltip' data-bs-placement='top' title='"+opportunityName+"'>"+opportunityName+"</h3>"+
                                 /*"<h3 class='cbp-vm-title left-col primary' data-bs-toggle='tooltip' data-bs-placement='top' title='"+opportunityName+"'>"+opportunityName+"</h3>"+*/
                                 /*"<p class='right-col primary' >In Test</p>"+*/
                                  "<button type='button' class='btn btn-primary mt-3' name='btn' onClick=\"edit('"+OpportunityId+"','"+opportunityName+"')\";>"+
                                  "<i class='fa fa-eye'></i>/ &nbsp; <i class='fa fa-edit'></i>"+
                                  "</button>"+
                                  "</li>";
                $('#ul_id').append(li_element);
                i++;
                
                var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
				var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
					return new bootstrap.Tooltip(tooltipTrigger)
				 });
                
                 });
                 var phaseOptions ="<option class='options All' value='Select'>Select</option>"
                 $.each(data[3][0], function(key, value){
                      phaseOptions += "<option class='phaseOptions options' value='"+value.phaseName+"'>"+value.phaseName+"</option>";
                 });
                 $('#phase').html(phaseOptions);
                $('#phase').selectpicker('refresh');
                 var waveOptions ="<option class='options All' value='Select'>Select</option>"
                     $.each(data[3][1], function(key, value){
                         
                          waveOptions += "<option class='options waveOptions' value='"+value.waveName+"'>"+value.waveName+"</option>";
                     });
                 $('#wave').html(waveOptions).selectpicker('refresh');
                // $('#wave').selectpicker('refresh');
                 $('#title_id').html("Number of Opportunities &nbsp;("+(i-1)+")");
            },
            error: function (e) {
                console.log(e);
            }
});

}
});

$(document).on('change','#phase',function(){
	$("#ArchiveExecutionList").empty();
var phaseName = $(this).val();
if(phaseName!="Select")
    {
   GovBindWave();
    $("#wave").val("Select");
    }
    if(phaseName=="Select")
    {
   GovBindWaveAll();
    $("#wave").val("Select");
    }
});


function GovBindWave()
{
	var phase1=$("#phase").val();
    $.ajax({
            url: "WaveFilterServlet",
            type: 'POST',
            data:{phase:phase1},
            dataType: "json",
            success: function (data) {
	 var waveOptions ="<option selected class='options All' value='All'>All</option>"
	 $.each(data[0],function(key,value){
              
              
              waveOptions += "<option class='options waveOptions' value='"+value.WaveName+"'>"+value.WaveName+"</option>";
              
              
                });
                $('#wave').empty().selectpicker('refresh');
                $('#wave').html(waveOptions).selectpicker('refresh');
             },
            error: function (e) {
                console.log(e);
            }
});
}


function GovBindWaveAll()
{
    $.ajax({
            url: "OpportunityListServlet",
            type: 'POST',
            dataType: "json",
            success: function (data) {
                console.log("Data OpportunityList", data);
                 if (!$.isArray(data)) {
                     data = [data];
                 }
              
                 var waveOptions ="<option selected class='options All' value='All'>All</option>"
                     $.each(data[3][1], function(key, value){
                         
                          waveOptions += "<option class='options waveOptions' value='"+value.waveName+"'>"+value.waveName+"</option>";
                     });
                     $('#wave').empty().selectpicker('refresh');
                 $('#wave').html(waveOptions).selectpicker('refresh');
            },
            error: function (e) {
                console.log(e);
            }
});
}

function BindWave()
{
	var phase1=$("#phase").val();
    $.ajax({
            url: "WaveFilterServlet",
            type: 'POST',
            data:{phase:phase1},
            dataType: "json",
            success: function (data) {
	 var waveOptions ="<option selected class='options All' value='All'>Select Wave</option>"
	 $.each(data[0],function(key,value){
              
              
              waveOptions += "<option class='options waveOptions' value='"+value.WaveName+"'>"+value.WaveName+"</option>";
              
              
                });
                $('#wave').empty();
                $('#wave').selectpicker('refresh');
                $('#wave').html(waveOptions);
                $('#wave').selectpicker('refresh');
            },
            error: function (e) {
                console.log(e);
            }
});
}


function BindWaveAll()
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
              
                 var waveOptions ="<option selected class='options All' value='All'>Select Wave</option>"
                     $.each(data[3][1], function(key, value){
                         
                          waveOptions += "<option class='options waveOptions' value='"+value.waveName+"'>"+value.waveName+"</option>";
                     });
                     $('#wave').empty();
                $('#wave').selectpicker('refresh');
                $('#wave').html(waveOptions);
                $('#wave').selectpicker('refresh');
            },
            error: function (e) {
                console.log(e);
            }
});
}

$(document).on('click','#existWaveSubmit', function(){
	$('#overlay').hide();
	var oppName = $('#oppNameId').val();
	var waveName = $('#existWaveTypesId').val();
	var seqNum = $('#existWaveSeqNum').val();
	if(oppName != '' && oppName != null && oppName != undefined && waveName != '' && waveName != null && waveName != undefined)
		addToWave(seqNum, oppName, waveName);
	else
		notification("warning","Please select the wave name.","Warning");
});


function addToWave(seqNum, oppName, waveName){
	 $.ajax({
	        url: "addToExistWaveServlet",
	        type: 'POST',
	        dataType: "json",
	        data:{seqNum:seqNum, oppName:oppName, waveName:waveName},
	        success: function (data) {
	        	console.log("Data OpportunityList", data);
	        	 	if(data.checkStatus){
	        	 		$('.addClass').eq(seqNum).hide();
	        	 		$('#existWaveClose').click();
						$('#overlay').hide();
	        	 		notification("success","Successfully added Opportunity to selected wave.","Note : ");
	        	 	}
	        		 else
	        			 notification("error","Problem occurred while creating.","Error");
	        	 
	        	        },
	        error: function (e) {
	            console.log(e);
	        }
});
}





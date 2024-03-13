$(document).ready(function(){
	
	selectCategory("Phase");
	
	selectCategoryAjaxCall("WAVE_OPTIONS");
	
	selectCategoryAjaxCall("APPLICATION_OPTIONS");

	//$(".filter").selectpicker('refresh');
	
	$(document).on('click', '.addClass', function(){
		var index = $(this).index('.addClass');
		$(".myDropdown").eq(index).hide();
		var oppName = $('.oppName').eq(index).val();
		$('#oppNameId').val(oppName);
		$('#existWaveSeqNum').val(index);
		$('#addWaveBtnId').click();
	});
	$(document).on('change','#phase',function(){
		var phaseName = $(this).val();
		$(".waveOption").hide();
		$(".appOption").hide();
		if(phaseName=="All")
		{
			  $(".waveOption").show();
			  $(".appOption").show();
		}
		else
		$("."+((phaseName).replace(" ","").replace("-",""))).show();
    });
	
	$(document).on('change','#wave',function(){
		var waveName =$(this).val();
		var phaseName = $("#wave").val();
		$(".appOption").hide();
		
		if(phaseName=="All"&&waveName=="All")
			$(".appOption").show();
		else if(phaseName!="All"&&waveName=="All")
			$("."+((phaseName).replace(" ","").replace("-",""))).show();
		else if((phaseName=="All"&&waveName!="All")||(phaseName!="All"&&waveName!="All"))
			$("."+((waveName).replace(" ","").replace("-",""))).show();
    });
	$(document).on('click','.deletePhaseClass',function(){
		$("#deletePhaseBtn").click();
		var index =  $(this).index(".deletePhaseClass");
		$("#phaseIndex").val(index);
	});
	$(document).on('click','#deletePhaseYesBtn',function(){
		var index = $("#phaseIndex").val();
		var phaseName = $('.phaseName').eq(index).val();
		var phaseId = $('.phaseId').eq(index).val();
		var includeAll=$("#includePhaseAll").is(":checked");
		deleteAjaxCall(phaseId,phaseName,"Phase",index,includeAll);
		$("#deletePhaseClose").click();
	});
	$(document).on('click','.phaseCard',function(){
		var index = $(this).index('.phaseCard');
		var phaseId = $('.phaseId').eq(index).val();
		var phaseName = $('.phaseName').eq(index).val();
		
		var f=document.form;
		f.method="post";
		f.action="setPhaseId?phaseId="+phaseId+"&phaseName="+phaseName;
		f.submit();
	});
	
	$(document).on('mouseenter','.dropClass',function(){
	var index = $(this).index('.dropClass');
	$('.cardClass').eq(index).removeClass('phaseCard');
	
	});
	$(document).on('mouseleave','.dropClass',function(){
		var index = $(this).index('.dropClass');
		$('.cardClass').eq(index).addClass('phaseCard');
		});
});
function deleteAjaxCall(Id,Name,deleteType,index,includeAll)
{
	$.ajax({
        url: "deleteGovernanceServlet",
        type: 'POST',
        async:false,
        data : {Id:Id, Name:Name,deleteType:deleteType,includeAll:includeAll},
        dataType: "json",
        success: function (data) {
        	console.log("data: ",data);
          if(data.deleteStatus)
          {
        	notification("success",Name+" deleted successfully","Note:");
        	if(deleteType=="Phase")
        		{
        	       $(".phaseCard").eq(index).remove();
        	       $("#phase option[value='"+Name+"']").remove();
        		}
        	else if(deleteType=="Wave")
        		{
        	           $(".waveCard").eq(index).remove();
        	           $("#wave option[value='"+Name+"']").remove();
        		}
        	for(var i=0;i<data.waves.length;i++)
        	{
        		$("#wave option[value='"+data.waves[i]+"']").remove();
        	}
        	
          }
          else if(!data.deleteStatus)
          {
        	  notification("error","Problem occured while deleting.","Error:");
          }
        
        },
        error: function (e) {
            console.log(e);
       }
	});
}
function selectCategoryAjaxCall(operation)
{
	$.ajax({
        url: "selectCategoryServlet",
        type: 'POST',
        dataType: "json",
        async:false,
        data:{operation:operation},
        success: function (data) {
        	console.log("Wave Options:", data);
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 if(operation=="WAVE_OPTIONS")
        		 {
        	 $("#wave").append("<option  class='all options' value='All'>All</option>");
        	 $.each(data,function(key,value){
        		 var phaseName = ((value.phaseName).replace(" ","").replace("-",""));
        		 var waveName = value.WaveName;
        	    $("#wave").append("<option  class='waveOption "+phaseName+" options' value='"+waveName+"' >"+waveName+"</option>");
        	 });
        	 }
        	 else if(operation=="APPLICATION_OPTIONS")
        	{
        		 $("#application").append("<option  class='all options' value='All'>All</option>");
        		 $.each(data,function(key,value){
            		 var phaseName = ((value.phaseName).replace(" ","").replace("-",""));
            		 var waveName = ((value.waveName).replace(" ","").replace("-",""));
            		 var appName = value.appName;
            	    $("#application").append("<option  class='appOption "+phaseName+" "+waveName+" options' value='"+appName+"' >"+appName+"</option>");
            	 });
        	}
        	 
        	  
        },
        error: function (e) {
            console.log(e);
        }
});

}
/*$(document).on('change','#category',function(){
	selectCategory($(this).val());
});*/
function selectCategory(category)
{
	$("#ul_id").html("");
	//$("#phase").val("none");
	//$("#wave").val("none");
	switch(category)
	{
	
	case "Phase":
		phaseListAjaxCall();
		
		break;
		
	case "Wave":
		waveListAjaxCall();
		break;
		
	case "Application":
		$(".waveOption").show();
		opportunityListAjaxCall();
		break;
	
	}
}
 function waveListAjaxCall()
 {
	 $.ajax({
	        url: "governanceListServlet",
	        type: 'POST',
	        dataType: "json",
	        success: function (data) {
	        	console.log("Data GovernanceList", data);
	        	 if (!$.isArray(data)) {
	                 data = [data];
	                 
	             }
              
	        	 displayWaveList(data);
	            
	        },
	        error: function (e) {
	            console.log(e);
	        }
});
 }
 function displayWaveList(data)
 {
	 var i = 1;
	 $('#ul_id').html("");
     $.each(data, function(key, value){
    	 var waveName = value.WaveName; 
    	 var WaveId = value.WaveId;
		 var Appdesc="";
		 var li_element ="<div class=\"col waveCard\">" +
			 "<div class=\"card\">" +
			 "<div class=\"row\">" +
			 "<div class=\"col-9 mt-3 m-auto\">" +
			 "<h5 class=\"card-title AppCardTitle waveHeadingName\">"+waveName+"</h5>" +
			 "</div>" +
			 "<div class=\"col-1 mt-2 m-auto\">" +
			 "<div class=\" d-flex justify-content-end\">" +
			 "<button type=\"button\" class=\"Card-Icon btn btn-outline-none border-0 dropdown-toggle-split\"" +
			 "data-bs-toggle=\"dropdown\" aria-expanded=\"false\">" +
			 "<i class=\"fa-solid fa-ellipsis-vertical fa-lg \"></i>" +
			 "</button>" +
			 "<ul class=\"dropdown-menu\">" +
			 "<li><a class=\"dropdown-item\">" +
			 "<i class= 'fa-solid fa-pencil iconColor'></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
			 "</li>" +
			 "<li>" +
			 "<hr class=\"dropdown-divider\">" +
			 "</li>" +
			 "<li><a class=\"dropdown-item deleteWaveClass\" href=\"#\"" +
			 ">" +
			 "<i class=\"fa-solid fa-trash-can text-danger\"></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
			 "</li>" +
			 "</ul>" +
			 "</div>" +
			 "</div>" +
			 "</div>" +
			 "<input type = 'hidden' class = 'waveName' value = '"+waveName+"'>"+
			 "<input type = 'hidden' class = 'waveId' value = '"+WaveId+"'>"+
			 "<div class=\"row card-text col-11 mt-3 m-auto AppCardBody scrollbar\">" +Appdesc+
			 "</div>" +
			 "</div>" +
			 "</div>";
	$('#ul_id').append(li_element);
	
	i++;
     });
     $('#title_id').html("Number of Wave &nbsp;("+(i-1)+")");
 }
function opportunityListAjaxCall()
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
             
             $.each(data[1], function(key, value){
            	 var opportunityName = value.OpportunityName; 
            	 var OpportunityId = value.OpportunityId; 
            	 var checkWave = value.CheckWave;
            	 var optionWave = "";
            	 if(checkWave || data[0].length == 0)
            		 optionWave = "display:none;";	 
            	
        	var li_element ="<li class='opportunityCard'>"+
        					"<div class='drophide'>"+
        					"<i class = 'fal fa-ellipsis-v dropbtn dropClass' style='font-size:35px; position:absolute; width:90%; top:0px;'>"+
        					"<div class='dropdown-content myDropdown' style = 'float:right;'>"+
        					"<a class = 'options' style = 'text-align:left;' href='#'>Edit</a>"+
        					"<a class = 'options addClass' style = 'text-align:left;"+optionWave+"' href='#'>Add to Wave</a>"+
        					"<a class = 'options deleteClass' style = 'text-align:left;' href='#'>Delete</a>"+
        					"</div>"+
        					"</i>"+
        					"<input type = 'hidden' class = 'oppName' value = '"+opportunityName+"'>"+
        					"<input type = 'hidden' class = 'oppId' value = '"+OpportunityId+"'>"+
        					"</div>"+
                             "<h3 class='cbp-vm-title left-col primary opportunityHeadingName' name='name' contenteditable='false'>"+opportunityName+"</h3>"+
                              "</li>";
        	$('#ul_id').append(li_element);
        	
        	i++;
             });
             $('#title_id').html("Number of Opportunities &nbsp;("+(i-1)+")");
        },
        error: function (e) {
            console.log(e);
       }
});
}
function phaseListAjaxCall()
{
	$.ajax({
        url: "phaseListServlet",
        type: 'POST',
        dataType: "json",
        async:false,
        success: function (data) {
        	console.log("Data GovernanceList", data);
        	 if (!$.isArray(data)) {
                 data = [data];
                 
             }
             var i = 1;
             var option ="<option class='options' value='All'>All</option>";
             $.each(data, function(key, value){
            	 var phaseName = value.phaseName; 
            	 var phaseId = value.phaseId;
				 var Appdesc ="";
				 var li_element ="<div class=\"col phaseCard\">" +
					 "<div class=\"card\">" +
					 "<div class=\"row\">" +
					 "<div class=\"col-9 mt-3 m-auto\">" +
					 "<h5 class=\"card-title AppCardTitle waveHeadingName\">"+phaseName+"</h5>" +
					 "</div>" +
					 "<div class=\"col-1 mt-2 m-auto\">" +
					 "<div class=\" d-flex justify-content-end\">" +
					 "<button type=\"button\" class=\"Card-Icon btn btn-outline-none border-0 dropdown-toggle-split\"" +
					 "data-bs-toggle=\"dropdown\" aria-expanded=\"false\">" +
					 "<i class=\"fa-solid fa-ellipsis-vertical fa-lg \"></i>" +
					 "</button>" +
					 "<ul class=\"dropdown-menu\">" +
					 "<li><a class=\"dropdown-item editPhaseClass\" onClick=\"edit('"+phaseId+"','"+phaseName+"')\";>" +
					 "<i class= 'fa-solid fa-pencil iconColor'></i>&nbsp;&nbsp;&nbsp;Edit</a>" +
					 "</li>" +
					 "<li>" +
					 "<hr class=\"dropdown-divider\">" +
					 "</li>" +
					 "<li><a class=\"dropdown-item deletePhaseClass\" href=\"#\"" +
					 ">" +
					 "<i class=\"fa-solid fa-trash-can text-danger\"></i>&nbsp;&nbsp;&nbsp;Delete</a>" +
					 "</li>" +
					 "</ul>" +
					 "</div>" +
					 "</div>" +
					 "</div>" +
					 "<input type = 'hidden' class = 'phaseName' value = '"+phaseName+"'>"+
					 "<input type = 'hidden' class = 'phaseId' value = '"+phaseId+"'>"+
					 "<div class=\"row card-text col-11 mt-3 m-auto AppCardBody scrollbar\">" +Appdesc+
					 "</div>" +
					 "</div>" +
					 "</div>";
        	$('#ul_id').append(li_element);
        	 option +="<option class='options' value='"+phaseName+"'>"+phaseName+"</option>";
        	
        	i++;
        	
        	var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
			var tooltipList = tooltipTriggerList.map(function (tooltipTrigger) {
				return new bootstrap.Tooltip(tooltipTrigger)
			});
             });
             $('#phase').html(option);
             $('#title_id').html("Number of Wave &nbsp;("+(i-1)+")");
        },
        error: function (e) {
            console.log(e);
        }
});	
}
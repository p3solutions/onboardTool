$(document).ready(function(){

$(document).on('click','.AddRow',function(){
		
		var addRowIndex = $(this).index('.AddRow');
		var addlevel = $('.archiveLevel'). eq(addRowIndex).val();
		var seqNum = parseInt(addRowIndex)+1;
		
		if(addlevel == '1'){
			$("#planSrtDate").val("");
			$('#seqNumParId').val(seqNum);
			var PlanSrtDateFlag = checkForPlanStartDate(addRowIndex);
			$(".hidePlanSrt").show();
			(PlanSrtDateFlag)?$(".hidePlanSrt").show():$(".hidePlanSrt").hide();
			/*alert("check parent pln: "+PlanSrtDateFlag);*/
			$("#checkPlanStartDate").val(PlanSrtDateFlag);
			$('#ArchExecParentId').click();
		}
		else if(addlevel == '2'){
			$("#planSrtDate1").val("");
			$('#seqNumChlId').val(seqNum);
			var PlanSrtDateFlag = checkForChildPlanStartDate(addRowIndex);
			/*alert("check child pln: "+PlanSrtDateFlag);*/
			$(".hidePlanSrt1").show();
			(PlanSrtDateFlag)?$(".hidePlanSrt1").show():$(".hidePlanSrt1").hide();
			$("#checkChildPlanStartDate").val(PlanSrtDateFlag);
			$('#ArchExecChildId').click();
			console.log("child");
			
		}
	});

$(document).on('click','#ArchiveParentSubmit', function(){
	
	$('.submitDisable').attr('disabled',true);
	var rowType = $('input[name="ArchExecRadio"]:checked').val();
	var taskGroup = $('#ArchiveParentGrpLabel').val();
	var taskName = $('#ArchiveParentNameLabel').val();
	var planSrtDate = $('#planSrtDate').val();
	var seq = $('#seqNumParId').val();
	var checkRow = false;
	var planSrtDateFlag=$("#checkPlanStartDate").val();
	if(rowType == 'Parent'){
		if(taskGroup!=''&&taskGroup!=undefined&&taskGroup!=null)
			checkRow = true;
		else
			checkRow = false;
			
	}
	else if(rowType == 'Child'){
		if(planSrtDateFlag=='false')
			checkRow = true;
		else if(taskName!=''&&taskName!=undefined&&taskName!=null && planSrtDate!=''&&planSrtDate!=undefined&&planSrtDate!=null || planSrtDate==''||planSrtDate==undefined||planSrtDate==null )
			checkRow = true;
		else
			checkRow = false;
			
	}
	
	if(checkRow){
		addFunction(seq, taskName, taskGroup, rowType, planSrtDate);
	}
	else{
			if(rowType == 'Parent')
				notification("warning","Please fill Task Group for Parent Row.","Warning");
			else if(rowType == 'Child'){
				if(planSrtDate == '')
					notification("warning","Please fill Plan Start Date for Child Row.","Warning");
				else
				notification("warning","Please fill Task Name for Child Row.","Warning");
			}
			
	}
		
	$('.submitDisable').attr('disabled',false);
});

$(document).on('click','#ArchiveChildSubmit', function(){
	
	$('.submitDisable').attr('disabled',true);
	var rowType = $('input[name="ArchcExecRadio"]:checked').val();
	var taskGroup = $('#ArchiveChildGrpLabel').val();
	var taskName = $('#ArchiveChildNameLabel').val();
	var planSrtDate = $('#planSrtDate1').val();
	var seq = $('#seqNumChlId').val();
	var planSrtDateFlag = $("#checkChildPlanStartDate").val();
	if(planSrtDateFlag=="false")
		planSrtDate="";
	if(taskName!=''&&taskName!=undefined&&taskName!=null && ((planSrtDate!=''&&planSrtDate!=undefined&&planSrtDate!=null&&planSrtDateFlag=='true')||planSrtDateFlag=='false'|| planSrtDate==''||planSrtDate==undefined||planSrtDate==null))
		addFunction(seq, taskName, taskGroup, rowType, planSrtDate);
	
	else if(taskName ==''||taskName==undefined||taskName==null)
		notification("warning","Please fill Task Name for Child Row.","Warning");
	
	else if (planSrtDate==''||planSrtDate==undefined||planSrtDate==null)
		notification("warning","Please fill Plan Start Date for Child Row.","Warning");
	
	$('.submitDisable').attr('disabled',false);
});

});

$(document).on('change', 'input[name="ArchExecRadio"]', function(){
	
	var radioType = $('input[name="ArchExecRadio"]:checked').val();
	var checkPlnSrtDate = $("#checkPlanStartDate").val();
	if(radioType == 'Parent')
		$('.hidePlanSrt').hide();
		else if(radioType == 'Child')
			if(checkPlnSrtDate!="false")
			$('.hidePlanSrt').show();	
});

function addFunction(seq, taskName, taskGroup, rowType, planSrtDate){
	planSrtDate=(planSrtDate==undefined||planSrtDate==null)?"":planSrtDate;
	$.ajax({
        url: "ArchiveExecutionAddServlet",
        type: 'POST',
        async:false,
        data: {seqNum:seq, TaskName:taskName, TaskGroup:taskGroup, Type:rowType, PlanStartDate:planSrtDate},
        dataType: "json",
        success: function (data) {
        	console.log("Add Details : ",data);
        	$('#ArchiveExecutionList').html('');
        	$('#closeIdChild').click();
        	$('#closeIdParent').click();
        	$('#spinner').show();
        	appendRowFunction(data);
        	$('.assignedToDrop').selectpicker();
        	var script="<script>$('.datepicker1').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "clearBtn:true,"+
            "autoclose: true,\n"+
            "orientation: 'bottom',"+
            "});"+
            "$('.datepicker2').datepicker({\n" +
            "format: \"mm/dd/yyyy\",\n"+
            "clearBtn:true,"+
            "autoclose: true,\n"+
            "orientation: 'bottom',"+
            "});<\/script>";
        $(".visibleBtn").hide(); 
        $('#scripttag').append(script);
        
        for(var i = 0; i<$('.datepicker1').length; i++){
        	var className = $('.datepicker1').eq(i).attr('class');
            $('.datepicker1').eq(i).attr('class', className+" taskChange");
        }
        	$('#spinner').hide();
        	notification("success","New field added Successfully.","Note : ");
        },
        error: function (e) {
            console.log(e);
        }
    });
	
}

function checkForPlanStartDate(currentIndex)
{
	var checkPlanSrtDate=false;
   var checkChild = false;
   var childCount=0;
   var lastChildIndex = 0;
   for(var i=currentIndex+1;i<$(".archiveLevel").length;i++)
	{
	    var level  = $(".archiveLevel").eq(i).val();
	    if(level=="1")
	    	break;
	    else if(level=="2")
	    {
	    	checkChild=true;
	    	childCount++;
	    	lastChildIndex=i;
	    }
	}
     if(childCount==0)
    	 checkChild=false;
     if(checkChild)
    	 checkPlanSrtDate =	checkFieldValues(lastChildIndex);
     else
    	 checkPlanSrtDate =	false;
     return checkPlanSrtDate;
}

function checkForChildPlanStartDate(currentIndex)
{
  var PlnSrtDateFlag = false;
  var previousLevel = $(".archiveLevel").eq(currentIndex).val();
  if(previousLevel=="1")
  {
	  PlnSrtDateFlag=false;
  }
  else
	  {
	   var PlnSrtDateFlag1 = checkFieldValues(currentIndex);
	   var nextNodeLevel=$(".archiveLevel").eq(currentIndex+1).val();
	   PlnSrtDateFlag=PlnSrtDateFlag1;
	   if(currentIndex+1<$(".archiveLevel").length&&nextNodeLevel=="2")
		   {
	         var PlnSrtDateFlag2 = checkFieldValues(currentIndex+1);
	         if(PlnSrtDateFlag1&&PlnSrtDateFlag2)
	        	 PlnSrtDateFlag=true;
	         else
	        	 PlnSrtDateFlag=false;
		   }
	  }

return PlnSrtDateFlag;
}
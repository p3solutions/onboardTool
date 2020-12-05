var fieldName = "";
var columnName = "";
var status = "";
var valuePrev = "";

$(document).ready(function (){
	
	$(document).on('focusin', '.taskChange', function(){
		valuePrev = $(this).val();
	 	});
	
	$(document).on('focusin', 'select.assignedToDrop', function(){
		valuePrev = $(this).val();
	});
	$(document).on('change', '.taskChange', function(){
		fieldName = "";
		columnName = "";
		var className = $(this).attr('class');
		getFieldName(className);
		var index = $(this).index('.'+fieldName);
		var value = $('.'+fieldName).eq(index).val();
		var seqNo = parseInt(index)+1;
		//var valuePrev = $(this).data('val');
		saveFunction(seqNo,columnName,value,valuePrev);
		});

	
	function getFieldName(className){
			if(className.includes('taskTypeDrop')){
				 fieldName = 'taskTypeDrop';
				 columnName = 'taskType';
		     }
			else if(className.includes('assignedToDrop')){
				 fieldName = 'assignedToDrop';
				 columnName = 'assignedTo';
			}
		    
			else if(className.includes('planStart')){
				fieldName = 'planStart';
				columnName = 'planSrt';
			}
		    
			else if(className.includes('planEnd')){
				fieldName = 'planEnd';
				columnName = 'planEnd';
			}
		    
			else if(className.includes('actStart')){
				fieldName = 'actStart';
				columnName = 'actSrt';
			}
		    
		    else if(className.includes('actEnd')){
				fieldName = 'actEnd';
				columnName = 'actEnd';
		    }
		    else if(className.includes('majorDep'))
		    {
		    	fieldName = 'majorDep';
				columnName = 'majorDependencies';
		    }
		    else if(className.includes('remark'))
		    {
		    	fieldName = 'remark';
				columnName = 'remark';
		    }
		  
	}
	$(".datepicker1").change(function()
		{
		    var className = $(this).attr("class");
		    getFieldName(className);
		    var index = $(this).index('.'+fieldName);
			var value = $('.'+fieldName).eq(index).val();
			var seqNo = parseInt(index)+1;
			//var valuePrev = $(this).data('val');
			saveFunction(seqNo,columnName,value,valuePrev);
		    
		});
	$(document).on('change','select.assignedToDrop',function()
	{
		var val=$(this).val();
		fieldName = "assignedToDrop";
		var value = MultiSelectDropDownValues(val);
		//var index = parseInt($(this).index('.assignedToDrop'))-2+1;
		var seqNo = $(this).index("select.assignedToDrop")+1;
		var columnName = 'assignedTo';
		
		saveFunction(seqNo,columnName,value,valuePrev);
	});
	
	var typingTimer;                //timer identifier
	var doneTypingInterval = 1000;  //time in ms, 5 second for example
	
	//on keyup, start the countdown
	
	$(document).on('keyup','.changeText', function () {
	      clearTimeout(typingTimer);
		  var Obj_this = this;
		  //typingTimer = setTimeout(doneTyping(this), doneTypingInterval);
		  typingTimer=setTimeout(function (){
	          doneTyping(Obj_this);
	          },  doneTypingInterval);
	});

	//on keydown, clear the countdown 
	$(document).on('keydown','.changeText',function () {
		clearTimeout(typingTimer);
	});

	//user is "finished typing," do something
	function doneTyping (event) {
		fieldName="";
		columnName="";
 	    var value = $(event).val();
	    var classname = $(event).attr('class');
	    getFieldName(classname);
	    var index = $(event).index("."+fieldName);
	    var value = $('.'+fieldName).eq(index).val();
		var seqNo = parseInt(index)+1;
	    saveFunction(seqNo, columnName, value,"");
	} 
	
	$(document).on("mouseenter", ".statusCode", function() {
		var index = $(this).index('.colorCode');
		$('.ArchiveList').eq(index).attr('data-toggle','');
	});

	$(document).on("mouseleave", ".statusCode", function() {
		var index = $(this).index('.colorCode');
		$('.ArchiveList').eq(index).attr('data-toggle','collapse');
	});
	

	});

function MultiSelectDropDownValues(ValuesArray)
{
	var value ="";
	if(ValuesArray!=null)
	   {
			for(var i=0;i<ValuesArray.length;i++)
				{
					value += ValuesArray[i]+",";	
				}
			return value.substring(0,value.length-1);
	   }
	else
	   {
			return value;
	   }
	
}


function columnNameToClassName(columnName){
	
	var parentClassName;
	
	switch(columnName){
	
	case "planSrt":
		parentClassName = "planStart";
		break;
		
	case "planEnd":
		parentClassName = "planEnd";
		break;
		
	case "actSrt":
		parentClassName = "actStart";
		break;
		
	case "actEnd":
		parentClassName = "actEnd";
		break;
	
	}
	
	return parentClassName;
}

$(document).on('click','.colorCode',function()
{
	status = "";
	fieldName = 'colorCode';
	var class_name = $(this).attr('class');
	var index = $(this).index('.colorCode');
	$(".colorCode").eq(index).attr('class',changeColor(class_name));
	var seqNo = parseInt(index)+1;
	saveFunction(seqNo, "status", status,"");
});


function changeColor(classname)
{
	var colorClassName = "";
  classname =	classname.split(" ");
  var colorClass = classname[0].toString();
  if(colorClass=="statusRed")
	  {
		  colorClassName = "statusOrange statusCode colorCode"
		  status = "statusOrange";
	   }
  else if(colorClass=="statusOrange")
  	{
		  colorClassName = "statusGreen statusCode colorCode";
		  status = "statusGreen";
  	}
  else if(colorClass =="statusGreen")
  	{
		  colorClassName  = "statusRed statusCode colorCode";
		  status = "statusRed";
  	}
  return colorClassName;
}


function saveFunction(seqNo, columnName, value, valuePrev){
var JsonObj = [];
var checkPrevChild = checkPreviousRows(seqNo-1,true,value);
var checkPrevParent = checkPreviousRows(seqNo-1,false,value);
if(!checkPrevChild){
	notification("warning","Please fill the previous sub-task.","Warning");
}

 if(!checkPrevParent)
{
	notification("warning","Please fill atleast one of the previous parents sub-task.","Warning");
}
if(!checkPrevParent||!checkPrevChild)
{
	var prev = getPreviousValue(valuePrev, columnName, fieldName, seqNo-1);
}
 if(checkPrevChild&&checkPrevParent){
	$.ajax({
        url: "archiveExecutionSaveServlet",
        type: 'POST',
        data: {seqNum:seqNo, colName:columnName, Value:value},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Data : " ,data);
        	if(data.checkSave)
        		{
        		if(columnName == "planSrt" || columnName == "planEnd" || columnName == "actSrt" || columnName == "actEnd"){
        			if(data.CheckParentDate)
        			updateParentDate(seqNo, columnName, data.ResultDate);
        		}
        		if(fieldName != 'colorCode'&&fieldName!="")
        		$("."+fieldName).eq(seqNo-1).val(value);
	        		SaveInfoNotification(seqNo, columnName, value);
	        		
	        		notification("success","changed field saved successfully.","Note:");
	        	
        		}
        		else
        			notification("error","error while saving the chnaged field.","Error:");
        		
        	        },
        
        error: function (e) {
            console.log(e);
        }
        
	});
}



	
	//if(JsonObj.checkSave)
    	

	//alert(seqNo + " " + columnName + " " + value);
}

function updateParentDate(seqNum, columnName, value){
	
	var currentIndex = parseInt(seqNum-1);

	var parentClassName = columnNameToClassName(columnName)
	for(var i = currentIndex; i >= 0; i--){
		var level = $('.archiveLevel').eq(i).val();
			if(level == "1"){
				$('.'+parentClassName).eq(i).val(value); 
				break;
			}
	}
}

function getPreviousValue(valuePrev, columnName, fieldName, index){
	
	var prevValue = "";
	
	switch(columnName){
	
	case 'taskType':
		/*prevValue = (valuePrev == '')? 'Activity': valuePrev;	
		//$("."+fieldName).eq(index).find("option[value='"+prevValue+"']").attr("selected","selected");
		$("."+fieldName).eq(index).val(prevValue);
		break;*/
		
	case 'planSrt':
		
	case 'planEnd':
		
	case 'actSrt':
		
	case 'actEnd':
		
	case 'majorDependencies':
		
	case 'remark':
		$("."+fieldName).eq(index).val(prevValue);
		break;
		
	case 'status':
		var class_name = $(".colorCode").eq(index).attr('class');
		$(".colorCode").eq(index).attr('class',"statusRed statusCode colorCode");
		break;
		
	case 'assignedTo':
		var option  = Options(users,prevValue);
		$("select.assignedToDrop").eq(index).html(option);
		$('select.assignedToDrop').eq(index).selectpicker("refresh");
		$('select.assignedToDrop').eq(index).selectpicker();
		//$("div.assignedToDrop").eq(index).find("button.bs-deselect-all").eq(1).click();
		//$('.select.assignedToDrop').selectpicker('refresh');
		/*var valArr = prevValue.split(",");
		for(var i = 0; i<valArr.length; i++){
			var text = $("select.assignedToDrop option[value='"+valArr[i]+"']").eq(index).text();
			
			$('select.assignedToDrop .filter-option').eq(index).text(text);
			
			$('select.assignedToDrop').eq(index).val(valArr[i]);
		}*/
		break;
	}
	return 	prevValue;
}

 function SaveInfoNotification(seqNo, columnName, value)
 {
	 var taskId =$(".taskId").eq(seqNo-1).html();
	   if (columnName=="taskType") 
		   notification("info","In Task id "+taskId+" taskType changed to "+value,"Info:");
	   
	   else if (columnName=="assignedTo") 
		   notification("info","Task Id"+taskId+"assigned to "+value,"Info:");
	   
	   else if (columnName=="planSrt") 
		   notification("info","In Task id "+taskId+" plan start date changed to "+value,"Info:");
	   
	   else if(columnName=="planEnd")
		   notification("info","In Task id "+taskId+" plan end date changed to "+value,"Info:");
	   
	   else if(columnName=="actSrt") 
		   notification("info","In Task id "+taskId+" actual start date changed to "+value,"Info:");
	   
	   else if(columnName=="actEnd")
		   notification("info","In Task id "+taskId+" actual end date changed to "+value,"Info:");
	   
	   else if(columnName=="completion")
		   notification("info","In Task id "+taskId+" % completion changed to "+value+"%","Info:");
	   
	   else if(columnName=="status")
		   notification("info","In Task id "+taskId+" Changed "+value+" for status.","Info:");
	   
	   else if (columnName=="majorDependencies")
		   notification("info","In Task id "+taskId+" major dependencies filled with "+value,"Info:");
	   
	   else if (columnName=="remark")
		   notification("info","In Task id "+taskId+" remarks filled with "+value,"Info:");
 }
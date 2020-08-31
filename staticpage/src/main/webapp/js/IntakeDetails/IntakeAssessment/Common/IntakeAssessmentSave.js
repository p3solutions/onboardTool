var checkMandatoryFields = true;
var checkAllMandatoryFields=true;
var DependencyPairs=['OtherPleaseDescribe','plsdescribeStreams','LastUpdateMade','ExpectedDate'];
var UnfilledSections = [];
var DependencyFields =[];
var DependencyFieldsPair = [];
var DependencykeyValuePair = [];
var DependencyType=[];
var JsonArray =[];
$("#AssessmentSaveBtn").click(function(e){
	
	var section =['ApplicationInformation','DataCharacteristics','ComplianceCharacteristics','ArchivalConsumption'];
	//var section =['ApplicationInformation'];
	UnfilledSections = [];
	JsonArray =[];
	checkAllMandatoryFields = true;
	for(var index = 0;index<section.length;index++)
    {
		console.log("check section: ",section[index]);
	  checkMandatoryFields = true;
	  CheckMandatoryCommonFields(section[index]);	
	}
	CheckMandatoryContractInfo();
	CheckDependencyFields();
	console.log("Assessment Save json Array :",JsonArray);
	if(checkAllMandatoryFields)
	{
		//alert("IntakeAssessment Save");
		var JsonString = JSON.stringify(JsonArray);
		var jsonobj = AssessmentAjaxCallUpdate(JsonString,e);
		if(jsonobj.CheckExistence)
			alert("Saved Successfully!");
		else
			alert("Details not saved");
	}
	else
	{
	var ValidationMsg = ValidationMsgMandatoryFields();
	alert(ValidationMsg);	
	}	
});

function CheckMandatoryCommonFields(InputFieldClass)
{
var nameAttr = [];
var jsonObj = [];
$("."+InputFieldClass).each(function(i) {
	var inputs = {};
	var req=$(this).find(".required_fie").length;  
	console.log("requied field check: ",req);
	        if(req)
		   {
	       
	       console.log("text area length:",$(this).find("textarea").length,"section :",InputFieldClass);
		   console.log("input console",$(this).find("input").length);
		   if($(this).find("input").length)
			   {
			     var val1 =$(this).find("input").val();
			     var type = $(this).find("input").attr("type");
			     if(type == 'radio')
	        		{
	        			var nameRadio = $(this).find("input").attr("name");
	        			var radioValue = $("input[name='"+nameRadio+"']:checked").val();
	        			if(radioValue==""||radioValue==undefined)
	        				{
	        				checkMandatoryFields = false;
	        				}
	        			
	        		}
	        	else if(type == 'checkbox'){
	        		var nameCheckbox = $(this).find("input").attr("name");
        			var CheckboxValue = "";
        			$.each($("input[name='"+nameCheckbox+"']:checked"), function(){
        				CheckboxValue += $(this).val()+",";
                    });
        			CheckboxValue = CheckboxValue.substring(0,CheckboxValue.length-1);
        			if(CheckboxValue=="")
        				{
        				checkMandatoryFields = false;
        				}
	        	}
	        	else if (val1 == ""){
	        		var name_attr = $(this).find("input").attr("name");
	        		if(!DependencyPairs.includes(name_attr))
			    	 checkMandatoryFields = false;
			     }
			     console.log("value in input : ",val1);

			     console.log("value in input : ",val1);
			   }
		   else if($(this).find("select").length)
		   {
			     var val2 =$(this).find("select").val();
			     if (val2 == ""){
			    	 checkMandatoryFields = false;
			     }
			     console.log("value in select : ",val2);
			   }
		   else if($(this).find("textarea").length)
		   {
			   var value =$(this).find("textarea").val();
			   if(value==""||value==undefined)
			   checkMandatoryFields = false;
		   }
		   
		   
		   }
	        if(InputFieldClass=="ApplicationInformation"&&!CheckFileFields())
	 		   checkMandatoryFields = false;
	        if(checkMandatoryFields==false&&!UnfilledSections.includes(InputFieldClass))
	        {
	        	checkAllMandatoryFields =false;
	        	UnfilledSections.push(InputFieldClass);
	        }
	        
	        if($(this).find("input").length)
			   {
	        	var type = $(this).find("input").attr("type");
	        	if(type == 'radio')
	        		{
	        			var nameRadio = $(this).find("input").attr("name");
	        			var radioValue = $("input[name='"+nameRadio+"']:checked").val();
	        			if(DependencyColumnNameCheck(nameRadio))
	   			        {
	        				nameRadio =  DependencyColumnNameChange(nameRadio);
	   			        }
	        			inputs["Name"]=nameRadio;
 				        inputs["Value"]=(radioValue == undefined)?"":radioValue;
	        			
	        		}
	        	else if(type == 'checkbox'){
	        		var nameCheckbox = $(this).find("input").attr("name");
     			var CheckboxValue = "";
     			$.each($("input[name='"+nameCheckbox+"']:checked"), function(){
     				CheckboxValue += $(this).val()+",";
                 });
     			CheckboxValue = CheckboxValue.substring(0,CheckboxValue.length-1);
     			inputs["Name"]=nameCheckbox;
				    inputs["Value"]=(CheckboxValue == undefined)?"":CheckboxValue;
	        	}
	        	else
	        		{
			     var name1 =$(this).find("input").attr("name");
			     var val1 =$(this).find("input").val();
			     if(name1=="BriefArchitectureDescription_file")
			    	 BriefDescTextArea(jsonObj);
			     if(DependencyColumnNameCheck(name1))
			     {
			    	name1 =  DependencyColumnNameChange(name1);
			     }
			     inputs["Name"]=name1;
			     inputs["Value"]= (val1 == undefined)?"":val1;
			     nameAttr.push(name1);
			     console.log("name in input : ",name1);
	        		}
	        }
		   else if($(this).find("select").length)
			   {
			     var name2 =$(this).find("select").attr("name");
			     var val2 =$(this).find("select").val();
			     if(DependencyColumnNameCheck(name2))
			     {
			    	name2 =  DependencyColumnNameChange(name2);
			     }
			     inputs["Name"]=name2;
			     inputs["Value"]= (val2  == undefined) ?"":val2;
			     
			     nameAttr.push(name2);
			     console.log("name in select : ",name2);
			   }
	        jsonObj.push(inputs);
    });
CheckDependencyFields(InputFieldClass);
JsonArray.push(jsonObj);
}

function CheckMandatoryContractInfo()
{

	var appDetailsValue=$("#AppDetails").val();
    if(appDetailsValue=="Third Party")
    {
    	CheckMandatoryCommonFields("ContractInformation");
    }
}
function ValidationMsgMandatoryFields()
{
var msg = "please fill the mandatory fields in ";
for(var j=0;j<UnfilledSections.length;j++)
{
   if(UnfilledSections.length==1)
	msg += UnfilledSections[j]+".";
   else if(j==UnfilledSections.length-1)
	msg += "and "+UnfilledSections[j]+".";
   else if(j==UnfilledSections.length-2)
	msg += UnfilledSections[j]+" ";
   else
	msg +=  UnfilledSections[j]+", ";
	 
}
return msg;
}
function CheckFileFields()
{
	var check =true;
	var file = $("#choosen_file_name").val();
	if(file==""||file==undefined)
	check = false;
	return check;
}
function CheckDependencyFields(Section)
{
	getDependencyDetails(Section);
	CheckingCurrentSectionDependencyValue(Section);
}
function getDependencyDetails(Section)
{
	 DependencyFields =[];
	 DependencyFieldsPair = [];
	 DependencykeyValuePair = [];
	 DependencyType=[];
	
	switch(Section)
	{

	case 'ApplicationInformation':
     	 DependencyFields=['AssessAppPlatform'];	
	     DependencyFieldsPair['AssessAppPlatform'] = 'OtherPleaseDescribe';
	     DependencykeyValuePair['AssessAppPlatform']=['Others'];
	     DependencyType['AssessAppPlatform']=['select'];
	     break;
	
	case 'DataCharacteristics':
	      DependencyFields=['UpDownStream'];	
	      DependencyFieldsPair['UpDownStream'] = 'plsdescribeStreams';
	      DependencykeyValuePair['UpDownStream']=['Yes'];
	      DependencyType['UpDownStream']=['radio'];
	//CheckDataCharDependenciesFields(Section);
	break;
	case 'ComplianceCharacteristics':
		DependencyFields=['legalhold','specificpurgerequirements'];	
		DependencyFieldsPair['legalhold'] = 'ifanypleasedescribe';
		DependencykeyValuePair['legalhold']=['Yes'];
		DependencyType['legalhold']=['radio'];
		DependencyFieldsPair['specificpurgerequirements'] = 'describedetails';
		DependencykeyValuePair['specificpurgerequirements']=['Yes'];
		DependencyType['specificpurgerequirements']=['radio'];
		break;
	
	}	
}
function CheckingCurrentSectionDependencyValue(Section)
{
	for(var i = 0; i< DependencyFields.length; i++)
	{
		var FieldName = DependencyFields[i];
		var FieldType = DependencyType[FieldName];
	  	if(FieldType=="select")
	  	{
	  		
	  		var value = $("#"+FieldName).val();
	  		var FieldValue = DependencykeyValuePair[FieldName].toString();
	  		if(value==FieldValue)
	  		{
	  			var RelatedFieldName = DependencyFieldsPair[FieldName];
	  			var RelatedFieldvalue = $("#"+RelatedFieldName).val();
	  			CheckValue(Section,RelatedFieldvalue);
	  		}
	  	}
	  	else if(FieldType=="radio")
	  	{
	  		var value = $("input[name='"+FieldName+"']:checked").val();
	  		var FieldValue = DependencykeyValuePair[FieldName].toString();
	  		if(value==FieldValue)
	  		{
	  			var RelatedFieldName = DependencyFieldsPair[FieldName];
	  			var RelatedFieldvalue = $("#"+RelatedFieldName).val();
	  			CheckValue(Section,RelatedFieldvalue);
	  		}
	  	}
	}

}
function CheckDataCharDependenciesFields(Section)
{
 var value = $("input[name=ReadonlyData]:checked").val();
 if(value==="Yes")
 {
	 var RelatedFieldValue = $("#LastUpdateMade").val();
	 CheckValue(Section,RelatedFieldValue);
 }
 else if (value==="No")
 {
	 var RelatedFieldValue = $("#ExpectedDate").val();
	 CheckValue(Section,RelatedFieldValue);
 }
}
function CheckValue(Section,RelatedFieldValue)
{
	 if(RelatedFieldValue==""||RelatedFieldValue==undefined)
	 {
		 checkMandatoryFields=false;
	     if(!UnfilledSections.includes(Section))
		 UnfilledSections.push(Section);
     } 
}
function BriefDescTextArea(jsonObj)
{
	var inputarr={};
	inputarr["Name"]="BriefArchitectureDescription";
	inputarr["Value"]=$("#BriefArchitectureDescription").val();
	jsonObj.push(inputarr);
}
function AssessmentAjaxCallUpdate(JsonString,e)
{
	e.preventDefault();
	var JsonObject = [];
	var checkAjax =false;
	$.ajax({
        url: "IntakeAssessmentSaveServlet",
        type: 'POST',
        data : {JsonString : JsonString},
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("CREATE VALIDATION",data);
        	JsonObject = data;
           },
        error: function (e) {
            console.log(e);
        }
        
    });
return JsonObject;
}
function DependencyColumnNameChange(ColumnName)
{
	var ColName = "";
	var arr =['SupportedApp','SupportApp','ComplianceLegalDrivers','PleaseDescribe1','BusinessDriversDrivers','PleaseDescribe2','TechnicalDrivers','PleaseDescribe3','DataSetMainframe','plsprovideinfo','ReportGeneration','plsprovidedetails','LastUpdateMade','ExpectedDate','UpDownStream','plsdescribeStreams','legalhold','ifanypleasedescribe','specificpurgerequirements','describedetails'];
	for(var i=0;i<arr.length;i++)
	{
		if(ColumnName.includes(arr[i]))
		{
			ColName = arr[i]
			break;
		}
	}
	return ColName;
}
function DependencyColumnNameCheck(ColumnName)
{
	var checkColName = false;
	var arr =['SupportedApp','SupportApp','ComplianceLegalDrivers','PleaseDescribe1','BusinessDriversDrivers','PleaseDescribe2','TechnicalDrivers','PleaseDescribe3','DataSetMainframe','plsprovideinfo','ReportGeneration','plsprovidedetails','LastUpdateMade','ExpectedDate','UpDownStream','plsdescribeStreams','legalhold','ifanypleasedescribe','specificpurgerequirements','describedetails'];
	for(var i=0;i<arr.length;i++)
	{
		if(ColumnName.includes(arr[i]))
		{
			checkColName = true;
			break;
		}
	}
	return checkColName;
}

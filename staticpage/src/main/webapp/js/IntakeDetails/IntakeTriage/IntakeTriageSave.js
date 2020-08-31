$("#createbtn").click(function(e)
{
	var checkMandatory = true;
	var DepedentColumnNameCheck =['If_Other_describe','If_other_please_describe','vendor','describe','plsdescribe','pls_describe'];
	var nameAttr = [];
	var jsonObj = [];
		$(".Inputvalue").each(function(i) {
    		var inputs = {};
    		var req=$(this).find(".required_fie").length;  
    		console.log("requied field check: ",req);
    		        if(req)
    			   {
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
  		        				checkMandatory = false;
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
		        				checkMandatory = false;
		        				}
  		        	}
  		        	else if (val1 == ""){
  		        		var name_attr = $(this).find("input").attr("name");
  		        		if(!DepedentColumnNameCheck.includes(name_attr))
 				    	 checkMandatory = false;
 				     }
 				     console.log("value in input : ",val1);
 
    				     console.log("value in input : ",val1);
    				   }
    			   else if($(this).find("select").length)
    				   {
    				     var val2 =$(this).find("select").val();
    				     if (val2 == ""){
    				    	 checkMandatory = false;
    				     }
    				     console.log("value in select : ",val2);
    				   }
    			   }
    		        if($(this).find("input").length)
    				   {
    		        	var type = $(this).find("input").attr("type");
    		        	if(type == 'radio')
    		        		{
    		        			var nameRadio = $(this).find("input").attr("name");
    		        			var radioValue = $("input[name='"+nameRadio+"']:checked").val();
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
    				     inputs["Name"]=name2;
    				     inputs["Value"]= (val2  == undefined) ?"":val2;;
    				     nameAttr.push(name2);
    				     console.log("name in select : ",name2);
    				   }
    		        jsonObj.push(inputs);
    		        
    		});
    	
    	
    	console.log("name attr : ",nameAttr);
    	console.log("Json Object : ",jsonObj);
    	var JsonString = JSON.stringify(jsonObj);
    	$('#Json_sample_id').val(JSON.stringify(jsonObj));
    	
    	var checkAjax;
      	if(checkMandatory==true)
	    {
      		if(CheckRationalizationField()&&CheckApplicationPlatformField()&&CheckDependencyField())
      	    {
      		alert("Details which are common, will be reflected  in Intake Opportunity.");
	    	var validationCheck_json = TriageAjaxCallUpdate(JsonString,checkMandatory,e);
	    	if(validationCheck_json.appId==false)
	    	{
	    	 alert("Application Id is already used. PLease provide Unique Application ID.");
	    	 e.preventDefault();
	    	}
	    	else if(validationCheck_json.applicationName == false)
	    	{
	    		alert("Application Name is already used. PLease provide Unique Application Name.");
		    	 e.preventDefault();
	    	}
	    	else
	    	{
	    	$("#OpportunityListbtn").click();
	    	}
      	    }
      		else
      		{
      			
       		   alert("Please fill the Mandatory Fields.");	
       		e.preventDefault();
      		}
	    	} 
	    else 
	    {
		e.preventDefault();
	    alert("Please fill the Mandatory Fields.");
	    }
}); 
function TriageAjaxCallUpdate(JsonString,checkMandatory,e)
{
	e.preventDefault();
	var JsonObject=[];
	var checkAjax =false;
	$.ajax({
        url: "IntakeTriageSaveServlet",
        type: 'POST',
        data : {JsonString : JsonString, checkMandatory : checkMandatory},
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
function CheckRationalizationField()
{
	var check= true;
	var rationalization = $("#rationalization_type").length;
	if(rationalization)
	{
	   var rationalization_value = $("#rationalization_type").val();
	   if(rationalization_value=="Other")
	   {
		 var other_val = $("#If_other_please_describe").val();
		 if(other_val==""||other_val==undefined)
			 {
			   check =false;
			 }
	   }
	}
	return check;
}
function CheckApplicationPlatformField()
{
	var check= true;
	var rationalization = $("#appPlatfrm").length;
	if(rationalization)
	{
	   var rationalization_value = $("#appPlatfrm").val();
	   if(rationalization_value=="Others")
	   {
		 var other_val = $("#If_Other_describe").val();
		 if(other_val==""||other_val==undefined)
			 {
			   check =false;
			 }
	   }
	}
	return check;
}
function CheckDependencyField()
{
	var check= true;
	var YesNoDependencyColumnName =['app_and_data_hosted','compliance','Financialdate','TechincalDeterminingdate'];
	var DepedentColumnName =['vendor','describe','plsdescribe','pls_describe'];
	for(var i=0;i<YesNoDependencyColumnName.length;i++)
	{
	var DependencyField = $("input[name="+YesNoDependencyColumnName[i]+"]").length;
	 if(DependencyField)
	 {
	   var value = $("input[name="+YesNoDependencyColumnName[i]+"]:checked").val();
	   if(value=="Yes")
	   {
		 var other_val = $("#"+DepedentColumnName[i]).val();
		 if(other_val==""||other_val==undefined)
			 {
			   check =false;
			 }
	   }
	}
   }
	return check;
}
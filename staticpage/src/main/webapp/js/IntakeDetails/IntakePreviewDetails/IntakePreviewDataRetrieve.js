var dependencyColumn = "";
var readOnlyValue = "";
var finalCheck;

$(document).ready (function(){
	IntakePreviewDataRetrieveAjaxCall();
});

function IntakePreviewDataRetrieveAjaxCall()
{
	$.ajax({
        url: "IntakePreviewDataRetrieveServlet",
        type: 'POST',
        dataType: "json",
        success: function (data) {
            console.log("Data Retrieve Preview json array----->",data);
            
            var inputs = {};
           
            for(var i = 0; i<data[0].length; i++){
            	var OppTag = "<pre style='font-family:verdana;font-size:100%;' class = 'OppInfoPreview'><b>"+data[0][i].LabelName+"</b> : "+data[0][i].Value+" </pre>";
            	$("#OpportunityInfoPreview").append(OppTag);
            }
            
            var checkTriageDependency;
            for(var j = 0; j<data[1].length; j++){
            	
            	var triageStyle = "";
            	
            	var column_name = data[1][j].ColumnName;
            	
        		var columnValue = data[1][j].Value;
        		
            	if(checkTriageDependency)
            		triageStyle = "display:none;";
            		
            	var TriageTag = "<pre style='font-family:verdana;font-size:100%;"+triageStyle+"' class = 'TriageInfoPreview'><b>"+data[1][j].LabelName+"</b> : "+data[1][j].Value+" </pre>";
            	checkTriageDependency = checkDependency(column_name,columnValue);
            	
            	$("#TriageInfoPreview").append(TriageTag);
            }
            
            for(var k = 0; k<data[2].length; k++){
            	var TriageSummTag = "<pre style='font-family:verdana;font-size:100%;' class = 'TriageSummInfoPreview'><b>"+data[2][k].LabelName+"</b> : "+data[2][k].Value+" </pre>";
            	$("#TriageSummInfoPreview").append(TriageSummTag);
            }
            
            var checkAssessmentDependency;
            
            for(var l = 0; l<data[3].length; l++){
            	
            	for(var m = 0; m<data[3][l].length; m++){
            		
            		var assessmentStyle = "";
            		
            		var column_name = data[3][l][m].ColumnName;
            		
            		var columnValue = data[3][l][m].Value;
            		
            		var check = checkReadOnlyData(column_name);
            		
            		if(checkAssessmentDependency)
            			assessmentStyle = "display:none;";
            		
            		if(check){
            			assessmentStyle = "";
            		}
            		else if(finalCheck){
            			finalCheck = false;
            			assessmentStyle = "display:none;";
            		}
            		if(data[3][l][m].ColumnName == "AppDetails" && data[3][l][m].section == "ApplicationInformation" && data[3][l][m].Value == "Third Party")
            			$("#ContractInformationPreview").show();
            		
		            var AssessmentTag = "<pre style='font-family:verdana;font-size:100%;"+assessmentStyle+"' class = 'AssessmentPreview'><b>"+data[3][l][m].LabelName+"</b> : "+data[3][l][m].Value+" </pre>";
		            checkAssessmentDependency = checkDependency(column_name,columnValue);
		            
		            $("#"+data[3][l][m].section+"Preview").append(AssessmentTag);
            		}
            	}
            
            var table = "<table class='table table-bordered'>"+
            			"<thead>"+
      					"<tr>"+
        				"<th>Name</th>"+
        				"<th>Email</th>"+
        				"<th>User Name</th>"+
        				"<th>Role</th>"+
      					"</tr>"+
    					"</thead>"+
            			"<tbody id = 'StakeHolder'>";
            			
            
            for(var n = 1; n<data[4].length; n++){
            
            	//var stakeHolderTag = "<pre style='font-family:verdana;font-size:100%;' class = 'stakeHolderInfoPreview'><b>"+data[4][n].LabelName+"</b> : "+data[4][n].Value+" </pre>";
            	table += "<tr>"+
            				"<td>"+data[4][n].name+"</td>"+
            				"<td>"+data[4][n].emailId+"</td>"+
            				"<td>"+data[4][n].username+"</td>"+
            				"<td>"+data[4][n].role+"</td>"+
            			  "</tr>";
            }
            table += "</tbody>"+
            		"</table>";
            $("#StakeHolderInfoPreview").append(table);
        },
        error: function (e) {
            console.log(e);
        }

    });
}


function dependencyKeyValuePair(){
	
	var inputs = {};
	
	//Triage Dependency
	inputs["rationalization_type"] = "Other";
	inputs["appPlatfrm"] = "Other";
	inputs["app_and_data_hosted"] = "Yes";
	inputs["compliance"] = "Yes";
	inputs["Financialdate"] = "Yes";
	inputs["TechincalDeterminingdate"] = "Yes";
	
	//Application Info Dependency
	inputs["AssessAppPlatform"] = "Others";
	inputs["ComplianceLegalDrivers"] = "Yes";
	inputs["BusinessDriversDrivers"] = "Yes";
	inputs["TechnicalDrivers"] = "Yes";
	inputs["SupportedApp"] = "No";
	
	//DataChar Dependency
	inputs["DataSetMainframe"] = "Yes";
	inputs["ReportGeneration"] = "Yes";
	//inputs["ReadonlyData"] = "Yes";
	//inputs["ReadonlyData"] = "No";
	inputs["UpDownStream"] = "Yes";
	
	//Archival Dependency
	inputs["legalhold"] = "Yes";
	inputs["specificpurgerequirements"] = "Yes";
	
	return inputs;
}

function dependencyKeyValueColumnPair(){
	
	var inputs = {};
	
	//Triage Dependency
	inputs["rationalization_type"] = "If_other_please_describe";
	inputs["appPlatfrm"] = "If_Other_describe";
	inputs["app_and_data_hosted"] = "vendor";
	inputs["compliance"] = "describe";
	inputs["Financialdate"] = "plsdescribe";
	inputs["TechincalDeterminingdate"] = "pls_describe";
	
	//Application Info Dependency
	inputs["AssessAppPlatform"] = "OtherPleaseDescribe";
	inputs["ComplianceLegalDrivers"] = "PleaseDescribe1";
	inputs["BusinessDriversDrivers"] = "PleaseDescribe2";
	inputs["TechnicalDrivers"] = "PleaseDescribe3";
	inputs["SupportedApp"] = "SupportApp";
	
	//DataChar Dependency
	inputs["DataSetMainframe"] = "plsprovideinfo";
	inputs["ReportGeneration"] = "plsprovidedetails";
	//inputs["ReadonlyData"] = "LastUpdateMade";
	//inputs["ReadonlyData"] = "ExpectedDate";
	inputs["UpDownStream"] = "plsdescribeStreams";
	
	//Archival Dependency
	inputs["legalhold"] = "ifanypleasedescribe";
	inputs["specificpurgerequirements"] = "describedetails";
	
	return inputs;
}


function checkDependency(ColumnName,Value){
	var boolean = false;
	
	var inputs = dependencyKeyValuePair();
	
	var inputsValueColumn = dependencyKeyValueColumnPair();
	
	if(inputs.hasOwnProperty(ColumnName)){
		
		if(inputs[ColumnName] == Value){
			boolean = false;
			dependencyColumn = inputsValueColumn[ColumnName];
		}
		else{
			boolean = true;
			dependencyColumn = "";
		}
		
	}
	else if(ColumnName == "ReadonlyData"){
		finalCheck = true;
		dependencyColumn = "";
		if(Value == "Yes")
			readOnlyValue = "LastUpdateMade";
		else if(Value == "No")
			readOnlyValue = "ExpectedDate";
	}
	else{
		dependencyColumn = "";
	}
	return boolean;
	
}


function checkReadOnlyData(ColumnName){
	
	var checkBoolean = false;
	
	if(ColumnName == readOnlyValue){
		checkBoolean = true;
		readOnlyValue = "";
	}
	return checkBoolean;
	
}
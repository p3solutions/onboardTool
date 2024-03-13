var dependencyColumn = "";
var readOnlyValue = "";
var finalCheck;
var exportContent = [];
$(document).ready(function()
{
	reviewDataRetrieveAjaxCall();
	$(document).on('click','#button_id',function(){
		emailAjaxCall("ARCHIVE_REQUIREMENTS");
		 
	});
})

$(document).on('click','#exportPdf',function(o){
	$.ajax({ 
		 url: "exportPdfServlet",
		 type: 'POST',
		 async: false,
	     dataType: "json",
	     data: {jsonContent:JSON.stringify(exportContent),modulename:"ARCHIVE_REQUIREMENTS"},
	     success: function (data) {
	    	 var pdfPath = data.path;
	    	 pdfPath =pdfPath.replaceAll("\\","//");
	    	 window.location.href = "downloadPDFservlet?path='"+pdfPath+"'";
	    	 console.log("export pdf archive req :"+data);
	    	 //downloadPDFAjaxCall(pdfPath);
	    	 //setTimeout(deletePDFAjaxCall(pdfPath), 2000);
	    	 //deletePDFAjaxCall(pdfPath);
	         o.preventDefault();
	     },
	  error: function (e) { console.log(e); }
	  
	  });
	});

function reviewDataRetrieveAjaxCall()
{
	$.ajax({
        url: "archiveReqReviewDataRetrieveServlet",
        type: 'POST',
        async: false,
        dataType: "json",
        success: function (data) {
        	console.log("Review data --->",data);
        	exportContent = data;
        	 if (!$.isArray(data)) {
                 data = [data];
             }
        	 // purpose and scope
        	 if(data[0][0].checkData)
        	  {
        		 var purpose = "<textarea class='OppInfoPreview form-control border-none w-100' rows='3' >" +data[0][0].Purpose+ "</textarea>";
        		 $("#purposeInfoPreview").html(purpose);
        		 var scope = "<h6 class='panel-title'>Scope</h6>";
				 scope+= "<textarea class='form-control border-none w-100' rows='3' >" +data[0][0].Scope+ " </textarea>";
    		 $("#scopeInfoPreview").html(scope);
    		 var assumptionValArray = (data[0][0].Assumption).split("::");
    		 var assumptionVal ="";
    		 for(var i=0;i<assumptionValArray.length;i++)
    			 assumptionVal += "<li>"+assumptionValArray[i].trim()+"</li>";
				  // b>Assumptions :</b>
    		 var Assumption = "<b>Assumptions :</b><br><ul class = 'OppInfoPreview'>"+assumptionVal+"</ul>";
		 $("#AssumptionInfoPreview").html(Assumption); }
        	 // Roles and Responsibility
        	 var checkRoles =true;
        	 $.each(data[0][1],function(key,value)
        	 {
        		 var row ="<tr >"+
        		           "<td>"+value.role+" </td>"+
        		           "<td>"+value.name+"</td>"+
        		           "<td>"+value.emailId+"</td>"+
        		           "<td>"+value.username+"</td>"+
        		           "<td>"+value.priority_order_num+"</td>"+
        		           "</tr>";
        		  if(!checkFieldValues(value.role, value.name, value.emailId, value.username,value.priority_order_num))
                        checkRoles =false;
        			  $("#roleResponseInfoPreview").append(row);
        	  });
        	 if(!checkRoles)
        	 {
        		$("#ReviewNextBtn").attr("disabled",true);
        		$("#nextBtn").attr('title',"Please Fill all the fields in roles and responsibility");
        		$("#nextBtn").attr('data-toggle',"tooltip");
        		$("#nextBtn").tooltip();
        	  }
        	 else
         		$("#ReviewNextBtn").attr("disabled",false);

        	 //legacy app info
        	 $.each(data[1][0],function(key,value)
                	 {
                		 var input = "<tr><td>"+value.LabelName+"</b> </td><td>"+value.Value+"</td></tr>";
                		 $("#AppInfoPreview").append(input);
                	  });

        	 // archive environment
        	 $.each(data[1][1][0],function(key,value)
                	 {
                		 var input = "<tr><td>"+value.DevName+"</td><td>"+value.TestName+"</td><td>"+value.StageName+"</td><td>"+value.ProdName+"</td></tr>";
                		 $("#ArchiveEnvInfoPreview").append(input);
                	  });
        	 $.each(data[1][1][1],function(key,value)
                	 {
                		 var input = "<tr><td>"+value.DevServerIp+"</td><td>"+value.TestServerIp+"</td><td>"+value.StageServerIp+"</td><td>"+value.ProdServerIp+"</td></tr>";
                		 $("#ArchiveEnvServerInfoPreview").append(input);
                	  });
        	 var files= data[1][2].listOfScreenShots;
        	 var fileList = files.split(",");
        	 for(var i=0;i<fileList.length;i++)
             {
                		 var input = "<li>"+fileList[i]+"</li>";
                		 $("#legacyAppInfoReview").append(input);
                	  }
        	 var contentInfo = (data[2][0].ContentInfo).split("::");
        	 for(var i=0;i<contentInfo.length;i++)
        	 $("#RetentionDetailsInfoPreview").append("<li>"+contentInfo[i]+"</li>");
        	 if(data[2][1][0].checkExistance){
        	 $.each(data[2][1],function(key,value)
                	 {
        		         var check = value.retentionCheck=="true"?"checked":"";
                		 var input = "<tr><td><div><input type='checkbox' disabled "+check+"/></div></td><td>"+value.retentionLevel+"</td><td>"+value.condition+"</td><td><b>Field Type:</b> "+value.dateUsedType+"<br><b>value:</b> "+value.dateUsed+"</td><td>"+value.descp+"</td></tr>";
                		 $("#RetentionInfoPreview").append(input);
                	  });
        	 }
        	 
        	 $.each(data[3],function(key,value)
                	 {
        		         var check = value.retentionCheck=="true"?"checked":"";
                		 var input = "<tr><td>"+value.req_in_scope+"</td><td>"+value.description+"</td></tr>";
                		 $("#BusinessReqTableInfoPreview").append(input);
                	  });
        	 var businessContentInfo = "<ul><li>Each requirement must be marked as In-Scope or Out-of-Scope for this project, with additional information specific to each requirement if necessary. </li><li>Requirement ID's are linked to test script ID's to ensure traceability from requirement to test execution. Requirement ID's may be formatted according to client needs.</li></ul>";
        	 if(data[4].checkData){
        		 businessContentInfo = "<ul>";
        		 var businessContentInfoArray = (data[4].businessreq).split("::");
        		 for(var i =0 ; i<businessContentInfoArray.length;i++)
        			 businessContentInfo+="<li>"+businessContentInfoArray[i]+"</li>";
        		 businessContentInfo+="</ul>";
        	 }
        	 $("#BusinessReqHeaderInfo").html(businessContentInfo);
              var functionalReqIdArray = ['FunctionReqDataReqInfoPreview','FunctionReqRetentionLegalReqInfoPreview','FunctionReqSecurityReqInfoPreview','FunctionReqUsabilityReqInfoPreview','FunctionReqAuditReqInfoPreview'];
              for(var j=0;j<functionalReqIdArray.length;j++)
            	  {
					  if(data[5][j][0]){
              var dataCheck = data[5][j][0].checkExistance; 
              $.each(data[5][j],function(key,value){    
            	         if(dataCheck){
                 		 var input = "<tr><td>"+value.reqId+"</td><td>"+value.reqInScope+"</td><td>"+value.reqType+"</td><td>"+value.req+"</td><td>"+value.additionInfo+"</td></tr>";
         		         $("#"+functionalReqIdArray[j]).append(input);
            	         }
                 	});
            	}else{
						   var input = "<tr><td colspan='5' style='text-align: center;'>No Records Found</td></tr>";
         		         $("#"+functionalReqIdArray[j]).append(input); 
						 }
            	}
              var checkScreenReqData= data[6][0][0].checkData;
              if(checkScreenReqData)
            	{
            	  $.each(data[6][0],function(key,value){    
         	         
              		 var input = "<tr><td>"+value.reqId+"</td><td>"+value.screenDisplay+"</td><td>"+value.purpose+"</td><td>"+value.equivalentLegacy+"</td></tr>";
      		         $("#ScreenReqInfoPreview").append(input);
         	         
              	});
            	}else{
						   var input = "<tr><td colspan='5'>No Records Found</td></tr>";
         		         $("#ScreenReqInfoPreview").append(input); 
						 }
              var checkSearchFormReqData = data[6][1][0].checkData;
              if(checkSearchFormReqData)
               {
            	  $.each(data[6][1],function(key,value){    
          	         
               		 var input = "<tr><td>"+value.reqId+"</td><td>"+value.searchForm+"</td><td>"+value.searchField+"</td><td>"+value.fieldFormat+"</td><td>"+value.dataType+"</td><td>"+value.dataRetrieval+"</td><td>"+value.requiredField+"</td><td>"+value.searchField+"</td></tr>";
       		         $("#SearchFormInfoPreview").append(input);
          	         
               	});
            	  }else{
						   var input = "<tr><td colspan='8'>No Records Found</td></tr>";
         		         $("#SearchFormInfoPreview").append(input); 
						 }

              //AbbrevationDescriptionInfoPreview
             	var checkAbbreviationData= data[7][0].checkData;
             	if(checkAbbreviationData){
             	$.each(data[7], function(key, value) {
					 var abbreviation = "<tr><td>" + value.abbreviation_acronym + "</td><td>" + value.description + "</td></tr>";
       				 $("#AbbrevationDescriptionInfoPreview").append(abbreviation);
       				 });
    			} else {
       				  var abbreviation = "<tr><td colspan='2'>No Abbreviations found.</td></tr>";
       				 $("#AbbrevationDescriptionInfoPreview").append(abbreviation);
 			    }
				
              
              //document revision
              var checkDocumentRevisionData = data[8][0].checkExistance;
              if(checkDocumentRevisionData)
            	{
            	  $.each(data[8],function(key,value){    
           	         
                		 var input = "<tr><td >"+value.date+"</td><td>"+value.version+"</td><td>"+value.documentChanges+"</td><td>"+value.changeAuthor+"</td></tr>";
        		         $("#documentRevisionsInfoPreview").append(input);
                	});
            	  }
              //addendum
var checkAddendumData = data[9][0].checkExistance;
if (checkAddendumData) {
  $.each(data[9], function(key, value) {

    var input = `<div class="bg-light scroll-div pt-1 px-2 OppInfoPreview">
                   <b>${value.labelName}</b>: ${value.addendumInfo}
                 </div>
                 <div class="table-responsive my-3" id="addendum_filelist">
                      <table class="table table-bordered" id="datatable_add">
                     <thead class="text-center">
                       <th scope='col'>File Name</th>
                       <th scope='col'>Action</th>
                     </thead>
                     <tbody  class="text-center" >`;
    if (value.fileNames.checkData) {
      Object.keys(value.fileNames).forEach(function(index) {
        if (index !== "checkData") {
          var fileName = value.fileNames[index];
          input += `<tr>
                     <td hidden>${index}</td>
                     <td hidden>${value.section_no}</td>
                     <td hidden>${value.labelName}</td>
                     <td>${fileName}</td>
                     <td>
                       <span class="fa-solid fa-download add_download_btn" >
                       </span>
                     </td>
                   </tr>`;
        }
      });
    } else {
      input += `<tr>
                  <td colspan="2" >No Attachments found.</td>
                </tr>`;
    }
    input += `</tbody>
               </table>
             </div>`;
    $("#addendumInfoPreview").append(input);
  });
}

            if(data[10].checkOverAllStatus)
            	{
            	  $("#ReviewNextBtn").show();
            	  $("#button_id").hide();
            	  $("#ReviewPrevBtn").attr('onclick','location.href="ArchiveDecommPage.jsp";');
            	}
            var indexCount =0;
            $.each(data[11],function(key,value){
            	if(indexCount!=0)
            	{
      		  var input = "<tr><td width='80px;'>"+value.role+"</td><td>"+value.name+"</td><td>"+value.emailId+"</td><td>"+value.username+"</td><td>"+value.priority_order_num+"</td><td>"+value.approvalStatus+"</td></tr>";
		         $("#approvalInfoPreview").append(input);
            	}
            	indexCount++;
      	 });
             $("#ReviewNextBtn").attr("onclick", "location.href='archiveRequirementsApprovalDetails.jsp?a_id=" + data[11][0].approvalId + "';");
			$(".ReviewNextBtn").attr("onclick", "location.href='archiveRequirementsApprovalDetails.jsp?a_id=" + data[11][0].approvalId + "';");
        	     },
        error: function (e) {
            console.log(e);
        }
    });	
}
function checkFieldValues(role, name, emailId, username,priority_order_num){
	
	var validationFlag = false;
	if((role != '' && role != undefined && role != null) && (name != '' && name != undefined && name != null) &&  
			(emailId != '' && emailId != undefined && emailId != null) && (username != '' && username != undefined && username != null)
			&&(priority_order_num != '' && priority_order_num != undefined && priority_order_num != null))
			validationFlag = true;
	
	return validationFlag;
}
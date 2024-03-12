package NewArchiveRequirements.archiveRequirementReview.service;

import exportPdf.service.jsonToHtmlContent;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.apache.commons.codec.binary.Base64;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;
import com.google.gson.JsonObject;


import exportPdf.service.jsonToHtmlContent;
import logger.System;

public class archivePreviewHtmlContentService extends jsonToHtmlContent {
	  
	    private JsonArray jsonArray =null;
	    private String[] introduction_sections= {"Purpose","Scope","Assumption"};
		private String[] legacyAppInfoSection= {"Application Information","Archive Environment","Legacy Application Screenshots"};
		private String[] businessReqSection= {"Requirement In Scope","Functional Requirement","Screen Requirements"};
		private String[] retentionSection= {"ContentInfo"};
		private String[] functionalReqSection= {"Data Requirements","Retention and Legal Requirements","Security Requirements","Usability Requirements","Audit Requirements"};
		private String[] archive_sections = {"Introduction","Legacy Application Information","Retention Details","Business Requirements","Abbreviation, Acronym, Definitions","Document Revisions","Addendum","Roles & Responsibilites"};
		public archivePreviewHtmlContentService(JsonArray jsonArray) {
		 this.jsonArray = jsonArray;
		}
		
		public void getHtmlContent() {
			writeStartingTags();
			//writeImageTag(false);
			writeMainTitle("Archive Requirements Summary");
			getArchiveDetails();
			getLegacyDetails();
			getRetentionDetails();
			getBusinessRequirements();
			getAbbrevationDef();
			getDocumentRevisions();
			getAddendum();
			getRolesResponsibilites() ;
			writeEndingTags();
		}

		private void getArchiveDetails() {
				writeHeader("Introduction");
				JsonArray jsonArray1 = jsonArray.get(0).getAsJsonArray();
				writeTableStartTags();
				for(int i=0;i<3;i++) {
					JsonObject jsonObject = jsonArray1.get(0).getAsJsonObject();
					String labelName=introduction_sections[i].toString();
					String value = jsonObject.get(introduction_sections[i].toString()).getAsString();
					writeTableContent(labelName, value);
			}
				writeTableEndTags();
		}
		
		private void getLegacyDetails() {
			writeHeader("Legacy Application Information");
				writeHeader(legacyAppInfoSection[0]);
				JsonArray jsonArray1 = jsonArray.get(1).getAsJsonArray();		
				System.out.println(jsonArray1+ "  Intake sesion hai ");
				writeTableStartTags();
					JsonArray jsonArray2 = jsonArray1.get(0).getAsJsonArray();
					System.out.println(jsonArray2+" jsonArray2 hai ye");
					for(int k=0;k<jsonArray2.size();k++)
					{
					JsonObject jsonObject = jsonArray2.get(k).getAsJsonObject();
					String labelName = jsonObject.get("LabelName").getAsString();
					String value = jsonObject.get("Value").getAsString();
					String fieldType = jsonObject.get("Type").getAsString();
					if(fieldType.equals("Datepicker")&&!value.isEmpty()) {
					value = DateFieldConversion(value);
					}
					writeTableContent(labelName, value);
					}
				writeTableEndTags();
				getArchieveEnvDetails();
		}
		private void getArchieveEnvDetails() {
			writeHeader(legacyAppInfoSection[1]);
			
	        
	        JsonArray jsonArray1 = jsonArray.get(1).getAsJsonArray();	
			JsonArray jsonArray2 = jsonArray1.get(1).getAsJsonArray();
			for(int i=0;i<jsonArray2.size();i++) {

				if(i==0)
				{
				writeTableStartTags();
				writeTableHeadingTags(new String[]{"Dev Name","Test Name","Stage Name","Production Name"});
				JsonArray jsonArray3 = jsonArray2.get(i).getAsJsonArray();
				JsonObject jsonObject = jsonArray3.get(0).getAsJsonObject();	
				writeTableDataTags(new String[] {jsonObject.get("DevName").getAsString(),jsonObject.get("TestName").getAsString(),jsonObject.get("StageName").getAsString(),jsonObject.get("ProdName").getAsString()});
				writeTableEndTags();
				writeHeader("");
				}
				else if(i==1)
				{
					writeTableStartTags();
					writeTableHeadingTags(new String[]{"Dev Server IP","Test Server IP","Stage Server IP","Production Server IP"});
					JsonArray jsonArray3 = jsonArray2.get(i).getAsJsonArray();
					JsonObject jsonObject = jsonArray3.get(0).getAsJsonObject();	
					writeTableDataTags(new String[] {jsonObject.get("DevServerIp").getAsString(),jsonObject.get("TestServerIp").getAsString(),jsonObject.get("StageServerIp").getAsString(),jsonObject.get("ProdServerIp").getAsString()});
					writeTableEndTags();
				}
			}
			
		}
		//get Retention Details
		
		private void getRetentionDetails() {
				writeHeader("Retention Details");
				JsonArray jsonArray1 = jsonArray.get(2).getAsJsonArray();
				JsonArray jsonArray2 = jsonArray1.get(1).getAsJsonArray();

					JsonObject jsonObject = jsonArray1.get(0).getAsJsonObject();
					String labelName=retentionSection[0].toString();
					String value = jsonObject.get(retentionSection[0].toString()).getAsString();
					writeSectionInfo(value);
					writeHeader("");
					writeTableStartTags();
					writeTableHeadingTags(new String[]{"Retention Level (Select all Used)","Retention Level","Condition (If applicable)	","Date Used","Description"});
					for(int i=0;i<jsonArray2.size();i++) {
					JsonObject jsonObject1 = jsonArray2.get(i).getAsJsonObject();	
					writeTableDataTags(new String[] {jsonObject1.get("retentionCheck").getAsString(),jsonObject1.get("retentionLevel").getAsString(),jsonObject1.get("condition").getAsString(),jsonObject1.get("dateUsed").getAsString(),jsonObject1.get("descp").getAsString()});
					}
					writeTableEndTags();
		}//over
		//get Business Requirements 
		
				private void getBusinessRequirements() {
						writeHeader("Business Requirements");
						String ContentValue="Each requirement must be marked as In-Scope or Out-of-Scope for this project, with additional information specific to each requirement if necessary.::\nRequirement ID's are linked to test script ID's to ensure traceability from requirement to test execution. Requirement ID's may be formatted according to client needs.";
						writeSectionInfo(ContentValue);
						writeHeader("");

						JsonArray jsonArray1 = jsonArray.get(3).getAsJsonArray();

		    			JsonObject jsonObject = jsonArray1.get(0).getAsJsonObject();
						writeHeader("Requirement In Scope");
     					writeHeader("");
				     	writeTableStartTags();
    					writeTableHeadingTags(new String[]{"Req In-Scope(Y/N)","Description"});
						for(int i=0;i<jsonArray1.size();i++) {
							JsonObject jsonObject1 = jsonArray1.get(i).getAsJsonObject();	
							writeTableDataTags(new String[] {jsonObject1.get("req_in_scope").getAsString(),jsonObject1.get("description").getAsString()});
						}
							writeTableEndTags();
							functionalReq();
							getScreenRequirements();
										}
				
				//functional requirement
				
				
				private void functionalReq() {
							writeHeader("Functional Requirement");
							
							JsonArray jsonArray1 = jsonArray.get(5).getAsJsonArray();
                            for(int j=0; j<functionalReqSection.length;j++) {
	         				JsonArray jsonArray2 = jsonArray1.get(j).getAsJsonArray();
							writeHeader(functionalReqSection[j].toString());
					     	writeTableStartTags();
					     	writeTableHeadingTags(new String[]{"Req Id","Req In-Scope(Y/N)","Requirement Type","Requirement","Additional Info"});
					    if(jsonArray2.size()>0)
					    {
						for(int i=0;i<jsonArray2.size();i++) {
								JsonObject jsonObject1 = jsonArray2.get(i).getAsJsonObject();
								
									writeTableDataTags(new String[] {jsonObject1.get("reqId").getAsString(),jsonObject1.get("reqInScope").getAsString(),jsonObject1.get("reqType").getAsString(),jsonObject1.get("req").getAsString(),jsonObject1.get("additionInfo").getAsString()});
								  
						}}
					    else
					    {
					    	writeTableDataEmptyTags(new String[] {"","","","",""});
					    }
								writeTableEndTags();
                            }
				}
								//over
			//Screen Requirements
				private void getScreenRequirements() {
					writeHeader("Screen Requirements");
					
					JsonArray jsonArray1 = jsonArray.get(6).getAsJsonArray();
     				JsonArray jsonArray2 = jsonArray1.get(0).getAsJsonArray();
	    			JsonObject jsonObject1 = jsonArray2.get(0).getAsJsonObject();
			     	Boolean dataCheck1=jsonObject1.get("checkData").getAsBoolean();	
			     	System.out.println("Screen Requirements : "+jsonArray1);
	    			if(dataCheck1) {
	    				writeTableStartTags();
			     		writeTableHeadingTags(new String[]{"Req Id","Screen Display Name in Infoarchive","Purpose","Equivalent in the Legacy Application"});
			     		for(int i=0;i<jsonArray2.size();i++) {
							JsonObject jsonObject2 = jsonArray2.get(i).getAsJsonObject();
							
								writeTableDataTags(new String[] {jsonObject2.get("reqId").getAsString(),jsonObject2.get("screenDisplay").getAsString(),jsonObject2.get("purpose").getAsString(),jsonObject2.get("equivalentLegacy").getAsString()});
							  
			     		}
			     		writeTableEndTags();
						writeHeader("");
	    			}else {
	    				writeTableStartTags();
			     		writeTableHeadingTags(new String[]{"Req Id","Screen Display Name in Infoarchive","Purpose","Equivalent in the Legacy Application"});
			     		writeTableDataEmptyTags(new String[] {"","","",""});
			     		writeTableEndTags();
						writeHeader("");
	    			}
	     				JsonArray jsonArray3 = jsonArray1.get(1).getAsJsonArray();
		    			JsonObject jsonObject3 = jsonArray3.get(0).getAsJsonObject();
				     	Boolean dataCheck2=jsonObject3.get("checkData").getAsBoolean();	
				     	if(dataCheck2) {	
				     	writeTableStartTags();
						writeTableHeadingTags(new String[]{"Req Id","Search Form Name","Search Field Name","Field Format","Data Type","Data Retrieval Requirement","Required Field","Search Field Additional Information"});
						for(int i=0;i<jsonArray3.size();i++) {
							JsonObject jsonObject4 = jsonArray3.get(i).getAsJsonObject();
							
								writeTableDataTags(new String[] {jsonObject4.get("reqId").getAsString(),jsonObject4.get("searchForm").getAsString(),jsonObject4.get("searchField").getAsString(),jsonObject4.get("fieldFormat").getAsString(),jsonObject4.get("dataType").getAsString(),jsonObject4.get("dataRetrieval").getAsString(),jsonObject4.get("requiredField").getAsString(),jsonObject4.get("additionalInfo").getAsString()});
							  
						}
						writeTableEndTags();						
                    }else {
                    	writeTableStartTags();
						writeTableHeadingTags(new String[]{"Req Id","Search Form Name","Search Field Name","Field Format","Data Type","Data Retrieval Requirement","Required Field","Search Field Additional Information"});
			     		writeTableDataEmptyTags(new String[] {"","","","","","","",""});
						writeTableEndTags();
                    }		//over
                    
				}
				private void getAbbrevationDef() {
					/*
					 * writeHeader("Abbreviation, Acronym, Definitions"); String key[]=
					 * {"AB","BI","IA","Read-Only","REQ","UAT","XML"}; String value[]=
					 * {"Active Directory Group","Business Intelligence",
					 * "InfoArchive is a repository that compresses and maintains data from business applications and data sources. Data contained within the archive is no longer transactional and immutable (unable to be changed). Access to the archive is normally confined to a small group of users defined by security rules and roles. Data retention policies may be applied to data contained within the archive"
					 * ,"Date at which the legacy application data has been set to static use. There are no changes to be made to the data, no integration jobs running to alter the status of the data, nor will any future changes be made to the data"
					 * , "Requirement","User Acceptance Testing",
					 * "Extensible Markup Format is used to define documents with a standard format that can be read by any XML-compatible application.It is a \\\"metalanguage\\\" that can be used to create markup languages for specific applications"
					 * }; writeTableStartTags(); writeTableHeadingTags(new
					 * String[]{"Abbreviation/Acronym","Description"}); for(int
					 * i=0;i<key.length;i++) {
					 * 
					 * writeTableDataTags(new String[] {key[i],value[i]}); }
					 */
                    writeHeader("Abbreviation/Acronyms");					
					JsonArray jsonArray1 = jsonArray.get(7).getAsJsonArray();
					writeTableStartTags();
					writeTableHeadingTags(new String[]{"Abbreviation/Acronym","Description"});
					
					for(int i=0;i<jsonArray1.size();i++) {
						JsonObject jsonObject1 = jsonArray1.get(i).getAsJsonObject();
						if(jsonObject1.get("checkData").getAsBoolean()) {
						writeTableDataTags(new String[] {jsonObject1.get("abbreviation_acronym").getAsString(),jsonObject1.get("description").getAsString()});
					}
					else
			     		writeTableDataEmptyTags(new String[] {"",""});
					}

					writeTableEndTags();
				}
//					writeHeader("Abbreviation, Acronym, Definitions");
//					JsonArray jsonArray1 = jsonArray.get(7).getAsJsonArray();
//					writeTableStartTags();
//					writeTableHeadingTags(new String[]{"Abbreviations","Description"});
//					for(int i=0;i<jsonArray1.size();i++) {
//						JsonObject jsonObject1 = jsonArray1.get(i).getAsJsonObject();	
//						writeTableDataTags(new String[] {jsonObject1.get("abbreviation_acronym").getAsString(),jsonObject1.get("description").getAsString()});
//					}
//						writeTableEndTags();
//                    }
				
				// Document Revisions
				private void getDocumentRevisions() {
					writeHeader("Document Revisions");
					
					JsonArray jsonArray1 = jsonArray.get(8).getAsJsonArray();
					writeTableStartTags();
					writeTableHeadingTags(new String[]{"Date","Version No","Document Changes","Change Author"});
					for(int i=0;i<jsonArray1.size();i++) {
						JsonObject jsonObject1 = jsonArray1.get(i).getAsJsonObject();	
						writeTableDataTags(new String[] {jsonObject1.get("date").getAsString(),jsonObject1.get("version").getAsString(),jsonObject1.get("documentChanges").getAsString(),jsonObject1.get("changeAuthor").getAsString()});
					}
					writeTableEndTags();
				}
				// Document Revisions
				private void getAddendum() {
				    writeHeader("Addendum");
				    
				    JsonArray jsonArray1 = jsonArray.get(9).getAsJsonArray();
				    System.out.println(" Addendum jsonArray1 : "+jsonArray1);
				    for(int i=0;i<jsonArray1.size();i++) {
				        JsonObject jsonObject1 = jsonArray1.get(i).getAsJsonObject();
				        System.out.println(" Addendum Objects "+i+" : "+jsonObject1);
				        writeTableStartTags();
				        String label= jsonObject1.get("labelName").getAsString();
				        String value= jsonObject1.get("addendumInfo").getAsString();
				        writeTableContent(label, value);
				        writeTableEndTags();
				        writeNewLineTags();
				        writeTableStartTags();		
				        writeAddendumFilesTableHeadingTags(new String[]{"S.No","File Name"});
				        JsonObject jsonObject2 = jsonObject1.getAsJsonObject("fileNames");
				        System.out.println(" Addendum Objects File Names : "+jsonObject2);
				        System.out.println(" Addendum Objects Size : "+jsonObject2.size());

				        if (jsonObject2.size()>1) {
				        	jsonObject2.remove("checkData");
				        	int j=1;
				        	for (Map.Entry<String, JsonElement> entry : jsonObject2.entrySet()) {				        	 
				        	    JsonElement value1 = entry.getValue();				        	    
				        	    if (value1 != null && value1.isJsonPrimitive()) {
				        	        String fileName = value1.getAsString();
				        	        writeTableDataTags(new String[] { String.valueOf(j), fileName });
				        	    }
				        	    j++;
				        	}
				        }
				        else {
						    writeTableFileEmptyTags(new String[] {"",""});
						    }
				        
				        writeTableEndTags();
				        writeNewLineTags();
				    } 
				}
				
	   private void getRolesResponsibilites() {
			writeHeader("Roles & Responsibilites");
			writeTableStartTags();
	        writeTableHeadingTags(new String[]{"Role","Name","Email","UserName","Priority"});
			JsonArray jsonArray1 = jsonArray.get(0).getAsJsonArray();
			JsonArray jsonArray2 = jsonArray1.get(1).getAsJsonArray();
			
			for(int i=0;i<jsonArray2.size();i++) {
				JsonObject jsonObject = jsonArray2.get(i).getAsJsonObject();	
				writeTableDataTags(new String[] {jsonObject.get("role").getAsString(),jsonObject.get("name").getAsString(),jsonObject.get("emailId").getAsString(),jsonObject.get("username").getAsString(),jsonObject.get("priority_order_num").getAsString()});
			}
			writeTableEndTags();
		}
	


}

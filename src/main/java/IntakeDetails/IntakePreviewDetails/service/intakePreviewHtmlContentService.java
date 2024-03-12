package IntakeDetails.IntakePreviewDetails.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.apache.commons.codec.binary.Base64;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import exportPdf.service.jsonToHtmlContent;
import logger.System;

public class intakePreviewHtmlContentService  extends jsonToHtmlContent{

	private JsonArray jsonArray =null;
	private String[] assessment_sections = {"Application Details","Data Characteristics","Compliance Characteristics","Archival Consumption","Contract Information"};
	private String[] intake_sections = {"Opportuntiy Details","Triage Details","Triage Summary Details"};
	public intakePreviewHtmlContentService(JsonArray jsonArray) {
	 this.jsonArray = jsonArray;
	}
	
	public void getHtmlContent() {
		writeStartingTags();
		//writeImageTag(false);
		writeMainTitle("Intake Summary");
		getIntakeDetails();
		getAssessmentDetails();
		getApprovalDetails();
		writeEndingTags();
	}

	private void getIntakeDetails() {
		for(int j=0;j<intake_sections.length;j++) {
			writeHeader(intake_sections[j]);
			JsonArray jsonArray1 = jsonArray.get(j).getAsJsonArray();		
			System.out.println(jsonArray1+ "  Intake sesion hai ");
			writeTableStartTags();
			for(int i=0;i<jsonArray1.size();i++) {
				JsonObject jsonObject = jsonArray1.get(i).getAsJsonObject();
				String labelName = jsonObject.get("LabelName").getAsString();
				String value = jsonObject.get("Value").getAsString();
				String fieldType = jsonObject.get("Type").getAsString();
				if(fieldType.equals("Datepicker")&&!value.isEmpty()) {
				value = DateFieldConversion(value);
				}
				writeTableContent(labelName, value);
		}
			writeTableEndTags();
		}
	}
	private void getAssessmentDetails() {
		writeHeader("Assessment Details");
		JsonArray jsonArray2 = jsonArray.get(3).getAsJsonArray();
		getAssessmentSections(jsonArray2);
	}
	
	private void getAssessmentSections(JsonArray jsonArray) {
		
		boolean isContractInformationVisible = false;
		for(int j =0;j<assessment_sections.length;j++) {
			JsonArray jsonArray1 = jsonArray.get(j).getAsJsonArray();
			String section = assessment_sections[j];
			
		if(!section.equals("Contract Information") || isContractInformationVisible) {
			writeSectionHeader(section);
			writeTableStartTags();
       for(int i=0;i<jsonArray1.size();i++) {	
			JsonObject jsonObject = jsonArray1.get(i).getAsJsonObject();
			String labelName = jsonObject.get("LabelName").getAsString();
			String value = jsonObject.get("Value").getAsString();
			String fieldType = jsonObject.get("Type").getAsString();
			if(fieldType.equals("Datepicker")&&!value.isEmpty()) {
			value = DateFieldConversion(value);
			}
			
			if(section.equals("Application Details")) {
				String columnName = jsonObject.get("ColumnName").getAsString();
				if(columnName.equals("AppDetails")&&value.equals("COTS - Commercial Off The Shelf") || value.equals("MOTS - Modified Off The Shelf")) {
					isContractInformationVisible =true;
				}
			}
			writeTableContent(labelName, value);
		}
		}
		writeTableEndTags();
		}
		
	}
	
   private void getApprovalDetails() {
		writeHeader("Approval Details");
		writeTableStartTags();
        writeTableHeadingTags(new String[]{"Name","Email","UserName","Role","Approval Status"});
		JsonArray jsonArray2 = jsonArray.get(4).getAsJsonArray();
		for(int i=1;i<jsonArray2.size();i++) {
			JsonObject jsonObject = jsonArray2.get(i).getAsJsonObject();	
			writeTableDataTags(new String[] {jsonObject.get("name").getAsString(),jsonObject.get("emailId").getAsString(),jsonObject.get("username").getAsString(),jsonObject.get("role").getAsString(),jsonObject.get("intakeApproval").getAsString()});
		}
		writeTableEndTags();
	}
}

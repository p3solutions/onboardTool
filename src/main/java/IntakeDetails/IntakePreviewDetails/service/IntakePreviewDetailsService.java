package IntakeDetails.IntakePreviewDetails.service;

import IntakeDetails.IntakeAssessment.service.IntakeAssessSectionDataRetrieveService;
import IntakeDetails.IntakeAssessment.service.IntakeAssessmentService;
import IntakeDetails.IntakeOpportunity.Service.IntakeOpportunityService;
import IntakeDetails.IntakeStakeHolder.service.IntakeStakeHolderService;
import IntakeDetails.IntakeTriage.Service.IntakeTriageService;
import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import common.constant.APPLICATION_ROLES;
import common.constant.MODULE_NAME;
import common.email.service.EmailApprovalService;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IntakePreviewDetailsService {
	
	    DBconnection dBconnection =null;
		Connection con = null;
		private String username;
		private String oppId;
		
		public IntakePreviewDetailsService(String oppId,String username) throws ClassNotFoundException, SQLException {
			dBconnection = new DBconnection();
			con = (Connection) dBconnection.getConnection();
			this.oppId = oppId;
			this.username = username;
		}
		
		
		public JsonArray IntakeApprovalPreviewDataRetrieve(String Id,String role) throws ClassNotFoundException, SQLException {
			JsonArray jsonArray = new JsonArray();
			IntakeStakeHolderService intakeStake =  new IntakeStakeHolderService();
			try {
				JsonObject jsonObj = new JsonObject();
				
			switch(role) {

			   case APPLICATION_ROLES.PROJECT_SPONSOR:
				jsonArray.add(IntakeOpportunityService.IntakeOpportunityDataRetrieveService(Id));
				jsonArray.add(new IntakeTriageService().DataRetrieve(Id));
				jsonArray.add(new IntakeTriageSummaryService().DataRetrieve(Id));
				jsonArray.add(intakeStake.IntakeStakeHolderDataRetrieve(Id,"","",false));
				jsonObj.addProperty("userRole",APPLICATION_ROLES.PROJECT_SPONSOR );
				jsonArray.add(jsonObj);
				break;
				
			   case APPLICATION_ROLES.PROJECT_MANAGER:
					jsonArray.add(IntakeOpportunityService.IntakeOpportunityDataRetrieveService(Id));
					jsonArray.add(new IntakeTriageService().DataRetrieve(Id));
					jsonArray.add(new IntakeTriageSummaryService().DataRetrieve(Id));
					jsonArray.add(new IntakeAssessSectionDataRetrieveService("APPLICATIONINFO",Id).DataRetrieveTableInfo());
					boolean checkContractInfo = new IntakeAssessSectionDataRetrieveService("CONTRACTINFO", Id).CheckAppInfoThirdParty();
					
					if(checkContractInfo)
						jsonArray.add(new IntakeAssessSectionDataRetrieveService("CONTRACTINFO", Id).DataRetrieveTableInfo());
					
					jsonArray.add(intakeStake.IntakeStakeHolderDataRetrieve(Id,"","",false));
					jsonObj.addProperty("userRole",APPLICATION_ROLES.PROJECT_MANAGER );
					jsonObj.addProperty("contractInfo", checkContractInfo);
					jsonArray.add(jsonObj);
					break;
					
			   case APPLICATION_ROLES.BUSINESS_OWNER:
				    jsonArray.add(IntakeOpportunityService.IntakeOpportunityDataRetrieveService(Id));
					jsonArray.add(new IntakeTriageService().DataRetrieve(Id));
					jsonArray.add(new IntakeTriageSummaryService().DataRetrieve(Id));
					jsonArray.add(new IntakeAssessSectionDataRetrieveService("APPLICATIONINFO",Id).DataRetrieveTableInfo());
					jsonArray.add(new IntakeAssessSectionDataRetrieveService("COMPLIANCE",Id).DataRetrieveTableInfo());
					jsonArray.add(new IntakeAssessSectionDataRetrieveService("ARCHIVALCONSUMPTION",Id).DataRetrieveTableInfo());
                    boolean checkContractInfo1 = new IntakeAssessSectionDataRetrieveService("CONTRACTINFO", Id).CheckAppInfoThirdParty();
					if(checkContractInfo1)
						jsonArray.add(new IntakeAssessSectionDataRetrieveService("CONTRACTINFO", Id).DataRetrieveTableInfo());
					jsonArray.add(intakeStake.IntakeStakeHolderDataRetrieve(Id,"","",false));
					jsonObj.addProperty("userRole",APPLICATION_ROLES.BUSINESS_OWNER );
					jsonObj.addProperty("contractInfo", checkContractInfo1);
					jsonArray.add(jsonObj);
					break;
			
			   case APPLICATION_ROLES.TECHNICAL_SME:
					jsonArray.add(new IntakeAssessSectionDataRetrieveService("DATACHARACTERISTICS",Id).DataRetrieveTableInfo());
					jsonArray.add(intakeStake.IntakeStakeHolderDataRetrieve(Id,"","",false));
					jsonObj.addProperty("userRole",APPLICATION_ROLES.TECHNICAL_SME );
					jsonArray.add(jsonObj);
				   break;
				   
			   case APPLICATION_ROLES.APPLICATION_OWNER:	   
			   case APPLICATION_ROLES.DEVELOPMENT_OWNER:
				    jsonArray.add(IntakeOpportunityService.IntakeOpportunityDataRetrieveService(Id));
					jsonArray.add(new IntakeTriageService().DataRetrieve(Id));
					jsonArray.add(new IntakeTriageSummaryService().DataRetrieve(Id));
					jsonArray.add(new IntakeAssessSectionDataRetrieveService("APPLICATIONINFO",Id).DataRetrieveTableInfo());
					jsonArray.add(new IntakeAssessSectionDataRetrieveService("DATACHARACTERISTICS",Id).DataRetrieveTableInfo());
					jsonArray.add(new IntakeAssessSectionDataRetrieveService("COMPLIANCE",Id).DataRetrieveTableInfo());
					jsonArray.add(new IntakeAssessSectionDataRetrieveService("ARCHIVALCONSUMPTION",Id).DataRetrieveTableInfo());
					boolean checkContractInfo2 = new IntakeAssessSectionDataRetrieveService("CONTRACTINFO", Id).CheckAppInfoThirdParty();
					if(checkContractInfo2)
						jsonArray.add(new IntakeAssessSectionDataRetrieveService("CONTRACTINFO", Id).DataRetrieveTableInfo());
					jsonArray.add(new IntakeAssessmentService().DataRetrieve(Id));
					jsonArray.add(intakeStake.IntakeStakeHolderDataRetrieve(Id,"","",false));
					jsonArray.add(getCurrentUserApproverId());
					jsonArray.add(CheckOverallApproval(Id));
					jsonObj.addProperty("userRole", APPLICATION_ROLES.APPLICATION_OWNER+"|"+APPLICATION_ROLES.DEVELOPMENT_OWNER);
					jsonObj.addProperty("contractInfo", checkContractInfo2);

					jsonArray.add(jsonObj);
				   break;
			}
			
				intakeStake = null;
				System.gc();
			}
			catch(Exception e) {
				e.printStackTrace();
				System.out.println("Exception--------[info]----------"+e);
			}
			
			return jsonArray;
		}
		public JsonArray IntakePreviewDataRetrieve(String Id) throws ClassNotFoundException, SQLException {
		JsonArray jsonArray = new JsonArray();
		IntakeStakeHolderService intakeStake =  new IntakeStakeHolderService();
		try {
			
			jsonArray.add(IntakeOpportunityService.IntakeOpportunityDataRetrieveService(Id));
			jsonArray.add(new IntakeTriageService().DataRetrieve(Id));
			jsonArray.add(new IntakeTriageSummaryService().DataRetrieve(Id));
			jsonArray.add(new IntakeAssessmentService().DataRetrieve(Id));
			jsonArray.add(intakeStake.IntakeStakeHolderDataRetrieve(Id,"","",false));
			jsonArray.add(getCurrentUserApproverId());
			jsonArray.add(CheckOverallApproval(Id));
			
			intakeStake = null;
			System.gc();
		}
		
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception--------[info]----------"+e);
		}
		
		return jsonArray;
		
	}
		
	private JsonObject getCurrentUserApproverId() {
		JsonObject approverId = null;
		try {
		   	approverId = new JsonObject();
		   	String selectQuery = "select * from intake_stake_holder_info  where oppId=? and username =?";
		   	PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, oppId);
			st.setString(2, username);
			ResultSet rs = st.executeQuery();
		   	if(rs.next()) {
		   		approverId.addProperty("a_id", rs.getString("approvalId"));
		   		EmailApprovalService mailService = new EmailApprovalService(oppId, "", MODULE_NAME.INTAKE_MODULE);
		   		approverId.addProperty("checkRequestSign", mailService.getMailPriorityNumber());
		   	}
		   	st.close();
		   	rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return approverId;
	}
	private JsonObject CheckOverallApproval(String Id)
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean checkOverallApproval = false;
			String SelectQuery="Select * from module_approval_info where oppid=? and moduleName='Intake' ";
			PreparedStatement st = con.prepareStatement(SelectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				checkOverallApproval = Boolean.parseBoolean(rs.getString(4));
			}
			rs.close();
			st.close();
			jsonObject.addProperty("CheckExistence",checkOverallApproval);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
	}

}

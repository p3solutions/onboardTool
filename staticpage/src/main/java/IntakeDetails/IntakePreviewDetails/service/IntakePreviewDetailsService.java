package IntakeDetails.IntakePreviewDetails.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.google.gson.JsonArray;

import IntakeDetails.IntakeAssessment.service.IntakeAssessmentService;
import IntakeDetails.IntakeOpportunity.Service.IntakeOpportunityService;
import IntakeDetails.IntakeStakeHolder.service.IntakeStakeHolderService;
import IntakeDetails.IntakeTriage.Service.IntakeTriageService;
import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;
import onboard.DBconnection;

public class IntakePreviewDetailsService {
	
	 DBconnection dBconnection =null;
		
		Connection con = null;
		
		public IntakePreviewDetailsService() throws ClassNotFoundException, SQLException {
			dBconnection = new DBconnection();
			con = (Connection) dBconnection.getConnection();
		}
		
		public JsonArray IntakePreviewDataRetrieve(String Id) throws ClassNotFoundException, SQLException {
		JsonArray jsonArray = new JsonArray();
		IntakeStakeHolderService intakeStake =  new IntakeStakeHolderService();
		try {
			
			jsonArray.add(IntakeOpportunityService.IntakeOpportunityDataRetrieveService(Id));
			jsonArray.add(new IntakeTriageService().DataRetrieve(Id));
			jsonArray.add(new IntakeTriageSummaryService().DataRetrieve(Id));
			jsonArray.add(new IntakeAssessmentService().DataRetrieve(Id));
			jsonArray.add(intakeStake.IntakeStakeHolderDataRetrieve(Id,""));
			
			intakeStake = null;
			System.gc();
		}
		
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception--------[info]----------"+e);
		}
		
		return jsonArray;
		
	}

}

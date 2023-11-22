package Opportunity.Service;

import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionTemplateService;
import NewArchiveRequirements.AbbreviationList.service.Add_Abbreviation_Service;
import NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service.archiveFunctionDataRetrieveService;
import Opportunity.OpportunityBean;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class NewOpportunityCreateService {

	public static JsonObject OpportunityValidation(String AppName,JsonArray jsonArray,boolean checkMandatory)
	{
		PreparedStatement st=null,st1=null;
		ResultSet rs=null,rs1=null;
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean checkAPMID = false;
			boolean checkAppName = false;
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			String AMPID = OpportunityBean.getRecord_Number();
			String CheckQueryAmpid = "SELECT * FROM OPPORTUNITY_INFO WHERE ID='"+AMPID+"'";
			st = connection.prepareStatement(CheckQueryAmpid);
			rs = st.executeQuery();
			if(rs.next())
			{
				checkAPMID = true;
			}
			String CheckQueryAppName = "SELECT * FROM OPPORTUNITY_INFO WHERE COLUMN_NAME = 'appName';";
			st1 = connection.prepareStatement(CheckQueryAppName);
			rs1 = st1.executeQuery();
			while(rs1.next()) {
				if(rs1.getString("value").equals(AppName))
				{
					checkAppName =true;
				}
			}
			jsonObject.addProperty("APMID_VALIDATION", checkAPMID);
			jsonObject.addProperty("AppName_VALIDATION",checkAppName);
			if(checkMandatory==true && checkAPMID == false && checkAppName == false)
			{
				NewOpportunityCreateService.NewOpportunityDetailsSave(jsonArray);
				
				Add_Abbreviation_Service AddAbbFromTemplate=new Add_Abbreviation_Service();
				AddAbbFromTemplate.TemplateInsert(AMPID);
				ArchiveExecutionTemplateService archiveExecObj = new ArchiveExecutionTemplateService(OpportunityBean.getRecord_Number());
				archiveExecObj.archiveTemplateToArchiveInfo();
				archiveExecObj = null;
				String[] tableNamesFunctionReq = { "Archive_DataReq_Info", "Archive_RetentionLegalReq_Info",
						"Archive_SecurityReq_Info", "Archive_UsabilityReq_Info", "Archive_AuditReq_Info" };
				for (int index = 0; index < tableNamesFunctionReq.length; index++) {
					archiveFunctionDataRetrieveService dataReqDetails;					
						dataReqDetails = new archiveFunctionDataRetrieveService(AMPID, AppName, tableNamesFunctionReq[index]);
						dataReqDetails.TemplateInsert();
						dataReqDetails = null;	
                        System.gc();
					
					}
				
			}
			st.close();
			rs.close();
			st1.close();
			rs1.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception----------[info]--------"+e);
		}
		return jsonObject;
	}
	
	
	public static void NewOpportunityDetailsSave(JsonArray jsonArr) {
		PreparedStatement st=null,st1=null,st2=null;
		ResultSet rs=null,rs2=null;
		 try {
			 
			 DBconnection con = new DBconnection();
			 Connection connection = (Connection) con.getConnection();
			 
			  for(int i=0;i<jsonArr.size();i++)
			 {
			JsonObject jsonObj = jsonArr.get(i).getAsJsonObject();
			String name = jsonObj.get("Name").getAsString();
			String value = jsonObj.get("Value").getAsString();
			String SelectQuery = "select * from opportunity_info_details where column_name='"+name+"';";
			st = connection.prepareStatement(SelectQuery);
			rs = st.executeQuery();
			if(rs.next())
			{
				String UpdateQuery = "update opportunity_info_details set value='"+value+"' where column_name ='"+name+"'";
				st1 = connection.prepareStatement(UpdateQuery);
                st1.executeUpdate();
                
			}
			 }
			String SelectTableQuery = "select * from opportunity_info_details order by seq_no;";
			st2 = connection.prepareStatement(SelectTableQuery);
            rs2 = st2.executeQuery();
            while(rs2.next())
            {
            	String Opportunity_InsertQuery = "insert into Opportunity_Info (seq_no,Id, prj_name, app_name, options, label_name, column_name, type, mandatory, value,usermandatoryflag)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";

				PreparedStatement prestmt = connection.prepareStatement(Opportunity_InsertQuery);
				prestmt.setInt(1, rs2.getInt("seq_no"));
				prestmt.setString(2, rs2.getString("Id"));
				prestmt.setString(3, rs2.getString("prj_name"));
				prestmt.setString(4, rs2.getString("app_name"));
				prestmt.setString(5, rs2.getString("options"));
				prestmt.setString(6, rs2.getString("label_name"));
				prestmt.setString(7, rs2.getString("column_name"));
				prestmt.setString(8, rs2.getString("type"));
				prestmt.setString(9, rs2.getString("mandatory"));
				prestmt.setString(10, rs2.getString("value"));
				prestmt.setString(11, rs2.getString("usermandatoryflag"));
				prestmt.execute();
				  }
			st2.close();
			rs2.close();
			st.close();
			rs.close();
			st1.close();
			connection.close();
      
		 }
		 catch(Exception e) {
			 e.printStackTrace();
			System.out.println("Exception----------[info]--------"+e);
		 }
	}
}

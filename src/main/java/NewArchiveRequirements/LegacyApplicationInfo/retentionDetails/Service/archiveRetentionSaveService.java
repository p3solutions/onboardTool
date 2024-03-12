package NewArchiveRequirements.LegacyApplicationInfo.retentionDetails.Service;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveRetentionSaveService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray ;
	
	public archiveRetentionSaveService(String Id, JsonArray jsonArray) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
	}
	
	public JsonObject archiveRetentionSave()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag =false;
		try
		{	
			JsonObject jsonObj1 = jsonArray.get(0).getAsJsonObject();
			String UpdateQuery1 = "update archive_retention_content_info set contentInfo = ? where OppId=?";
	          PreparedStatement prestmt1 = con.prepareStatement(UpdateQuery1);
	          prestmt1.setString(1, jsonObj1.get("contentInfo").getAsString());
	          prestmt1.setString(2,Id);
	          prestmt1.execute();
	          prestmt1.close();
			for(int i=1;i<jsonArray.size();i++)
			{
				 
		          
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
		  		String seqNum = jsonObj.get("seq_no").getAsString();	
		  		String retentionCheck = jsonObj.get("retentionCheck").getAsString();
		  		String retentionLevel =  jsonObj.get("retentionLevel").getAsString();
		  		String conditions=  jsonObj.get("conditions").getAsString();
		  		String dateUsedType =  jsonObj.get("dateUsedType").getAsString();
		  		String dateUsed =  jsonObj.get(dateUsedType).getAsString();
		  		String descp =  jsonObj.get("descp").getAsString();
		  		
			  String UpdateQuery = "update Archive_Retention_Info set retentionCheck = ?, retentionLevel = ?, conditions = ?, dateUsedType = ?, dateUsed = ?, descp = ? where OppId=? and seq_no=?;";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1, retentionCheck);
	          prestmt.setString(2, retentionLevel);
	          prestmt.setString(3, conditions);
	          prestmt.setString(4, dateUsedType);
	          prestmt.setString(5, dateUsed);
	          prestmt.setString(6, descp);
	          prestmt.setString(7,Id);
	          prestmt.setString(8,seqNum);
	          prestmt.execute();
	          prestmt.close();
			}
			statusFlag =true;
			
			
		}
		
		catch(Exception e)
		{
			statusFlag =false;
			e.printStackTrace();
		}
		jsonObject.addProperty("SaveStatus", statusFlag);
		return jsonObject;
		
	}
	protected void finalize() throws Throwable {
      con.close();
	}
	
}

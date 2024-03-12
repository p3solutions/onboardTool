package NewArchiveRequirements.addendumInfo.service;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveReqAddendumSaveService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray ;
	
	public archiveReqAddendumSaveService(String Id, JsonArray jsonArray) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
		
	}
	
	public JsonObject archiveReqAddendumSave()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag =false;
		try
		{	
			for(int i=0;i<jsonArray.size();i++)
			{
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
		  		String seqNum = jsonObj.get("seq_no").getAsString();	
		  		String label = jsonObj.get("label").getAsString();
		  		String addendumInfo =  jsonObj.get("addendumInfo").getAsString();
		  		
		  		
			  String UpdateQuery = "update Archive_Req_Addendum_Info set labelName = ?, addendumInfo =? where OppId=? and seq_no=?";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1, label);
	          prestmt.setString(2, addendumInfo);
	          prestmt.setString(3, Id);
	          prestmt.setString(4, seqNum);
	          prestmt.execute();
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
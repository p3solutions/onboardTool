package NewArchiveRequirements.documentRevisions.service;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveReqDocRevSaveService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray ;
	
	public archiveReqDocRevSaveService(String Id,JsonArray jsonArray) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
	}
	
	public JsonObject archiveReqDocRevSave()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag =false;
		try
		{	
			for(int i=0;i<jsonArray.size();i++)
			{
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
		  		String seqNum = jsonObj.get("seq_no").getAsString();	
		  		String date = jsonObj.get("date").getAsString();
		  		String version =  jsonObj.get("version").getAsString();
		  		String documentChanges =  jsonObj.get("documentChanges").getAsString();
		  		String changeAuthor =  jsonObj.get("changeAuthor").getAsString();
		  		
			  String UpdateQuery = "update archive_documentrevision_info set date = ?, version =?, documentChanges =?, changeAuthor =? where OppId=? and seq_no=?";
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1, date);
	          prestmt.setString(2, version);
	          prestmt.setString(3, documentChanges);
	          prestmt.setString(4, changeAuthor);
	          prestmt.setString(5, Id);
	          prestmt.setString(6, seqNum);
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

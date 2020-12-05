package ArchiveExecutionModule.ArchiveExecutionDetails.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class ArchiveExecutionDetailService {

	
	 DBconnection dBconnection =null;
		
		Connection con = null;
	
	public ArchiveExecutionDetailService() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
	}

	public JsonArray archiveExecutionDataRetrieve(String Id, String oppName) {
		
		JsonArray jsonArray = new JsonArray();
		
		try {
			JsonObject jsonObject = archiveExecutionHearderInfo(Id); 
			jsonArray.add(jsonObject);
			String selectQuery = "select * from Archive_Execution_Info where oppId = '"+Id+"' and oppName = '"+oppName+"' order by seq_no;";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			while(rs.next())
			{
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("seq_no",rs.getString(1));
				jsonObj.addProperty("oppId",rs.getString(2));
				jsonObj.addProperty("oppName",rs.getString(3));
				jsonObj.addProperty("level",rs.getString(4));
				jsonObj.addProperty("taskId",rs.getString(5));
				jsonObj.addProperty("taskGroup",rs.getString(6));
				jsonObj.addProperty("taskName",rs.getString(7));
				jsonObj.addProperty("taskType",rs.getString(8));
				jsonObj.addProperty("majorDep",rs.getString(9));
				jsonObj.addProperty("assignedTo",rs.getString(10));
				jsonObj.addProperty("planStart",rs.getString(11));
				jsonObj.addProperty("planEnd",rs.getString(12));
				jsonObj.addProperty("actStart",rs.getString(13));
				jsonObj.addProperty("actEnd",rs.getString(14));
				jsonObj.addProperty("completion",rs.getString(15));
				jsonObj.addProperty("status",rs.getString(16));
				jsonObj.addProperty("remark",rs.getString(17));
				jsonArray.add(jsonObj);
				
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
		
	}
	
	
	public JsonObject archiveExecutionHearderInfo(String Id) {
		
		JsonObject jsonObj = new JsonObject();
		try {
			
			String selectQuery = "select * from opportunity_info where id = '"+Id+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while(rs.next()) {
				if((rs.getString("column_name")).equals("apmid"))
					jsonObj.addProperty("Opp_Id",rs.getString("value"));
				else if((rs.getString("column_name")).equals("appName"))
					jsonObj.addProperty("appName",rs.getString("value"));
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonObj;
		
	}
	
	protected void finalize() throws Throwable 
    { 
		System.out.println("Db connection closed.");
        con.close();
    }
	
	
}
package NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;
import java.sql.PreparedStatement;

import onboard.DBconnection;
import logger.System;

public class archiveScreenReqDataRetrieveService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	
	public archiveScreenReqDataRetrieveService(String Id) throws ClassNotFoundException, SQLException {
		
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
	}
	
	public JsonArray archiveScreenInfoDataRetrieve() {
		
		JsonArray jsonArray = new JsonArray();
		try {
			boolean checkData = false;
			JsonObject jsonObject = null;
			String selectQuery = "select * from Archive_ScreenReq_Info where oppId=? order by seq_no;";
			PreparedStatement st=con.prepareStatement(selectQuery);
			st.setString(1, Id);
     		ResultSet rs = st.executeQuery();
			while(rs.next())
			{
				checkData =  true;
			    jsonObject = new JsonObject();
			    jsonObject.addProperty("checkData",checkData);
			    jsonObject.addProperty("seq_no",rs.getString("seq_no"));
			    jsonObject.addProperty("reqId",rs.getString("reqId"));
			    jsonObject.addProperty("screenDisplay",rs.getString("screenDisplay"));
			    jsonObject.addProperty("purpose",rs.getString("purpose"));
			    jsonObject.addProperty("equivalentLegacy",rs.getString("equivalentLegacy"));
				jsonArray.add(jsonObject);
			}
			if(!checkData)
			{
				jsonObject = new JsonObject();
				jsonObject.addProperty("checkData",checkData);
				jsonArray.add(jsonObject);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	public JsonArray searchFormDataRetrieve() {
		
		JsonArray jsonArray = new JsonArray();
		try {
			boolean checkData = false;
			JsonObject jsonObject = null;
			String selectQuery = "select * from Archive_ScreenReq_SearchForm where oppId=? order by seq_no;";
			PreparedStatement st=con.prepareStatement(selectQuery);
			st.setString(1, Id);
     		ResultSet rs = st.executeQuery();
			
			while(rs.next())
			{
				checkData =  true;
			    jsonObject = new JsonObject();
			    jsonObject.addProperty("checkData",checkData);
			    jsonObject.addProperty("seq_no",rs.getString("seq_no"));
			    jsonObject.addProperty("reqId",rs.getString("reqId"));
			    jsonObject.addProperty("searchForm",rs.getString("searchForm"));
			    jsonObject.addProperty("searchField",rs.getString("searchField"));
			    jsonObject.addProperty("fieldFormat",rs.getString("fieldFormat"));
			    jsonObject.addProperty("dataType",rs.getString("dataType"));
			    jsonObject.addProperty("dataRetrieval",rs.getString("dataRetrieval"));
			    jsonObject.addProperty("requiredField",rs.getString("requiredField"));
			    jsonObject.addProperty("additionalInfo",rs.getString("additionalInfo"));
				jsonArray.add(jsonObject);
			}
			if(!checkData)
			{
				jsonObject = new JsonObject();
				jsonObject.addProperty("checkData",checkData);
				jsonArray.add(jsonObject);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}
	
}

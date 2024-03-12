package NewArchiveRequirements.Introduction.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveReqIntroDataRetrieveService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	
	public archiveReqIntroDataRetrieveService(String Id) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
	}
	
	public JsonObject archiveReqDataRetrieve(){
		
		JsonObject jsonObject = new JsonObject();
		
		try {
			
			String selectQuery = "select * from archiveintro_info where OppId = ?;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
					
			if(rs.next()) {
				jsonObject.addProperty("checkData", true);
				jsonObject.addProperty("Purpose", rs.getString("purpose"));
				jsonObject.addProperty("Scope", rs.getString("scope"));
				jsonObject.addProperty("Assumption", rs.getString("assumption"));
				
			}
			else 
				jsonObject.addProperty("checkData", false);
				
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	
	
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}

}

package NewArchiveRequirements.LegacyApplicationInfo.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import onboard.DBconnection;
import logger.System;

public class LegacyAppSrcService {

		public static JsonObject  LegacyAppSrcDataRetrieveService(String Id,String value) {
			JsonObject jsonObject = new JsonObject();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			
			String SelectQuery = "SELECT value FROM decom3sixtytool.assessment_application_info where column_name ='AssessAppPlatform' and id=?;";
			PreparedStatement st = con.prepareStatement(SelectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				
				jsonObject.addProperty("value",rs.getString("value"));
				
			}
			rs.close();
			st.close();
		}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		return jsonObject;
	}
		
}

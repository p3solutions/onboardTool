package NewArchiveRequirements.Introduction.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import IntakeDetails.Common.DynamicFields;
import onboard.DBconnection;

public class ApproverRoles_Service {

		public static JsonObject ApproverRolesDataRetrieveService(String Id) {
			JsonObject jsonObject = new JsonObject();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			
			String SelectQuery = "SELECT value FROM opportunity_info where column_name ='request_type' and id='"+Id+"';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(SelectQuery);
			
			if(rs.next()) {
				
				jsonObject.addProperty("request_type", rs.getString("value"));
				
								
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

		public int Add(String iD, String role, String name, String type, int numberofInputfields, String title) {
			// TODO Auto-generated method stub
			return 0;
		}

		

	

		
}
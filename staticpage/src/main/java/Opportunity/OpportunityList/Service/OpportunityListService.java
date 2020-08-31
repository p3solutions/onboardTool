package Opportunity.OpportunityList.Service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class OpportunityListService {

	public static JsonArray OpportunityListDetails(String Projects) {
		JsonArray jsonArray = new JsonArray();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			
			if(Projects.equals("all"))
			{
			 String SelectOpportunityQuery ="select * from opportunity_info where column_name = 'appName'";
			 Statement st = connection.createStatement();
			 ResultSet rs = st.executeQuery(SelectOpportunityQuery);
			 
			 while(rs.next()) {
				 JsonObject jsonObj = new JsonObject();
				 jsonObj.addProperty("OpportunityId", rs.getString("id"));
				 jsonObj.addProperty("OpportunityName", rs.getString("value"));
			     
				 jsonArray.add(jsonObj);
			 }
			 
			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception------->>>>>--------" + e);
		}
		return jsonArray;
	}
}

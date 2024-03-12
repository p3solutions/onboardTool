package Opportunity.OpportunityList.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class OpportunityListService {

	public static JsonArray OpportunityListDetails(String Projects) {
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonArray jsonArray = new JsonArray();
		JsonArray jsonArray1 = new JsonArray();
		try {
			jsonArray1.add(getWaveName());
			jsonArray1.add(getResources());	
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			
			if(Projects.equals("all"))
			{
			 String SelectOpportunityQuery ="select * from opportunity_info where column_name = 'appName'";
			 st = connection.prepareStatement(SelectOpportunityQuery);
			 rs = st.executeQuery();
			 
			 while(rs.next()) {
				 JsonObject jsonObj = new JsonObject();
				 jsonObj.addProperty("OpportunityId", rs.getString("id"));
				 jsonObj.addProperty("OpportunityName", rs.getString("value"));
			     jsonObj.addProperty("CheckWave",checkOpportunityWave(rs.getString("value")));
				 jsonArray.add(jsonObj);
			 }
			 jsonArray1.add(jsonArray);
			 jsonArray1.add(new OpportunityDropdownOptions().getOptions());
			}
			st.close();
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception------->>>>>--------" + e);
		}
		return jsonArray1;
	}
	
	public static JsonArray getWaveName() throws SQLException {
		
		PreparedStatement st=null;
		ResultSet rs=null;
		
		DBconnection dBconnection = null;
		Connection connection = null;
		JsonArray jsonArray = new JsonArray();
		try {
			
			dBconnection = new DBconnection();
			connection = (Connection) dBconnection.getConnection();
			
			String selectQuery = "select * from governance_info where column_name = 'waveName';";
			st = connection.prepareStatement(selectQuery);
			rs = st.executeQuery();
			
			while(rs.next()) { 
				jsonArray.add(rs.getString("value"));
			}
			st.close();
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		finally{
			if(connection != null)
				connection.close();
		}
		
		return jsonArray;
	}
	
	public static boolean checkOpportunityWave(String waveName) throws SQLException {
		
		DBconnection dBconnection = null;
		Connection connection = null;
		boolean checkWave = false; 
		
		try {
			dBconnection = new DBconnection();
			connection = (Connection) dBconnection.getConnection();
			
			String selectQuery = "select * from governance_info where column_name = 'apps' and value like ?;";
			PreparedStatement st = connection.prepareStatement(selectQuery);
			st.setString(1,"%"+waveName+"%");
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) 
				checkWave = true;
			
			st.close();
			rs.close();
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		finally{
			if(connection != null)
				connection.close();
		}
		return checkWave;
	}
	
	public static JsonArray getResources() {
		JsonArray jsonArray = new JsonArray();
		JsonArray jsonArray1 = new JsonArray();
		PreparedStatement st=null;
		ResultSet rs=null;
		try {
			
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			
		
			 String SelectResourcesQuery ="select * from users";
			 st = connection.prepareStatement(SelectResourcesQuery);
			 rs = st.executeQuery();
			 
			 while(rs.next()) {
				 JsonObject jsonObj = new JsonObject();
				 jsonObj.addProperty("resourcesList", rs.getString("uname"));
				 jsonArray.add(jsonObj);
			 }
			 System.out.println("Exception------->>>>>--------" + jsonArray);
			 jsonArray1.add(jsonArray);
			 jsonArray1.add(new OpportunityDropdownOptions().getOptions());
			 st.close();
			 rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception------->>>>>--------" + e);
		}
		return jsonArray1;
	}
}

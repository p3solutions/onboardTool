package Opportunity.OpportunityList.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import org.apache.log4j.Logger;

public class OpportunityListService {
	private static Logger logger =  Logger.getRootLogger();
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
				 jsonObj.addProperty("AppDesc", ApplicationDescription(rs.getString("id")));
				 jsonArray.add(jsonObj);
			 }
			 logger.info("Application retrieved successfully "+jsonArray);
			 jsonArray1.add(jsonArray);
			 jsonArray1.add(new OpportunityDropdownOptions().getOptions());
			}
			st.close();
			rs.close();
		}
		catch(Exception e) {
			logger.debug("Error in Application retrieve ",e);
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
			logger.info("Wave Name "+jsonArray);
			st.close();
			rs.close();
		}
		catch(Exception e) {
			logger.debug("error in getting wave name",e);
			e.printStackTrace();
		}
		
		finally{
			if(connection != null)
				connection.close();
		}
		
		return jsonArray;
	}
	public static String ApplicationDescription(String ID) throws SQLException {

		DBconnection dBconnection = null;
		Connection connection = null;
		String Appdesc = "";

		try {
			dBconnection = new DBconnection();
			connection = (Connection) dBconnection.getConnection();

			String selectQuery = "select * from opportunity_info where column_name='appdesc'AND Id = ?";
			PreparedStatement st = connection.prepareStatement(selectQuery);
			st.setString(1,ID);
			ResultSet rs = st.executeQuery();
			while (rs.next()){
				Appdesc = rs.getString("value");
			}
			logger.info("Application description name "+ Appdesc);
			st.close();
			rs.close();

		}

		catch(Exception e) {
			logger.debug("error in getting Application description name",e);
			e.printStackTrace();
		}

		finally{
			if(connection != null)
				connection.close();
		}
		return Appdesc;
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

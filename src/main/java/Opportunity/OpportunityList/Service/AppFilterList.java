package Opportunity.OpportunityList.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class AppFilterList {
	public JsonArray retrieve_apps() {
		PreparedStatement st2=null;
		ResultSet rs2=null;
		JsonArray jsonArray = new JsonArray();
		JsonArray jsonArray1 = new JsonArray();
		try {
			jsonArray1.add(getWaveName());
			jsonArray1.add(getResources());	
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			System.out.println("Connected...");
			String selectQuery2 = "select distinct Id from decom3sixtytool.Opportunity_Info oi left join decom3sixtytool.Intake_Stake_Holder_Info ish on ish.OppId=oi.Id ;";
			st2 = connection.prepareStatement(selectQuery2);
			rs2 = st2.executeQuery();
			while (rs2.next()) {
				String Id = rs2.getString("Id");
				String selectIntakeCount = "select * from decom3sixtytool.Intake_Stake_Holder_Info where intakeApproval='Approved' and priority_order_num=(select Max(priority_order_num) from decom3sixtytool.Intake_Stake_Holder_Info where OppId=?)and OppId=?;";
				PreparedStatement statement = connection.prepareStatement(selectIntakeCount);
				statement.setString(1, Id);
				statement.setString(2, Id);
				ResultSet rset = statement.executeQuery();
				while (rset.next()) {
					String app_id=rset.getString("OppId");
					String app_name_query = "select * from opportunity_info where column_name='appName' and  Id = ?";
					PreparedStatement st = connection.prepareStatement(app_name_query);
					st.setString(1, app_id);
					ResultSet rs = st.executeQuery();
					if(rs.next())
					{	JsonObject jsonObj = new JsonObject();
					jsonObj.addProperty("OpportunityId",app_id);
					jsonObj.addProperty("OpportunityName",rs.getString("value"));
					jsonObj.addProperty("CheckWave",checkOpportunityWave(rs.getString("value")));
					jsonArray.add(jsonObj);
					}
				} 

			}
			jsonArray1.add(jsonArray);
			jsonArray1.add(new OpportunityDropdownOptions().getOptions());
			rs2.close();
			st2.close();

		}
		catch(Exception e)
		{
			System.out.println("Execption Occurs");
		}
		System.out.println("JSON"+jsonArray);
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

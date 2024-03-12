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

public class OpportunityDropdownOptions {

	DBconnection dBconnection ;
	Connection connection;

	public OpportunityDropdownOptions() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		connection = (Connection) dBconnection.getConnection();
	}
	public JsonArray getOptions()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			jsonArray.add(getPhaseOptions());
			jsonArray.add(getWaveOptions());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	public JsonArray getPhaseOptions()
	{
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectPhase ="select * from phase_info where column_name='phaseName';";
			st = connection.prepareStatement(selectPhase);
			rs = st.executeQuery();
			while(rs.next())
			{
				JsonObject jsonObject = new JsonObject();
				String phaseName = rs.getString("value");
				jsonObject.addProperty("phaseName",phaseName);
				jsonArray.add(jsonObject);
			}
			st.close();
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return jsonArray;
	}

	public JsonArray getWaveOptions()
	{	PreparedStatement st1=null;
		ResultSet rs1=null;
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectWaves ="select * from governance_info where column_name='waveName'";
			st1 = connection.prepareStatement(selectWaves);
			rs1 = st1.executeQuery();

			while(rs1.next())
			{
				JsonObject jsonObject = new JsonObject();


				String wave = rs1.getString("value");
				jsonObject.addProperty("waveName",wave );
				String selectWave = "select * from phase_info where column_name='waves' and value like ?";
				PreparedStatement st2=connection.prepareStatement(selectWave);
				st2.setString(1, "%"+ wave +"%");   
				ResultSet rs2 = st2.executeQuery();
				if(rs2.next())
					jsonObject.addProperty("phaseName",rs2.getString("phaseName"));
				else
					jsonObject.addProperty("phaseName","");

				rs2.close();
				st2.close();
				jsonArray.add(jsonObject);
			}
			st1.close();
			rs1.close();
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return jsonArray;
	}

	protected void finalize() throws Throwable {
		connection.close();
	}
}

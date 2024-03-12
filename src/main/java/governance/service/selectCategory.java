package governance.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class selectCategory {

	DBconnection dBconnection;
	Connection con;
	String Category;
	String Phase;
	String Wave;
	public selectCategory() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
	}

	public JsonArray AppsDropdown()
	{
		JsonArray jsonArray = new JsonArray();
		PreparedStatement st=null;
		ResultSet rs=null;
		try
		{
			String selectQuery ="select * from opportunity_info where column_name = 'appName'";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();

			while(rs.next()) {
				JsonObject jsonObj = new JsonObject();
				String appName = rs.getString("value");
				String waveName = getWaveName(appName);
				String phaseName =  getPhaseName(waveName);
				jsonObj.addProperty("appId", rs.getString("id"));
				jsonObj.addProperty("appName", appName);
				jsonObj.addProperty("waveName", waveName);
				jsonObj.addProperty("phaseName", phaseName);		
				jsonArray.add(jsonObj);
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
	public JsonArray WavesDropdown()
	{
		JsonArray jsonArray = new JsonArray();

		try
		{	PreparedStatement st=null;
		ResultSet rs=null;
		String selectQuery ="select * from governance_info where column_name = 'waveName'";
		st = con.prepareStatement(selectQuery);
		rs = st.executeQuery();

		while(rs.next()) {
			JsonObject jsonObj = new JsonObject();
			String waveName = rs.getString("value");

			jsonObj.addProperty("WaveId", rs.getString("waveid"));
			jsonObj.addProperty("WaveName", waveName);
			jsonObj.addProperty("phaseName", getPhaseName(waveName));

			jsonArray.add(jsonObj);
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

	private String getPhaseName(String waveName)
	{
		String phaseName = "";
		try
		{
			String selectQuery  = "select * from phase_info where column_name = 'waves' and value like ?";
			PreparedStatement st=con.prepareStatement(selectQuery);
			st.setString(1, "%"+waveName+"%");
			ResultSet rs = st.executeQuery();
			if(rs.next())
				phaseName = rs.getString("phaseName");

			st.close();
			rs.close();	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return phaseName;
	}

	private String getWaveName(String appName)
	{
		String phaseName = "";
		try
		{
			String selectQuery  = "select * from governance_info where column_name = 'apps' and value like ?";
			PreparedStatement st=con.prepareStatement(selectQuery);
			st.setString(1, "%"+appName+"%");
			ResultSet rs = st.executeQuery();

			if(rs.next())
				phaseName = rs.getString("waveName");

			st.close();
			rs.close();	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return phaseName;
	}
	protected void finalize() throws Throwable {
		con.close();
	}

	public JsonArray getPhaseList(String appName)
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectWave = "select * from governance_info where column_name='apps' and value like ?";
			PreparedStatement st=con.prepareStatement(selectWave);
			st.setString(1, "%"+appName+"%");
			ResultSet rs = st.executeQuery();
			if(rs.next()) {

				String selectPhase = "select * from phase_info where column_name = 'waves' and value like ? "; 
				PreparedStatement st1=con.prepareStatement(selectWave);
				st1.setString(1, "%"+rs.getString("value")+"%");
				ResultSet rs1 = st1.executeQuery();
				if(rs1.next())
				{
					JsonObject jsonObject = new JsonObject();
					jsonObject.addProperty("ohaseId", rs1.getString("phaseId"));
					jsonObject.addProperty("ohaseName", rs1.getString("phaseName"));
					jsonObject.addProperty("apps", new phaseListService("all").getPhaseApps(rs.getString("phaseName")));
				}
				rs1.close();
				st1.close();
			}
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return jsonArray;
	}
}

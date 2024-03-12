package governance.wave.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class waveListService {

	DBconnection dBconnection;
	Connection con;
	
	String phaseId;
	String phaseName;
	String waves[];
	public waveListService(String phaseId,String phaseName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.phaseId = phaseId;
		this.phaseName = phaseName;
	}
	
	public JsonArray getWaveList()
	{
	
	JsonArray jsonArray = new JsonArray();
	JsonArray jsonArray1 = new JsonArray();
	try
	{
		//JsonObject jsonObject = new JsonObject();
		//jsonObject.addProperty("phaseName", phaseName);
		//jsonArray.add(jsonObject);
		String selectWaves = "select * from phase_info where column_name='waves' and phaseId=?";
		PreparedStatement st = con.prepareStatement(selectWaves);
		st.setString(1, phaseId);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
		 waves = rs.getString("value").split(",");
		for(String wave : waves)
		{
			if(!wave.isEmpty())
			jsonArray1.add(getWave(wave));
		}
		}
		st.close();
		rs.close();
		if(jsonArray1.size()!=0)
		jsonArray.add(jsonArray1);
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return jsonArray;
	
	}
	
	
	public JsonArray getAllWaveList()
	{
	PreparedStatement st=null;
	ResultSet rs=null;
	JsonArray jsonArray = new JsonArray();
	JsonArray jsonArray1 = new JsonArray();
	try
	{
		String selectWaves = "select * from governance_info where column_name='waveName';";
		st = con.prepareStatement(selectWaves);
		rs = st.executeQuery();
		while(rs.next()) {
		String wave = rs.getString("value");
			if(!wave.isEmpty())
			jsonArray1.add(getWave(wave));
		}
		
		if(jsonArray1.size()!=0)
		jsonArray.add(jsonArray1);
		st.close();
		rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return jsonArray;
	
	}
	
	
	public JsonObject getWave(String wave)
	{
		JsonObject jsonObject = new JsonObject();
	try
	{
		String selectWaves = "select * from governance_info where column_name='waveName' and value=?";
		PreparedStatement st = con.prepareStatement(selectWaves);
		st.setString(1, wave);
		ResultSet rs = st.executeQuery();
		if(rs.next()) {
			 jsonObject.addProperty("phaseName",getPhaseName(wave));
		     jsonObject.addProperty("WaveId", rs.getString("waveId"));
		     jsonObject.addProperty("WaveName", rs.getString("waveName"));
		     jsonObject.addProperty("Apps",getWaveOptions(rs.getString("waveName")));
		}
		st.close();
		rs.close();
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	return jsonObject;
	}
	
	private String getPhaseName(String wave) {
		String phaseName = "";
		try {
			String selectQuery = "select * from phase_info where column_name = 'waves' and value like ?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, "%" + wave + "%");
			ResultSet rs = st.executeQuery();
			if(rs.next())
				phaseName = rs.getString("phaseName");
			rs.close();
			st.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return phaseName;
	}

	public String getWaveOptions(String wave)
	{
		String app = "";
		try
		{
			
			String selectOptions = "select * from governance_info where column_name='apps' and waveName=?";
			PreparedStatement st = con.prepareStatement(selectOptions);
			st.setString(1, wave);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
			 app = rs.getString("value");
			}
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return app;
	}
	protected void finalize() throws Throwable {
	 con.close();
	}
	
	
	
}

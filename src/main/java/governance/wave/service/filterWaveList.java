package governance.wave.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.ws.rs.core.Request;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class filterWaveList {

	DBconnection dBconnection;
	Connection con;
	
	String phaseName;
	String waveName;
	String appName;
	
	public filterWaveList(String phaseName, String waveName,String appName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.phaseName = phaseName;
		this.waveName = waveName;
		this.appName = appName;
	}
	
	public JsonArray getWaveList()
	{
		JsonArray jsonArray = new JsonArray();
		try {
			if(!appName.equals("All")) {
		    jsonArray = getWaveListByApp();
			}
			else if(!waveName.equals("All")) {
			    jsonArray = getWaveListByWave();	
			}
			else 
			jsonArray = getWaveListByPhase();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	public JsonArray getWaveListByApp()
	{
		JsonArray jsonArray = new JsonArray();
		try {
			
		String selectWave = "select * from governance_info where column_name='apps' and value like ?";
		PreparedStatement st = con.prepareStatement(selectWave);
		st.setString(1, "%" + appName + "%");
		ResultSet rs = st.executeQuery();
		
		if(rs.next())
		{
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("WaveId",rs.getString("waveId"));
			jsonObject.addProperty("WaveName",rs.getString("waveName"));
		
			jsonArray.add(jsonObject);
		}
	
		rs.close();
		st.close();
		
	   }
	   catch(Exception e){
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	public JsonArray getWaveListByPhase()
	{
		JsonArray jsonArray = new JsonArray();
		try {
	    String selectPhase = "select * from phase_info where column_name='waves' and phaseName=?;";
	    PreparedStatement st1 = con.prepareStatement(selectPhase);
		st1.setString(1, phaseName);
		ResultSet rs1 = st1.executeQuery();
	    if(rs1.next()) {
		
	    String waves[] = rs1.getString("value").split(",");	
	    for(String wave:waves) {
	    String selectWave = "select * from governance_info where column_name='waveName' and value = ?;";
	    PreparedStatement st = con.prepareStatement(selectWave);
		st.setString(1, wave);
		ResultSet rs = st.executeQuery();

		while(rs.next())
		{
			
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("WaveId",rs.getString("waveId"));
			jsonObject.addProperty("WaveName",rs.getString("waveName"));
		
			jsonArray.add(jsonObject);
			
		}
	
		rs.close();
		st.close();
	    }
	    
	 }
	    
	    rs1.close();
	    st1.close();
	   }
	   catch(Exception e){
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	public JsonArray getWaveListByWave()
	{
		JsonArray jsonArray = new JsonArray();
		try {
			
		String selectWave = "select * from governance_info where column_name='waveName' and value = ?";
		PreparedStatement st = con.prepareStatement(selectWave);
		st.setString(1, waveName);
		ResultSet rs = st.executeQuery();

		if(rs.next())
		{
			JsonObject jsonObject = new JsonObject();
			
			jsonObject.addProperty("WaveId",rs.getString("waveId"));
			jsonObject.addProperty("WaveName",rs.getString("waveName"));
		
			jsonArray.add(jsonObject);
		}
	
		rs.close();
		st.close();
		
	   }
	   catch(Exception e){
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	protected void finalize() throws Throwable {
	 con.close();
	}

}

package governance.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import onboard.DBconnection;
import logger.System;


public class dynamicCreationService {
	DBconnection dBconnection;
	Connection con;
	String name;
	String creationType;
	public dynamicCreationService(String name,String creationType) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.name = name;
		this.creationType=creationType;
	}
	
	
	public JsonObject save()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			switch(creationType)
			{
			case "Phase":
				
				jsonObject = CreateDynamicPhase();
				
				break;
			case "Wave":
				
				jsonObject = CreateDynamicWave();
				
				break;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	public JsonObject CreateDynamicPhase() throws SQLException {
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonObject jsonObject = new JsonObject();
		
		try {
			
			String phaseId = getPhaseUUID();
			
			phaseSaveService phaseSave = new phaseSaveService(phaseId, name);
			boolean checkPhaseName = phaseSave.checkDuplicateData("phaseName", name);
			boolean checkPhaseId = phaseSave.checkDuplicateData("phaseId", phaseId);
			jsonObject.addProperty("checkPhaseName", checkPhaseName);
			jsonObject.addProperty("checkPhaseId", checkPhaseId);
			
			if(!checkPhaseName&&!checkPhaseId)
			{
				JsonArray jsonArray = new JsonArray();
				String selectQuery = "select * from phase_info_template_details order by seq_no";
				st =con.prepareStatement(selectQuery);
				rs = st.executeQuery();
				
				while(rs.next())
				{
					String value = "";
					if(rs.getString("column_name").equals("phaseId"))
						value = phaseId;
						
					else if(rs.getString("column_name").equals("phaseName")) 
						value = name;
					
					String insert_query = "insert into phase_info (seq_no,phaseId,phaseName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
					PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
					preparedStatement1.setInt(1, rs.getInt(1));
					preparedStatement1.setString(2,phaseId);
					preparedStatement1.setString(3,name);
					preparedStatement1.setString(4,"");
					preparedStatement1.setString(5,"");
					preparedStatement1.setString(6,rs.getString("label_name"));
					preparedStatement1.setString(7,rs.getString("column_name"));
					preparedStatement1.setString(8,rs.getString("type"));
					preparedStatement1.setString(9,rs.getString("mandatory"));
					preparedStatement1.setString(10,value);
					preparedStatement1.execute();
					
		            preparedStatement1.close();
				}
				
				
			}
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
			
		}
		finally
		{
			rs.close();
			st.close();
		}
		return jsonObject;
	}

	private String getPhaseUUID() throws SQLException
	{
		PreparedStatement st=null;
		ResultSet rs=null;
		String PhaseId="";
		try
		{
			boolean checkPhaseId = true;
			while(checkPhaseId)
			{
			PhaseId=UUID.randomUUID().toString();
			//checking the wave id in Governance_Info
			String selectQuery = "select * from phase_info where column_name='phaseId' and value='"+PhaseId+"'";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
			if(!rs.next())
			checkPhaseId =false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally {
			st.close();
			rs.close();
		}
		return PhaseId;
	}
	
	public JsonObject CreateDynamicWave() throws SQLException {
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonObject jsonObject = new JsonObject();
		boolean saveStatus = false;	
		try {
		    
			String waveId = getWaveUUID();
			
			governanceSaveService governanceSave = new governanceSaveService(waveId, name);
			boolean checkWaveName = governanceSave.checkDuplicateData("waveName", name);
			
			jsonObject.addProperty("checkWaveName", checkWaveName);
			
			if(!checkWaveName)
			{
				JsonArray jsonArray = new JsonArray();
				String selectQuery = "select * from governance_info_template_details order by seq_no";
				st =con.prepareStatement(selectQuery);
				rs = st.executeQuery();
				
				while(rs.next())
				{
					String value = "";
					if(rs.getString("column_name").equals("waveId"))
						value = waveId;
						
					else if(rs.getString("column_name").equals("waveName")) 
						value = name;
					
					String insert_query = "insert into governance_info (seq_no,waveId,waveName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
					PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
					preparedStatement1.setInt(1, rs.getInt(1));
					preparedStatement1.setString(2,waveId);
					preparedStatement1.setString(3,name);
					preparedStatement1.setString(4,"");
					preparedStatement1.setString(5,"");
					preparedStatement1.setString(6,rs.getString("label_name"));
					preparedStatement1.setString(7,rs.getString("column_name"));
					preparedStatement1.setString(8,rs.getString("type"));
					preparedStatement1.setString(9,rs.getString("mandatory"));
					preparedStatement1.setString(10,value);
					preparedStatement1.execute();
					
		            preparedStatement1.close();
					saveStatus = true;
				}
				
			}
		}
		
		catch(Exception e) {
			e.printStackTrace();
			
		}
		finally
		{   if(st!=null) {
			st.close();
			rs.close();
		}
		}
		jsonObject.addProperty("saveStatus", saveStatus);
		return jsonObject;
	}
	
	private String getWaveUUID() throws SQLException
	{
		PreparedStatement st=null;
		ResultSet rs=null;
		String WaveId="";
		try
		{
			boolean checkWaveId = true;
			while(checkWaveId)
			{
			WaveId=UUID.randomUUID().toString();
			//checking the wave id in Governance_Info
			String selectQuery = "select * from Governance_Info where column_name='waveId' and value='"+WaveId+"'";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
			if(!rs.next())
			checkWaveId =false;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			st.close();
			rs.close();
		}
		return WaveId;
	}
	protected void finalize() throws Throwable {
	 con.close();
	}
	
	/*
	 * public static void main(String[] args) throws ClassNotFoundException,
	 * SQLException { dynamicCreationService service = new
	 * dynamicCreationService("wave4", "Wave"); JsonObject jsonObject=
	 * service.save(); System.out.println(jsonObject); service = null; }
	 */
}

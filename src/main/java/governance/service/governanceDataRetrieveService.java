package governance.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashSet;
import java.util.UUID;

import org.checkerframework.checker.formatter.qual.ReturnsFormat;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class governanceDataRetrieveService {

	DBconnection dBconnection;
	Connection con;
	private String waveId;
	private String purpose;
	public governanceDataRetrieveService(String waveId, String purpose) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.waveId = waveId;
		 this.purpose = purpose;
	}
	
	public JsonArray governanceDataRetrieve()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			if(purpose.equals("NewWave")) {
			moveTemptoInfo();
			updateApplications();
			jsonArray = getInfoDetails();
			}
			else if(purpose.equals("EditWave"))
			{
				updateApplicationsEditWave();
				jsonArray = getInfoEditDetails();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	private void moveTemptoInfo() throws SQLException
	{
		PreparedStatement st1=null,st2=null;
		ResultSet rs2=null;
		try
		{
			//delete prev table
			String deleteQuery = "delete from Governance_Info_Details";
			st1 = con.prepareStatement(deleteQuery);
			st1.executeUpdate();
			
			//select temp details
			String selectTempQuery = "select * from governance_info_template_details order by seq_no";
			st2 = con.prepareStatement(selectTempQuery);
			rs2 = st2.executeQuery(); 
			String WaveId=getUUID();
			while(rs2.next())
			{
				// insert temp details into info details
				String wave_InsertQuery = "insert into Governance_Info_Details (seq_no,waveId,waveName,prj_name, options, label_name, column_name, type, mandatory, value)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

				PreparedStatement prestmt = con.prepareStatement(wave_InsertQuery);
				prestmt.setInt(1, rs2.getInt("seq_no"));
				prestmt.setString(2,WaveId);
				prestmt.setString(3,"");
				prestmt.setString(4,"");
				prestmt.setString(5,rs2.getString("options"));
				prestmt.setString(6, rs2.getString("label_name"));
				prestmt.setString(7, rs2.getString("column_name"));
				prestmt.setString(8, rs2.getString("type"));
				prestmt.setString(9, rs2.getString("mandatory"));
				prestmt.setString(10, rs2.getString("value"));
				prestmt.execute();
				prestmt.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			st1.close();
			st2.close();
			rs2.close();
		}
	}
	private String getUUID() throws SQLException
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
			String selectQuery = "select * from Governance_Info where waveId=?";
				st = con.prepareStatement(selectQuery);
			st.setString(1, WaveId);
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
	
	public JsonArray getInfoDetails() throws SQLException
	{
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonArray jsonArray = new JsonArray();
		try
		{
			HashSet<String> WaveSet = new HashSet<String>();
			String selectQuery = "select * from Governance_Info_Details;";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
			while(rs.next()) {
				String options = rs.getString("options");
				String waveArray[] = options.split(",");
				for (String wave : waveArray) {
					if (wave.equals("")) {
						continue;
					}
					WaveSet.add(wave);
			}
			String appToReturn = String.join(",", WaveSet);
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("seq_num",rs.getInt("seq_no"));
			jsonObject.addProperty("WaveId",rs.getString("WaveId"));
			jsonObject.addProperty("waveName", rs.getString("waveName"));
			jsonObject.addProperty("options",appToReturn);
			jsonObject.addProperty("LabelName",rs.getString("label_name"));
			jsonObject.addProperty("ColumnName",rs.getString("column_name"));
			jsonObject.addProperty("Type",rs.getString("type"));
			jsonObject.addProperty("Mandatory",rs.getString("mandatory"));
			jsonObject.addProperty("Value",rs.getString("value"));
			jsonArray.add(jsonObject);
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
		return jsonArray;
	}
	
	public JsonArray getInfoEditDetails() throws SQLException
	{
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonArray jsonArray = new JsonArray();
		try
		{
			HashSet<String> WaveSet = new HashSet<String>();
			String selectQuery = "select * from governance_Info where waveId = ?;";
			st = con.prepareStatement(selectQuery);
			st.setString(1, waveId);
			rs = st.executeQuery();
			while(rs.next()) {
				String options = rs.getString("options");
				String waveArray[] = options.split(",");
				for (String wave : waveArray) {
					if (wave.equals("")) {
						continue;
					}
					WaveSet.add(wave);
				}
			String appToReturn = String.join(",", WaveSet);
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("seq_num",rs.getInt("seq_no"));
			jsonObject.addProperty("waveId",rs.getString("waveId"));
			jsonObject.addProperty("waveName", rs.getString("waveName"));
			jsonObject.addProperty("options",appToReturn);
			jsonObject.addProperty("LabelName",rs.getString("label_name"));
			jsonObject.addProperty("ColumnName",rs.getString("column_name"));
			jsonObject.addProperty("Type",rs.getString("type"));
			jsonObject.addProperty("Mandatory",rs.getString("mandatory"));
			jsonObject.addProperty("Value",rs.getString("value"));
			jsonArray.add(jsonObject);
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
	
	private void updateApplications() throws SQLException
	{
		PreparedStatement st=null;
		ResultSet rs=null;
		String appNames = "";
		try
		{
			boolean checkApp = false;
			String selectQuery="select * from opportunity_info where column_name='appName';";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
			while(rs.next())
			{
				checkApp =true;
				String selectQuery1 = "select * from governance_info where column_name='apps' and value like ?";
				PreparedStatement st1 = con.prepareStatement(selectQuery1);
				st1.setString(1, "%" + rs.getString("value") + "%");
				ResultSet rs1 = st1.executeQuery();
				if(!rs1.next())
				  appNames+=rs.getString("value")+",";	
			  rs1.close();
			  st1.close();
			}
			rs.close();
			st.close();
			if(!appNames.equals(""))
				appNames=appNames.substring(0,appNames.length()-1);
			
			String updateQuery ="update governance_info_details set options =? where column_name = 'apps';";
			 PreparedStatement st2 = con.prepareStatement(updateQuery);
			 st2.setString(1, appNames);
			 st2.execute();
			 st2.close();
			System.out.println("appNames : "+appNames);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	private void updateApplicationsEditWave() throws SQLException
	{
		PreparedStatement st=null;
		ResultSet rs=null;
		String appNames = "";
		try
		{
			boolean checkApp = false;
			String selectQuery="select * from opportunity_info where column_name='appName';";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
			while(rs.next())
			{
				checkApp =true;
				String selectQuery1 = "select * from governance_info where column_name='apps' and value like ?";
				PreparedStatement st1 = con.prepareStatement(selectQuery1);
				st1.setString(1, "%" + rs.getString("value") + "%");
				ResultSet rs1 = st1.executeQuery();
				if(!rs1.next())
					appNames += rs.getString("value")+",";	
			  rs1.close();
			  st1.close();
			}
			rs.close();
			st.close();
			System.out.println("appNames : "+appNames);

			String selectWaves = "select * from governance_info where column_name='apps' and waveId=?";
			PreparedStatement st3 = con.prepareStatement(selectWaves);
			st3.setString(1, waveId);
			ResultSet rs3 = st3.executeQuery();
			if(rs3.next())
			{
				String app = ((rs3.getString("value").equals(""))?"":rs3.getString("value")+",");
				appNames = app+appNames;
			}
			if(!appNames.equals(""))
				appNames=appNames.substring(0,appNames.length()-1);
			
			String updateQuery ="update governance_info set options =? where column_name = 'apps' and waveId=?;";
			PreparedStatement st2 = con.prepareStatement(updateQuery);
			 st2.setString(1, appNames);
			 st2.setString(2,waveId);
			 st2.execute();
			 st2.close();
			System.out.println("appNames : "+appNames);
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

	protected void finalize() throws Throwable {
		con.close();
		System.out.println("New Wave data retrieve Db connection closed");
	}
}

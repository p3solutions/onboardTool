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

public class governanceListService {
	DBconnection dBconnection;
	Connection con;
	String waves;
	
	public governanceListService(String waves) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.waves = waves;
	}

	public  JsonArray governanceListDetails() {
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonArray jsonArray = new JsonArray();
		try {
			
			if(waves.equals("all"))
			{
			 String selectQuery ="select * from governance_info where column_name = 'waveName'";
			 st = con.prepareStatement(selectQuery);
			 rs = st.executeQuery();
			 
			 while(rs.next()) {
				 JsonObject jsonObj = new JsonObject();
				 jsonObj.addProperty("WaveId", rs.getString("waveid"));
				 jsonObj.addProperty("WaveName", rs.getString("value"));
				 jsonObj.addProperty("phaseName", rs.getString("value"));
				 jsonArray.add(jsonObj);
			 }
			 
			}
			rs.close();
			st.close();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception------->>>>>--------" + e);
		}
		return jsonArray;
	}
	
	
	private String getPhaseName(String waveName)
	{
		String phaseName = "";
		try
		{
			String selectQuery ="select * from phase_info where column_name='waves' and values like ?";
			PreparedStatement st=con.prepareStatement(selectQuery);
			st.setString(1, "%"+waveName+"%");
			ResultSet rs = st.executeQuery();
			if(rs.next())
				phaseName += rs.getString("phaseName");
			
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return phaseName;
	}
}

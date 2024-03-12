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

public class phaseListService {
	DBconnection dBconnection;
	Connection con;
	String waves;
	
	public phaseListService(String waves) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.waves = waves;
	}

	public  JsonArray phaseListDetails() {
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonArray jsonArray = new JsonArray();
		try {
			
			if(waves.equals("all"))
			{
			 String selectQuery ="select * from phase_info where column_name = 'phaseName'";
			 st = con.prepareStatement(selectQuery);
			 rs = st.executeQuery();
			 
			 while(rs.next()) {
				 JsonObject jsonObj = new JsonObject();
				 jsonObj.addProperty("phaseId", rs.getString("phaseid"));
				 jsonObj.addProperty("phaseName", rs.getString("value"));
			     jsonObj.addProperty("apps",getPhaseApps(rs.getString("value")));
				 jsonArray.add(jsonObj);
			 }
			 
			}
			st.close();
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception------->>>>>--------" + e);
		}
		return jsonArray;
	}
	
	public String getPhaseApps(String phaseName)
	{
        String phaseApps = "";
		try
		{
			String selectWaves = "select * from phase_info where phaseName = ? and column_name='waves'";
			PreparedStatement st = con.prepareStatement(selectWaves);
			st.setString(1, phaseName);
			ResultSet rs = st.executeQuery();
		    if(rs.next())
		    {
		    	String waves[] =rs.getString("value").split(",");
		    	
		    	for(String wave:waves)
		    	{
		    		String selectApps = "select * from governance_info where waveName = ? and column_name='apps'";
		    		PreparedStatement st1 = con.prepareStatement(selectApps);
					st1.setString(1, wave);
					ResultSet rs1 = st1.executeQuery();
				    if(rs1.next())
				    {
				    	String apps[] = rs1.getString("value").split(","); 
				    	for(String app :apps)
				    	{
				    		phaseApps +=app+" ";
				    	}
				    }
				    rs1.close();
				    st1.close();
		    	}
		    }
		    rs.close();
		    st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	 return phaseApps;
	}

}

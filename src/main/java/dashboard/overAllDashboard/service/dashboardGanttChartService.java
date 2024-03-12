package dashboard.overAllDashboard.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class dashboardGanttChartService {

	 DBconnection dBconnection =null;
		Connection con = null;
		
		String oppName;
		String Id;
		
		
		public dashboardGanttChartService(String oppName) throws ClassNotFoundException, SQLException {
			dBconnection = new DBconnection();
			con = (Connection) dBconnection.getConnection();
			this.oppName = oppName;
		}
	
		public JsonArray getArchiveExecution() {
			
			JsonArray jsonArray = new JsonArray();
			try {
				
				String selectQuery = "select * from archive_execution_info where oppName = ? and level = '1' order by seq_no;";
				PreparedStatement st=con.prepareStatement(selectQuery);
				st.setString(1, oppName);
				ResultSet rs = st.executeQuery();
				
				while(rs.next()) {
					JsonObject jsonObject = new JsonObject();
					
					jsonObject.addProperty("taskGroup", rs.getString("taskGroup"));
					jsonObject.addProperty("actSrt", rs.getString("actSrt"));
					jsonObject.addProperty("actEnd", rs.getString("actEnd"));
					jsonArray.add(jsonObject);
				}

				rs.close();
				st.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			
			
			return jsonArray;
		}
		
		protected void finalize() throws Throwable 
    	{ 
	        con.close();
    	}
}

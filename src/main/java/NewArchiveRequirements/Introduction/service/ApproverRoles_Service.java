package NewArchiveRequirements.Introduction.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import IntakeDetails.Common.DynamicFields;
import onboard.DBconnection;
import logger.System;

public class ApproverRoles_Service {

		public static JsonObject ApproverRolesDataRetrieveService(String Id) {
			JsonObject jsonObject = new JsonObject();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			
			String SelectQuery = "SELECT value FROM opportunity_info where column_name ='request_type' and id=?";
			PreparedStatement st = con.prepareStatement(SelectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				
				jsonObject.addProperty("request_type", rs.getString("value"));
				if((rs.getString("value")).equals("Archive+Decommission")||(rs.getString("value")).equals("Archive"))
					jsonObject.addProperty("checkOverAllArchiveStatus",checkOverAllApproval(Id,"Archive_Requirement"));
				
								
			}
			rs.close();
			st.close();
			con.close();
		}
			
			catch(Exception e)
			{
				e.printStackTrace();
			}
			
		return jsonObject;
	}
		
		private static boolean checkOverAllApproval(String Id,String moduleName)
		{
			boolean checkOverAllStatus = false;
			try
			{
				DBconnection dBconnection = new DBconnection();
				Connection con = (Connection) dBconnection.getConnection();
				String selectQuery = "select * from module_approval_info where OppId=? and moduleName=?;";
				PreparedStatement st = con.prepareStatement(selectQuery);
				st.setString(1, Id);
				st.setString(2, moduleName);
			    ResultSet rs = st.executeQuery();
			    if(rs.next())
			    checkOverAllStatus = rs.getBoolean("overAllApproval");
			    
			    st.close();
			    rs.close();
			    con.close();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			return checkOverAllStatus;
		}

		public int Add(String iD, String role, String name, String type, int numberofInputfields, String title) {
			// TODO Auto-generated method stub
			return 0;
		}

		

	

		
}

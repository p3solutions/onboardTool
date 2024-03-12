package NewArchiveRequirements.LegacyApplicationInfo.retentionDetails.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveRetentionDataRetrieve {
	DBconnection dBconnection;
	Connection con;
	public String Id = null;
	public String oppName = null; 
	
	public archiveRetentionDataRetrieve(String Id,String oppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.oppName = oppName;
	}
	
	public JsonArray archiveRetentionDataRetrieveService()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			jsonArray.add(getContentInfo());
			checkTempTable();
			jsonArray.add(getRetentionInfo());
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	private JsonObject getContentInfo()
	{
		JsonObject jsonObj = new JsonObject();
		try
		{
			String contentInfo = "";
			
			String selectQuery ="select * from Archive_Retention_Content_Info where OppId =?;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1,Id);
			ResultSet rs = st.executeQuery();
			
			
			if(!rs.next())
			{
				String insertQuery = "insert into `Archive_Retention_Content_Info` (OppId,app_name,prjName,contentInfo) values(?, ?, ?, ?);";
				PreparedStatement preparedStatement1 = con.prepareStatement(insertQuery);
				preparedStatement1.setString(1,Id );
				preparedStatement1.setString(2, oppName);
				preparedStatement1.setString(3, "");
				preparedStatement1.setString(4,"Retention Policies will be applied to the data per Company Policies ::\r\n" + 
						"Select the level retention that will be applied for this application::\r\n" + 
						"IF there is more than one condition applicable, specify which conditions apply i.e., If there is not a specified date at record level, the read-only date at the table level will be used.");
			    preparedStatement1.execute();
			    preparedStatement1.close();
			}
			String selectQuery1 ="select * from Archive_Retention_Content_Info where OppId =?;";
			PreparedStatement st1 = con.prepareStatement(selectQuery1);
			st1.setString(1, Id);
			ResultSet rs1 = st1.executeQuery();
			if(rs1.next())
				contentInfo=rs1.getString("contentInfo");
			jsonObj.addProperty("ContentInfo",contentInfo);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObj;
	}
	private void checkTempTable() throws SQLException
	{
		PreparedStatement st1=null;
		ResultSet rs1=null;
		try
		{
			String selectQuery = "select * from Archive_Retention_Info where OppId = ? order by seq_no";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1,Id);
			ResultSet rs = st.executeQuery();
			
			if(!rs.next())
			{
				String TempTable ="select * from Archive_Retention_Template_details;";
				st1 = con.prepareStatement(TempTable);
				rs1 = st1.executeQuery();
				while(rs1.next())
				{
				 String InsertQuery = "insert into Archive_Retention_Info (seq_no, OppId, prjName, app_name, retentionCheck, retentionLevel, conditions, dateUsedType, dateUsed, descp)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
	             PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	             prestmt.setInt(1,rs1.getInt(1));
	             prestmt.setString(2,Id);
	             prestmt.setString(3,"");
	             prestmt.setString(4,oppName);
	             prestmt.setString(5,rs1.getString(2));
	             prestmt.setString(6, rs1.getString(3));
	             prestmt.setString(7, rs1.getString(4));
	             prestmt.setString(8, rs1.getString(5));
	             prestmt.setString(9, rs1.getString(6));
	             prestmt.setString(10, rs1.getString(7));
	             prestmt.execute();
	             prestmt.close();
				}
				rs1.close();
				st1.close();
			}
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}
	private JsonArray getRetentionInfo()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectQuery ="select * from Archive_Retention_Info where OppId =? order by seq_no;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1,Id);
			ResultSet rs = st.executeQuery();
			
			System.out.println();
			if(rs.next())
			{
			JsonObject jsonObj =new JsonObject();
				jsonObj.addProperty("checkExistance",true);
				jsonObj.addProperty("seq_no",rs.getString("seq_no"));
				jsonObj.addProperty("retentionCheck",rs.getString("retentionCheck"));
				jsonObj.addProperty("retentionLevel",rs.getString("retentionLevel"));
				jsonObj.addProperty("condition",rs.getString("conditions"));
				jsonObj.addProperty("dateUsedType",rs.getString("dateUsedType"));
				jsonObj.addProperty("dateUsed",rs.getString("dateUsed"));
				jsonObj.addProperty("descp", rs.getString("descp"));
                jsonArray.add(jsonObj);
                
                while(rs.next()) {
                	JsonObject jsonObj1 =new JsonObject();
    				jsonObj1.addProperty("seq_no",rs.getString("seq_no"));
    				jsonObj1.addProperty("retentionCheck",rs.getString("retentionCheck"));
    				jsonObj1.addProperty("retentionLevel",rs.getString("retentionLevel"));
    				jsonObj1.addProperty("condition",rs.getString("conditions"));
    				jsonObj1.addProperty("dateUsedType",rs.getString("dateUsedType"));
    				jsonObj1.addProperty("dateUsed",rs.getString("dateUsed"));
    				jsonObj1.addProperty("descp", rs.getString("descp"));
                    jsonArray.add(jsonObj1);
                }
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}


}

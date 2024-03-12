package NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveFunctionDataRetrieveService {

	DBconnection dBconnection;
	Connection con;
	public String Id = null;
	public String oppName = null; 
	public String tableName = null;
	public String tempTableName = null;
	private String column;
	
	public archiveFunctionDataRetrieveService(String Id,String oppName, String tableName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.oppName = oppName;
		 this.tableName = tableName;
		 getTableNameInfo();
	}
	
	public JsonArray archiveFunctionDataRetrieve()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			//checkDataReqTempTable();
			jsonArray = getDataInfo();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	public void TemplateInsert() throws Exception
	{
		checkDataReqTempTable();
	}
	
	private void checkDataReqTempTable() throws SQLException
	{
		PreparedStatement st=null,st1=null;
		ResultSet rs=null,rs1=null;
		
		try
		{
			String selectQuery = "select * from "+tableName+" where oppId = ? order by seq_no";
			st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			rs = st.executeQuery();
			
			if(!rs.next())
			{
				String TempTable ="select * from "+tempTableName+";";
				st1 = con.prepareStatement(TempTable);
				rs1 = st1.executeQuery();
				while(rs1.next())
				{
				 String InsertQuery = "insert into "+tableName+" (seq_no, OppId, oppName, prjName, reqId, reqInScope, reqType, "+column+", additionInfo)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?, ?);";
	             PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	             prestmt.setInt(1,rs1.getInt(1));
	             prestmt.setString(2,Id);
	             prestmt.setString(3,oppName);
	             prestmt.setString(4,"");
	             prestmt.setString(5, rs1.getString(2));
	             prestmt.setString(6, rs1.getString(3));
	             prestmt.setString(7, rs1.getString(4));
	             prestmt.setString(8, rs1.getString(5));
	             prestmt.setString(9, rs1.getString(6));
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
	
	private JsonArray getDataInfo()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectQuery ="select * from "+tableName+" where OppId =? order by seq_no;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
			JsonObject jsonObj =new JsonObject();
				jsonObj.addProperty("checkExistance",true);
				jsonObj.addProperty("seq_no",rs.getString("seq_no"));
				jsonObj.addProperty("reqId",rs.getString("reqId"));
				jsonObj.addProperty("reqInScope",rs.getString("reqInScope"));
				jsonObj.addProperty("reqType",rs.getString("reqType"));
				jsonObj.addProperty("req",rs.getString(column));
				jsonObj.addProperty("additionInfo",rs.getString("additionInfo"));
				
                jsonArray.add(jsonObj);
                
                while(rs.next()) {
                	JsonObject jsonObj1 =new JsonObject();
    				jsonObj1.addProperty("seq_no",rs.getString("seq_no"));
    				jsonObj1.addProperty("reqId",rs.getString("reqId"));
    				jsonObj1.addProperty("reqInScope",rs.getString("reqInScope"));
    				jsonObj1.addProperty("reqType",rs.getString("reqType"));
    				jsonObj1.addProperty("req",rs.getString(column));
    				jsonObj1.addProperty("additionInfo",rs.getString("additionInfo"));
    				
                    jsonArray.add(jsonObj1);
                }
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
	
	public void getTableNameInfo() {

		switch(tableName) {
		
		case "Archive_DataReq_Info":
			tempTableName = "Archive_DataReq_Template_Details";
			column = "req";
			break;
			
		case "Archive_RetentionLegalReq_Info":
			tempTableName = "Archive_RetentionLegalReq_Template_Details";
			column = "descp";
			break;
			
		case "Archive_SecurityReq_Info":
			tempTableName = "Archive_SecurityReq_Template_Details";
			column = "descp";
			break;
			
		case "Archive_UsabilityReq_Info":
			tempTableName = "Archive_UsabilityReq_Template_Details";
			column = "descp";
			break;
			
		case "Archive_AuditReq_Info":
			tempTableName = "Archive_AuditlReq_Template_Details";
			column = "descp";
			break;
		}
	}
	
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}
	
}

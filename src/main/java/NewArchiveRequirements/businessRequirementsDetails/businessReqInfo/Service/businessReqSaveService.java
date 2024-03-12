package NewArchiveRequirements.businessRequirementsDetails.businessReqInfo.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class businessReqSaveService{
	DBconnection dBconnection;
	Connection con;
	String columnName;
	String value;
	String Id;
	String app_Name;
	
	public businessReqSaveService(String columnName,String value,String Id,String appName) throws ClassNotFoundException, SQLException {
	this.columnName =columnName;
	this.value =value;
	this.Id =Id;
	this.app_Name = appName;
	 dBconnection = new DBconnection();
	 con = (Connection) dBconnection.getConnection();
	}
	
	public JsonObject BusinessRequirementSave() throws SQLException
	{
		PreparedStatement st1=null;
		ResultSet rs1=null;
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean checkInsert =true;
			int max_seq = 0;
			String Business_Requirements = "Each requirement must be marked as In-Scope or Out-of-Scope for this project, with additional information specific to each requirement if necessary.::\r\n" + 
					"Requirement ID's are linked to test script ID's to ensure traceability from requirement to test execution. Requirement ID's may be formatted according to client needs.";
			String selectQuery = "select * from archivebussinessreq_info where OppId=?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			if(rs.next())
				checkInsert =false;
			rs.close();
			st.close();
			String selectSeqNum = "select max(seq_no) from archivebussinessreq_info;";
			st1 = con.prepareStatement(selectSeqNum);
			rs1 = st1.executeQuery();
			if(rs1.next())
				max_seq =rs1.getInt(1);
		
			if(checkInsert)
			{
				String InsertQuery = "Insert into archivebussinessreq_info (seq_no,OppId,app_name,businessreq) values (?,?,?,?)";
				PreparedStatement prepareStmt = con.prepareStatement(InsertQuery);
				prepareStmt.setString(1,String.valueOf(max_seq+1));
				prepareStmt.setString(2,Id);
				prepareStmt.setString(3,app_Name);
				prepareStmt.setString(4, Business_Requirements);
				prepareStmt.execute();
				prepareStmt.close();
			}
			
			String UpdateQuery ="update archivebussinessreq_info set businessreq=? where OppId=?;";
			 PreparedStatement st2 = con.prepareStatement(UpdateQuery);
	          st2.setString(1, value);
	          st2.setString(2, Id);
	          st2.execute();
			System.out.println(UpdateQuery);
					
			st2.close();
			jsonObject.addProperty("checkUpdate", true);
		}
		catch(Exception e)
		{
			jsonObject.addProperty("checkUpdate", false);
			e.printStackTrace();
		}
		finally {
			rs1.close();
			st1.close();
		}
		return jsonObject;
	}
	protected void finalize() throws Throwable {
	 con.close();
	 System.out.println("DB connection closed");
	}
}
package NewArchiveRequirements.Introduction.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class ArchiveIntroSaveService{
	DBconnection dBconnection;
	Connection con;
	String columnName;
	String value;
	String Id;
	String appName;
	static String qry;
	public ArchiveIntroSaveService(String columnName,String value,String Id,String appName) throws ClassNotFoundException, SQLException {
		this.columnName =columnName;
		this.value =value;
		this.Id =Id;
		this.appName = appName;
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
	}

	public JsonObject ArchiveIntroRequirementSave() throws SQLException
	{
		PreparedStatement st=null,st1=null;
		ResultSet rs=null,rs1=null;
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean checkInsert =true;
			int max_seq = 0;
			String Purpose = "The scope of this document is to gather information pertinent for data archiving, including creating custom screen/display views, with data that is specified to be non-transactional and is static/read-only. Retention policies will be applied according to Company Policies.\r\n" + 
					" A job aid will be provided for general navigation, performing searches, and basic functionality within the Archive.";

			String Scope = "Read-only data will be archived";

			String Assumption = "Legacy Application SMEs are available for Requirements gathering::\r\n" + 
					"Legacy Application SMEs/users will be available for UAT activities::\r\n" + 
					"The Data Archive Project Team has access granted to the front end of the legacy application along with network connectivity::\r\n" + 
					"The retiring/repurposing legacy application has been turned to read-only mode before the Production archival begins (if this is not the case the archive could be compromised)";
			String selectQuery = "select * from archiveintro_info where oppid=?";
			st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			rs = st.executeQuery();

			if(rs.next())
				checkInsert =false;

			String selectSeqNum = "select max(seq_no) from archiveintro_info;";
			st1 = con.prepareStatement(selectSeqNum);
			rs1 = st1.executeQuery();
			if(rs1.next())
				max_seq =rs1.getInt(1);
			if(checkInsert)
			{
				String InsertQuery = "Insert into archiveintro_info (seq_no,OppId,app_name,purpose,scope,assumption) values (?,?,?,?,?,?)";
				PreparedStatement prepareStmt = con.prepareStatement(InsertQuery);
				prepareStmt.setString(1,String.valueOf(max_seq+1));
				prepareStmt.setString(2,Id);
				prepareStmt.setString(3,appName);
				prepareStmt.setString(4, Purpose);
				prepareStmt.setString(5, Scope);
				prepareStmt.setString(6, Assumption);
				prepareStmt.execute();
				prepareStmt.close();
			}

			String UpdateQuery =getQuery(columnName);
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
			st.close();
			rs.close();
			st1.close();
			rs1.close();
		}
		return jsonObject;
	}
	public static String getQuery(String columnName)
	{
		switch(columnName)
		{
		case "scope":
			qry="update archiveintro_info set scope=? where oppid=?;";
			break;
		case "purpose":
			qry="update archiveintro_info set purpose=? where oppid=?;";
			break;
		case "assumption":
			qry="update archiveintro_info set assumption=? where oppid=?;";
			break;

		default:
			System.out.println("Error");
			break;
		}
		return qry;
	}
	protected void finalize() throws Throwable {
		con.close();
		System.out.println("DB connection closed");
	}
}
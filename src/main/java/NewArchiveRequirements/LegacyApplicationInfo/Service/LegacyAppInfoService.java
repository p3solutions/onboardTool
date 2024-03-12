package NewArchiveRequirements.LegacyApplicationInfo.Service;

import com.google.gson.JsonArray;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServlet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class LegacyAppInfoService {

	public JsonArray LegacyAppInfoDataRetrieveService(String Id,String Opportunityname) {
		PreparedStatement st1=null;
		ResultSet rs1=null;
		JsonArray jsonArray = new JsonArray();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			
			String SelectQuery = "select * from archivereq_legacyapp_info where Id=? order by seq_no";
			PreparedStatement st = con.prepareStatement(SelectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			
			if (!rs.next()){
				String TemplateQuery = "select * from archivereq_legacyapp_template_details order by seq_no;";
				st1 = con.prepareStatement(TemplateQuery);
				rs1 = st1.executeQuery();
				
				while(rs1.next()) {
					JsonObject jsonObject = new JsonObject();
					boolean checkexsistent=false; 
					jsonObject.addProperty("checkexsistent",checkexsistent);
					jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
					jsonObject.addProperty("id", Id);
					jsonObject.addProperty("Project_Name", rs1.getString("prj_name"));
					jsonObject.addProperty("App_Name", Opportunityname);
					jsonObject.addProperty("options", rs1.getString("options"));
					jsonObject.addProperty("LabelName", rs1.getString("label_name"));
					jsonObject.addProperty("ColumnName", rs1.getString("column_name"));
					jsonObject.addProperty("Type", rs1.getString("type"));
					jsonObject.addProperty("Mandatory", rs1.getString("mandatory"));
					jsonObject.addProperty("Value", rs1.getString("value"));
					
					jsonArray.add(jsonObject);
					
				}
				LegacyAppInfoRecordsStorage(Id,Opportunityname);
				new LegacyAppInfoService().LegacyAppInfoDataRetrieveService(Id,Opportunityname);
			st1.close();
			rs1.close();
			}
			else
			{
				String TemplateQuery = "select * from archivereq_legacyapp_info where id=? order by seq_no;";
				st1 = con.prepareStatement(TemplateQuery);
				st1.setString(1, Id);
				rs1 = st1.executeQuery();
				
				while(rs1.next()) {
					JsonObject jsonObject = new JsonObject();
					boolean checkexsistent=true; 
					jsonObject.addProperty("checkexsistent",checkexsistent);
					jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
					jsonObject.addProperty("id", Id);
					jsonObject.addProperty("Project_Name", rs1.getString("prj_name"));
					jsonObject.addProperty("App_Name", Opportunityname);
					jsonObject.addProperty("options", rs1.getString("options"));
					jsonObject.addProperty("LabelName", rs1.getString("label_name"));
					jsonObject.addProperty("ColumnName", rs1.getString("column_name"));
					jsonObject.addProperty("Type", rs1.getString("type"));
					jsonObject.addProperty("Mandatory", rs1.getString("mandatory"));
					jsonObject.addProperty("Value", rs1.getString("value"));
					
					jsonArray.add(jsonObject);
					
				}
			}
			}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception-------[ Legacy App info]--------" +e);
		}
		
		return jsonArray;
	}

	private static void LegacyAppInfoRecordsStorage(String Id,String Opportunityname) {
		PreparedStatement st=null;
		ResultSet rs=null;
		try
		{
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			
			String SelectRecords = "select * from archivereq_legacyapp_info_template_details ";
			st = con.prepareStatement(SelectRecords);
			rs = st.executeQuery();
			int seq_num=1;
			while(rs.next())
			{
				String insert_query = "insert into archivereq_legacyapp_info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
				preparedStatement1.setInt(1, seq_num++);
				preparedStatement1.setString(2, Id);
				preparedStatement1.setString(3, "");
				preparedStatement1.setString(4, Opportunityname);
				preparedStatement1.setString(5, rs.getString("options"));
				preparedStatement1.setString(6, rs.getString("label_name"));
				preparedStatement1.setString(7,rs.getString("column_name"));
				preparedStatement1.setString(8,rs.getString("type"));
				preparedStatement1.setString(9, rs.getString("mandatory"));
				preparedStatement1.setString(10, "");
				preparedStatement1.execute();
			}
			st.close();
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception------[Legacy App info]-----"+e);
		}
	}
		
}
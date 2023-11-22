package finance_module_service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import onboard.DBconnection;

public class FinanceAppInfoService {
	public JsonArray FinanceAppInfoDataRetrieveService(String app_name) {
		PreparedStatement st1=null;
		ResultSet rs1=null;
		JsonArray jsonArray = new JsonArray();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			
			String SelectQuery = "select * from finance_info where app_name=? order by seq_no";
			PreparedStatement st = con.prepareStatement(SelectQuery);
			st.setString(1, app_name);
			ResultSet rs = st.executeQuery();
			
			if (!rs.next()){
				String TemplateQuery = "select * from finance_info_detail order by seq_no;";
				st1 = con.prepareStatement(TemplateQuery);
				rs1 = st1.executeQuery();
				
				while(rs1.next()) {
					JsonObject jsonObject = new JsonObject();
					boolean checkexsistent=false; 
					jsonObject.addProperty("checkexsistent",checkexsistent);
					jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
					jsonObject.addProperty("Project_Name", rs1.getString("prj_name"));
					jsonObject.addProperty("options", rs1.getString("options"));
					jsonObject.addProperty("LabelName", rs1.getString("label_name"));
					jsonObject.addProperty("ColumnName", rs1.getString("column_name"));
					jsonObject.addProperty("Type", rs1.getString("type"));
					jsonObject.addProperty("Mandatory", rs1.getString("mandatory"));
					jsonObject.addProperty("Value", rs1.getString("value"));
					
					jsonArray.add(jsonObject);
					
				}
				FinanceAppInfoRecordsStorage(app_name);
				new FinanceAppInfoService().FinanceAppInfoDataRetrieveService(app_name);
			st1.close();
			rs1.close();
			}
			else
			{
				String TemplateQuery = "select * from archivereq_legacyapp_info where app_name=? order by seq_no;";
				st1 = con.prepareStatement(TemplateQuery);
				st1.setString(1, app_name);
				rs1 = st1.executeQuery();
				
				while(rs1.next()) {
					JsonObject jsonObject = new JsonObject();
					boolean checkexsistent=true; 
					jsonObject.addProperty("checkexsistent",checkexsistent);
					jsonObject.addProperty("seq_num", rs1.getString("seq_no"));
					
					jsonObject.addProperty("Project_Name", rs1.getString("prj_name"));
					jsonObject.addProperty("App_Name",rs1.getString("app_name"));
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
			System.out.println("Exception-------[ Finance App info]--------" +e);
		}
		
		return jsonArray;
	}

	private static void FinanceAppInfoRecordsStorage(String app_name) {
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
				String insert_query = "insert into archivereq_legacyapp_info (seq_no,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
				preparedStatement1.setInt(1, seq_num++);
			
				preparedStatement1.setString(2, "");
				preparedStatement1.setString(3, rs.getString("app_name"));
				preparedStatement1.setString(4, rs.getString("options"));
				preparedStatement1.setString(5, rs.getString("label_name"));
				preparedStatement1.setString(6,rs.getString("column_name"));
				preparedStatement1.setString(7,rs.getString("type"));
				preparedStatement1.setString(8, rs.getString("mandatory"));
				preparedStatement1.setString(9, "");
				preparedStatement1.execute();
			}
			st.close();
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			System.out.println("Exception------[Finance App info]-----"+e);
		}
	}

}

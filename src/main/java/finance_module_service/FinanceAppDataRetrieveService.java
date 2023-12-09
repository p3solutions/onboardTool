package finance_module_service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import IntakeDetails.IntakeOpportunity.Service.IntakeOpportunityService;
import IntakeDetails.IntakeStakeHolder.service.IntakeStakeHolderService;
import onboard.DBconnection;

public class FinanceAppDataRetrieveService {
	
	
	DBconnection dBconnection;
	Connection con;
	public String Id = null;
	public String appName = null; 
	
	public FinanceAppDataRetrieveService(String Id,String appName) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.appName = appName;
	}
	
	public JsonArray financeTemplateToFinanceInfo() {
		PreparedStatement st1=null;
		ResultSet rs1=null;
		JsonArray jsonArray = new JsonArray();
		try {
			
			String selectQuery = "select * from decom3sixtytool.finance_info where Id = ?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
						
			if(!rs.next()) {
				
				String TemplateQuery = "select * from decom3sixtytool. finance_info_detail order by seq_no;";
				st1 = con.prepareStatement(TemplateQuery);
				rs1 = st1.executeQuery();
							
				while(rs1.next()) {
					String column =rs1.getString("column_name");
					String insertQuery = "insert into decom3sixtytool.finance_info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
					PreparedStatement preparedStatement1 = con.prepareStatement(insertQuery);
					preparedStatement1.setString(1, rs1.getString("seq_no"));
					preparedStatement1.setString(2, Id);
					preparedStatement1.setString(3, "");
					preparedStatement1.setString(4, "");
			        preparedStatement1.setString(5, "options");
					preparedStatement1.setString(6, rs1.getString("label_name"));
					preparedStatement1.setString(7, rs1.getString("column_name"));
					preparedStatement1.setString(8, rs1.getString("type"));
					preparedStatement1.setString(9, rs1.getString("mandatory"));
					preparedStatement1.setString(10, rs1.getString("value"));
					preparedStatement1.execute();
				}
				rs1.close();
				st1.close();
			}
			jsonArray = financeAppDataRetrieve();
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return jsonArray;
	}
	
	public JsonArray financeAppDataRetrieve() {
		
		JsonArray jsonArray = new JsonArray();
		try {
			
			String selectQuery = "select * from decom3sixtytool.finance_info where Id = ? order by seq_no;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			LinkedHashMap<String,String> columnDetails = getAutoPopulateFields();
			while(rs.next()) {
				String column = rs.getString("column_name");
				JsonObject jsonObject = new JsonObject();
				
				jsonObject.addProperty("seq_num", rs.getString("seq_no"));
				jsonObject.addProperty("Id", rs.getString("Id"));
				jsonObject.addProperty("prjName", rs.getString("prj_name"));
				jsonObject.addProperty("appName", rs.getString("app_name"));
				jsonObject.addProperty("options", rs.getString("options"));
				jsonObject.addProperty("LabelName", rs.getString("label_name"));
				jsonObject.addProperty("ColumnName", rs.getString("column_name"));
				jsonObject.addProperty("Type", rs.getString("type"));
				jsonObject.addProperty("mandatory", rs.getString("mandatory"));
				jsonObject.addProperty("Value", columnDetails.containsKey(column)&&rs.getString("value").equals("")?getAutoPopulateValue(columnDetails.get(column),column):rs.getString("value"));
				jsonObject.addProperty("umandatory", rs.getString("usermandatoryflag"));
				jsonArray.add(jsonObject);
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	public LinkedHashMap<String, String> getAutoPopulateFields(){
		LinkedHashMap<String, String> columnDet =new LinkedHashMap<String,String>(); 
		try {
			columnDet.put("srcdb","appName-opportunity_info");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return columnDet;
	}
	
	public String getAutoPopulateValue(String columnTablePair,String key)
	{
		String value="";
		try
		{
		 boolean checkValue =false;
		 String columnName =columnTablePair.split("-")[0];
		 String tableName =columnTablePair.split("-")[1];
		 
		 String selectQuery = "select * from "+tableName+" where column_name = ? and Id = ?";
		 PreparedStatement st = con.prepareStatement(selectQuery);
		 st.setString(1, columnName);
		 st.setString(2, Id);
		 ResultSet rs = st.executeQuery();
	     if(rs.next())
		 {
			 checkValue = true;
	         value= rs.getString("value");		 
		 }
		 rs.close();
		 st.close();
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println();
		return value;
	}
	
	
	
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}

}

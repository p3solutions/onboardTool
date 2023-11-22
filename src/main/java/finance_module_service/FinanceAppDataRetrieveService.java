package finance_module_service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class FinanceAppDataRetrieveService {
	DBconnection dBconnection;
	Connection con;
	public String Id = null;
	public String oppName = null; 
	
	public FinanceAppDataRetrieveService(String Id,String oppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 
		 this.Id = Id;
		 this.oppName=oppName;
	}
	
	
	public JsonArray FinanceTemplateToFinanceInfo() {
		PreparedStatement st1=null;
		ResultSet rs1=null;
		JsonArray jsonArray = new JsonArray();
		try {
			
			String selectQuery = "select * from  decom3sixtytool.finance_info where Id= ?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
						
			if(!rs.next()) {
				
				String TemplateQuery = "select * from decom3sixtytool. finance_info_detail order by seq_no;";
				st1 = con.prepareStatement(TemplateQuery);
				rs1 = st1.executeQuery();
							
				while(rs1.next()) {
					String column =rs1.getString("column_name");
					String insertQuery = "insert into finance_info (seq_no,Id,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
					PreparedStatement preparedStatement1 = con.prepareStatement(insertQuery);
					preparedStatement1.setString(1, rs1.getString("seq_no"));
					preparedStatement1.setString(2, Id);
					preparedStatement1.setString(3, "");
					preparedStatement1.setString(4, "");
					preparedStatement1.setString(5, rs1.getString("options"));
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
				
				rs1.close();
				st1.close();
			
			jsonArray = FinanceDataRetrieve();
			
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
	
		return jsonArray;
	}
	
	public JsonArray FinanceDataRetrieve() {
		
		JsonArray jsonArray = new JsonArray();
		try {
			
			String selectQuery = "select * from decom3sixtytool.finance_info where app_name = ? order by seq_no;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			LinkedHashMap<String,String> columnDetails = getAutoPopulateFields();
			while(rs.next()) {
				String column = rs.getString("column_name");
				JsonObject jsonObject = new JsonObject();
				
				jsonObject.addProperty("seq_no", rs.getString("seq_no"));
				jsonObject.addProperty("Id",rs.getString("Id"));
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
			columnDet.put("dbaaccess", "column_name='Premilinary_CBA");
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
	
	private String getTotalSize(String structDbSize,String tableName)
	{
		String totalSize ="";
		try
		{
			boolean checkValue =false;
		    String value = "";
			int structureDataSize = !structDbSize.equals("")?Integer.parseInt(structDbSize):0;
			String selectQueryDate = "select * from "+tableName+" where column_name = 'UnstrucDataVolume' and app_name = ?;";
			PreparedStatement st2 = con.prepareStatement(selectQueryDate);
			st2.setString(1,Id);
			ResultSet rs2 = st2.executeQuery();
			
			
			
			
			 if(rs2.next())
			 {
				 checkValue = true;
		         value= rs2.getString("value");		 
			 }
			 st2.close();
			 rs2.close();
			 int unstructureDataSize = !value.equals("")?Integer.parseInt(value):0;
			totalSize=String.valueOf(structureDataSize+unstructureDataSize);
			 
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return totalSize;
	}
	
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}
}

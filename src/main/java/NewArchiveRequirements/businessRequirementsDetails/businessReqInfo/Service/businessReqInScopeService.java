package NewArchiveRequirements.businessRequirementsDetails.businessReqInfo.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class businessReqInScopeService {

	
DBconnection dBconnection =null;
	
	Connection con = null;
	
	public String Id = null;
	public String OppName;
	
	public businessReqInScopeService(String Id,String OppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.OppName = OppName;
	}

	public void BusinessReqServiceDefaultRecords() throws SQLException {
		PreparedStatement st=null,st1=null;
		ResultSet rs=null,rs1=null;
		try {
			 
			 String oppName = "";
			 
			 String AppNameQuery = "SELECT * FROM OPPORTUNITY_INFO WHERE COLUMN_NAME = 'appName' and Id = ?";
			 st = con.prepareStatement(AppNameQuery);
			 st.setString(1, Id);
			 rs = st.executeQuery();
				 
			 if(rs.next())
				 oppName = rs.getString("value");
			 
			 st.close();
			 rs.close();
			 
			
			 
			 String selectQuery = "select * from BusinessReqinscope_Info_template_details";
			 st1 = con.prepareStatement(selectQuery);
			 rs1 = st1.executeQuery();
			 
			 while(rs1.next()) {
				 String BusinessReq_InsertQuery = "insert into BusinessReqinscope_Info (seq_no, OppId, prj_name, OppName, req_in_scope, description)"
						 +" value(?,?,?,?,?,?)";
				 
				 PreparedStatement preparedStatement1 = con.prepareStatement(BusinessReq_InsertQuery);
					preparedStatement1.setInt(1, rs1.getInt(1));
					preparedStatement1.setString(2, Id);
					preparedStatement1.setString(3, "");
					preparedStatement1.setString(4, oppName);
					preparedStatement1.setString(5, rs1.getString(2));
					preparedStatement1.setString(6, rs1.getString(3));
					preparedStatement1.execute();
			 	}
				
			 }
		 catch(Exception e) {
			 e.printStackTrace();
		 }
		finally
		{
			 st1.close();
			 rs1.close();
		}
	}
	
	public JsonArray BusinessRequirementsDataRetrieve() {
		
		JsonArray jsonArray = new JsonArray();
		
		try {
			 String selectQuery1 = "select * from BusinessReqinscope_Info where OppId = ?;";
			 PreparedStatement st2 = con.prepareStatement(selectQuery1);
				st2.setString(1, Id);
				ResultSet rs2 = st2.executeQuery();
					 
			 if(!rs2.next()) {
				 BusinessReqServiceDefaultRecords();
				 
			 }
			 jsonArray = getTableInfo();
			 st2.close();
			 rs2.close();
		}
		
			 catch(Exception e) {
				 e.printStackTrace();
			 }
		return jsonArray;
	}
	
	public JsonArray getTableInfo() {
		
		JsonArray jsonArray = new JsonArray();
		
		try {
			 String selectQuery1 = "select * from BusinessReqinscope_Info where OppId = ? order by seq_no;";
			 PreparedStatement st2 = con.prepareStatement(selectQuery1);
			 st2.setString(1, Id);
			 ResultSet rs2 = st2.executeQuery();
				 
			 while(rs2.next()) {
				 JsonObject jsonObject = new JsonObject();
				 jsonObject.addProperty("seq_no", rs2.getInt(1));
				 jsonObject.addProperty("OppId", rs2.getString(2));
				 jsonObject.addProperty("prj_name", rs2.getString(3));
				 jsonObject.addProperty("OppName", rs2.getString(4));
				 jsonObject.addProperty("req_in_scope", rs2.getString(5));
				 jsonObject.addProperty("description", rs2.getString(6));
				 jsonArray.add(jsonObject);
			 }
			 st2.close();
			 rs2.close();
		}
		
			 catch(Exception e) {
				 e.printStackTrace();
			 }
		return jsonArray;
		
	}
	
	
	protected void finalize() throws Throwable {
		 con.close();
		 System.out.println("DB connection closed");
		}
	
}

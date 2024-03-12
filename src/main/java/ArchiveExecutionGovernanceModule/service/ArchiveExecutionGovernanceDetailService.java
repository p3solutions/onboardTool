package ArchiveExecutionGovernanceModule.service;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class ArchiveExecutionGovernanceDetailService {


	DBconnection dBconnection =null;

	Connection con = null;

	public ArchiveExecutionGovernanceDetailService() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
	}

	public JsonArray archiveExecutionGovernanceDataRetrieve(String waveName) {
		JsonArray jsonArray = new JsonArray();
		JsonArray jsonArray1 = new JsonArray();
		String apps[] = {};
		try {
			JsonObject jsonObject = archiveExecutionHearderInfo(waveName); 
			jsonArray.add(jsonObject);
			String selectWaves = "select * from governance_info where waveName=?";
			PreparedStatement st1 = con.prepareStatement(selectWaves);
			st1.setString(1, waveName);
			ResultSet rs1 = st1.executeQuery();
			while (rs1.next()) {
				if (rs1.getString("column_name").equals("apps")) {
					if (rs1.getString("value").isEmpty() == false) {
						apps = rs1.getString("value").split(",");
						System.out.println("APPS : "+apps);
					}
				}
			}
			System.out.println("APPS : "+apps);
			if (apps.length > 0) {

				jsonArray1 = getArchiveExeDetail(apps);

			} 
			rs1.close();
			st1.close();


		}

		catch(Exception e) {
			e.printStackTrace();
		}
		jsonArray.addAll(jsonArray1);


		return jsonArray;

	}

	private JsonArray getArchiveExeDetail(String[] apps) {
		PreparedStatement st=null;
		ResultSet rs=null;
		String Id="";
		JsonArray jsonArray = new JsonArray();

		try {
			for(String app:apps) {
				JsonObject js = new JsonObject();
				String selectApp = "select distinct ar.oppName,OppId from decom3sixtytool.opportunity_info o inner join decom3sixtytool.archive_execution_info ar on o.Id=ar.OppId where column_name='appName' and value =?";
				st = con.prepareStatement(selectApp);
				st.setString(1, app);
				rs = st.executeQuery();
				while (rs.next()) {
					JsonObject jsonObj1 = new JsonObject();
					Id = rs.getString("OppId");
					jsonObj1.addProperty("oppName", app);
					jsonObj1.addProperty("level", "1");
					jsonArray.add(jsonObj1);
				}

				String selectAppdetail = "select * from decom3sixtytool.archive_execution_info where level='1' and OppId = ?";
				PreparedStatement st12 = con.prepareStatement(selectAppdetail);
				st12.setString(1, Id);
				ResultSet rs12 = st12.executeQuery();
				while (rs12.next()) {
					JsonObject jsonObj = new JsonObject();
					jsonObj.addProperty("seq_no",rs12.getString(1));
					jsonObj.addProperty("oppId",rs12.getString(2));
					jsonObj.addProperty("oppName",rs12.getString(3));
					jsonObj.addProperty("level","2");
					jsonObj.addProperty("taskId",rs12.getString(5));
					jsonObj.addProperty("taskGroup",rs12.getString(6));
					jsonObj.addProperty("taskName",rs12.getString(7));
					jsonObj.addProperty("taskType",rs12.getString(8));
					jsonObj.addProperty("majorDep",rs12.getString(9));
					jsonObj.addProperty("assignedTo",rs12.getString(10));
					jsonObj.addProperty("planStart",rs12.getString(11));
					jsonObj.addProperty("planEnd",rs12.getString(12));
					jsonObj.addProperty("actStart",rs12.getString(13));
					jsonObj.addProperty("actEnd",rs12.getString(14));
					jsonObj.addProperty("completion",rs12.getString(15));
					jsonObj.addProperty("status",rs12.getString(16));
					jsonObj.addProperty("remark",rs12.getString(17));
					jsonArray.add(jsonObj);
				}

				rs12.close();
				st12.close();
			}


			rs.close();
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("APPS ARRAY : "+jsonArray);
		return jsonArray;
	}

	private JsonObject archiveExecutionHearderInfo(String waveName) {

		JsonObject jsonObj = new JsonObject();
		try {

			String selectQuery = "select * from governance_info where waveName = ?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, waveName);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				
				 if((rs.getString("column_name")).equals("waveName"))
					jsonObj.addProperty("waveName",rs.getString("value"));
				else if((rs.getString("column_name")).equals("creation_date"))
					jsonObj.addProperty("creation_date",rs.getString("value"));
				else if((rs.getString("column_name")).equals("completion_date"))
					jsonObj.addProperty("completion_date",rs.getString("value"));
			}


			st.close();
			rs.close();

		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonObj;

	}

	protected void finalize() throws Throwable 
	{ 
		System.out.println("Db connection closed.");
		con.close();
	}


}

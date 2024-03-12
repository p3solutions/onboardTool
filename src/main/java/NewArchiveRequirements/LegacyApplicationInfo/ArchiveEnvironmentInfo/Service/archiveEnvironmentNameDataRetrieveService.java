package NewArchiveRequirements.LegacyApplicationInfo.ArchiveEnvironmentInfo.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveEnvironmentNameDataRetrieveService {
	DBconnection dBconnection;
	Connection con;
	
	String Id;
	String oppName;
	
	public archiveEnvironmentNameDataRetrieveService(String Id, String oppName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.oppName = oppName;
	}
	
	public JsonArray archiveEnmtNameDataRetrieve() {
		JsonArray jsonArray = new JsonArray();
		
		try {
			
			String selectQuery = "select * from Archive_Environment_Name_Info where OppId = ?;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1,Id);
			ResultSet rs = st.executeQuery();
			
			if(rs.next()) {
				JsonObject jsonObj =new JsonObject();
				jsonObj.addProperty("checkExistance",true);
				
				jsonObj.addProperty("DevName",rs.getString("devName"));
				jsonObj.addProperty("TestName",rs.getString("testName"));
				jsonObj.addProperty("StageName",rs.getString("stageName"));
				jsonObj.addProperty("ProdName",rs.getString("prodName"));
                jsonArray.add(jsonObj);
                
                while(rs.next()) {
                	JsonObject jsonObj1 =new JsonObject();
    				jsonObj1.addProperty("DevName",rs.getString("devName"));
    				jsonObj1.addProperty("TestName",rs.getString("testName"));
    				jsonObj1.addProperty("StageName",rs.getString("stageName"));
    				jsonObj1.addProperty("ProdName",rs.getString("prodName"));
                    jsonArray.add(jsonObj1);
                }
			}
			else
            {
				String StakeHolderInsertQuery = "insert into Archive_Environment_Name_Info(seq_no, OppId, prjName, oppName,devName ,testName, stageName,prodName)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, 1);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, "");
	          prestmt.setString(4, oppName);
	          prestmt.setString(5, "");
	          prestmt.setString(6, "");
	          prestmt.setString(7, "");
	          prestmt.setString(8, "");
	          prestmt.execute();
	          prestmt.close();
                JsonObject jsonObj2 = new JsonObject();
                jsonObj2.addProperty("checkExistance",false);
                jsonArray.add(jsonObj2);
            }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	public JsonArray archiveEnmtServerIpDataRetrieve() {
		JsonArray jsonArray = new JsonArray();
		
		try {
			
			String selectQuery = "select * from Archive_Environment_ServerIp_Info where OppId = ?;";
			PreparedStatement st1 = con.prepareStatement(selectQuery);
            st1.setString(1, Id);
            ResultSet rs = st1.executeQuery();
            
			if(rs.next()) {
				JsonObject jsonObj =new JsonObject();
				jsonObj.addProperty("checkExistance",true);
				
				jsonObj.addProperty("DevServerIp",rs.getString("devServerIp"));
				jsonObj.addProperty("TestServerIp",rs.getString("testServerIp"));
				jsonObj.addProperty("StageServerIp",rs.getString("stageServerIp"));
				jsonObj.addProperty("ProdServerIp",rs.getString("prodServerIp"));
                jsonArray.add(jsonObj);
                
                while(rs.next()) {
                	JsonObject jsonObj1 =new JsonObject();
    				jsonObj1.addProperty("DevServerIp",rs.getString("devServerIp"));
    				jsonObj1.addProperty("TestServerIp",rs.getString("testServerIp"));
    				jsonObj1.addProperty("StageServerIp",rs.getString("stageServerIp"));
    				jsonObj1.addProperty("ProdServerIp",rs.getString("prodServerIp"));
                    jsonArray.add(jsonObj1);
                }
			}
			else
            {
                
                String StakeHolderInsertQuery = "insert into Archive_Environment_ServerIp_Info(seq_no, OppId, prjName, oppName,devServerIp ,testServerIp, stageServerIp,prodServerIp)"
						+ " value(?, ?, ?, ?, ?, ?, ?, ?);";
	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, 1);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, "");
	          prestmt.setString(4, oppName);
	          prestmt.setString(5, "");
	          prestmt.setString(6, "");
	          prestmt.setString(7, "");
	          prestmt.setString(8, "");
	          prestmt.execute();
	          prestmt.close();
	          JsonObject jsonObj2 = new JsonObject();
              jsonObj2.addProperty("checkExistance",false);
                jsonArray.add(jsonObj2);
            }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	
	public JsonArray archiveEnvmtDataRetrieve() {
		JsonArray jsonArray = new JsonArray();
		
		try {
			jsonArray.add(archiveEnmtNameDataRetrieve());
			jsonArray.add(archiveEnmtServerIpDataRetrieve());
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}
	
	protected void finalize() throws Throwable {
	      con.close();
	      System.out.println("Db connection Closed");
		}
}

package NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveFunctionalReqSaveService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray ;
	String tableName;
	String column;
	static String qry;
	public archiveFunctionalReqSaveService(String Id,JsonArray jsonArray,String tableName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.jsonArray = jsonArray;
		 this.tableName = tableName;
		 getTableNameInfo();
	}

	
	public JsonObject archiveFunctionalReqSave()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag =false;
		try
		{	
			for(int i=0;i<jsonArray.size();i++)
			{
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
		  		String seqNum = jsonObj.get("seq_no").getAsString();	
		  		String ReqId = jsonObj.get("ReqId").getAsString();
		  		String InScope =  jsonObj.get("InScope").getAsString();
		  		String ReqType=  jsonObj.get("ReqType").getAsString();
		  		String Requirements =  jsonObj.get("Requirements").getAsString();
		  		String Additional =  jsonObj.get("Additional").getAsString();
		  		
			  String UpdateQuery = getQuery(tableName);
	          PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	          prestmt.setString(1, ReqId);
	          prestmt.setString(2, InScope);
	          prestmt.setString(3, ReqType);
	          prestmt.setString(4, Requirements);
	          prestmt.setString(5, Additional);
	          prestmt.setString(6, Id);
	          prestmt.setString(7, seqNum);
	          prestmt.execute();
			}
			statusFlag =true;
			
			
		}
		
		catch(Exception e)
		{
			statusFlag =false;
			e.printStackTrace();
		}
		jsonObject.addProperty("SaveStatus", statusFlag);
		return jsonObject;
		
	}
	
	public void getTableNameInfo() {

		switch(tableName) {
		
		case "Archive_DataReq_Info":
			column = "req";
			break;
		default : 
			column = "descp";
		}
	}
	
	public static String getQuery(String tableName)
	{
		switch(tableName)
		{
		case "Archive_DataReq_Info":
			qry="update archive_datareq_info set reqId = ?, reqInScope =?, reqType=?, req=?, additionInfo=? where OppId=? and seq_no=?";
		break;
		case "Archive_RetentionLegalReq_Info":
			qry="update Archive_RetentionLegalReq_Info set reqId = ?, reqInScope =?, reqType=?, descp=?, additionInfo=? where OppId=? and seq_no=?";
		break;
		case "Archive_SecurityReq_Info":
			qry="update Archive_SecurityReq_Info set reqId = ?, reqInScope =?, reqType=?, descp=?, additionInfo=? where OppId=? and seq_no=?";
		break;
		case "Archive_UsabilityReq_Info":
			qry="update Archive_UsabilityReq_Info set reqId = ?, reqInScope =?, reqType=?, descp=?, additionInfo=? where OppId=? and seq_no=?";
		break;
		case "Archive_AuditReq_Info":
			qry="update Archive_AuditReq_Info set reqId = ?, reqInScope =?, reqType=?, descp=?, additionInfo=? where OppId=? and seq_no=?";
		break;
		default:
			System.out.println("Error");
			break;
		}
		return qry;
	}
	
	protected void finalize() throws Throwable {
      con.close();
	}

	
}

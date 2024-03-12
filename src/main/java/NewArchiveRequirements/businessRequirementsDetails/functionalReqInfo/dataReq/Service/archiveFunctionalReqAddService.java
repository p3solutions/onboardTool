package NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service;

import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveFunctionalReqAddService {

	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	String oppName;
	String tableName;
	String column;
	String ReqId;
	static String qry;
	
	public archiveFunctionalReqAddService(int SeqNum,String Id, String oppName, String tableName) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
		 this.oppName = oppName;
		 this.tableName = tableName;
		 getTableNameInfo();
		 
	}

	public JsonObject AddRow()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean statusFlag = false;
			
			  String InsertQuery = getQuery(tableName);
	          PreparedStatement prestmt = con.prepareStatement(InsertQuery);
	          prestmt.setInt(1, SeqNum+1);
	          prestmt.setString(2, Id);
	          prestmt.setString(3, oppName);
	          prestmt.setString(4, "");
	          prestmt.setString(5, ReqId);
	          prestmt.setString(6, "");
	          prestmt.setString(7, "");
	          prestmt.setString(8, "");
	          prestmt.setString(9, "N/A");
	          prestmt.execute();
	          statusFlag =true;
			
			jsonObject.addProperty("AddStatus", statusFlag);
			jsonObject.addProperty("ReqId",ReqId);
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
		
	}
	
	public void getTableNameInfo() {

		switch(tableName) {
		
		case "archive_datareq_info":
			column = "req";
			ReqId ="FR-D-"+getSeqNum();
			break;
			
		case "Archive_RetentionLegalReq_Info":
			column = "descp";
			ReqId ="FR-R-"+getSeqNum();
			break;
			
		case "Archive_SecurityReq_Info":
			column = "descp";
			ReqId ="FR-S-"+getSeqNum();
			break;
			
		case "Archive_UsabilityReq_Info":
			column = "descp";
			ReqId ="FR-U-"+getSeqNum();
			break;
			
		case "Archive_AuditReq_Info":
			column = "descp";
			ReqId ="FR-A-"+getSeqNum();
			break;
			
		}
	}
	
	public static String getQuery(String tableName)
	{
		switch(tableName)
		{
		case "archive_datareq_info":
			qry="insert into archive_datareq_info (seq_no, oppId, oppName, prjname, reqId, reqInScope, reqType, req, additionInfo)values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
		break;
		case "Archive_RetentionLegalReq_Info":
			qry="insert into Archive_RetentionLegalReq_Info (seq_no, oppId, oppName, prjname, reqId, reqInScope, reqType, descp, additionInfo)values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
		break;
		case "Archive_SecurityReq_Info":
			qry="insert into Archive_SecurityReq_Info (seq_no, oppId, oppName, prjname, reqId, reqInScope, reqType, descp, additionInfo)values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
		break;
		case "Archive_UsabilityReq_Info":
			qry="insert into Archive_UsabilityReq_Info (seq_no, oppId, oppName, prjname, reqId, reqInScope, reqType, descp, additionInfo)values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
		break;
		case "Archive_AuditReq_Info":
			qry="insert into Archive_AuditReq_Info (seq_no, oppId, oppName, prjname, reqId, reqInScope, reqType, descp, additionInfo)values(?, ?, ?, ?, ?, ?, ?, ?, ?);";
		break;
		default:
			System.out.println("Error");
			break;
		}
		return qry;
	}
	private String getSeqNum()
	{
		String seq_num="";
	  try
	  {
		  int count = 0;
		  seq_num=String.valueOf(SeqNum+1);
		  if(seq_num.length()<3)
		  {
		  count = 3-seq_num.length();
		  for(int i=0;i<count;i++)
		  seq_num = "0"+seq_num;
		  }
	  }
	  catch(Exception e)
	  {
		  e.printStackTrace();
	  }
	  return seq_num;
	}
	protected void finalize() throws Throwable {
	      con.close();
	      System.out.println("Db connection Closed");
		}
	
}

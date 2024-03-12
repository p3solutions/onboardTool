package NewArchiveRequirements.LegacyApplicationInfo.ArchiveEnvironmentInfo.Service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class archiveEnvironmentDeleteService {
	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	String tableName;
	String columnSuffix;
	static String qry;
	public archiveEnvironmentDeleteService(int SeqNum,String Id,String tableName) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
		 this.tableName = tableName;
		 columnSuffix = getColumnSuffix();
	}
private String getColumnSuffix()
{
	return((tableName.equals("archive_environment_name_info"))?"Name":(tableName.equals("archive_environment_serverip_info")?"ServerIp":""));
}


public static String getQuery(String tableName)
{
	switch(tableName)
	{
	case "archive_environment_name_info":
		qry="select * from archive_environment_name_info where OppId=?;";
		break;
	case "archive_environment_serverip_info":
		qry="select * from archive_environment_serverip_info where OppId=?;";
		break;
		
    default:
	System.out.println("Error");
	break;
	
	}
	return qry;
}

public static String getDelQuery(String tableName)
{
	switch(tableName)
	{
	case "archive_environment_name_info":
		qry="delete from archive_environment_name_info where OppId=?;";
		break;
	case "archive_environment_serverip_info":
		qry="delete from archive_environment_serverip_info where OppId=?;";
		break;
		
    default:
	System.out.println("Error");
	break;
	
	}
	return qry;
}

public static String getrowInsQuery(String tableName)
{
	switch(tableName)
	{
	case "archive_environment_name_info":
		qry="insert into archive_environment_name_info (seq_no, OppId, prjName, OppName, devName, testName, stageName, prodName)"
				+ " value(?, ?, ?, ?, ?, ?, ?, ?);";
		break;
	case "archive_environment_serverip_info":
		qry="insert into archive_environment_serverip_info (seq_no, OppId, prjName, OppName, devServerIp, testServerIp, stageServerIp, prodServerIp)"
				+ " value(?, ?, ?, ?, ?, ?, ?, ?);";
		break;
		
    default:
	System.out.println("Error");
	break;
	
	}
	return qry;
}

	public JsonObject DeleteRowEnvironmentName()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag = false;
		try
		{
			
			ArrayList<String> seqNum = new ArrayList<String>();
			ArrayList<String> dev = new ArrayList<String>();
			ArrayList<String> test = new ArrayList<String>();
			ArrayList<String> stage = new ArrayList<String>();
			ArrayList<String> prod = new ArrayList<String>();
			
			ArrayList<String> seqNumRes = new ArrayList<String>();
			ArrayList<String> devRes = new ArrayList<String>();
			ArrayList<String> testRes = new ArrayList<String>();
			ArrayList<String> stageRes = new ArrayList<String>();
			ArrayList<String> prodRes = new ArrayList<String>();
			
			String oppName ="";
			int newSeqNum = SeqNum+1;
			String selectQuery = getQuery(tableName);
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			
			while(rs.next())
			{
			   seqNum.add(rs.getString("seq_no"));
			   dev.add(rs.getString("dev"+columnSuffix));
			   test.add(rs.getString("test"+columnSuffix));
			   stage.add(rs.getString("stage"+columnSuffix));
			   prod.add(rs.getString("prod"+columnSuffix));
			   oppName = rs.getString("OppName");
			}
			
			for(int i=0;i<seqNum.size();i++)
			{
				if(SeqNum<Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(seqNum.get(i));
					devRes.add(dev.get(i));
					testRes.add(test.get(i));
					stageRes.add(stage.get(i));
					prodRes.add(prod.get(i));
				}
				else if(SeqNum>Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(String.valueOf(Integer.parseInt(seqNum.get(i))-1));
					devRes.add(dev.get(i));
					testRes.add(test.get(i));
					stageRes.add(stage.get(i));
					prodRes.add(prod.get(i));
				}
			}
			for(int i=0;i<seqNumRes.size();i++)
			{
			  System.out.println(seqNumRes.get(i)+" "+devRes.get(i)+" "+testRes.get(i)+" "+stageRes.get(i)+" "+prodRes.get(i)+" ");	
			}
			
			String deleteQuery =getDelQuery(tableName);
			PreparedStatement st1 = con.prepareStatement(deleteQuery);
			st1.setString(1,Id);
			st1.executeUpdate();
			st1.close();
						
			for(int i=0;i<seqNumRes.size();i++)
			{
			  System.out.println(seqNumRes.get(i)+" "+devRes.get(i)+" "+testRes.get(i)+" "+stageRes.get(i)+" "+prodRes.get(i)+" ");	
			  String StakeHolderInsertQuery = getrowInsQuery(tableName);
	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, Integer.parseInt(seqNum.get(i)));
			  prestmt.setString(2,Id);
			  prestmt.setString(3, "");
			  prestmt.setString(4, oppName);
			  prestmt.setString(5,devRes.get(i));
			  prestmt.setString(6, testRes.get(i));
			  prestmt.setString(7,stageRes.get(i));
			  prestmt.setString(8,prodRes.get(i));
			  prestmt.execute();
	          
			}
			statusFlag =true;
			
			
		}
		
		catch(Exception e)
		{
			statusFlag =false;
			e.printStackTrace();
		}
		jsonObject.addProperty("DeleteStatus", statusFlag);
		return jsonObject;
		
	}
	protected void finalize() throws Throwable {
      con.close();
	}

}
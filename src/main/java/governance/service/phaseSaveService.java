package governance.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class phaseSaveService {
	
	DBconnection dBconnection;
	Connection con;
	String Id;
	JsonArray jsonArray;
	String phaseName;
	String oppName;
	
	String tableName;
	String idWhereCond;
	String idAndCond;
	String operation;
	String id;
	static String qry;
	public phaseSaveService(String Id,String phaseName,JsonArray jsonArray,String id,String operation) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.id = id;
		this.phaseName = phaseName;
		this.jsonArray = jsonArray;
		this.operation = operation;
		getTableProperty(operation);
	}
	
	public phaseSaveService(String phaseName, String oppName) throws ClassNotFoundException, SQLException
	{
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.phaseName = phaseName;
		this.oppName = oppName;
	}
	
	public void getTableProperty(String operation)
	{
		try
		{
			switch(operation)
			{
			case "EditPhase":
				  tableName = "phase_info";
				  break;
				
			case "NewPhase":
				tableName = "phase_info_details";
				break;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	public static String getUpdQuery(String tableName)
	{
		switch(tableName)
		{
		case "phase_info":
			qry="update phase_info set value=?,phaseName=? where column_name=? and phaseId=?;";
			break;
		case "phase_info_details":
			qry="update phase_info_details set value=?,phaseName=? where column_name=?;";
			break;
			
	    default:
		System.out.println("Error");
		break;
		
		}
		return qry;
	}
	
	public boolean AddOpportunityToExistingWave()
	{
		boolean statusFlag = false;
		try
		{
			String oppNames = "";
			String selectQuery = "select * from phase_info where phaseName = ? and column_name='apps';";
			PreparedStatement st1 = con.prepareStatement(selectQuery);
			st1.setString(1, phaseName);
			ResultSet rs1 = st1.executeQuery();
	
			if(rs1.next())
			oppNames = rs1.getString("value");
			rs1.close();
			st1.close();
			
			String updateQuery = "update phase_info set value=? where column_name='apps' and phaseName = ?;";
			String s=oppNames+","+oppName;
			System.out.println("s Value : "+s);
	 		PreparedStatement st = con.prepareStatement(updateQuery);
	         st.setString(1, s);
	          st.setString(2, phaseName);
	          st.execute();
	          st.close();
            
            statusFlag = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return statusFlag;
	}
	public boolean SaveService()
	{
		boolean saveStatus = false;
		try
		{
			for(int i=0;i<jsonArray.size();i++)
			{
				if(tableName.equals("phase_info"))
				{
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
				String name = jsonObj.get("Name").getAsString();
				String value = jsonObj.get("Value").getAsString();
				String updateQuery = getUpdQuery(tableName);
				 PreparedStatement st = con.prepareStatement(updateQuery);
		          st.setString(1, value);
		          st.setString(2, phaseName);
		          st.setString(3, name);
		          st.setString(4, id);
		          st.execute();
				  st.close();
				}
				
				if(tableName.equals("phase_info_details"))
				{
				JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
				String name = jsonObj.get("Name").getAsString();
				String value = jsonObj.get("Value").getAsString();
				String updateQuery = getUpdQuery(tableName);
				 PreparedStatement st = con.prepareStatement(updateQuery);
		          st.setString(1, value);
		          st.setString(2, phaseName);
		          st.setString(3, name);
		          st.execute();
				  st.close();
				}
				
			}
			if(operation.equals("NewPhase"))
			moveInfoDetailsToInfo();
			saveStatus = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return saveStatus;
	}
	public boolean moveInfoDetailsToInfo()
	{	PreparedStatement st=null;
		ResultSet rs=null;
		boolean statusFlag = false;
		try
		{
			String selectQuery = "select * from phase_info_details order by seq_no;";
			st = con.prepareStatement(selectQuery);
			rs = st.executeQuery();
			while(rs.next())
			{
				String insert_query = "insert into phase_info (seq_no,phaseId,phaseName,prj_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
				PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
				preparedStatement1.setInt(1, rs.getInt(1));
				preparedStatement1.setString(2,rs.getString(2));
				preparedStatement1.setString(3,rs.getString(3));
				preparedStatement1.setString(4,rs.getString(4));
				preparedStatement1.setString(5,rs.getString(5));
				preparedStatement1.setString(6,rs.getString(6));
				preparedStatement1.setString(7,rs.getString(7));
				preparedStatement1.setString(8,rs.getString(8));
				preparedStatement1.setString(9,rs.getString(9));
				preparedStatement1.setString(10,rs.getString(10));
				preparedStatement1.execute();
	            preparedStatement1.close();
			}
			st.close();
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return statusFlag;
	}
	public boolean checkDuplicateData(String columnName,String value)
	{
		boolean statusFlag  = false;
		try
		{
			if(operation.equals("NewPhase"))
			{
			String selectQuery = "select * from phase_info where column_name=? and value=?;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, columnName);
			st.setString(2, value);
			ResultSet rs = st.executeQuery();
			System.out.println("Query : "+selectQuery);
			if(rs.next())
			{
				if(value.equals(rs.getString("value")))
				statusFlag =  true;
			}
			st.close();
			rs.close();
			}
			else if(operation.equals("EditPhase"))
			{
				String selectQuery = "select * from phase_info where column_name=? and value=?;";
				PreparedStatement st = con.prepareStatement(selectQuery);
				st.setString(1, columnName);
				st.setString(2, value);
				ResultSet rs = st.executeQuery();
				System.out.println("Query : "+selectQuery);
				while(rs.next())
				{
					if(value.equals(rs.getString("value"))&&!rs.getString("phaseId").equals(id))
					statusFlag =  true;
					
				}
				st.close();
				rs.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return statusFlag;
	}
	protected void finalize() throws Throwable {
	   System.out.println("Db connection closed.");
		con.close();
	}

}

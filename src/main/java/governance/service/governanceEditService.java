package governance.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.sql.Connection;
import java.sql.PreparedStatement;

import onboard.DBconnection;
import logger.System;

public class governanceEditService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	String labelName;
	int seqNum;
	String tableName;
	String idWhereCond;
	String idAndCond;
	String id;
	static String qry;
	private String operation;
	
	public governanceEditService(String labelName,int seqNum, String id, String operation) throws ClassNotFoundException, SQLException
	{
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.labelName = labelName;
		this.seqNum = seqNum;
		this.id = id;
		
		getTableProperty(operation);
		
	}
	
	public void getTableProperty(String operation)
	{
		try
		{
			switch(operation)
			{
			case "EditWave":
				  tableName = "governance_info";
				  break;
				
			case "NewWave":
				tableName = "governance_info_details";
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
		case "governance_info":
			qry="update governance_info set label_name=? where  seq_no=? and waveId=?";
			break;
		case "governance_info_details":
			qry="update governance_info_details set label_name=? where  seq_no=?";
			break;
			
	    default:
		System.out.println("Error");
		break;
		
		}
		return qry;
	}
	
	public static String getPrevLblQuery(String tableName)
	{
		switch(tableName)
		{
		case "governance_info":
			qry="select * from governance_info where seq_no=? and waveId=?;";
			break;
		case "governance_info_details":
			qry="select * from governance_info_details where seq_no=?;";
			break;
			
	    default:
		System.out.println("Error");
		break;
		
		}
		return qry;
	}
	
	public static String getCheckDplLblQuery(String tableName)
	{
		switch(tableName)
		{
		case "governance_info":
			qry="select * from governance_info where label_name=? and waveId=?;";
			break;
		case "governance_info_details":
			qry="select * from governance_info_details where label_name=?;";
			break;
			
	    default:
		System.out.println("Error");
		break;
		
		}
		return qry;
	}
	
	public boolean EditService()
	{
		boolean editStatus  = false;
		try
		{
			if(tableName.equals("governance_info"))
			{
			String updateQuery =getUpdQuery(tableName);
			 PreparedStatement st = con.prepareStatement(updateQuery);
	          st.setString(1, labelName);
	          st.setInt(2, seqNum);
	          st.setString(3, id);
	          st.execute();
			  st.close();
			  }
			if(tableName.equals("governance_info_details"))
			{System.out.println("G Invokes");
			String updateQuery =getUpdQuery(tableName);
			 PreparedStatement st = con.prepareStatement(updateQuery);
	          st.setString(1, labelName);
	          st.setInt(2, seqNum);
	          st.execute();
			  st.close();
			  }
			editStatus = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return editStatus;
	}
	
	public String getPreviousLabelName()
	{
		String previousLabel ="";
		try
		{
			if(tableName.equals("governance_info"))
			{
			String selectQuery = getPrevLblQuery(tableName);
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setInt(1, seqNum);
			st.setString(2, id);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			previousLabel =rs.getString("label_name");
			rs.close();
			st.close();
		}
			if(tableName.equals("governance_info_details"))
			{
			String selectQuery = getPrevLblQuery(tableName);
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setInt(1, seqNum);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			previousLabel =rs.getString("label_name");
			rs.close();
			st.close();
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return previousLabel;
	}
	public boolean checkDuplicateLabelName()
	{
		boolean checkDuplicateLabel = false;
		try
		{
			if(tableName.equals("governance_info"))
			{
			String selectQuery = getCheckDplLblQuery(tableName);
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, labelName);
			st.setString(2, id);
			ResultSet rs = st.executeQuery();
			if(rs.next())
				checkDuplicateLabel = true;
				rs.close();
			st.close();
		}
			if(tableName.equals("governance_info_details"))
			{
			String selectQuery = getCheckDplLblQuery(tableName);
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, labelName);
			ResultSet rs = st.executeQuery();
			if(rs.next())
				checkDuplicateLabel = true;
				rs.close();
			st.close();
		}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return checkDuplicateLabel;
	}
	
	protected void finalize() throws Throwable {
	 con.close();
	 System.out.println("Db connection closed.");
	}
	
}

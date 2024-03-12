package ArchiveExecutionGovernanceModule.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class ArchiveExecutionGovernanceSaveService {
    
	Connection con = null;
	public String waveId = null;
	DBconnection dBconnection =null;
	public String ColumnName = "";
	public int SeqNo = 0;
	public String Value = "";
	static String qry;
	static String dateqry;
	public ArchiveExecutionGovernanceSaveService(String waveId,int SeqNo,String ColumnName,String Value) throws ClassNotFoundException, SQLException {
		
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.waveId = waveId;
		this.SeqNo = SeqNo;
		this.ColumnName = ColumnName;
		this.Value = Value;
	}
	
	public static String getQuery(String ColumnName)
	{
		switch(ColumnName)
		{
		case "taskType":
			qry="update archive_execution_governance_info set taskType = ? where waveId=? and seq_No=?;";
			break;
		case "majorDependencies":
			qry="update archive_execution_governance_info set majorDependencies = ? where waveId=? and seq_No=?;";
			break;
		case "assignedTo":
			qry="update archive_execution_governance_info set assignedTo = ? where waveId=? and seq_No=?;";
			break;
		case "planSrt":
			qry="update archive_execution_governance_info set planSrt = ? where waveId=? and seq_No=?;";
			break;
		case "planEnd":
			qry="update archive_execution_governance_info set planEnd = ? where waveId=? and seq_No=?;";
			break;
		case "actSrt":
			qry="update archive_execution_governance_info set actSrt = ? where waveId=? and seq_No=?;";
			break;
		case "actEnd":
			qry="update archive_execution_governance_info set actEnd = ? where waveId=? and seq_No=?;";
			break;
		case "completion":
			qry="update archive_execution_governance_info set completion = ? where waveId=? and seq_No=?;";
			break;
		case "status":
			qry="update archive_execution_governance_info set status = ? where waveId=? and seq_No=?;";
			break;
		case "remark":
			qry="update archive_execution_governance_info set remark = ? where waveId=? and seq_No=?;";
			break;
	    default:
		System.out.println("Error");
		break;
		
		}
		return qry;
	}
	
	public static String getDateQuery(String ColumnName)
	{
		switch(ColumnName)
		{
		case "planSrt":
			dateqry="update archive_execution_governance_info set planSrt = ? where waveId=? and seq_No=?;";
			break;
		case "planEnd":
			dateqry="update archive_execution_governance_info set planEnd = ? where waveId=? and seq_No=?;";
			break;
		case "actSrt":
			dateqry="update archive_execution_governance_info set actSrt = ? where waveId=? and seq_No=?;";
			break;
		case "actEnd":
			dateqry="update archive_execution_governance_info set actEnd = ? where waveId=? and seq_No=?;";
			break;
			
		default:
			System.out.println("Error");
			break;
		}
		return dateqry;
		
	}
	
	public JsonObject ArchiveExecutionSave()
	{
		JsonObject jsonObject = new JsonObject();
		boolean checkSave = false;
		try
		{
			
			String UpdateQuery  = getQuery(ColumnName);
			PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
	        prestmt.setString(1, Value);
	        prestmt.setString(2, waveId);
	        prestmt.setInt(3, SeqNo);
	        prestmt.execute();
			
			jsonObject = checkInputType(ColumnName, SeqNo);
		    checkSave = true;
		    jsonObject.addProperty("checkSave", checkSave);
		    
		    System.out.println("Archive Execution Save");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
	}
	
	public JsonObject updateParentStartDate(int seqNum, String ColumnName, boolean setMin) {
		
		
		String resultDate = "";
		boolean checkParentDate = false;
		JsonObject jsonObject = new JsonObject();
		
		try {
			
			String selectQuery = "select * from archive_execution_governance_info where waveid=? order by seq_no";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, waveId);
			ResultSet rs = st.executeQuery();
			
			ArrayList<String> arrDate = new ArrayList<String>();
			ArrayList<Integer> arrLevel = new ArrayList<Integer>();
			ArrayList<Date> arrChildDate = new ArrayList<Date>();
		
		    SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			
			
			int rowIndex = seqNum-1;
		    while(rs.next()) {
		    	String startDateValue = rs.getString(ColumnName);
		    	int level = rs.getInt("level");
		    	arrDate.add(startDateValue);
		    	arrLevel.add(level);
		    }
		    
		    
		    for(int i = rowIndex; i >= 0; i--) {
		    	
		    	if(arrLevel.get(i) == 1) 
		    		break;
		    	else {
		    		if(!arrDate.get(i).equals(""))
		    		arrChildDate.add(simpleDateFormat.parse(arrDate.get(i)));
		    		
		    	}
		    }
		    
		    for(int j = rowIndex; j<arrDate.size(); j++) {
		    	
		    	if(arrLevel.get(j) == 1)
		    		break;
		    	else {
		    		if(!arrDate.get(j).equals(""))
		    		arrChildDate.add(simpleDateFormat.parse(arrDate.get(j)));
		    	}
		    }
		    if(setMin && !arrChildDate.isEmpty()) {
		    Date minDate = Collections.min(arrChildDate);
		    resultDate = simpleDateFormat.format(minDate);
		    
		    System.out.println("Minimum Date : "+simpleDateFormat.format(minDate));
		    }
		    else if(!arrChildDate.isEmpty()){
		    	Date maxDate = Collections.max(arrChildDate);
			    resultDate = simpleDateFormat.format(maxDate);
			    System.out.println("Minimum Date : "+simpleDateFormat.format(maxDate));
		    }
		    if(!resultDate.equals("") && !Value.equals(""))
		    if(simpleDateFormat.parse(resultDate).compareTo(simpleDateFormat.parse(Value)) == 0)
		    	checkParentDate = true;
		    
		    jsonObject.addProperty("ResultDate",resultDate);
		    jsonObject.addProperty("CheckParentDate", true);
		    
		    for(int i = rowIndex; i >= 0; i--) {
		    	
		    	if(arrLevel.get(i) == 1) {
		    		
		    		String UpdateQuery  = getDateQuery(ColumnName);
		    		PreparedStatement prestmt = con.prepareStatement(UpdateQuery);
		    		int s=(i+1);
			        prestmt.setString(1, resultDate);
			        prestmt.setString(2, waveId);
			        prestmt.setInt(3, s);
			        prestmt.execute();	    		
			    	break;
		    	}
		    }
		    
			/*
			 * for (Date date : arrChildDate) { System.out.println("Date " +
			 * simpleDateFormat.format(date)); }
			 */
		    
		}
		
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	public JsonObject checkInputType(String columnName, int seqNum) {
		
		JsonObject value = new JsonObject();
		switch (columnName) {
		
		case "planSrt":
			
		case "actSrt":
			
			value = updateParentStartDate(seqNum,columnName,true);
			break;
			
		case "planEnd":
		
		case "actEnd":
			value = updateParentStartDate(seqNum,columnName,false);
			break;
			
		}
		
		return value;
	}
	
	protected void finalize() throws Throwable 
    { 
		System.out.println("Db connection closed.");
        con.close();
    }	
}

package ArchiveExecutionModule.ArchiveExecutionDetails.service;

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

public class ArchiveExecutionSaveService {
    
	Connection con = null;
	public String Id = null;
	DBconnection dBconnection =null;
	public String ColumnName = "";
	public int SeqNo = 0;
	public String Value = "";
	static String qry;
	static String dateqry;
	static String columnName;
	public ArchiveExecutionSaveService(String Id,int SeqNo,String ColumnName,String Value) throws ClassNotFoundException, SQLException {
		
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.SeqNo = SeqNo;
		this.ColumnName = ColumnName;
		this.Value = Value;
	}
	public static String getQuery(String ColumnName)
	{
		switch(ColumnName)
		{
		case "taskType":
			qry="update archive_execution_info set taskType = ? where oppid=? and seq_No=?;";
			break;
		case "majorDependencies":
			qry="update archive_execution_info set majorDependencies = ? where oppid=? and seq_No=?;";
			break;
		case "assignedTo":
			qry="update archive_execution_info set assignedTo = ? where oppid=? and seq_No=?;";
			break;
		case "planSrt":
			qry="update archive_execution_info set planSrt = ? where oppid=? and seq_No=?;";
			break;
		case "planEnd":
			qry="update archive_execution_info set planEnd = ? where oppid=? and seq_No=?;";
			break;
		case "actSrt":
			qry="update archive_execution_info set actSrt = ? where oppid=? and seq_No=?;";
			break;
		case "actEnd":
			qry="update archive_execution_info set actEnd = ? where oppid=? and seq_No=?;";
			break;
		case "completion":
			qry="update archive_execution_info set completion = ? where oppid=? and seq_No=?;";
			break;
		case "status":
			qry="update archive_execution_info set status = ? where oppid=? and seq_No=?;";
			break;
		case "remark":
			qry="update archive_execution_info set remark = ? where oppid=? and seq_No=?;";
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
			dateqry="update archive_execution_info set planSrt = ? where oppid=? and seq_No=?;";
			break;
		case "planEnd":
			dateqry="update archive_execution_info set planEnd = ? where oppid=? and seq_No=?;";
			break;
		case "actSrt":
			dateqry="update archive_execution_info set actSrt = ? where oppid=? and seq_No=?;";
			break;
		case "actEnd":
			dateqry="update archive_execution_info set actEnd = ? where oppid=? and seq_No=?;";
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
			PreparedStatement pst1 = con.prepareStatement(UpdateQuery);
			pst1.setString(1, Value);
	    	pst1.setString(2, Id);
	    	pst1.setInt(3, SeqNo);
	    	pst1.execute();
			
			
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
			
			String selectQuery = "select * from archive_execution_info where oppid=? order by seq_no";
			PreparedStatement st1 = con.prepareStatement(selectQuery);
			st1.setString(1, Id);
			ResultSet rs = st1.executeQuery();
			
			
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
		    		int t=i+1;
		    		String UpdateQuery  = getDateQuery(ColumnName);
		    		PreparedStatement pst1 = con.prepareStatement(UpdateQuery);
					pst1.setString(1, resultDate);
			    	pst1.setString(2, Id);
			    	pst1.setInt(3, t);
			    	pst1.execute();
		    		
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
	
public JsonObject updateChildStartDate(int seqNum, String ColumnName, boolean setMin) {
		
		
		String resultDate = "";
		boolean checkParentDate = false;
		JsonObject jsonObject = new JsonObject();
		
		try {
			
			String selectQuery = "select * from archive_execution_info where oppid=? order by seq_no";
			PreparedStatement st1 = con.prepareStatement(selectQuery);
			st1.setString(1, Id);
			ResultSet rs = st1.executeQuery();
			
			
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
		    	
		    	if(arrLevel.get(i) == 2) 
		    		break;
		    	else {
		    		if(!arrDate.get(i).equals(""))
		    		arrChildDate.add(simpleDateFormat.parse(arrDate.get(i)));
		    		
		    	}
		    }
		    
		    for(int j = rowIndex; j<arrDate.size(); j++) {
		    	
		    	if(arrLevel.get(j) == 2)
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
		    	
		    	if(arrLevel.get(i) == 2) {
		    		int t=i+1;
		    		String UpdateQuery  = getDateQuery(ColumnName);
		    		PreparedStatement pst1 = con.prepareStatement(UpdateQuery);
					pst1.setString(1, resultDate);
			    	pst1.setString(2, Id);
			    	pst1.setInt(3, t);
			    	pst1.execute();
		    		
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
	
	public JsonObject checkInputType(String columnName, int seqNum) throws SQLException {
		
		JsonObject value = new JsonObject();
		int level=0;
		String selectQuery = "select * from archive_execution_info where oppid=? and seq_no=?";
		PreparedStatement st1 = con.prepareStatement(selectQuery);
		st1.setString(1, Id);
		st1.setInt(2, seqNum);
		ResultSet rs = st1.executeQuery();
		while(rs.next()) {
	    	String startDateValue = rs.getString(ColumnName);
	    	level = rs.getInt("level");
	        }
		String lvl=String.valueOf(level);
		switch (columnName) {
		
		case "planSrt":
			
		case "actSrt":
			if(lvl.equals("2")) 
			value=updateParentStartDate(seqNum,columnName,true);
			else
			value=updateChildStartDate(seqNum,columnName,true);
			value=updateParentStartDate(seqNum,columnName,true);
			break;
			
		case "planEnd":
		
		case "actEnd":
			if(lvl.equals("2")) 
				value=updateParentStartDate(seqNum,columnName,false);
			else
			value = updateChildStartDate(seqNum,columnName,false);
			value=updateParentStartDate(seqNum,columnName,false);
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

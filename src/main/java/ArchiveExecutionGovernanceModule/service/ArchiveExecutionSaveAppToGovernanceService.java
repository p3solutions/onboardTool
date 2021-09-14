package ArchiveExecutionGovernanceModule.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Date;

import com.google.gson.JsonObject;

import onboard.DBconnection;

public class ArchiveExecutionSaveAppToGovernanceService {

DBconnection dBconnection =null;
	
	public Connection con = null;
	
	private String Id = null;
	private int seqNo;
	private String columnName;
	private String value;
	private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");

	public ArchiveExecutionSaveAppToGovernanceService(String Id,int seqNo,String columnName,String value) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.Id = Id;
		this.seqNo = seqNo;
		this.columnName = columnName;
		this.value = value;
	}
	
	private boolean isArchiveImplementationNode() {
		boolean isArchiveParentNode = false;
		try {
			for(int i=seqNo;i>0;i--) {
			String selectQuery = "select * from Archive_Execution_info where oppId='"+Id+"' and seq_no ='"+i+"'";
			Statement st =con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next()) {
				if (rs.getInt("level")==1) {
					if(rs.getString("taskGroup").startsWith("Archive Implementation"))
						isArchiveParentNode = true;
					break;
				}
			}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return isArchiveParentNode; 
	}
	
	private String getAppName() {
		String appName = null;
		try {
			String selectQuery = "select * from opportunity_info where id='"+Id+"' and column_name='appName'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next()) {
			appName = rs.getString("value");	
			}
			st.close();
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return appName;
	}
	
	private String getWaveId() {
		String waveId = null;
		try {
			String appName = getAppName();
			String selectQuery = "select * from governance_info where column_name='apps' and value like'%"+appName+"%'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next()) {
			waveId = rs.getString("waveId");	
			}
			st.close();
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return waveId;
	}
	
	private int getNodeSeqNum(String waveId) {
		int seqNum = 0;
		try {
			String taskGroup = "";
			String taskName = "";
			String selectQuery = "select * from archive_execution_info where seq_no ="+seqNo+" and oppId='"+Id+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next()) {
			taskGroup = rs.getString("taskGroup");	
			taskName = rs.getString("taskName");
			}
			st.close();
			rs.close();
			
			String selectQuery1 = "select * from archive_execution_governance_info where taskGroup ='"+taskGroup+"' and taskName = '"+taskName+"' and  waveId='"+waveId+"'";
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(selectQuery1);
			if(rs1.next()) {
			seqNum = rs1.getInt("seq_no");
			}
			st1.close();
			rs1.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return seqNum;
	}
	
	public boolean saveArchivExecGovernance() {
		boolean statusFlag = false;
		try {
			String waveId = getWaveId();
			int seq = getNodeSeqNum(waveId);
			if(isArchiveImplementationNode()) {
				System.out.println("waveId : "+waveId+" seq_no : "+ seq);
				seq = getSeqNumArchiveImplentationNode(waveId);
				ArchiveExecutionSave(waveId,seq);
			}
			else {
				
				String apps[] = getGovernanceApps(waveId).split(",");
				String date = getComparedWithApps(waveId,seq,apps);
				value = date;
				System.out.println("date value: "+date);
				ArchiveExecutionSave(waveId,seq);
			}
			statusFlag = true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	return statusFlag;
	}
	
	private int getSeqNumArchiveImplentationNode(String waveId) {
		int seqNum = 0;
		try {
			String appName = getAppName();
			int childCount=0;
//			String taskGroup = "";
//			String taskName = "";
			for(int i=seqNo;i>0;i--) {
			String selectQuery = "select * from archive_execution_info where seq_no ="+i+" and oppId='"+Id+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next()) {
				int level = rs.getInt("level");
				if(level == 2)
					childCount++;
				else if(level ==1)
					break;		
			}
			rs.close();
			st.close();
			}
			
//			Statement st = con.createStatement();
//			ResultSet rs = st.executeQuery(selectQuery);
//			if(rs.next()) {
//			taskGroup = rs.getString("taskGroup");	
//			taskName = rs.getString("taskName");
//			}
//			st.close();
//			rs.close();
			seqNum += childCount;
			String selectQuery1 = "select * from archive_execution_governance_info where taskGroup like '%"+appName+"' and waveId='"+waveId+"'";
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery(selectQuery1);
			if(rs1.next()) {
			seqNum += rs1.getInt("seq_no");
			}
			st1.close();
			rs1.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return seqNum;
	}

	private String getComparedWithApps(String waveId, int seq,String[] apps) {
		String date = "";
		try {
			String taskGroup = "";
			String taskName = "";
			String selectQuery = "select * from archive_execution_info where seq_no ="+seqNo+" and oppId='"+Id+"'";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			if(rs.next()) {
			taskGroup = rs.getString("taskGroup");	
			taskName = rs.getString("taskName");
			}
			rs.close();
			st.close();
			
			ArrayList<Date> Date = new ArrayList<Date>();
			

			for (String app:apps) {
				
				Date date1 = getAppDate(app, taskGroup, taskName);
				
				System.out.println(((date1!=null&&!date1.equals(""))?simpleDateFormat.format(date1):""));
				if(date1!=null&&!date1.equals(""))
				Date.add(date1);
			    
			}
			
			date = getMinOrMaxDate(Date);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return date;
	}

	private String getMinOrMaxDate(ArrayList<Date> date2) {
		String date = "";
		try {
			if(!date2.isEmpty())
			switch(columnName) {
			case "planSrt":
			case "actSrt" :
				date = simpleDateFormat.format(Collections.min(date2));
				break;
			case "planEnd":
			case "actEnd":
				date = simpleDateFormat.format(Collections.max(date2));
				break;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return date;
	}

	private Date getAppDate(String app,String taskGroup, String taskName) {
		Date date = null;
		try {
			int seq_no = 0;
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
			
			String selectQuery = "select * from archive_execution_info where taskGroup = '"+taskGroup+"' and taskName = '"+taskName+"' and oppName= '"+app+"';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			
			if(rs.next()) {
				String rs_date = rs.getString(columnName);
				if(!rs_date.equals("")&&rs_date!=null)
				date = simpleDateFormat.parse(rs_date);
				seq_no = rs.getInt(1);
			}			
			rs.close();
			st.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return date;
	}
	private String getGovernanceApps(String waveId) {
		String apps="";
		try {
		String selectQuery1 = "select * from governance_info where column_name ='apps' and  waveId='"+waveId+"'";
		Statement st1 = con.createStatement();
		ResultSet rs1 = st1.executeQuery(selectQuery1);
		if(rs1.next()) {
		apps = rs1.getString("value");
		}
		st1.close();
		rs1.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return apps;
	}

	public JsonObject ArchiveExecutionSave(String waveId,int seq)
	{
		JsonObject jsonObject = new JsonObject();
		boolean checkSave = false;
		try
		{
			
			String UpdateQuery  = "update archive_execution_governance_info set "+columnName+" = '"+value+"' where waveid='"+waveId+"' and seq_No='"+seq+"';";
		    Statement st = con.createStatement();
		    st.executeUpdate(UpdateQuery);
			st.close();
			
			jsonObject = checkInputType(columnName, seq,waveId);
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
	
	public JsonObject updateParentStartDate(int seqNum, String ColumnName, boolean setMin,String waveId) {	
		String resultDate = "";
		boolean checkParentDate = false;
		JsonObject jsonObject = new JsonObject();
		
		try {
			
			String selectQuery = "select * from archive_execution_governance_info where waveid='"+waveId+"' order by seq_no";
			Statement st1 = con.createStatement();
			ResultSet rs = st1.executeQuery(selectQuery);
			
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
		    if(!resultDate.equals("") && !value.equals(""))
		    if(simpleDateFormat.parse(resultDate).compareTo(simpleDateFormat.parse(value)) == 0)
		    	checkParentDate = true;
		    
		    jsonObject.addProperty("ResultDate",resultDate);
		    jsonObject.addProperty("CheckParentDate", true);
		    
		    for(int i = rowIndex; i >= 0; i--) {
		    	
		    	if(arrLevel.get(i) == 1) {
		    		String UpdateQuery  = "update archive_execution_governance_info set "+ColumnName+" = '"+resultDate+"' where waveid='"+waveId+"' and seq_No='"+(i+1)+"';";
			    	Statement st3 = con.createStatement();
			    	st3.executeUpdate(UpdateQuery);
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
	
	public JsonObject checkInputType(String columnName, int seqNum, String waveId) {
		
		JsonObject value = new JsonObject();
		switch (columnName) {
		
		case "planSrt":
			
		case "actSrt":
			
			value = updateParentStartDate(seqNum,columnName,true,waveId);
			
			break;
			
		case "planEnd":
		
		case "actEnd":
			
			value = updateParentStartDate(seqNum,columnName,false,waveId);
			
			break;
			
		}
		
		return value;
	}
	
	protected void finalize() throws Throwable {
	     con.close();
    }
}
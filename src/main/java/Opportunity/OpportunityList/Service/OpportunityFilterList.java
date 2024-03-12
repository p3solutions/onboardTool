package Opportunity.OpportunityList.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Opportunity.OpportunityList.Servlet.OpportunityListServlet;
import onboard.DBconnection;
import logger.System;

public class OpportunityFilterList {

	DBconnection dBconnection ;
	Connection connection;
	String category;
	String phaseName;
	String waveName;
	
	public OpportunityFilterList(String category,String phaseName,String waveName) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		connection = (Connection) dBconnection.getConnection();
		this.category = category;
		this.phaseName = phaseName;
		this.waveName = waveName;
	}
	
	public OpportunityFilterList() throws ClassNotFoundException, SQLException
	{
		dBconnection = new DBconnection();
		connection = (Connection) dBconnection.getConnection();
	}
	
	public JsonArray getAppListBySearch(String appName)
	{
		JsonArray jsonArray = new JsonArray();
		try {
			String selectApps = "select * from opportunity_info where column_name='appName' and value like ?;";
			PreparedStatement st = connection.prepareStatement(selectApps);
			st.setString(1,"%"+appName+"%");
			ResultSet rs = st.executeQuery();
			
			
			while(rs.next())
			{
				  JsonObject jsonObject = new JsonObject();
				  String app = rs.getString("value");
				  jsonObject.addProperty("OpportunityName", app);
				  jsonObject.addProperty("OpportunityId",rs.getString("Id"));
				  jsonObject.addProperty("CheckWave",new OpportunityListService().checkOpportunityWave(app));
				  jsonArray.add(jsonObject);
			}
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	public JsonArray getAppList()
	{
		JsonArray jsonArray  = new JsonArray();
		try
		{
			if(!waveName.equals("All"))
				jsonArray = getAppListByWave(jsonArray,waveName);
			else if(!phaseName.equals("All"))
				jsonArray = getAppListByPhase();
			else 
			    jsonArray = getAllAppListWithorWithoutCategory();
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	private JsonArray getAllAppListWithorWithoutCategory()
	{	PreparedStatement st=null;
		ResultSet rs=null;
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectAppList = "select * from opportunity_info where column_name='appName';";
			st = connection.prepareStatement(selectAppList);
			rs = st.executeQuery();
			
			while(rs.next())
			{
				String appName = rs.getString("value");
				JsonObject jsonObject = getAppInfo(appName);
				if(jsonObject!=null)
					jsonArray.add(jsonObject);
			}
			
			st.close();
			rs.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	public JsonArray getAppListByPhase()
	{
		JsonArray jsonArray  = new JsonArray();
		try
		{
			String selectWaves = "select * from phase_info where column_name='waves' and phaseName=?;";
		    PreparedStatement st  =connection.prepareStatement(selectWaves);
		    st.setString(1,phaseName);
		    ResultSet rs = st.executeQuery();
			
		    
		    
		    while(rs.next())
		    {
		    	String waves[] = rs.getString("value").split(",");
		    	for(String wave:waves)
		    	{
		    		getAppListByWave(jsonArray,wave);
		    	}
		    }
		    rs.close();
		    st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	public JsonArray getAppListByWave(JsonArray jsonArray,String wave)
	{
		
		try
		{
			String selectApps = "select * from governance_info where column_name='apps' and waveName=?;";
		    PreparedStatement st = connection.prepareStatement(selectApps);
		    st.setString(1,wave);
			ResultSet rs = st.executeQuery();
			
			
			
		    while(rs.next())
		    {
		    	String apps[] = rs.getString("value").split(",");
		    	for(String app:apps) {
						JsonObject jsonObject = getAppInfo(app);
						if(jsonObject!=null)
							jsonArray.add(jsonObject);
		    	}
		    }
		    rs.close();
		    st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonArray;
	}
	
	public JsonObject getAppInfo(String app)
	{
		JsonObject jsonObject = null;
		try
		{
			String selectApp ="select * from opportunity_info where column_name='appName' and value =?;"; 
			PreparedStatement st = connection.prepareStatement(selectApp);
			st.setString(1,app);
			ResultSet rs = st.executeQuery();
		    	
		   
			
			if(rs.next())
			{
				if(getCategoryInfo(rs.getString("Id"))) {
					jsonObject = new JsonObject();
			  jsonObject.addProperty("OpportunityName",app );
			  jsonObject.addProperty("OpportunityId",rs.getString("Id"));
			  jsonObject.addProperty("CheckWave",new OpportunityListService().checkOpportunityWave(app));
			}
			}
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	private boolean  getAppCategoryInfo(String moduleName,String oppId)
	{
		
		boolean checkCurrentPhase = true;
		try
		{
			
			if(!moduleName.equals("Archive_ Requirment")&&!moduleName.equals("Decomm_Requirement")&&!moduleName.equals("Triage")&&!moduleName.equals("Assessment")) {
				
				String selectQuery = "select * from module_approval_info where moduleName = ? and OppId = ?";
				PreparedStatement st1=connection.prepareStatement(selectQuery);
				st1.setString(1,moduleName);
				st1.setString(2,oppId);
				ResultSet rs1 = st1.executeQuery();
				
				if(rs1.next()) {
					if(rs1.getBoolean(4))
						checkCurrentPhase = false;
				}
				rs1.close();
				st1.close();
			}
			else if(moduleName.equals("Archive_ Requirment")&&moduleName.equals("Decomm_Requirement")) {
				
				String selectQuery1 = "select * from opportunity_info where Id = ? and column_name = 'request_type';";
				PreparedStatement st2=connection.prepareStatement(selectQuery1);
				st2.setString(1,oppId);
				ResultSet rs2 = st2.executeQuery();
				
				if(rs2.next())
					checkCurrentPhase = getReqApproval(rs2.getString("value"), oppId);
			     rs2.close();
			     st2.close();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return checkCurrentPhase;
	}
	private boolean getReqApproval(String reqType, String oppId) {
		
		boolean checkPhase = true;
		try {
			
			switch(reqType) {
			
			case "Archive":
				checkPhase = getReqInfo("Archive_Requirement", oppId);
				break;
				
			case "Decommission":
				checkPhase = getReqInfo("Decomm_Requirement", oppId);
				break;
				
			case "Archive+Decommission":
				if(!getReqInfo("Archive_Requirement", oppId) && !getReqInfo("Decomm_Requirement", oppId)) 
					checkPhase = false;
				
				break;
			
			
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return checkPhase;
	}
	private boolean getReqInfo(String phaseName, String oppId) {
		
		boolean checkPhase = true;
		try {
			String selectQuery = "select * from module_approval_info where moduleName = ? and OppId = ?";
			PreparedStatement st=connection.prepareStatement(selectQuery);
			st.setString(1,phaseName);
			st.setString(2,oppId);
			ResultSet rs = st.executeQuery();
		
			if(rs.next())
				if(rs.getBoolean(4))
					checkPhase = false;
			rs.close();
			st.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return checkPhase;
	}
	 
	private boolean getCategoryInfo(String id)
	{
		boolean statusFlag = false; 
		switch(category)
		{
		case "All":
			statusFlag =true;
			break;
		case "Intake":
		case "Archive_Requirement":
		case "Decomm_Requirement":
		case "ArchiveExecution":
		case "DecommissionExecution":
			statusFlag = getModuleInfo(id);
			break;
		case "Triage":
		case "Assessment":
			statusFlag = getSectionInfo(id,getTableInfo());
			break;
			
		case "Closure":
			statusFlag = getClosureInfo(id);
			break;
		}
		
		return statusFlag;
	}
	
	private boolean getClosureInfo(String id)
	{
		boolean statusFlag = true;
		try
		{
			String selectQuery ="select * from archive_execution_info where oppid=? and level = 1  order by seq_no";
			PreparedStatement st = connection.prepareStatement(selectQuery);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			
			
			
			while(rs.next())
			{
				if(rs.getString("plansrt").equals("")&&rs.getString("planEnd").equals("")&&rs.getString("actsrt").equals("")&&rs.getString("actEnd").equals(""))
					statusFlag = false;
			}
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return statusFlag;
	}
	private boolean getModuleInfo(String id)
	{
		boolean statusFlag = false;
		try
		{
			boolean moduleFlag = true;
			String modules="Intake,"+getRequirements(id)+"ArchiveExecution,DecommissionExecution";
			String[] moduleArray =modules.split(",");
			for(String module:moduleArray)
			{
				
			 String selectQuery = "select * from module_approval_info where oppid=? and moduleName=?;";
			 PreparedStatement st = connection.prepareStatement(selectQuery);
			 st.setString(1,id);
			 st.setString(2,module);
			 ResultSet rs = st.executeQuery();
			 
			
			 
			 if(rs.next()) {
				 if(category.equals(module))
				statusFlag = !Boolean. parseBoolean(rs.getString("overAllApproval"));
				 else 
				moduleFlag = Boolean. parseBoolean(rs.getString("overAllApproval"));
			 }
			 else {
				 if(!category.equals(module))
				 statusFlag = false;
				 else if(moduleFlag)
				 statusFlag = true;
				 else 
				 statusFlag =false;
				 break;
			 }
			 
			 if(category.equals(module))
				 break;
			 rs.close();
			 st.close();
			 
			}
			
			
			
				
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return statusFlag;
	}
	
	private LinkedHashMap<String,String> getTableInfo()
	{
		LinkedHashMap<String,String> tables = new LinkedHashMap<String, String>();
		switch(category)
		{
		case "Triage":
			
			tables.put("opportunity_info","appName");
			tables.put("Triage_info","Decom_date");
			break;
		case "Assessment":
			tables.put("Triage_info","Decom_date");
			tables.put("Assessment_application_info","AssessAppPlatform");
			break;
		}
		
		return tables;
	}
	private boolean getSectionInfo(String id,LinkedHashMap<String,String> tables)
	{
		boolean statusFlag =false;
		try
		{
			int count =0;
		    boolean valueFlag =false;
			for (Map.Entry<String, String> entry : tables.entrySet()) {
			    String tableName = entry.getKey();
			    String columnName = entry.getValue();
			    count++;
			    String selectQuery ="select * from "+tableName+" where column_name=? and id=?; ";
			    PreparedStatement st = connection.prepareStatement(selectQuery);
			    st.setString(1,columnName);
			    st.setString(2,id);
			    ResultSet rs = st.executeQuery();
			    
			   
			    
			  
			    if(rs.next()) {
			     if(count==1&&!rs.getString("value").equals(""))
				  valueFlag = true;
		         else if(count==2&&rs.getString("value").equals("")&&valueFlag)
		          statusFlag = true;
			    }
			    else if(count==2&&valueFlag) {
			    	statusFlag = true;
			    }
			    rs.close();
			    st.close();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return statusFlag;
	}
	
	private String getRequirements(String id)
	{
		String requirements = "";
		try
		{
			String selectQuery ="select * from opportunity_info where id=? and column_name='request_type'";
			PreparedStatement st = connection.prepareStatement(selectQuery);
			st.setString(1,id);
			ResultSet rs = st.executeQuery();
			
			
			
		
			if(rs.next())
			{
				String value = rs.getString("value");
				if(value.equals("Archive"))
				requirements= "Archive_Requirement,";
				else if(value.equals("Decommission"))
				requirements = "Decomm_Requirement,";
				else if(value.equals("Archive+Decommission"))
				requirements ="Archive_Requirement,Decomm_Requirement,";
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return requirements;
	}
	protected void finalize() throws Throwable {
	connection.close();
	}
	
	
}

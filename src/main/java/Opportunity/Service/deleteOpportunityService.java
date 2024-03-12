package Opportunity.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;
import java.sql.PreparedStatement;

import onboard.DBconnection;
import logger.System;

public class deleteOpportunityService {

	String Id;
	DBconnection dBconnection;
	Connection con;
	String Name;
	String deleteType;
	boolean includeAll;
	JsonArray waveArray = new JsonArray();	
	JsonArray appArray = new JsonArray();	
	

	public deleteOpportunityService(String Id,String Name, String deleteType, boolean includeAll) throws ClassNotFoundException, SQLException {
	 this.Id = Id;
	 this.Name = Name;
	 this.deleteType = deleteType;
	 this.includeAll = includeAll;
	 
	 dBconnection = new DBconnection();
	 con = (Connection) dBconnection.getConnection();
	}
	
	public JsonObject deleteService()
	{
		JsonObject jsonObject = new JsonObject();
		boolean statusFlag =false;
		try
		{
			
			switch(deleteType)
			{
			
			case "Phase":
			    	
			    if(includeAll)
			    	statusFlag = deleteDependency();
			    statusFlag = delete("Phase",getPhaseTableNames(),Id);
				break;
			
			case "Wave":
				
				if(includeAll)
			    	statusFlag = deleteDependency();
				statusFlag = delete("Wave",getWaveTableNames(),Id);	
				deleteFromPhase(Name);
				break;
			
			case "Application":
				statusFlag = delete("Application",getAppTableNames(),Id);
               deleteFromWave(Name);				
				break;
				
			}
			statusFlag = true;
			jsonObject.add("waves", waveArray);
			jsonObject.add("apps",appArray);
			jsonObject.addProperty("deleteStatus",statusFlag);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return jsonObject;
	}
	
	
	public boolean delete(String category,LinkedHashMap<String, String> tableNames,String id)
	{
		boolean deleteFlag = false;
		try
		{
			Set entrySet = tableNames.entrySet();
			Iterator it = entrySet.iterator();     
			while(it.hasNext())
			{
				Map.Entry obj = (Map.Entry)it.next();
			String deleteQuery = "delete from "+obj.getKey()+" where "+obj.getValue()+"=?";
			PreparedStatement st = con.prepareStatement(deleteQuery);
			st.setString(1,id);
			int num_rows=st.executeUpdate();
			System.out.println(obj.getKey()+" "+num_rows+" rows deleted.");
			st.close();
			
			}
			deleteFlag = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return deleteFlag;
	}
	
	private LinkedHashMap<String,String> getTableNames(String categoryName)
	{ 
		LinkedHashMap<String,String> tableNames = new LinkedHashMap<String,String>();
		try
		{
			switch(categoryName) {
			
			case "Phase" :
				tableNames = getPhaseTableNames();
				break;
				
			case "Wave" :
				tableNames = getWaveTableNames();
				break;
			
			case "Application" :
				tableNames = getAppTableNames();
				break;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return tableNames;
	}
	
	
	private LinkedHashMap<String,String> getAppTableNames()
	{ 
		LinkedHashMap<String,String> tableNames = new LinkedHashMap<String,String>();
		try
		{
			//intake module
			tableNames.put("opportunity_info","Id");
			tableNames.put("triage_info","Id");
			tableNames.put("triage_summary_info","Id");
			tableNames.put("assessment_application_info","Id");
			tableNames.put("assessment_archival_consumption_info","Id");
			tableNames.put("assessment_compliance_char_info","Id");
			tableNames.put("assessment_contract_info","Id");
			tableNames.put("assessment_data_char_info","Id");
			tableNames.put("intake_stake_holder_info","OppId");
			
			//module approval table
			tableNames.put("module_approval_info","OppId");
			
			//archive execution module
			tableNames.put("archive_execution_info","oppId");
			
			//archive requirement module
			tableNames.put("archiveintro_info","oppId");
			tableNames.put("archivereq_roles_info","oppId");
			tableNames.put("archivereq_legacyapp_info","Id");
			tableNames.put("Archive_Environment_Name_Info","OppId");
			tableNames.put("Archive_Environment_ServerIp_Info","OppId");
			tableNames.put("Archive_Retention_Info","OppId");
			tableNames.put("Archive_Retention_Content_Info","OppId");
			tableNames.put("ArchiveBussinessReq_Info","OppId");
			
			tableNames.put("BusinessReqinscope_Info","OppId");
			tableNames.put("Archive_DataReq_Info","OppId");
			tableNames.put("Archive_RetentionLegalReq_Info","OppId");
			tableNames.put("Archive_SecurityReq_Info","OppId");
			tableNames.put("Archive_UsabilityReq_Info","OppId");
			tableNames.put("Archive_AuditReq_Info","OppId");
			tableNames.put("Archive_ScreenReq_Info","OppId");
			tableNames.put("Archive_ScreenReq_SearchForm","OppId");
			tableNames.put("Archive_DocumentRevision_Info","OppId");
			tableNames.put("Archive_Req_Addendum_Info","OppId");
			tableNames.put("ArchiveRequirements_Stake_Holder_Info", "OppId");



		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return tableNames;
	}
	private LinkedHashMap<String,String> getPhaseTableNames()
	{ 
		LinkedHashMap<String,String> tableNames = new LinkedHashMap<String,String>();
		try
		{
			//phase
			tableNames.put("phase_info","phaseId");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return tableNames;
	}
	
	private LinkedHashMap<String,String> getWaveTableNames()
	{ 
		LinkedHashMap<String,String> tableNames = new LinkedHashMap<String,String>();
		try
		{
			//wave
			tableNames.put("governance_info","waveId");
			tableNames.put("archive_execution_governance_info", "waveId");
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return tableNames;
	}
	
	private String getAppName()
	{
		String appName = "";
		
		try
		{
			String selectQuery = "select * from opportunity_info where id=? and column_name='appName'";
			PreparedStatement st = con.prepareStatement(selectQuery);
			 st.setString(1, Id);
			 ResultSet rs = st.executeQuery();  
						
			if(rs.next())
				appName = rs.getString("value");
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return appName;
	}
	
	private boolean deleteFromWave(String appName)
	{
		boolean statusFlag = false;
		try
		{
			String selectQuery ="select * from governance_info where column_name='apps' and value like ?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			 st.setString(1, "%" + appName + "%");
			 ResultSet rs = st.executeQuery();  
			if(rs.next())
			{
				String waveId = rs.getString("waveId");
				String apps = rs.getString("value");
				String appArr[] =apps.split(",");
				String newApps = "";
				for(String app:appArr)
					if(!app.equals(appName))
					newApps+=app+",";
				
				if(!newApps.equals(""))
					newApps = newApps.substring(0,newApps.length()-1);
				
				String updateQuery ="update governance_info set value=? where column_name='apps' and waveId=?";
				 PreparedStatement st1 = con.prepareStatement(updateQuery);
				 st1.setString(1, newApps);
				 st1.setString(2, waveId);
		         st1.execute();
		         st1.close();
				
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
	
	private boolean deleteFromPhase(String waveName)
	{
		boolean statusFlag = false;
		try
		{
			String selectQuery ="select * from phase_info where column_name='waves' and value like ?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			 st.setString(1, "%" + waveName + "%");
			 ResultSet rs = st.executeQuery();  
			if(rs.next())
			{
				String phaseId = rs.getString("phaseId");
				String waves = rs.getString("value");
				String waveArr[] =waves.split(",");
				String newWaves = "";
				for(String wave:waveArr)
					if(!wave.equals(waveName))
						newWaves += wave+",";
				
				if(!newWaves.equals(""))
					newWaves = newWaves.substring(0,newWaves.length()-1);
				
				String updateQuery ="update phase_info set value=? where column_name='waves' and phaseId=?";
				PreparedStatement st1 = con.prepareStatement(updateQuery);
				 st1.setString(1, newWaves);
				 st1.setString(2, phaseId);
		         st1.execute();
		         st1.close();
				
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
	
	private boolean deleteDependency()
	{
		boolean statusFlag =  false;
		try
		{
			if(deleteType.equals("Phase"))
			{	
			String selectQuery="select * from phase_info where column_name ='waves' and phaseId=?";
			 PreparedStatement st = con.prepareStatement(selectQuery);
			 st.setString(1, Id);
			 ResultSet rs = st.executeQuery();  
			if(rs.next())
			{
				String[] waves = rs.getString("value").split(",");
				for(String wave: waves)
				  deleteWaves(wave);
			}
			rs.close();
			st.close();
			
			
			}
			else if(deleteType.equals("Wave"))
			
				deleteWaves(Name);
			
			statusFlag = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return statusFlag;
	}
	
	private boolean deleteWaves(String waveName)
	{
		boolean statusFlag = false;
		try
		{String selectApps ="select * from governance_info where column_name='apps' and waveName = ?;";
		 PreparedStatement st1 = con.prepareStatement(selectApps);
		  st1.setString(1, waveName);
		  ResultSet rs1 = st1.executeQuery();  
		  if(rs1.next())
		  {
			  String waveId = rs1.getString("waveId");
              waveArray.add(rs1.getString("waveName"));
			  String[] apps =rs1.getString("value").split(",");
			  delete("Wave", getWaveTableNames(), waveId);
			  statusFlag = deleteApps(apps);
		  }
		  rs1.close();
		  st1.close();
		  statusFlag =true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return statusFlag;
	}
	private boolean deleteApps(String apps[])
	{
		boolean statusFlag = false;
		try
		{
			for(String app:apps)
			  {
			  String selectApplication ="select * from opportunity_info where column_name='appName' and value= ?;";
			  PreparedStatement st2 = con.prepareStatement(selectApplication);
  			  st2.setString(1, app);
  			  ResultSet rs2 = st2.executeQuery();
			  while(rs2.next())
			  {
				  String appId = rs2.getString("id");
				 appArray.add(rs2.getString("value"));
				  delete("Application", getAppTableNames(),appId);
			  }
			  rs2.close();
			  st2.close();
			  }
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return statusFlag;
	}
	protected void finalize() throws Throwable {
	 con.close();
	}
}

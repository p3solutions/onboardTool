package governance.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import Opportunity.OpportunityList.Service.OpportunityListService;
import onboard.DBconnection;
import logger.System;
public class selectListService {
	DBconnection dBconnection;
	Connection con;
	String categoryName;
	String phaseName;
	String waveName;
	String applicationName;
	boolean searchByApp;
	public selectListService(String categoryName,String phaseName, String waveName,String applicationName,boolean searchByApp) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.categoryName = categoryName;
		this.phaseName =  phaseName;
		this.waveName = waveName;
		this.applicationName = applicationName;
		this.searchByApp = searchByApp;
	}
	public JsonArray getList()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			switch(categoryName)
			{
			case "Phase":
				jsonArray = getPhaseList();
				break;
			case "Wave":
				jsonArray = getWaveList();
				break;
			case "Application":
				jsonArray = getApplicationList();
				break;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	public JsonArray getPhaseList()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			if(!phaseName.equals("All"))
			{
				jsonArray=getPhase(phaseName);
			}
			else if(!waveName.equals("All"))
			{
				jsonArray = getPhaseFromWave(waveName);
			}
			else if(!applicationName.equals("All"))
			{
				jsonArray = getPhaseFromApplication(applicationName);
			}
			else if(phaseName.equals("All"))
			{
				jsonArray = getAllPhase();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	public JsonArray getAllPhase()
	{
		JsonArray jsonArray = new JsonArray(); 
		try
		{	PreparedStatement st=null;
		ResultSet rs=null;
		String selectPhase= "select * from phase_info where column_name='phaseName';";
		st = con.prepareStatement(selectPhase);
		rs = st.executeQuery();
		while(rs.next())
		{
			JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("phaseName",rs.getString("phaseName"));
			jsonObject.addProperty("phaseId",rs.getString("phaseId"));
			jsonObject.addProperty("apps", new phaseListService("all").getPhaseApps(rs.getString("phaseName")));
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
	public JsonArray getPhaseFromApplication(String app)
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectPhase = "select * from governance_info where column_name='apps' and value like ?;";
			PreparedStatement st = con.prepareStatement(selectPhase);
			String s="%"+app+"%";
			st.setString(1, s);
			ResultSet rs = st.executeQuery();
			if(!searchByApp)
			{
				if(rs.next())
					jsonArray = getPhaseFromWave(rs.getString("waveName"));
			}
			else
				while(rs.next())
					jsonArray .addAll( getPhaseFromWave(rs.getString("waveName")));
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	public JsonArray getPhaseFromWave(String wave)
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectPhase = "select * from phase_info where column_name='waves' and value like ?;";
			PreparedStatement st = con.prepareStatement(selectPhase);
			String s="%"+wave+"%";
			st.setString(1, s);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("phaseName",rs.getString("phaseName"));
				jsonObject.addProperty("phaseId",rs.getString("phaseId"));
				jsonObject.addProperty("apps", new phaseListService("all").getPhaseApps(rs.getString("phaseName")));
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
	public JsonArray getPhase(String phase)
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			String selectPhase = "select * from phase_info where column_name='phaseName' and value=?;";
			PreparedStatement st = con.prepareStatement(selectPhase);
			st.setString(1,phase);
			ResultSet rs = st.executeQuery();
			if(rs.next())
			{
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("phaseName",rs.getString("phaseName"));
				jsonObject.addProperty("phaseId",rs.getString("phaseId"));
				jsonObject.addProperty("apps", new phaseListService("all").getPhaseApps(rs.getString("phaseName")));
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
	public JsonArray getWaveList()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{	PreparedStatement st=null;
		ResultSet rs=null;
		String selectWaves = "select * from governance_info where column_name='waveName';";
		st = con.prepareStatement(selectWaves);
		rs = st.executeQuery();
		while(rs.next())
		{
			String wave = rs.getString("value");
			if(checkPhaseList(wave))
			{
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("WaveId",rs.getString("waveId"));
				jsonObject.addProperty("WaveName",rs.getString("waveName"));
				jsonArray.add(jsonObject);
			}
			if(phaseName.equals("none"))
			{
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("WaveId",rs.getString("waveId"));
				jsonObject.addProperty("WaveName",rs.getString("waveName"));
				jsonArray.add(jsonObject);
			}
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
	public boolean checkPhaseList(String wave)
	{
		boolean checkFlag = false;
		try
		{
			String selectPhase = "select * from phase_info where phaseName = ? and column_name='waves' and value like ?;";
			PreparedStatement st = con.prepareStatement(selectPhase);
			String s="%"+wave+"%";
			st.setString(1,phaseName);
			st.setString(2,s);
			ResultSet rs = st.executeQuery();
			if(rs.next())
				checkFlag = true;
			rs.close();
			st.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return checkFlag;
	}
	public JsonArray getApplicationList()
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			if(phaseName.equals("none")&&waveName.equals("none"))
			{
				jsonArray = OpportunityListService.OpportunityListDetails("all");
			}
			else if(!phaseName.equals("none")&&waveName.equals("none"))
			{
				JsonArray jsonArray1 = new JsonArray();
				jsonArray.add(new JsonArray());
				String selectPhases = "select * from phase_info where phaseName=? and column_name='waves';";
				PreparedStatement st = con.prepareStatement(selectPhases);
				st.setString(1,phaseName);
				ResultSet rs = st.executeQuery();
				if(rs.next())
				{
					String waves[] = rs.getString("value").split(",");
					for(String wave : waves)
					{
						String selectApps = "select * from governance_info where column_name='apps' and waveName=?;";
						PreparedStatement st1 = con.prepareStatement(selectApps);
						st1.setString(1,wave);
						ResultSet rs1 = st1.executeQuery();
						if(rs1.next())
						{
							String[] apps = rs1.getString("value").split(",");
							for(String app : apps)
							{
								String selectApp = "select * from opportunity_info where column_name='appName' and value=?;";
								PreparedStatement st2 = con.prepareStatement(selectApp); 
								st2.setString(1,app);
								ResultSet rs2 = st2.executeQuery();
								if(rs2.next())
								{
									JsonObject jsonObject = new JsonObject();
									jsonObject.addProperty("OpportunityId",rs2.getString("Id"));
									jsonObject.addProperty("OpportunityName",app);
									jsonObject.addProperty("CheckWave",new OpportunityListService().checkOpportunityWave(app));
									jsonArray1.add(jsonObject);
								}
								rs2.close();
								st2.close();
							}
						}
						rs1.close();
						st1.close();
					}
				}
				st.close();
				rs.close();
				jsonArray.add(jsonArray1);
			}
			else if(!phaseName.equals("none")&&!waveName.equals("none")||phaseName.equals("none")&&!waveName.equals("none"))
			{
				JsonArray jsonArray1 = new JsonArray();
				jsonArray.add(new JsonArray());
				String selectApps = "select * from governance_info where column_name='apps' and waveName=?;";
				PreparedStatement st1 = con.prepareStatement(selectApps);
				st1.setString(1,waveName);
				ResultSet rs1 = st1.executeQuery();
				if(rs1.next())
				{
					String[] apps = rs1.getString("value").split(",");
					for(String app : apps)
					{
						String selectApp = "select * from opportunity_info where column_name='appName' and value=?;";
						PreparedStatement st2 = con.prepareStatement(selectApp);
						st2.setString(1,app);
						ResultSet rs2 = st2.executeQuery();
						if(rs2.next())
						{
							JsonObject jsonObject = new JsonObject();
							jsonObject.addProperty("OpportunityId",rs2.getString("Id"));
							jsonObject.addProperty("OpportunityName",app);
							jsonObject.addProperty("CheckWave",new OpportunityListService().checkOpportunityWave(app));
							jsonArray1.add(jsonObject);
						}
						rs2.close();
						st2.close();
					}
				}
				rs1.close();
				st1.close();
				jsonArray.add(jsonArray1);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	protected void finalize() throws Throwable {
		con.close();
	}
}
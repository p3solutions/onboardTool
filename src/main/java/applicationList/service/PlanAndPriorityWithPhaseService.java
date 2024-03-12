package applicationList.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.internal.bind.JsonAdapterAnnotationTypeAdapterFactory;

import Opportunity.OpportunityList.Service.OpportunityDropdownOptions;
import onboard.DBconnection;
import logger.System;

public class PlanAndPriorityWithPhaseService {
	List<String> mainList = new LinkedList<String>();
	DBconnection dBconnection = null;
	Connection con = null;

	public PlanAndPriorityWithPhaseService() throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
	}

	public JsonArray GetAppWithPhaseWave(String phaseFilter, String waveFilter) {
		JsonArray jsonArray = new JsonArray();
		ArrayList<String> waves = new ArrayList<String>();
		PreparedStatement st=null;
		ResultSet rs=null;
		try {
			if(phaseFilter.equals("All")) {
				String selectPhases = "select * from phase_info";
				st = con.prepareStatement(selectPhases);
				rs = st.executeQuery();
				while (rs.next()) {
					if (rs.getString("column_name").equals("waves")) {
						if (rs.getString("value").isEmpty() == false) {
							String waveArray[] = rs.getString("value").split(",");
							for (String string : waveArray) {
								waves.add(string);
							}
						}
					}
				}
				String[] allWave = new String[waves.size()];
				allWave = waves.toArray(allWave);
				jsonArray = (getArchiveReqWaveDetails(allWave, waveFilter));
				rs.close();
				st.close();
			}
			if(!phaseFilter.equals("All")) {
				String selectPhases = "select * from phase_info where phaseName like ?";
				st = con.prepareStatement(selectPhases);
				st.setString(1, "%"+phaseFilter+"%");
				rs = st.executeQuery();
				while (rs.next()) {
					if (rs.getString("column_name").equals("waves")) {
						if (rs.getString("value").isEmpty() == false) {
							String waveArray[] = rs.getString("value").split(",");
							for (String string : waveArray) {
								waves.add(string);
							}
						}
					}
				}
				String[] allWave = new String[waves.size()];
				allWave = waves.toArray(allWave);
				jsonArray = (getArchiveReqWaveDetails(allWave, waveFilter));
				rs.close();
				st.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}

	private JsonArray getArchiveReqWaveDetails(String[] waves, String wavestatus) {
		JsonArray jsonArray = new JsonArray();
		ArrayList<String> allappsList = new ArrayList<String>();
		String apps[] = {};
		String[] allapp = {};
		try {
			if (wavestatus.equals("All")) {
				for (String wave : waves) {
					String selectWaves = "select * from governance_info where waveName=?";
					PreparedStatement st = con.prepareStatement(selectWaves);
					st.setString(1, wave);
					ResultSet rs = st.executeQuery();
					while (rs.next()) {
						if (rs.getString("column_name").equals("apps")) {
							if (rs.getString("value").isEmpty() == false) {
								apps = rs.getString("value").split(",");
								System.out.println("app length: " + apps.length);
								for (String string : apps) {
									allappsList.add(string);
								}
							}
						}
					}
					System.out.println("All apps: " + allappsList);
					allapp = new String[allappsList.size()];
					allapp = allappsList.toArray(allapp);
					rs.close();
					st.close();
				}
				if (allapp.length > 0) {
					jsonArray = getApplicationApprovalDataTable(allapp);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}

	private JsonArray getApplicationApprovalDataTable(String[] apps) {
		JsonArray jsonArray = new JsonArray();
		int i = 0;
		try {
			List<String> list = getphasewaveinfo("All");
			for (String app : apps) {
				JsonObject jsonObject = new JsonObject();
				String selectApp = "select distinct Id from opportunity_info  where column_name='appName' and value = ?";
				PreparedStatement st = con.prepareStatement(selectApp);
				st.setString(1, app);
				ResultSet rs = st.executeQuery();
				while (rs.next()) {
					for (String value : list) {
						if (value.equals(app)) {
							i++;
							continue;
						}
						if (i == 1) {
							jsonObject.addProperty("phaseName", value);
							i++;
							continue;
						}
						if (i == 2) {
							jsonObject.addProperty("waveName", value);
							i++;
						}
						if (i == 3) {
							i = 0;
							break;
						}
					}
					jsonObject.addProperty("app_name", app);
					jsonObject.addProperty("Id", rs.getString("Id"));
					jsonArray.add(jsonObject);
				}
				rs.close();
				st.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArray;
	}

	public List<String> getphasewaveinfo(String phaseFilter) {
		JsonArray jsonArray = new JsonArray();
		List<String> list = new LinkedList<String>();
		List<String> wavelist = new LinkedList<String>();
		PreparedStatement st=null;
		ResultSet rs=null;
		try {
			if(phaseFilter.equals("All"))
			{
				String selectPhases = "select * from phase_info";
				st = con.prepareStatement(selectPhases);
				rs = st.executeQuery();
				while (rs.next()) {
					if (rs.getString("column_name").equals("waves")) {
						String waves[] = rs.getString("value").split(",");
						for (String wave : waves) {
							if (wave.equals("")) {
								continue;
							}
							wavelist.add(wave);          
						}
						String[] allWave = new String[wavelist.size()];
						allWave = wavelist.toArray(allWave);
						list = (getWaveinfo(allWave, rs.getString("phaseName")));
					}
				}
				rs.close();
				st.close();
			}
			if(!phaseFilter.equals("All"))
			{
				String selectPhases = "select * from phase_info where phaseName like ?";
				st = con.prepareStatement(selectPhases);
				st.setString(1, "%"+phaseFilter+"%");
				rs = st.executeQuery();
				while (rs.next()) {
					if (rs.getString("column_name").equals("waves")) {
						String waves[] = rs.getString("value").split(",");
						for (String wave : waves) {
							if (wave.equals("")) {
								continue;
							}
							wavelist.add(wave);          
						}
						String[] allWave = new String[wavelist.size()];
						allWave = wavelist.toArray(allWave);
						list = (getWaveinfo(allWave, rs.getString("phaseName")));
					}
				}
				rs.close();
				st.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println();
		return list;
	}

	private List<String> getWaveinfo(String[] waves, String phase) {
		JsonArray jsonArray = new JsonArray();
		List<String> list = new LinkedList<String>();
		PreparedStatement st=null;
		ResultSet rs=null;
		try {
			for (String wave : waves) {
				String selectWaves = "select * from governance_info where waveName=?";
				st = con.prepareStatement(selectWaves);
				st.setString(1, wave);
				rs = st.executeQuery();
				while (rs.next()) {
					if (rs.getString("column_name").equals("apps")) {
						String apps[] = rs.getString("value").split(",");
						list = (getApplicationinfo(apps, rs.getString("waveName"), phase));
					}
				}
			}
			st.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	private List<String> getApplicationinfo(String[] apps, String wave, String phase) {
		JsonArray jsonArray = new JsonArray();
		try {
			for (String app : apps) {
				JsonObject jsonObject = new JsonObject();
				//                  String selectApp = "select * from opportunity_info where column_name='appName' and value = '" + app
				//                          + "'";
				//                  Statement st = con.createStatement();
				//                  ResultSet rs = st.executeQuery(selectApp);
				//                  while (rs.next()) {
				mainList.add(app);
				mainList.add(phase);
				mainList.add(wave);
			}
			//                  rs.close();
			//                  st.close();
			//              }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mainList;
	}

	public JsonArray GetAppWithoutPhaseWave() {
		List<String> list = new LinkedList<String>();
		List<String> applist = new LinkedList<String>();
		boolean isEqual = false;
		int count = 1;
		JsonArray jsonArray = new JsonArray();
		JsonArray jsonArray2 = new JsonArray();
		PreparedStatement st=null;
		ResultSet rs=null;
		try {
			String selectWaves = "select * from governance_info";
			st = con.prepareStatement(selectWaves);
			rs = st.executeQuery();
			while (rs.next()) {
				if (rs.getString("column_name").equals("apps")) {
					if (rs.getString("value").isEmpty() == false) {
						String[] apps = rs.getString("value").split(",");
						for (String string : apps) {
							list.add(string);
						}
					}
				}
			}

			st.close();
			rs.close();

			String selectApp = "select id,value from opportunity_info  where column_name='appName'";
			PreparedStatement st1 = con.prepareStatement(selectApp);
			ResultSet rs1 = st1.executeQuery();
			JsonObject jsonObject = new JsonObject();
			while (rs1.next()) {
				String appname = rs1.getString("value");
				String appId = rs1.getString("id");
				System.out.println("ID VAL" + appId);
				for (String app : list) {
					if (appname.equals(app)) {
						isEqual = true;
					}
				}
				if (isEqual == false) {
					JsonObject jsonObject2 = new JsonObject();
					jsonObject2.addProperty("appName", appname);
					jsonObject2.addProperty("appId", appId);

					count++;
					jsonArray2.add(jsonObject2);

				}
				isEqual = false;
			}
			count = 1;
			jsonArray.add(jsonArray2);
			st.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("Phase wave bina data " + jsonArray);
		return jsonArray;
	}

	public JsonArray getResources() {
		JsonArray jsonArray = new JsonArray();
		JsonArray jsonArray1 = new JsonArray();
		PreparedStatement st=null;
		ResultSet rs=null;
		try {

			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();

			String SelectResourcesQuery = "select * from users";
			st = connection.prepareStatement(SelectResourcesQuery);
			rs = st.executeQuery();

			while (rs.next()) {
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("resourcesList", rs.getString("uname"));
				jsonArray.add(jsonObj);
			}
			System.out.println("Exception------->>>>>--------" + jsonArray);
			jsonArray1.add(jsonArray);
			jsonArray1.add(new OpportunityDropdownOptions().getOptions());
			st.close();
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Exception------->>>>>--------" + e);
		}
		return jsonArray1;
	}

}

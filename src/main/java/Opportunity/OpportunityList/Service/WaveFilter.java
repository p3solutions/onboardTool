package Opportunity.OpportunityList.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class WaveFilter {
	public static JsonArray getOptions(String phaseName)
	{
		JsonArray jsonArray = new JsonArray();
		try
		{
			jsonArray.add(getWaveOptions(phaseName));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonArray;
	}
	public static JsonArray getWaveOptions(String phaseName)
	{	
		PreparedStatement st1=null;
		ResultSet rs1=null;
		JsonArray jsonArray = new JsonArray();
		ArrayList<String> waves = new ArrayList<String>();
		JsonObject js=new JsonObject();
		String waveArray[]= {};
		try
		{
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			String selectPhases = "select * from phase_info where phaseName like ?";
			st1 = connection.prepareStatement(selectPhases);
			st1.setString(1, "%"+phaseName+"%");
			rs1 = st1.executeQuery();

			while (rs1.next()) {
				JsonObject jsonObj1 = new JsonObject();
				if (rs1.getString("column_name").equals("waves")) {
					if (rs1.getString("value").isEmpty() == false) {
						waveArray = rs1.getString("value").split(",");

					}
				}
			}
			if (waveArray.length > 0) {

				jsonArray = getArchiveExeDetail(waveArray);

			} 

		}
		catch(Exception e)
		{
			e.printStackTrace();
		}

		return jsonArray;
	}

	private static JsonArray getArchiveExeDetail(String[] apps) {
		JsonArray jsonArray = new JsonArray();
		try {
			for(String app:apps) {
				JsonObject js = new JsonObject();
				JsonObject jsonObj1 = new JsonObject();
				jsonObj1.addProperty("WaveName", app);
				jsonArray.add(jsonObj1);
			}
			System.out.println("Dell"+jsonArray);

		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArray;	
	}
}
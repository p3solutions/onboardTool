package FinanceDetails.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class FinanceScreenShotService {
	public JsonArray finance_screenshot_retrieve(String Id) {

		JsonArray jsonArray = new JsonArray();
		try {

			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			System.out.println("Connected...");
			String selectQuery = "select AppId,File_Name from finance_screenshot_details where AppId=?";
			PreparedStatement st = connection.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				JsonObject jsonObj = new JsonObject();
				jsonObj.addProperty("AppId", rs.getString(1));
				jsonObj.addProperty("File_Name", rs.getString(2));
				jsonArray.add(jsonObj);
				System.out.println("Data Fetched.." + jsonObj);
			}
			connection.close();
		} catch (Exception e) {
			System.out.println("Execption Occurs" + e);
		}
		System.out.println("Finance  Application Screenshots Service : " + jsonArray);
		return jsonArray;
	}

}

package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class TableDetailEditService {
	public static JsonArray FinanceTableEdit(String Id) {
		JsonArray jsonArray = new JsonArray();
		try {
			DBconnection dBconnection = new DBconnection();
			Connection con = (Connection) dBconnection.getConnection();
			String SelectQuery = "select * from finance_informations where Id = ? order by seq_no;";
			PreparedStatement st = con.prepareStatement(SelectQuery);
			st.setString(1, Id);
			System.out.println("The connection Started in Update Service");
			ResultSet rs = st.executeQuery();

			while(rs.next()) {
				JsonObject jsonObject = new JsonObject();

				jsonObject.addProperty("seq_num", rs.getString("seq_no"));
				jsonObject.addProperty("id", rs.getString("Id"));
				jsonObject.addProperty("Project_Name", rs.getString("prj_name"));
				jsonObject.addProperty("App_Name", rs.getString("app_name"));
				jsonObject.addProperty("options", rs.getString("options"));
				jsonObject.addProperty("LabelName", rs.getString("label_name"));
				jsonObject.addProperty("ColumnName", rs.getString("column_name"));
				jsonObject.addProperty("Type", rs.getString("type"));
				jsonObject.addProperty("Mandatory", rs.getString("mandatory"));
				jsonObject.addProperty("Value", rs.getString("value"));
				jsonObject.addProperty("UMandatory", rs.getString("usermandatoryflag"));
				jsonArray.add(jsonObject);

			}
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("Exception-------[info]--------" +e);
		
		}
		System.out.println("Exception-------[info]--------" +jsonArray);
		return jsonArray;
		
	}}
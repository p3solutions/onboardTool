package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import onboard.DBconnection;
public class FinanceInputTemplate {
	 public static JsonArray InputDetailsRetrieve() {
	        JsonArray jsonArray = null;
	        try {
	        
	            FinanceRecords();
	            jsonArray = InputDetailsRetrievalService();
	        } catch (Exception e) {
	            System.out.println("Exception e" + e);
	        }
	        return jsonArray;
	    }

public static JsonArray InputDetailsRetrievalService() {
		PreparedStatement statementforcheck=null;
		ResultSet Resultset=null;
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String query = "select * from  Finance_Info_Template_Details order by seq_no;";
			statementforcheck = connection.prepareStatement(query);
			Resultset = statementforcheck.executeQuery();
            if (Resultset.next()) {
               
                String value = Resultset.getString("value");
                JsonObject jsonObject1 = new JsonObject();
                jsonObject1.addProperty("seq_num", Resultset.getString("seq_no"));
                jsonObject1.addProperty("Id", Resultset.getString("Id"));
                jsonObject1.addProperty("Project_Name", Resultset.getString("prj_name"));
                jsonObject1.addProperty("App_Name", Resultset.getString("app_name"));
                jsonObject1.addProperty("options", Resultset.getString("options"));
                jsonObject1.addProperty("LabelName", Resultset.getString("label_name"));
                jsonObject1.addProperty("ColumnName", Resultset.getString("column_name"));
                jsonObject1.addProperty("Type", Resultset.getString("type"));
                jsonObject1.addProperty("Mandatory", Resultset.getString("mandatory"));
                jsonObject1.addProperty("Value", value);
                jsonArray.add(jsonObject1);
                while (Resultset.next()) {
                    
                    String value1 = Resultset.getString("value");
                    JsonObject jsonObject2 = new JsonObject();
                    jsonObject2.addProperty("seq_num", Resultset.getString("seq_no"));
                    jsonObject2.addProperty("Id", Resultset.getString("Id"));
                    jsonObject2.addProperty("Project_Name", Resultset.getString("prj_name"));
                    jsonObject2.addProperty("App_Name", Resultset.getString("app_name"));
                    jsonObject2.addProperty("options", Resultset.getString("options"));
                    jsonObject2.addProperty("LabelName", Resultset.getString("label_name"));
                    jsonObject2.addProperty("ColumnName", Resultset.getString("column_name"));
                    jsonObject2.addProperty("Type", Resultset.getString("type"));
                    jsonObject2.addProperty("Mandatory", Resultset.getString("mandatory"));
                    jsonObject2.addProperty("Value", value1);
                    jsonArray.add(jsonObject2);
                }
            }
			statementforcheck.close();
			Resultset.close();
        } catch (Exception e) {
            System.out.println("Exception--->>" + e);
        }
        System.out.println("Json array from retrival"+jsonArray);
        return jsonArray;
    } public static void FinanceRecords() {
		PreparedStatement st=null,st1=null;
		ResultSet rs=null;
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String Deletequery = "delete from Finance_Informations_details";
			st = connection.prepareStatement(Deletequery);
			st.executeUpdate();
            String SelectQuery = "select * from Finance_Info_Template_Details order by seq_no";
			st1 = connection.prepareStatement(SelectQuery);
			rs = st1.executeQuery();
            while (rs.next()) {
                if (rs.getInt(1) <= 15) {
                    String Finance_InsertQuery = "insert into Finance_Informations_Details (seq_no,Id, prj_name, app_name, options, label_name, column_name, type, mandatory, value)"
                            + "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement prestmt = connection.prepareStatement(Finance_InsertQuery);
                    prestmt.setInt(1, rs.getInt(1));
                    prestmt.setString(2, rs.getString(2));
                    prestmt.setString(3, rs.getString(3));
                    prestmt.setString(4, rs.getString(4));
                    prestmt.setString(5, rs.getString(5));
                    prestmt.setString(6, rs.getString(6));
                    prestmt.setString(7, rs.getString(7));
                    prestmt.setString(8, rs.getString(8));
                    prestmt.setString(9, rs.getString(9));
                    prestmt.setString(10, rs.getString(10));
                    prestmt.execute();
                }
            }
		st.close();
		rs.close();
		st1.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception ---------[info]---------" + e);
        }
    }
}
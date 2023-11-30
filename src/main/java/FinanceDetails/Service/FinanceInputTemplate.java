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
	            String randomNumber = RandomIdGenerator();
	           
	           
	            jsonArray = InputDetailsRetrievalService(randomNumber);
	        } catch (Exception e) {
	            System.out.println("Exception e" + e);
	        }
	        return jsonArray;
	    }
	 public static String RandomIdGenerator() {
	        int n = 10;
	        String AlphaNumericNumber = "";
	        String randomNumber = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	                + "0123456789";
	        JsonObject jsonObject1 = new JsonObject();
	        boolean DuplicateFlag = true;
	        try {
	            while (DuplicateFlag) {
	               
	                for (int i = 0; i < n; i++) { 
	                    int index 
	                        = (int)(randomNumber.length() 
	                                * Math.random()); 
	                    AlphaNumericNumber += randomNumber .charAt(index);
	                } 
	                System.out.println("Random No In Service : " + randomNumber);
	                DBconnection dBconnection = new DBconnection();
	                Connection connection = (Connection) dBconnection.getConnection();
	                String query = "select * from Finance_informations where id='" +"D3S"+AlphaNumericNumber
	                        + "' order by seq_no;";
					PreparedStatement statementforcheck = connection.prepareStatement(query);
					ResultSet Resultset = statementforcheck.executeQuery();
	                if (!Resultset.next()) {
	                    DuplicateFlag = false;
	                }
					statementforcheck.close();
					Resultset.close();
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("Exception-------[info]---------" + e);
	        }jsonObject1.addProperty("RandomNumber", "D3S" + AlphaNumericNumber);
	        return "D3S" + AlphaNumericNumber;
	    }
	    

public static JsonArray InputDetailsRetrievalService(String randomNumber) {
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
    }}
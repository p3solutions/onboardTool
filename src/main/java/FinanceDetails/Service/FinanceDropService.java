package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class FinanceDropService {
	public JsonArray FinanceDropdown(String name) {
	    PreparedStatement st1 = null;
	    ResultSet rs1 = null;
	    PreparedStatement st2 = null;
	    ResultSet rs2 = null;
	    JsonArray jsonArray = new JsonArray();
	    List<String> valuesFromQuery1 = new ArrayList<>(); // List for values from the first query

	    try {
	        String app = name;
	        DBconnection dBconnection = new DBconnection();
	        Connection connection = (Connection) dBconnection.getConnection();

	      

	        // Second Query
	        String selectQuery2 = "SELECT `Application Name` FROM financedetails WHERE `Application Name` LIKE '" + app + "%';";
	        st2 = connection.prepareStatement(selectQuery2);
	        rs2 = st2.executeQuery();

	        // Process the result of the second query
	        if (!rs2.next()) {
	            // The second query result set is empty, add all unique values from the first query to the JsonArray
	        	  String selectQuery1 = "SELECT value, id FROM decom3sixtytool.opportunity_info WHERE column_name = 'appname' AND value LIKE '" + app + "%';";
	  	        st1 = connection.prepareStatement(selectQuery1);
	  	        rs1 = st1.executeQuery();

	  	        // Store values from the first query in a list
	  	        while (rs1.next()) {
	  	            JsonObject jsonObj = new JsonObject();
	  	            jsonObj.addProperty("value", rs1.getString(1));
	  	            jsonObj.addProperty("Id", rs1.getString(2));
	  	            jsonArray.add(jsonObj);
	  	            valuesFromQuery1.add(rs1.getString(1));
	  	        }
	  	        System.out.println("The value from 1" + valuesFromQuery1);

	  	        // Close resources for the first query
	  	        st1.close();
	  	        rs1.close();
	                    }
	               

	        else   {

	        }   
	           

	        // Close resources for the second query
	        st2.close();
	        rs2.close();

	        // Send the result to the front end here (after the comparison)
	        System.out.println("Result sent to front end: " + jsonArray);

	    } catch (Exception e) {
	        System.out.println("Exception Occurs");
	        e.printStackTrace(); // Print the exception details for debugging
	    } finally {
	        // Close resources in a finally block to ensure they are always closed
	        try {
	            if (st1 != null) st1.close();
	            if (rs1 != null) rs1.close();
	            if (st2 != null) st2.close();
	            if (rs2 != null) rs2.close();
	        } catch (SQLException e) {
	            e.printStackTrace(); // Handle the exception or log it as needed
	        }
	    }

	    return jsonArray;
	}


	

}
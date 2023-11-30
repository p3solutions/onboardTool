package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class FinancePhaseDropService {
public JsonArray FinanceDropDownStatus(String Id, String value) {
	    PreparedStatement st = null;
	    ResultSet rs = null;
	    JsonArray jsonArray = new JsonArray();
	    Connection connection = null; 

	    try {
	      
	        
	        String AppId = Id;
	        System.out.println("The value of id" + AppId);

	        
	        DBconnection dBconnection = new DBconnection();
	        connection = (Connection) dBconnection.getConnection();

	       
	        String selectQuery = "SELECT Application_Status, Phase_Status FROM decom3sixtytool.dropdown WHERE Application_ID =  ?";
	        st = connection.prepareStatement(selectQuery);
	        st.setString(1, AppId);
	        rs = st.executeQuery();

	        while (rs.next()) {
	            JsonObject jsonObj = new JsonObject();
	            jsonObj.addProperty("Application_Status", rs.getString(1));
	            jsonObj.addProperty("Phase_Status", rs.getString(2));
	            jsonArray.add(jsonObj);
	        }

	        
	    } catch (Exception e) {
	        
	        e.printStackTrace();
	        System.out.println("Exception Occurs");
	    } finally {
	      
	        try {
	            if (st != null) {
	                st.close();
	            }
	            if (rs != null) {
	                rs.close();
	            }
	            // Close the connection
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (SQLException e) {
	            
	            e.printStackTrace();
	        }
	    }

	   
	    return jsonArray;
	}}
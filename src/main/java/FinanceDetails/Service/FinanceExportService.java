package FinanceDetails.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class FinanceExportService {

	public JsonArray fetchExportData() {
		PreparedStatement st = null;
        ResultSet rs = null;
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            
            String query = "SELECT * FROM decom3sixtytool.FinanceDetails;";
            st = connection.prepareStatement(query);
           
            rs = st.executeQuery();

            while (rs.next()) {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("Project_Number",rs.getString(1));
                jsonObj.addProperty("Phase",rs.getString(2));
                jsonObj.addProperty("Application_Name",rs.getString(3));
                jsonObj.addProperty("Software_and_Licensing",rs.getString(4));
                jsonObj.addProperty("Contract_Date",rs.getString(5));
                jsonObj.addProperty("scope_of_infrastructure",rs.getString(6));
                jsonObj.addProperty("InfraStructure_Cost_Savings",rs.getString(7));
                jsonObj.addProperty("Cost_Avoidance",rs.getString(8));
                jsonObj.addProperty("Cost_of_Archive",rs.getString(9));
                jsonObj.addProperty("CBA",rs.getString(10));
                
                jsonObj.addProperty("Funding_approval",rs.getString(11));
                jsonObj.addProperty("Funding_type",rs.getString(12));
                jsonObj.addProperty("Status",rs.getString(13));
                jsonArray.add(jsonObj);
            }
            st.close();
            rs.close();
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
       

        System.out.println("JSON Export Service Pagination : " + jsonArray);
        return jsonArray;
	}


	

	
	

}

package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class FinanceTableDetails {
    public JsonObject FinanceDetails(String page, String maxRows) {
    	PreparedStatement st = null;
        ResultSet rs = null;
        int totalCount = 0;
        int Page = Integer.parseInt(page);
        int MaxRows = Integer.parseInt(maxRows);
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            int start = (Page - 1) * MaxRows;
            String query = "SELECT * FROM decom3sixtytool.financedetails LIMIT ?, ?";
            st = connection.prepareStatement(query);
            st.setInt(1, start);
            st.setInt(2, MaxRows);
 
            rs = st.executeQuery();
            while(rs.next())
            {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("Project_Number",rs.getString(1));
            jsonObj.addProperty("Phase",rs.getString(2));
            jsonObj.addProperty("Application_Name",rs.getString(3));
            jsonObj.addProperty("Software_and_Licensing",rs.getString(4));
            jsonObj.addProperty("Contract_Date",rs.getString(5));
            jsonObj.addProperty("scope_of_infrastructure",rs.getString(6));
            jsonObj.addProperty("infrastructure_Cost_Savings",rs.getString(7));
            jsonObj.addProperty("Cost_Avoidance",rs.getString(8));
            jsonObj.addProperty("Cost_of_Archive",rs.getString(9));
            jsonObj.addProperty("CBA",rs.getString(10));
            jsonObj.addProperty("Funding_approval",rs.getString(11));
            jsonObj.addProperty("Funding_type",rs.getString(12));
            jsonObj.addProperty("Status",rs.getString(13));
            jsonObj.addProperty("Id",rs.getString(14));
            jsonArray.add(jsonObj);
       }
            String countQuery = "SELECT COUNT(*) AS total FROM decom3sixtytool.financedetails";
            st = connection.prepareStatement(countQuery);
            rs = st.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt("total");
            }
            st.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        JsonObject result = new JsonObject();
        result.addProperty("total", totalCount);
        result.add("data", jsonArray);
 
        System.out.println("JSON Service Pagination : " + result);
        return result;
    }
}
package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class FinanceTableDetailsService {
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
            jsonObj.addProperty("Project Number",rs.getString(1));
            jsonObj.addProperty("Phase",rs.getString(2));
            jsonObj.addProperty("Application Name",rs.getString(3));
            jsonObj.addProperty("Software and Licensing",rs.getString(4));
            jsonObj.addProperty("Cost Savings($)",rs.getString(5));
            jsonObj.addProperty("Contract Date",rs.getString(6));
            jsonObj.addProperty("Comments",rs.getString(7));
            jsonObj.addProperty("scope of infrastructure",rs.getString(8));
            jsonObj.addProperty("infrastructure Cost Savings",rs.getString(9));
            jsonObj.addProperty("Cost Avoidance",rs.getString(10));
            jsonObj.addProperty("Cost of Archive",rs.getString(11));
            jsonObj.addProperty("Total CBA",rs.getString(12));
            jsonObj.addProperty("Funding Approval",rs.getString(13));
            jsonObj.addProperty("Funding type",rs.getString(14));
            jsonObj.addProperty("Status",rs.getString(15));
            jsonObj.addProperty("Id",rs.getString(16));
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
package Finance.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SearchFinanceService {

    public JsonObject search(String column, String searchTerm, int maxRows, int page) {
        PreparedStatement st = null;
        ResultSet rs = null;
        JsonArray jsonArray = new JsonArray();
        int totalCount = 0;
        FinanceListMapping financeListMapping =new FinanceListMapping();

        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            int start = (page - 1) * maxRows;

            String selectQuery = "SELECT * FROM FinanceList WHERE " + column + " LIKE ? LIMIT ?, ?";
            st = connection.prepareStatement(selectQuery);
            st.setString(1, "%" + searchTerm + "%");
            st.setInt(2, start);
            st.setInt(3, maxRows);

            rs = st.executeQuery();
            financeListMapping.FinanceMapping(rs,jsonArray);
            String countQuery = "SELECT COUNT(" + column + ") AS total FROM FinanceList WHERE " + column + " LIKE ?";
            st = connection.prepareStatement(countQuery);
            st.setString(1, "%" + searchTerm + "%");
            rs = st.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt("total");
            }

            st.close();
            rs.close();
        } catch (Exception e) {
            System.out.println("Exception Occurs");
        }

        // Create a JSON object to hold both data and total count
        JsonObject result = new JsonObject();
        result.addProperty("total", totalCount);
        result.add("data", jsonArray);
        System.out.println("JSON" + result);
        return result;
    }
}

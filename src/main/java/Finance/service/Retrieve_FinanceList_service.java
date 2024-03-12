package Finance.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import logger.System;

public class Retrieve_FinanceList_service {

    public JsonObject retrieveDataWithCount(int page, int maxRows) {
        PreparedStatement st = null;
        ResultSet rs = null;
        JsonArray jsonArray = new JsonArray();
        int totalCount = 0;
        FinanceListMapping financeListMapping = new FinanceListMapping();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");

            // Calculate the starting row for pagination
            int start = (page - 1) * maxRows;

            // Query to get the data for the specified page and max rows
            String selectQuery = "SELECT * FROM FinanceList LIMIT ?, ?";
            st = connection.prepareStatement(selectQuery);
            st.setInt(1, start);
            st.setInt(2, maxRows);

            rs = st.executeQuery();
            financeListMapping.FinanceMapping(rs,jsonArray);

            // Query to get the total count of records
            String countQuery = "SELECT COUNT(*) AS total FROM FinanceList";
            st = connection.prepareStatement(countQuery);
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

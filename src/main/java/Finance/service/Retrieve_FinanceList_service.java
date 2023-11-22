package Finance.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Retrieve_FinanceList_service {

    public JsonObject retrieveDataWithCount(int page, int maxRows) {
        PreparedStatement st = null;
        ResultSet rs = null;
        JsonArray jsonArray = new JsonArray();
        int totalCount = 0;

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
            while (rs.next()) {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("ID", rs.getString(1));
                jsonObj.addProperty("FinanceAppName", rs.getString(2));
                jsonObj.addProperty("SoftLicense",rs.getString(3));
                jsonObj.addProperty("ContractDate",rs.getString(4));
                jsonObj.addProperty("ScopeInfra",rs.getString(5));
                jsonObj.addProperty("CostAvoidance",rs.getString(6));
                jsonObj.addProperty("CostArchive",rs.getString(7));
                jsonObj.addProperty("CBA",rs.getString(8));
                jsonObj.addProperty("ArchiveTarget",rs.getString(9));
                jsonObj.addProperty("FundApprove",rs.getString(10));
                jsonObj.addProperty("FundType",rs.getString(11));
                jsonObj.addProperty("ProjectNumber",rs.getString(12));
                jsonObj.addProperty("ScreenShot",rs.getString(13));
                jsonArray.add(jsonObj);
            }

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

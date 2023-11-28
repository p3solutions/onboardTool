package Finance.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FinanceExportService {
    public JsonArray retrieveDataForExport() throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        JsonArray jsonArray = new JsonArray();
        int totalCount = 0;
        FinanceListMapping financeListMapping = new FinanceListMapping();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            String selectQuery = "SELECT * FROM FinanceList";
            st = connection.prepareStatement(selectQuery);
            rs = st.executeQuery();
            financeListMapping.FinanceMapping(rs,jsonArray);

        } catch (Exception e) {
            System.out.println("Exception Occurs");
        }
        finally {
            assert st != null;
            st.close();
            assert rs != null;
            rs.close();
            System.out.println("Connection Closed  in Retrieve Data");
        }

        System.out.println("JSON" + jsonArray);
        return jsonArray;
    }
}

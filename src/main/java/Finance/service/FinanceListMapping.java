package Finance.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import java.sql.ResultSet;
import java.sql.SQLException;

public class FinanceListMapping {
    protected void FinanceMapping(ResultSet rs, JsonArray jsonArray) throws SQLException {
        while (rs.next()) {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("ID", rs.getString(1));
            jsonObj.addProperty("Application Name", rs.getString(2));
            jsonObj.addProperty("Project Number",rs.getString(3));
            jsonObj.addProperty("Software and Licensing",rs.getString(4));
            jsonObj.addProperty("Software and Licensing(cost Saving)",rs.getString(5));
            jsonObj.addProperty("Contract end date",rs.getString(6));
            jsonObj.addProperty("Contract end date -comments",rs.getString(7));
            jsonObj.addProperty("Scope of infrastructure",rs.getString(8));
            jsonObj.addProperty("Infrastructure Cost Savings",rs.getString(9));
            jsonObj.addProperty("Cost Avoidance",rs.getString(10));
            jsonObj.addProperty("Cost Archive",rs.getString(11));
            jsonObj.addProperty("Total CBA",rs.getString(12));
            jsonObj.addProperty("Funding approved",rs.getString(13));
            jsonObj.addProperty("Funding Type",rs.getString(14));
            jsonObj.addProperty("Status",rs.getString(15));
            jsonObj.addProperty("Phase",rs.getString(16));

            jsonArray.add(jsonObj);
        }
        int arraySize = jsonArray.size();
        // Check if the array size is 0 and print a message accordingly
        if (arraySize == 0) {
            System.out.println("The JSON array is empty.");
            FinanceMappingHeader(jsonArray);
        } else {
            System.out.println("Array size: " + arraySize);
        }
    }
    protected void FinanceMappingHeader(JsonArray jsonArray) throws SQLException {
            JsonObject jsonObj = new JsonObject();
        jsonObj.addProperty("ID","");
        jsonObj.addProperty("Application Name", "");
        jsonObj.addProperty("Project Number","");
        jsonObj.addProperty("Software and Licensing","");
        jsonObj.addProperty("Software and Licensing(cost Saving)","");
        jsonObj.addProperty("Contract end date","");
        jsonObj.addProperty("Contract end date -comments","");
        jsonObj.addProperty("Scope of infrastructure","");
        jsonObj.addProperty("Infrastructure Cost Savings","");
        jsonObj.addProperty("Cost Avoidance","");
        jsonObj.addProperty("Cost Archive","");
        jsonObj.addProperty("Total CBA","");
        jsonObj.addProperty("Funding approved","");
        jsonObj.addProperty("Funding Type","");
        jsonObj.addProperty("Status","");
        jsonObj.addProperty("Phase","");
        jsonArray.add(jsonObj);
    }
}
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
            jsonObj.addProperty("FinanceAppName", "");
            jsonObj.addProperty("SoftLicense","");
            jsonObj.addProperty("ContractDate","");
            jsonObj.addProperty("ScopeInfra","");
            jsonObj.addProperty("CostAvoidance","");
            jsonObj.addProperty("CostArchive","");
            jsonObj.addProperty("CBA","");
            jsonObj.addProperty("ArchiveTarget","");
            jsonObj.addProperty("FundApprove","");
            jsonObj.addProperty("FundType","");
            jsonObj.addProperty("ProjectNumber","");
            jsonObj.addProperty("ScreenShot","");
            jsonArray.add(jsonObj);
    }
}
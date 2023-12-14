package Report;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReportMapping {
     protected void reportMapping1(ResultSet rs, JsonArray jsonArray) throws SQLException {
        while(rs.next()) {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("Application Id",rs.getString(2));
            jsonObj.addProperty("Application Name",rs.getString(3));
            jsonObj.addProperty("Workflow Status",rs.getString(4));
            jsonObj.addProperty("Phase",rs.getString(5));
            jsonObj.addProperty("Creation Date",rs.getString(6));
            jsonObj.addProperty("Status",rs.getString(7));
            jsonObj.addProperty("Request Type",rs.getString(8));
            jsonObj.addProperty("Requester",rs.getString(9));
            jsonObj.addProperty("Application Owner",rs.getString(10));
            jsonObj.addProperty("EDR Analyst",rs.getString(22));
            jsonObj.addProperty("Project Decommission Date",rs.getString(17));
            jsonObj.addProperty("Business Segment",rs.getString(11));
            jsonObj.addProperty("Business Unit",rs.getString(12));
            jsonObj.addProperty("Preliminary CBA",rs.getString(13));
            jsonObj.addProperty("Funding Available",rs.getString(14));
            jsonObj.addProperty("Program Funder",rs.getString(15));
            jsonObj.addProperty("Project Portfolio Information",rs.getString(16));
            jsonObj.addProperty("Infrastructure Impact",rs.getString(18));
            jsonObj.addProperty("Number of Infrastructure Components",rs.getString(19));
            jsonObj.addProperty("Archival Solution",rs.getString(20));
            jsonObj.addProperty("Status Notes",rs.getString(21));
            jsonObj.addProperty("Big Rock",rs.getString(23));
            jsonObj.addProperty("Read Only Date",rs.getString(24));
        
            jsonArray.add(jsonObj);
        }
         int arraySize = jsonArray.size();
         // Check if the array size is 0 and print a message accordingly
         if (arraySize == 0) {
             System.out.println("The JSON array is empty.");
             reportHeaderMapping1(jsonArray);
         } else {
             System.out.println("Array size: " + arraySize);
         }
    }
    protected void reportMapping2(ResultSet rs, JsonArray jsonArray) throws SQLException {
        while(rs.next()) {
            JsonObject jsonObj = new JsonObject();
           // jsonObj.addProperty("ID",rs.getString(1));
            jsonObj.addProperty("Application Name",rs.getString(1));
            jsonObj.addProperty("Phase",rs.getString(21));
            jsonObj.addProperty("Application Owner",rs.getString(2));
            jsonObj.addProperty("Status",rs.getString(3));
            jsonObj.addProperty("Project Portfolio Information",rs.getString(4));
            jsonObj.addProperty("Funding Available",rs.getString(5));
            jsonObj.addProperty("Application Details",rs.getString(6));
            jsonObj.addProperty("Target Date",rs.getString(7));
            jsonObj.addProperty("Readonly Date",rs.getString(8));
            jsonObj.addProperty("Database type",rs.getString(9));
            jsonObj.addProperty("Data Type Characteristics",rs.getString(10));
            jsonObj.addProperty("Structured Data In GB",rs.getString(11));
            jsonObj.addProperty("Structured Data Number of tables",rs.getString(12));
            jsonObj.addProperty("Unstructured Data In GB",rs.getString(13));
            jsonObj.addProperty("Unstructured Data files",rs.getString(14));
            jsonObj.addProperty("Database Server Name",rs.getString(15));
            jsonObj.addProperty("Database Name",rs.getString(16));
            jsonObj.addProperty("Table Names",rs.getString(17));
            jsonObj.addProperty("DBA Contact",rs.getString(18));
            jsonObj.addProperty("Encryption",rs.getString(19));
            jsonObj.addProperty("Data Masking",rs.getString(20));
            

            jsonArray.add(jsonObj);
        }
        int arraySize = jsonArray.size();
        // Check if the array size is 0 and print a message accordingly
        if (arraySize == 0) {
            System.out.println("The JSON array is empty.");
            reportHeaderMapping2(jsonArray);
        } else {
            System.out.println("Array size: " + arraySize);
        }
    }

    protected void reportMapping3(ResultSet rs, JsonArray jsonArray) throws SQLException {
        while (rs.next()) {
            JsonObject reportObj = new JsonObject();
            reportObj.addProperty("Application Name", rs.getString(1));
            reportObj.addProperty("Phase", rs.getString(2));
            reportObj.addProperty("Source Platform Databases", rs.getString(3));
            reportObj.addProperty("Legacy App Description", rs.getString(4));
            reportObj.addProperty("Read Only Date", rs.getString(5));
            reportObj.addProperty("Is Application The Only Source Of Truth For The Data", rs.getString(6));
            reportObj.addProperty("Legacy Application Hosted Internally Or With Third Party Vendor", rs.getString(7));
            reportObj.addProperty("Total Data Size", rs.getString(8));
            reportObj.addProperty("Retention Period", rs.getString(9));

            jsonArray.add(reportObj);
        }
        int arraySize = jsonArray.size();
        // Check if the array size is 0 and print a message accordingly
        if (arraySize == 0) {
            System.out.println("The JSON array is empty.");
            reportHeaderMapping3(jsonArray);
        } else {
            System.out.println("Array size: " + arraySize);
        }
    }

    protected void reportHeaderMapping1(JsonArray jsonArray)  {

            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("Application Id","");
            jsonObj.addProperty("Application Name","");
            jsonObj.addProperty("Workflow Status","");
            jsonObj.addProperty("Phase","");
            jsonObj.addProperty("Creation Date","");
            jsonObj.addProperty("Status","");
            jsonObj.addProperty("Request Type","");
            jsonObj.addProperty("Requester","");
            jsonObj.addProperty("Application Owner","");
            jsonObj.addProperty("EDR Analyst","");
            jsonObj.addProperty("Project Decommission Date","");
            jsonObj.addProperty("Business Segment","");
            jsonObj.addProperty("Business Unit","");
            jsonObj.addProperty("Preliminary CBA","");
            jsonObj.addProperty("Funding Available","");
            jsonObj.addProperty("Program Funder","");
            jsonObj.addProperty("Project Portfolio Information","");
            jsonObj.addProperty("Infrastructure Impact","");
            jsonObj.addProperty("Number of Infrastructure Components","");
            jsonObj.addProperty("Archival Solution","");
            jsonObj.addProperty("Status Notes","");
            
            jsonObj.addProperty("Big Rock","");
            jsonObj.addProperty("Read Only Date","");
            jsonArray.add(jsonObj);
        }
    protected void reportHeaderMapping2(JsonArray jsonArray) {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("Application Name","");
            jsonObj.addProperty("Phase","");
            jsonObj.addProperty("Application Owner","");
            jsonObj.addProperty("Status","");
            jsonObj.addProperty("Project Portfolio Information","");
            jsonObj.addProperty("Funding Available","");
            jsonObj.addProperty("Application Details","");
            jsonObj.addProperty("Target Date","");
            jsonObj.addProperty("Readonly Date","");
            jsonObj.addProperty("Database type","");
            jsonObj.addProperty("Data Type Characteristics","");
            jsonObj.addProperty("Structured Data In GB","");
            jsonObj.addProperty("Structured Data Number of tables","");
            jsonObj.addProperty("Unstructured Data In GB","");
            jsonObj.addProperty("Unstructured Data files","");
            jsonObj.addProperty("Database Server Name","");
            jsonObj.addProperty("Database Name","");
            jsonObj.addProperty("Table Names","");
            jsonObj.addProperty("DBA Contact","");
            jsonObj.addProperty("Encryption","");
            jsonObj.addProperty("Data Masking","");
            

            jsonArray.add(jsonObj);
        }
    protected void reportHeaderMapping3(JsonArray jsonArray) throws SQLException {

            JsonObject reportObj = new JsonObject();

            reportObj.addProperty("Application Name","");
            reportObj.addProperty("Phase", "");
            reportObj.addProperty("Source Platform Databases","");
            reportObj.addProperty("Legacy App Description","");
            reportObj.addProperty("Read Only Date","");
            reportObj.addProperty("Is Application The Only Source Of Truth For The Data","");
            reportObj.addProperty("Legacy Application Hosted Internally Or With Third Party Vendor","");
            reportObj.addProperty("Total Data Size","");
            reportObj.addProperty("Retention Period","");
            jsonArray.add(reportObj);
        }
}

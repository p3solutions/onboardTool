package Report;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReportMapping {
     protected void reportMapping1(ResultSet rs, JsonArray jsonArray) throws SQLException {
        while(rs.next()) {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("Application_Id",rs.getString(2));
            jsonObj.addProperty("Application_Name",rs.getString(3));
            jsonObj.addProperty("Application_Status",rs.getString(4));
            jsonObj.addProperty("Phase_Status",rs.getString(5));
            jsonObj.addProperty("Creation_Date",rs.getString(6));
            jsonObj.addProperty("Status",rs.getString(7));
            jsonObj.addProperty("Request_Type",rs.getString(8));
            jsonObj.addProperty("Requester",rs.getString(9));
            jsonObj.addProperty("Application_Owner",rs.getString(10));
            jsonObj.addProperty("Business_Segment",rs.getString(11));
            jsonObj.addProperty("Business_Unit",rs.getString(12));
            jsonObj.addProperty("Preliminary_CBA",rs.getString(13));
            jsonObj.addProperty("Funding_Available",rs.getString(14));
            jsonObj.addProperty("Program_Funder",rs.getString(15));
            jsonObj.addProperty("Project_Portfolio_Information",rs.getString(16));
            jsonObj.addProperty("Project_Decommission_Date",rs.getString(17));
            jsonObj.addProperty("Infrastructure_Impact",rs.getString(18));
            jsonObj.addProperty("Number_of_Infrastructure_Components",rs.getString(19));
            jsonObj.addProperty("Archival_Solution",rs.getString(20));
            jsonObj.addProperty("Status_Notes",rs.getString(21));
            jsonObj.addProperty("EDR_Analyst",rs.getString(22));
            jsonObj.addProperty("Big_Rock",rs.getString(23));
            jsonObj.addProperty("Readonlydate",rs.getString(24));
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
            jsonObj.addProperty("Application_Name",rs.getString(2));
            jsonObj.addProperty("Application_Owner",rs.getString(3));
            jsonObj.addProperty("status",rs.getString(4));
            jsonObj.addProperty("Project_Portfolio_Information",rs.getString(5));
            jsonObj.addProperty("Funding_Available",rs.getString(6));
            jsonObj.addProperty("Application_Details",rs.getString(7));
            jsonObj.addProperty("Target_Date",rs.getString(8));
            jsonObj.addProperty("Readonly_Date",rs.getString(9));
            jsonObj.addProperty("Database_Type",rs.getString(10));
            jsonObj.addProperty("Data_Type_Characteristics",rs.getString(11));
            jsonObj.addProperty("Structured_Data_In_GB",rs.getString(12));
            jsonObj.addProperty("Structured_Data_Number_of_tables",rs.getString(13));
            jsonObj.addProperty("Unstructured_Data_In_GB",rs.getString(14));
            jsonObj.addProperty("Unstructured_Data_files",rs.getString(15));
            jsonObj.addProperty("Database_Server_Name",rs.getString(16));
            jsonObj.addProperty("Database_Name",rs.getString(17));
            jsonObj.addProperty("Table_Names",rs.getString(18));
            jsonObj.addProperty("DBA_Contact",rs.getString(19));
            jsonObj.addProperty("Encryption",rs.getString(20));
            jsonObj.addProperty("Data_Masking",rs.getString(21));

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
          //  reportObj.addProperty("Id", rs.getString(1));
            reportObj.addProperty("Application_Name", rs.getString(2));
            reportObj.addProperty("Source_Platform_Databases", rs.getString(3));
            reportObj.addProperty("Legacy_App_Description", rs.getString(4));
            reportObj.addProperty("Read_Only_Date", rs.getString(5));
            reportObj.addProperty("Is_Application_The_Only_Source_Of_Truth_For_The_Data", rs.getString(6));
            reportObj.addProperty("Legacy_Application_Hosted_Internally_Or_With_Third_Party_Vendor", rs.getString(7));
            reportObj.addProperty("Total_Data_Size", rs.getString(8));
            reportObj.addProperty("Retention_Period", rs.getString(9));

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
            jsonObj.addProperty("Application_Id","");
            jsonObj.addProperty("Application_Name","");
            jsonObj.addProperty("Application_Status","");
            jsonObj.addProperty("Phase_Status","");
            jsonObj.addProperty("Creation_Date","");
            jsonObj.addProperty("Status","");
            jsonObj.addProperty("Request_Type","");
            jsonObj.addProperty("Requester","");
            jsonObj.addProperty("Application_Owner","");
            jsonObj.addProperty("Business_Segment","");
            jsonObj.addProperty("Business_Unit","");
            jsonObj.addProperty("Preliminary_CBA","");
            jsonObj.addProperty("Funding_Available","");
            jsonObj.addProperty("Program_Funder","");
            jsonObj.addProperty("Project_Portfolio_Information","");
            jsonObj.addProperty("Project_Decommission_Date","");
            jsonObj.addProperty("Infrastructure_Impact","");
            jsonObj.addProperty("Number_of_Infrastructure_Components","");
            jsonObj.addProperty("Archival_Solution","");
            jsonObj.addProperty("Status_Notes","");
            jsonObj.addProperty("EDR_Analyst","");
            jsonObj.addProperty("Big_Rock","");
            jsonObj.addProperty("Readonlydate","");
            jsonArray.add(jsonObj);
        }
    protected void reportHeaderMapping2(JsonArray jsonArray) {
            JsonObject jsonObj = new JsonObject();
          //  jsonObj.addProperty("ID","");
            jsonObj.addProperty("Application_Name","");
            jsonObj.addProperty("Application_Owner","");
            jsonObj.addProperty("status","");
            jsonObj.addProperty("Project_Portfolio_Information","");
            jsonObj.addProperty("Funding_Available","");
            jsonObj.addProperty("Application_Details","");
            jsonObj.addProperty("Target_Date","");
            jsonObj.addProperty("Readonly_Date","");
            jsonObj.addProperty("Database_Type","");
            jsonObj.addProperty("Data_Type_Characteristics","");
            jsonObj.addProperty("Structured_Data_In_GB","");
            jsonObj.addProperty("Structured_Data_Number_of_tables","");
            jsonObj.addProperty("Unstructured_Data_In_GB","");
            jsonObj.addProperty("Unstructured_Data_files","");
            jsonObj.addProperty("Database_Server_Name","");
            jsonObj.addProperty("Database_Name","");
            jsonObj.addProperty("Table_Names","");
            jsonObj.addProperty("DBA_Contact","");
            jsonObj.addProperty("Encryption","");
            jsonObj.addProperty("Data_Masking","");

            jsonArray.add(jsonObj);
        }
    protected void reportHeaderMapping3(JsonArray jsonArray) throws SQLException {

            JsonObject reportObj = new JsonObject();
         //   reportObj.addProperty("Id", "");
            reportObj.addProperty("Application_Name","");
            reportObj.addProperty("Source_Platform_Databases","");
            reportObj.addProperty("Legacy_App_Description","");
            reportObj.addProperty("Read_Only_Date","");
            reportObj.addProperty("Is_Application_The_Only_Source_Of_Truth_For_The_Data","");
            reportObj.addProperty("Legacy_Application_Hosted_Internally_Or_With_Third_Party_Vendor","");
            reportObj.addProperty("Total_Data_Size","");
            reportObj.addProperty("Retention_Period","");
            jsonArray.add(reportObj);
        }
}

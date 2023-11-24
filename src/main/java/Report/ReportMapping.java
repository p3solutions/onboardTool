package Report;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import java.sql.ResultSet;
import java.sql.SQLException;

public class ReportMapping {
     protected void reportMapping1(ResultSet rs, JsonArray jsonArray) throws SQLException {
        while(rs.next()) {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("Application_Id",rs.getString(1));
            jsonObj.addProperty("Application_Name",rs.getString(2));
            jsonObj.addProperty("Creation_Date",rs.getString(3));
            jsonObj.addProperty("Status",rs.getString(4));
            jsonObj.addProperty("Request_Type",rs.getString(5));
            jsonObj.addProperty("Requester",rs.getString(6));
            jsonObj.addProperty("Application_Owner",rs.getString(7));
            jsonObj.addProperty("Business_Segment",rs.getString(8));
            jsonObj.addProperty("Business_Unit",rs.getString(9));
            jsonObj.addProperty("Preliminary_CBA",rs.getString(10));
            jsonObj.addProperty("Funding_Available",rs.getString(11));
            jsonObj.addProperty("Program_Funder",rs.getString(12));
            jsonObj.addProperty("Project_Portfolio_Information",rs.getString(13));
            jsonObj.addProperty("Project_Decomission_Date",rs.getString(14));
            jsonObj.addProperty("Infrastructure_Impact",rs.getString(15));
            jsonObj.addProperty("Number_of_Infrastructure_Components",rs.getString(16));
            jsonObj.addProperty("Archival_Solution",rs.getString(17));
            jsonObj.addProperty("Status_Notes",rs.getString(18));
            jsonObj.addProperty("EDR_Analyst",rs.getString(19));
            jsonObj.addProperty("Big_Rock",rs.getString(20));

            jsonArray.add(jsonObj);
        }
    }
    protected void reportMapping2(ResultSet rs, JsonArray jsonArray) throws SQLException {
        while(rs.next()) {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("ID",rs.getString(1));
            jsonObj.addProperty("Application_Name",rs.getString(2));
            jsonObj.addProperty("Application_Owner",rs.getString(3));
            jsonObj.addProperty("status",rs.getString(4));
            jsonObj.addProperty("Project_Portfolio_Information",rs.getString(5));
            jsonObj.addProperty("Funding_Available",rs.getString(6));
            jsonObj.addProperty("Application_Details",rs.getString(7));
            jsonObj.addProperty("Target_Date",rs.getString(8));
            jsonObj.addProperty("Readonly_Date",rs.getString(9));
            jsonObj.addProperty("Database_type",rs.getString(10));
            jsonObj.addProperty("Data_Type_Characteristics",rs.getString(11));
            jsonObj.addProperty("Structured_Data_In_GB",rs.getString(12));
            jsonObj.addProperty("Structured_Data_Number_of_tables",rs.getString(13));
            jsonObj.addProperty("Unstructured_Data_In_GB",rs.getString(14));
            jsonObj.addProperty("Unstructured_Data_files",rs.getString(15));
            jsonObj.addProperty("Database_Server_Name",rs.getString(16));
            jsonObj.addProperty("Database_Name",rs.getString(17));
            jsonObj.addProperty("Table_Names",rs.getString(18));
            jsonObj.addProperty("DBA_Contact",rs.getString(19));

            jsonArray.add(jsonObj);
        }
    }

    protected void reportMapping3(ResultSet rs, JsonArray jsonArray) throws SQLException {
        while (rs.next()) {
            JsonObject reportObj = new JsonObject();
            reportObj.addProperty("Id", rs.getString(1));
            reportObj.addProperty("Legacy_Appliction_Name", rs.getString(2));
            reportObj.addProperty("Source_Platform_Databases", rs.getString(3));
            reportObj.addProperty("Legacy_App_Description", rs.getString(4));
            reportObj.addProperty("Read_Only_Date", rs.getString(5));
            reportObj.addProperty("Is_Application_The_Only_Source_Of_Truth_For_The_Data", rs.getString(6));
            reportObj.addProperty("Legacy_Application_Hosted_Internally_Or_With_Third_Party_Vendor", rs.getString(7));
            reportObj.addProperty("Total_Data_Size", rs.getString(8));
            reportObj.addProperty("Retention_Period", rs.getString(9));

            jsonArray.add(reportObj);
        }
    }

}

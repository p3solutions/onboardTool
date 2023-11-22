package governance.ReportGeneration.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class ReportGenerationSearchService {

    public JsonObject reportcolumnname(String reportName) {
        JsonArray jsonArray = new JsonArray();

        try {
        	DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");

            String query = "DESC " + reportName.toLowerCase() + ";";
            
            try (PreparedStatement st = connection.prepareStatement(query);
                 ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    JsonObject jsonObj = new JsonObject();
                    jsonObj.addProperty("Field", rs.getString(1));
                    jsonArray.add(jsonObj);
                }

            } // try-with-resources automatically closes the statement and result set

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        JsonObject result = new JsonObject();
        result.add("data", jsonArray);

        System.out.println("JSON Service Pagination: " + result);
        return result;
    }

	public JsonObject searchdata(String reportName, String page, String maxRows, String columnName,
			String searchValue) {
		PreparedStatement st = null;
        ResultSet rs = null;
        int totalCount = 0;
//        int Page = Integer.parseInt(page);
//        int MaxRows = Integer.parseInt(maxRows);
        JsonArray jsonArray = new JsonArray();
        if(reportName.equalsIgnoreCase("Intake_Report_1")) {
        	
        try {
        	System.out.println("Intake Report 1");
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            
//            int start = (Page - 1) * MaxRows;
            
            String query = "SELECT * FROM decom3sixtytool.Intake_Report_1 where "+columnName+" like ? LIMIT 1,10;";
            st = connection.prepareStatement(query);
            st.setString(1, "%"+searchValue+"%");
//            st.setInt(2, start);
//            st.setInt(3, MaxRows);
            
            System.out.println("Query :"+query);
            

            rs = st.executeQuery();

            while (rs.next()) {
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
                jsonObj.addProperty("Data_Read_only_State",rs.getString(21));
                jsonObj.addProperty("Application_Status",rs.getString(22));
                jsonObj.addProperty("Phase_Status",rs.getString(23));
                jsonArray.add(jsonObj);
            }
            String countQuery = "SELECT COUNT("+columnName+") AS total FROM decom3sixtytool.Intake_Report_1 Where "+columnName+" Like ?";
            st = connection.prepareStatement(countQuery);
            st.setString(1, "%"+searchValue+"%");
            rs = st.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt("total");
            }
            st.close();
            rs.close();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        }
        else if(reportName.equalsIgnoreCase("Intake_Report_2")) {
        	 try {
                 DBconnection dBconnection = new DBconnection();
                 Connection connection = (Connection) dBconnection.getConnection();
                 System.out.println("Connected...");
                 
//                 int start = (Page - 1) * MaxRows;
                 String query = "SELECT * FROM decom3sixtytool.Intake_Report_2 where "+columnName+" like ? LIMIT 1,10;";
                 st = connection.prepareStatement(query);
                 st.setString(1, "%"+searchValue+"%");
//                 st.setInt(2, start);
//                 st.setInt(3, MaxRows);
                 rs = st.executeQuery();

                 while (rs.next()) {
                	 JsonObject jsonObj = new JsonObject();
                     jsonObj.addProperty("Application_Name",rs.getString(1));
                     jsonObj.addProperty("Application_Owner",rs.getString(2));
                     jsonObj.addProperty("status",rs.getString(3));
                     jsonObj.addProperty("Project_Portfolio_Information",rs.getString(4));
                     jsonObj.addProperty("Funding_Available",rs.getString(5));
                     jsonObj.addProperty("Application_Details",rs.getString(6));
                     jsonObj.addProperty("Target_Date",rs.getString(7));
                     jsonObj.addProperty("Readonly_Date",rs.getString(8));
                     jsonObj.addProperty("Database_type",rs.getString(9));
                     jsonObj.addProperty("Data_Type_Characteristics",rs.getString(10));
                     jsonObj.addProperty("Structured_Data_In_GB",rs.getString(11));
                     jsonObj.addProperty("Structured_Data_Number_of_tables",rs.getString(12));
                     jsonObj.addProperty("Unstructured_Data_In_GB",rs.getString(13));
                     jsonObj.addProperty("Unstructured_Data_files",rs.getString(14));
                     jsonObj.addProperty("Database_Server_Name",rs.getString(15));
                     jsonObj.addProperty("Database_Name",rs.getString(16));
                     jsonObj.addProperty("Table_Names",rs.getString(17));
                     jsonObj.addProperty("DBA_Contact",rs.getString(18));
                     jsonObj.addProperty("Encryption",rs.getString(19));
                     jsonObj.addProperty("Data_Masking",rs.getString(20));
                     jsonArray.add(jsonObj);
                 }
                 String countQuery = "SELECT COUNT(*) AS total FROM decom3sixtytool.Intake_Report_2";
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
        }
        else if(reportName.equalsIgnoreCase("Intake_Report_3")) {
        	try {
                DBconnection dBconnection = new DBconnection();
                Connection connection = (Connection) dBconnection.getConnection();
                System.out.println("Connected...");
                
//                int start = (Page - 1) * MaxRows;
                String query = "SELECT * FROM decom3sixtytool.Intake_Report_3 where "+columnName+" like ? LIMIT ?,?;";
                st = connection.prepareStatement(query);
                st.setString(1, "%"+searchValue+"%");
//                st.setInt(2, start);
//                st.setInt(3, MaxRows);
                rs = st.executeQuery();

                while (rs.next()) {
               	 JsonObject jsonObj = new JsonObject();
                    jsonObj.addProperty("Legacy_Application_Name", rs.getString(1));
                    jsonObj.addProperty("SourcePlatform_Databases", rs.getString(2));
                    jsonObj.addProperty("Legacy_Application_Description", rs.getString(3));
                    jsonObj.addProperty("What_is_the_read_only_date", rs.getString(4));
                    jsonObj.addProperty("Is_this_application_the_only_source_of_truth_for_the_data", rs.getString(5));
                    jsonObj.addProperty("Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor", rs.getString(6));
                    jsonObj.addProperty("What_is_the_total_data_size", rs.getString(7));
                    jsonObj.addProperty("Retention_Period", rs.getString(8));
                    jsonArray.add(jsonObj);
                    
                }
                String countQuery = "SELECT COUNT(*) AS total FROM decom3sixtytool.Intake_Report_3";
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
        }
        JsonObject result = new JsonObject();
        result.addProperty("total", totalCount);
        result.add("data", jsonArray);

        System.out.println("JSON Service Pagination : " + result);
        return result;
	}
}
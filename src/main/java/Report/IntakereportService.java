package Report;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IntakereportService {

        public JsonObject getIntakeReport1(int page, int maxRows) throws SQLException {

            PreparedStatement st=null;
            ResultSet rs=null;

            DBconnection dBconnection = null;
            Connection connection = null;
            JsonArray jsonArray = new JsonArray();
            int totalCount = 0;
            try {

                dBconnection = new DBconnection();
                connection = (Connection) dBconnection.getConnection();
                int start = (page - 1) * maxRows;

                String selectQuery = "SELECT * FROM decom3sixtytool.ApplicationDataView1 LIMIT ?, ?";
                st = connection.prepareStatement(selectQuery);
                st.setInt(1, start);
                st.setInt(2, maxRows);
                rs = st.executeQuery();

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
                String countQuery = "SELECT COUNT(*) AS total FROM decom3sixtytool.ApplicationDataView1";
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
    public JsonObject getIntakeReport2(int page, int maxRows) throws SQLException {

        PreparedStatement st=null;
        ResultSet rs=null;

        DBconnection dBconnection = null;
        Connection connection = null;
        JsonArray jsonArray = new JsonArray();
        int totalCount = 0;

        try {

            dBconnection = new DBconnection();
            connection = (Connection) dBconnection.getConnection();

            int start = (page - 1) * maxRows;

            String selectQuery = "SELECT * FROM decom3sixtytool.ApplicationDataView2 LIMIT ?, ?";
            st = connection.prepareStatement(selectQuery);
            st.setInt(1, start);
            st.setInt(2, maxRows);
            rs = st.executeQuery();

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
            String countQuery = "SELECT COUNT(*) AS total FROM decom3sixtytool.ApplicationDataView2";
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
    public JsonObject getIntakeReport3(int page, int maxRows) throws SQLException {

        PreparedStatement st = null;
        ResultSet rs = null;

        DBconnection dBconnection = null;
        Connection connection = null;
        int totalCount = 0;

        int start = (page - 1) * maxRows;

        JsonArray jsonArray = new JsonArray();
        availabilityOfView availabilityOfView = new availabilityOfView();
        boolean viewAvaliable = availabilityOfView.Report3View();
        if (viewAvaliable) {
            try {


                dBconnection = new DBconnection();
                connection = (Connection) dBconnection.getConnection();

                String selectQuery = "SELECT * FROM decom3sixtytool.ApplicationDataView3  LIMIT ?, ?";
                st = connection.prepareStatement(selectQuery);
                st.setInt(1, start);
                st.setInt(2, maxRows);
                rs = st.executeQuery();

                while (rs.next()) {
                    JsonObject reportObj = new JsonObject();

                    reportObj.addProperty("Legacy_Application_Name", rs.getString(2));
                    reportObj.addProperty("SourcePlatform_Databases", rs.getString(3));
                    reportObj.addProperty("Legacy_Application_Description", rs.getString(4));
                    reportObj.addProperty("What_is_the_read_only_date", rs.getString(5));
                    reportObj.addProperty("Is_this_application_the_only_source_of_truth_for_the_data", rs.getString(6));
                    reportObj.addProperty("Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor", rs.getString(7));
                    reportObj.addProperty("What_is_the_total_data_size", rs.getString(8));
                    reportObj.addProperty("Retention_Period", rs.getString(9));

                    jsonArray.add(reportObj);
                }
                String countQuery = "SELECT COUNT(*) AS total FROM decom3sixtytool.ApplicationDataView3";
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

        }
        JsonObject result = new JsonObject();
        result.addProperty("total", totalCount);
        result.add("data", jsonArray);

        System.out.println("JSON" + result);
        return result;
    }
        public JsonObject getIntakeReport4 (int page, int maxRows) throws SQLException {

            PreparedStatement st = null;
            ResultSet rs = null;

            DBconnection dBconnection = null;
            Connection connection = null;
            int totalCount = 0;

            int start = (page - 1) * maxRows;

            JsonArray jsonArray = new JsonArray();
            try {

                dBconnection = new DBconnection();
                connection = (Connection) dBconnection.getConnection();

                String selectQuery = "SELECT * FROM decom3sixtytool.ApplicationDataView4 LIMIT ?, ?";
                st = connection.prepareStatement(selectQuery);
                st.setInt(1, start);
                st.setInt(2, maxRows);
                rs = st.executeQuery();

                while (rs.next()) {
                    JsonObject reportObj = new JsonObject();

                    reportObj.addProperty("Legacy_Application_Name", rs.getString(2));
                    reportObj.addProperty("SourcePlatform_Databases", rs.getString(3));
                    reportObj.addProperty("Legacy_Application_Description", rs.getString(4));
                    reportObj.addProperty("What_is_the_read_only_date", rs.getString(5));
                    reportObj.addProperty("Is_this_application_the_only_source_of_truth_for_the_data", rs.getString(6));
                    reportObj.addProperty("Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor", rs.getString(7));
                    reportObj.addProperty("What_is_the_total_data_size", rs.getString(8));
                    reportObj.addProperty("Retention_Period", rs.getString(9));

                    jsonArray.add(reportObj);
                }
                String countQuery = "SELECT COUNT(*) AS total FROM decom3sixtytool.ApplicationDataView4";
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




package compliance_module_service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

public class IntakeReport3Service {

    public JsonArray getReportDetails() {
    	
        JsonArray jsonArray = new JsonArray();

        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("connected to............Intake Report 3");
            String query = "SELECT * FROM decom3sixtytool.requirementreports;";
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                JsonObject reportObj = new JsonObject();
               
                reportObj.addProperty("Legacy_Application_Name", rs.getString("Legacy_Application_Name"));
                reportObj.addProperty("SourcePlatform_Databases", rs.getString("SourcePlatform_Databases"));
                reportObj.addProperty("Legacy_Application_Description", rs.getString("Legacy_Application_Description"));
                reportObj.addProperty("What_is_the_read_only_date", rs.getString("What_is_the_read_only_date"));
                reportObj.addProperty("Is_this_application_the_only_source_of_truth_for_the_data", rs.getString("Is_this_application_the_only_source_of_truth_for_the_data"));
                reportObj.addProperty("Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor", rs.getString("Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor"));
                reportObj.addProperty("What_is_the_total_data_size", rs.getString("What_is_the_total_data_size"));
                reportObj.addProperty("Retention_Period", rs.getString("Retention_Period"));

                jsonArray.add(reportObj);
                
               
            }

            rs.close();
            st.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("JSON Service : "+jsonArray);
        return jsonArray;
    }
}

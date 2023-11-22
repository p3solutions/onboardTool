package compliance.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class IntakeReportService {

 

    public JsonArray ReportDetails(String ReportName,int Limit,int offset) throws SQLException {
    	PreparedStatement st=null;
    	ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
        String IntakeReportName = ReportName;
        String limit=Integer.toString(Limit);
      String Offset=Integer.toString(offset);
       
     
        try {
    	
    
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected... in intake2Service");
        if (IntakeReportName.equalsIgnoreCase("Intake_Report_2"))
        {
        	
        	   System.out.println("I am in intake report2");
        	
        		    // Execute a query to get the total count
        		    String countQuery = "SELECT COUNT(*) AS total_count FROM decom3sixtytool.IntakeReport2";
        		    st = connection.prepareStatement(countQuery);
        		    ResultSet countResult = st.executeQuery();
        		    int totalCount = 0;

        		    if (countResult.next()) {
        		        totalCount = countResult.getInt("total_count");
        		    }

        		    // Execute the original query to fetch paginated data
        		    String selectQuery = "SELECT * FROM decom3sixtytool.IntakeReport2 ORDER BY Application_Name LIMIT " + limit + " OFFSET " + offset;
        		    st = connection.prepareStatement(selectQuery);
        		    rs = st.executeQuery();

        		   
        		    while (rs.next()) {
        		        JsonObject jsonObj = new JsonObject();
        		        // Your existing code to populate jsonObj goes here
        		        jsonObj.addProperty("Application_Name", rs.getString(1));
        		        jsonObj.addProperty("Application_Owner", rs.getString(2));
        		        jsonObj.addProperty("status", rs.getString(3));
        		        jsonObj.addProperty("Project_Portfolio_Information", rs.getString(4));
        		        jsonObj.addProperty("Funding_Available", rs.getString(5));
        		        jsonObj.addProperty("Application_Details", rs.getString(6));
        		        jsonObj.addProperty("Target_Date", rs.getString(7));
        		        jsonObj.addProperty("Readonly_Date", rs.getString(8));
        		        jsonObj.addProperty("Database_type", rs.getString(9));
        		        jsonObj.addProperty("Data_Type_Characteristics", rs.getString(10));
        		        jsonObj.addProperty("Structured_Data_In_GB", rs.getString(11));
        		        jsonObj.addProperty("Structured_Data_Number_of_tables", rs.getString(12));
        		        jsonObj.addProperty("Unstructured_Data_In_GB", rs.getString(13));
        		        jsonObj.addProperty("Unstructured_Data_files", rs.getString(14));
        		        jsonObj.addProperty("Database_Server_Name", rs.getString(15));
        		        jsonObj.addProperty("Database_Name", rs.getString(16));
        		        jsonObj.addProperty("Table_Names", rs.getString(17));
        		        jsonObj.addProperty("DBA_Contact", rs.getString(18));
        		        jsonObj.addProperty("Encryption", rs.getString(19));
        		        jsonObj.addProperty("Data_Masking", rs.getString(20));
        		        jsonArray.add(jsonObj);
        		    }

        		    // Now you can include the total count in your response
        		    JsonObject response = new JsonObject();
        		    System.out.println("the total count"+totalCount);
        		    response.addProperty("total_count", totalCount);
        		    response.add("data", jsonArray);
        		  
        		    st.close();
        	        rs.close();  }
       

        else if (IntakeReportName.equalsIgnoreCase("Intake_Report_1"))
        {
        	System.out.println("I am in intake report1");
        String selectQuery = "select *  from decom3sixtytool.IntakeReport1 ORDER BY Application_Name limit "+limit+" OFFSET "+Offset+" ";
        st = connection.prepareStatement(selectQuery);
        rs = st.executeQuery();
        while(rs.next())
        {
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
        st.close(); 
        rs.close();
        }
        else if (IntakeReportName.equalsIgnoreCase("Intake_Report_3")) {
        	System.out.println("I am in intake report3");
        String query = "SELECT * FROM decom3sixtytool.IntakeReport3 ORDER BY Legacy_Application_Name limit "+limit+" OFFSET "+Offset+"";
         st = connection.prepareStatement(query);
         rs = st.executeQuery();

 

 

 

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
    }else {
    	System.out.println("the requested report is not found");
    }

 

    }
catch(Exception e)
    {
    System.out.println("Execption Occurs");
    }
    System.out.println("JSONNext from service"+jsonArray);
    return jsonArray;
}

 

 

 

	
}
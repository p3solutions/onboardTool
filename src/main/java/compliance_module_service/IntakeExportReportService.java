package compliance_module_service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class IntakeExportReportService {
	public  JsonArray fetchReportDetails1() {
		System.out.println("=========IntakeReport 1===========");
		PreparedStatement st=null;
		ResultSet rs=null;
	    JsonArray jsonArray1 = new JsonArray();
	    try {
	    //String random_id = generateRandomApprovalId();
	        DBconnection dBconnection = new DBconnection();
	        Connection connection = (Connection) dBconnection.getConnection();
	        System.out.println("Connected... in intake1Service");
	        String selectQuery = "SELECT * FROM decom3sixtytool.IntakeReport1;";
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



	        jsonArray1.add(jsonObj);
	      }
	      st.close();
	      rs.close();
	      connection.close();
	   }
	   catch(Exception e)
	{
	System.out.println("Execption Occurs");
	}
	System.out.println("JSONNext :"+jsonArray1);
	return jsonArray1;
	}

    
  public JsonArray fetchReportDetails2() {
	System.out.println("=========IntakeReport 2===========");
	PreparedStatement st=null;
	ResultSet rs=null;
    JsonArray jsonArray2 = new JsonArray();
    try {
    //String random_id = generateRandomApprovalId();
       DBconnection dBconnection = new DBconnection();
       Connection connection = (Connection) dBconnection.getConnection();
       System.out.println("Connected... in intake2Service");
       String selectQuery = "select * from decom3sixtytool.IntakeReport2";
       st = connection.prepareStatement(selectQuery);
       rs = st.executeQuery();
    while(rs.next())
    {
        JsonObject jsonObj = new JsonObject();
        
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





        jsonArray2.add(jsonObj);
   }
    st.close();
    rs.close();
    connection.close();
  }
  catch(Exception e)
  {
    System.out.println("Execption Occurs");
  }
  System.out.println("JSONNext from service:"+jsonArray2);
  return jsonArray2;
  }
  
  public JsonArray fetchReportDetails3() {
	  System.out.println("=========IntakeReport 3===========");
      JsonArray jsonArray3 = new JsonArray();

      try {
          DBconnection dBconnection = new DBconnection();
          Connection connection = (Connection) dBconnection.getConnection();
          System.out.println("connected to............Intake Report 3");
          String query = "SELECT * FROM decom3sixtytool.requirementreports;";
          PreparedStatement st = connection.prepareStatement(query);
          ResultSet rs = st.executeQuery();

          while (rs.next()) {
              JsonObject jsonObj = new JsonObject();
              
              jsonObj.addProperty("Legacy_Application_Name", rs.getString("Legacy_Application_Name"));
              jsonObj.addProperty("SourcePlatform_Databases", rs.getString("SourcePlatform_Databases"));
              jsonObj.addProperty("Legacy_Application_Description", rs.getString("Legacy_Application_Description"));
              jsonObj.addProperty("What_is_the_read_only_date", rs.getString("What_is_the_read_only_date"));
              jsonObj.addProperty("Is_this_application_the_only_source_of_truth_for_the_data", rs.getString("Is_this_application_the_only_source_of_truth_for_the_data"));
              jsonObj.addProperty("Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor", rs.getString("Isthelegacyapplicationhostedinternallyorwithanthirdpartyvendor"));
              jsonObj.addProperty("What_is_the_total_data_size", rs.getString("What_is_the_total_data_size"));
              jsonObj.addProperty("Retention_Period", rs.getString("Retention_Period"));

              jsonArray3.add(jsonObj);
          }

          rs.close();
          st.close();
          connection.close();
      } catch (Exception e) {
          e.printStackTrace();
      }
      System.out.println("JSON Service3 : "+jsonArray3);
      return jsonArray3;
  }


  
 



 

}

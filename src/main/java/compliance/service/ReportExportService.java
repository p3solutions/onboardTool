package compliance.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class ReportExportService {

	public JsonArray fetchExportDataForIntakeReport1(String reportName) {
		PreparedStatement st = null;
        ResultSet rs = null;
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            
            String query = "SELECT * FROM Intake;";
            st = connection.prepareStatement(query);
           
            rs = st.executeQuery();

            while (rs.next()) {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("Application Id",rs.getString(1));
                jsonObj.addProperty("Application Name",rs.getString(2));
                jsonObj.addProperty("Creation Date",rs.getString(3));
                jsonObj.addProperty("Status",rs.getString(4));
                jsonObj.addProperty("Request Type",rs.getString(5));
                jsonObj.addProperty("Requester",rs.getString(6));
                jsonObj.addProperty("Application Owner",rs.getString(7));
                jsonObj.addProperty("Business Segment",rs.getString(8));
                jsonObj.addProperty("Business Unit",rs.getString(9));
                jsonObj.addProperty("Preliminary CBA",rs.getString(10));
                jsonObj.addProperty("Funding Available",rs.getString(11));
                jsonObj.addProperty("Program Funder",rs.getString(12));
                jsonObj.addProperty("Project Portfolio Information",rs.getString(13));
                jsonObj.addProperty("Project Decomission Date",rs.getString(14));
                jsonObj.addProperty("Infrastructure Impact",rs.getString(15));
                jsonObj.addProperty("Number of Infrastructure Components",rs.getString(16));
                jsonObj.addProperty("Archival Solution",rs.getString(17));
                jsonObj.addProperty("Status Notes",rs.getString(18));
                jsonObj.addProperty("EDR Analyst",rs.getString(19));
                jsonObj.addProperty("Big Rock",rs.getString(20));
                jsonObj.addProperty("Data Read only State",rs.getString(21));
                jsonObj.addProperty("Application Status",rs.getString(22));
                jsonObj.addProperty("Phase Status",rs.getString(23));
                jsonArray.add(jsonObj);
            }
            st.close();
            rs.close();
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
       

        System.out.println("JSON Export Service Pagination : " + jsonArray);
        return jsonArray;
	}

	public JsonArray fetchExportDataForIntakeReport2(String reportName) {
		PreparedStatement st = null;
        ResultSet rs = null;
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            
            String query = "SELECT * FROM Intake-Triage;";
            st = connection.prepareStatement(query);
           
            rs = st.executeQuery();

            while (rs.next()) {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("Application Name",rs.getString(1));
                jsonObj.addProperty("Application Owner",rs.getString(2));
                jsonObj.addProperty("status",rs.getString(3));
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
                jsonObj.addProperty("Phase Status",rs.getString(21));
                jsonArray.add(jsonObj);
            }
            st.close();
            rs.close();
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
       

        System.out.println("JSON Export Service Pagination : " + jsonArray);
        return jsonArray;
		
	}

	public JsonArray fetchExportDataForIntakeReport3(String reportName) {
		PreparedStatement st = null;
        ResultSet rs = null;
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            
            String query = "SELECT * FROM Requirements;";
            st = connection.prepareStatement(query);
           
            rs = st.executeQuery();

            while (rs.next()) {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("Legacy Application Name", rs.getString(1));
                jsonObj.addProperty("Source Platform Databases", rs.getString(2));
                jsonObj.addProperty("Legacy Application Description", rs.getString(3));
                jsonObj.addProperty("What is the read only date", rs.getString(4));
                jsonObj.addProperty("Is this application the only source of truth for the data", rs.getString(5));
                jsonObj.addProperty("Is the legacy application hosted internally or with an third party vendor", rs.getString(6));
                jsonObj.addProperty("What is the total data size", rs.getString(7));
                jsonObj.addProperty("Retention Period", rs.getString(8));
                jsonObj.addProperty("Phase Status",rs.getString(9));
                jsonArray.add(jsonObj);
            }
            st.close();
            rs.close();
            
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
       

        System.out.println("JSON Export Service Pagination : " + jsonArray);
        return jsonArray;
		
	}

	

	
	

}

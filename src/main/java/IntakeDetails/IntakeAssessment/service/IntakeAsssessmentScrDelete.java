package IntakeDetails.IntakeAssessment.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class IntakeAsssessmentScrDelete {
	 public static JsonObject delete_screenshots(String Id,String File_Name) {
	        JsonObject jsonobj = new JsonObject();
	    try {
	        DBconnection dBconnection = new DBconnection();
	        Connection connection = (Connection) dBconnection.getConnection();
	        System.out.println("DB Connected...");
	        String delete_query = "delete from intake_assessment_application_info_doc where AppId=? and File_Name=?;";
	        PreparedStatement st2=connection.prepareStatement(delete_query);
	        st2.setString(1, Id);
	        st2.setString(2, File_Name);
	        st2.executeUpdate();
	        System.out.println("Deleted File : "+File_Name);
	        jsonobj.addProperty("Deleted File Name : ", File_Name);
	        connection.close();   
	    }
	    
	    catch(Exception e)
	    {
	    System.out.println("Execption Occurs"+e);
	    }
	    return jsonobj;
	    }
}

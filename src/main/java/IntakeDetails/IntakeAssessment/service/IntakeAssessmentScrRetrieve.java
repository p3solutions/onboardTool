package IntakeDetails.IntakeAssessment.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class  IntakeAssessmentScrRetrieve {
public JsonArray intake_screenshot_retrieve(String Id) {
		
        JsonArray jsonArray = new JsonArray();
    try {
        //String random_id = generateRandomApprovalId();
    	
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected...");
        String selectQuery = "select AppId,File_Name from intake_assessment_application_info_doc where AppId=?";
        PreparedStatement st=connection.prepareStatement(selectQuery);
        st.setString(1, Id);
        ResultSet rs = st.executeQuery();
        while(rs.next())
        {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("AppId",rs.getString(1));
            jsonObj.addProperty("File_Name",rs.getString(2));
            jsonArray.add(jsonObj);
            System.out.println("Intake Assessment Screenshot : "+jsonObj);
           
       } 
        connection.close();    
    }
    
catch(Exception e)
    {
    System.out.println("Execption Occurs"+e);
    }
    System.out.println("INTAKE ASSESSMENT SCREENSHOT JSON ARRAY"+jsonArray);
    return jsonArray;
}

}

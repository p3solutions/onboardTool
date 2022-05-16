package NewArchiveRequirements.LegacyApplicationInfo.legacyAppScreenshot.service;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import onboard.DBconnection;

public class Legacy_App_Scr_Retrieve {
	public JsonArray screenshot_retrieve(String Id) {
		
        JsonArray jsonArray = new JsonArray();
    try {
     	
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected...");
        String selectQuery = "select AppId,File_Name from legacy_application_screenshot where AppId=?";
        PreparedStatement st=connection.prepareStatement(selectQuery);
        st.setString(1, Id);
        ResultSet rs = st.executeQuery();
        while(rs.next())
        {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("AppId",rs.getString(1));
            jsonObj.addProperty("File_Name",rs.getString(2));
            jsonArray.add(jsonObj);
           
           
       }    
    }
catch(Exception e)
    {
    System.out.println("Execption Occurs");
    }
    System.out.println("JSON"+jsonArray);
    return jsonArray;
}

}

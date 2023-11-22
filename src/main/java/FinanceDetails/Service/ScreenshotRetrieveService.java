package FinanceDetails.Service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import onboard.DBconnection;

public class ScreenshotRetrieveService {
public JsonArray ScreenshotDetailsRetrieve(String Id) {
		
        JsonArray jsonArray = new JsonArray();
    try {
       
    	String id=Id;
    	System.out.println("From The Service"+id);
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected...");
        String selectQuery = "select AppId,File_Name from Finance_Uploaded_Documents where Seq_num=?";
        PreparedStatement st=connection.prepareStatement(selectQuery);
        st.setString(1, Id);
        ResultSet rs = st.executeQuery();
        while(rs.next())
        {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("AppId",rs.getString(1));
            jsonObj.addProperty("File_Name",rs.getString(2));
            jsonArray.add(jsonObj);
            System.out.println(" Screenshot : "+jsonObj);
           
       } 
        connection.close();    
    }
    
catch(Exception e)
    {
    System.out.println("Execption Occurs"+e);
    }
    System.out.println(" JSON ARRAY"+jsonArray);
    return jsonArray;
}

}

package Finance.FinanceScreenshot.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import logger.System;

public class Finance_Screen_Retrieve {
    public JsonArray screenshot_retrieve(String Id) {

        JsonArray jsonArray = new JsonArray();
        try {

            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            String selectQuery = "select AppId,File_Name from finance_application_screenshot where AppId=?";
            PreparedStatement st=connection.prepareStatement(selectQuery);
            st.setString(1, Id);
            ResultSet rs = st.executeQuery();
            while(rs.next())
            {
                JsonObject jsonObj = new JsonObject();
                jsonObj.addProperty("AppId",rs.getString(1));
                jsonObj.addProperty("File_Name",rs.getString(2));
                jsonArray.add(jsonObj);
                System.out.println("Data Fetched.."+jsonObj);
            }
            connection.close();
        }
        catch(Exception e)
        {
            System.out.println("Execption Occurs"+e);
        }
        System.out.println("Legacy Application Screenshots : "+jsonArray);
        return jsonArray;
    }

}

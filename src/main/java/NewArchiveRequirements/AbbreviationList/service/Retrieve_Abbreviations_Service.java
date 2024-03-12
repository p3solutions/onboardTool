package NewArchiveRequirements.AbbreviationList.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class Retrieve_Abbreviations_Service {
    public JsonArray retrieve_abbreviations(String id) {
    	PreparedStatement st=null;
    	ResultSet rs=null;
        JsonArray jsonArray = new JsonArray();
    try {
        //String random_id = generateRandomApprovalId();
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected...");
		boolean checkData = false;
        String selectQuery = "select seq_no,random_id,app_id,abbreviation_acronym,description from archivereq_abbreviations_info_details where app_id=? order by seq_no";
        st = connection.prepareStatement(selectQuery);
        st.setString(1,id);
        rs = st.executeQuery();
        while(rs.next())
        {
        	checkData = true;
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("checkData",checkData);
            jsonObj.addProperty("seq_no",rs.getString(1));
            jsonObj.addProperty("random_id",rs.getString(2));
            jsonObj.addProperty("app_id",rs.getString(3));
            jsonObj.addProperty("abbreviation_acronym",rs.getString(4));
            jsonObj.addProperty("description",rs.getString(5));
            jsonArray.add(jsonObj);
            System.out.println("JSON ARRAY:"+jsonArray);
       }
        if(!checkData)
		{
        	JsonObject jsonObject = new JsonObject();
			jsonObject.addProperty("checkData",checkData);
			jsonArray.add(jsonObject);
		}

        st.close();
        rs.close();
    }
catch(Exception e)
    {
    System.out.println("Exception Occurs");
    }
    System.out.println("JSON"+jsonArray);
    return jsonArray;
}


}

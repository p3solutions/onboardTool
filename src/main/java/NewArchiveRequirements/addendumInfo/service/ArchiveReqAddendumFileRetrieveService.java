package NewArchiveRequirements.addendumInfo.service;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;


import onboard.DBconnection;
import logger.System;

public class ArchiveReqAddendumFileRetrieveService {
	public JsonArray file_retrieve(String Id,String Section_no) {
		
        JsonArray jsonArray = new JsonArray();
    try {
     	
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected...");
        String selectQuery = "select seq_num,section_no,oppId,File_Name from decom3sixtytool.archive_req_addendum_fileupload where oppId=? and section_no=?";
        PreparedStatement st=connection.prepareStatement(selectQuery);
        st.setString(1, Id);
        st.setString(2, Section_no);
        ResultSet rs = st.executeQuery();
        while(rs.next())
        {
            JsonObject jsonObj = new JsonObject();
            jsonObj.addProperty("seq_num",rs.getInt(1));
            jsonObj.addProperty("section_no",rs.getInt(2));
            jsonObj.addProperty("oppId",rs.getString(3));
            jsonObj.addProperty("File_Name",rs.getString(4));
            jsonArray.add(jsonObj);
            System.out.println("Data Fetched..."+jsonObj); 
       }
        connection.close();
    }
catch(Exception e)
    {
    System.out.println("Exception Occurs"+e);
    }
    System.out.println("Addendum File Json Array : "+jsonArray);
    return jsonArray;
}

}

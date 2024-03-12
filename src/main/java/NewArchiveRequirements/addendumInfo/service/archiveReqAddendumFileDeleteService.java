package NewArchiveRequirements.addendumInfo.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

public class archiveReqAddendumFileDeleteService {

	public static JsonObject delete_uploaded_files(String id, String seq_no, String section_no, String file_Name) {
	        JsonObject jsonobj = new JsonObject();
	    try {
	        DBconnection dBconnection = new DBconnection();
	        Connection connection = (Connection) dBconnection.getConnection();
	        System.out.println("DB Connected...");
	        String delete_query = "delete from archive_req_addendum_fileupload where oppId=? and seq_num=? and section_no=? and File_Name=?;";
	        PreparedStatement st2=connection.prepareStatement(delete_query);
	        st2.setString(1, id);
	        st2.setString(2, seq_no);
	        st2.setString(3, section_no);
	        st2.setString(4, file_Name);
	        st2.execute();
	        System.out.println("File Deleted : "+file_Name);
	        jsonobj.addProperty("Deleted File : ", file_Name);
	        connection.close();
	        }
	    catch(Exception e)
	    {
	    System.out.println("Execption Occurs"+e);
	    }
	    return jsonobj;
	    }
}

package NewArchiveRequirements.AbbreviationList.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class Update_Abbreviation_Service {
    public static JsonObject update_Abbreviation(String app_id,String random_id,String abbreviation_acronym_modify,String description_modify) {
        JsonObject jsonobj = new JsonObject();
    try {
        DBconnection dBconnection = new DBconnection();
        int uabbcount=0,udescount=0;
        String prev_abb="",prev_des="";
        boolean partial_update_flag=false;
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected...");
		System.out.println("RANDOM ID : "+random_id);
        	   String update_query = "update archivereq_abbreviations_info_details set abbreviation_acronym =?,description=? where seq_no =?;";
               PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
               preparedStmt1.setString(1, abbreviation_acronym_modify);
               preparedStmt1.setString(2, description_modify);
               preparedStmt1.setString(3, random_id);
            // preparedStmt1.setString(4, app_id);
               preparedStmt1.execute();
               jsonobj.addProperty("partial_update", "Success");		
    }
    catch(Exception e)
        {
        System.out.println("Exception Occurs");
        }
        return jsonobj;
    }
    }
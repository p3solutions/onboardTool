package NewArchiveRequirements.AbbreviationList.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class Delete_Abbreviation_Service {
    public static JsonObject delete_abbreviation(String random_id) {
        JsonObject jsonobj = new JsonObject();
    try {
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("DB Connected...");
        String delete_query = "delete from archivereq_abbreviations_info_details where seq_no=?;";
        PreparedStatement st2=connection.prepareStatement(delete_query);
        st2.setString(1, random_id);
        st2.executeUpdate();
        System.out.println("Deleted");
        }
    catch(Exception e)
    {
    System.out.println("Exception Occurs");
    }
    return jsonobj;
    }
}
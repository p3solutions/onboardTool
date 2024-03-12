package admin_module_modify.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class Delete_users_service {
    public static JsonObject delete_users(String random_id) {
        JsonObject jsonobj = new JsonObject();
    try {
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("DB Connected...");
        String delete_query = "delete from users where random_id=?;";
        PreparedStatement st2=connection.prepareStatement(delete_query);
        st2.setString(1, random_id);
        st2.executeUpdate();
        System.out.println("Deleted");
        }
    catch(Exception e)
    {
    System.out.println("Execption Occurs");
    }
    return jsonobj;
    }
}
package admin_module_modify.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Objects;

import com.google.gson.JsonArray;
;
import onboard.DBconnection;
import org.apache.log4j.Logger;

public class Delete_users_service {
    private static Logger logger =  Logger.getRootLogger();
    public static JsonArray delete_users(String random_id , String userName) {
        JsonArray jsonArray = new JsonArray();
    try {
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("DB Connected...");
        String checkUser_Query = "SELECT random_id FROM users where uname = ? ;";
        PreparedStatement st1=connection.prepareStatement(checkUser_Query);
         st1.setString(1, userName);
        ResultSet resultSet = st1.executeQuery();
        String idToCompare = null;
        while (resultSet.next()){
            idToCompare=resultSet.getString(1);
        }
        if (!Objects.equals(idToCompare, random_id)){
            String delete_query = "delete from users where random_id=?;";
            PreparedStatement st2=connection.prepareStatement(delete_query);
            st2.setString(1, random_id);
            st2.executeUpdate();
            System.out.println("Deleted");
            jsonArray.add("deleted");
            logger.info("User Deleted " + userName);
        }
        else {
            System.out.println("User not Deleted");
            jsonArray.add("notdeleted");
            logger.error("User not Deleted "+ userName);
        }

    }

    catch(Exception e)
    {
        logger.debug("Delete user Error",e);
    System.out.println("Execution Occurs");
    }
    return jsonArray;
    }
}
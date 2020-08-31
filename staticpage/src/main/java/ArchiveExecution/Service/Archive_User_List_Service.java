package ArchiveExecution.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Archive_User_List_Service {
    final static Logger logger = Logger.getLogger(Archive_User_List_Service.class);

    public JsonObject ArchiveUserlist(String select_project) throws SQLException, ClassNotFoundException {
        JsonObject infoJson = new JsonObject();
        try
        {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String user_query ="select id,uname from admin_userdetails where projects like '%"+select_project+"%';";
            Statement user_st = connection.createStatement();
            ResultSet users_list = user_st.executeQuery(user_query);
            while(users_list.next())
            {
                String key = users_list.getString("id");
                String value = users_list.getString("uname");
                infoJson.addProperty(key, value);
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("Exception----------"+e);
        }
        return infoJson;
    }


}

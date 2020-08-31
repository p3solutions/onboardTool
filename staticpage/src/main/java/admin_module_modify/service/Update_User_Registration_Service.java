package admin_module_modify.service;

import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Update_User_Registration_Service {
    final static Logger logger = Logger.getLogger(Update_User_Registration_Service.class);

    public Update_User_Registration_Service Update_Service_Registration (String uname,String fname,String lname,String email_val,String project_id,String application_id,String id) {
        JsonObject infoJson = new JsonObject();
        //JSONArray jsonArray = new JSONArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            Statement st=connection.createStatement();
            String query = "update admin_userdetails set uname='" + uname + "',fname='" + fname + "',lname='" + lname + "',email='" + email_val + "',projects='" + project_id + "',application='" + application_id + "' where id='" + id + "'; ";
            st.executeUpdate(query);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;

    }


}




package adminmodule.service;

import admin_module_modify.servlet.Update_User_registration;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class Admin_Module_Service {
    final static Logger logger = Logger.getLogger(Admin_Module_Service.class);

    public JsonObject getproject_details() {
        String query2 = "select * from AppEmphazize_ProjectDetails";
        JsonObject infoJson = new JsonObject();
        try (Connection connection = new DBconnection().getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(query2);
        ) {
            while (resultSet.next()) {
                String field = resultSet.getString("id");
                String value = resultSet.getString("projectname");
                infoJson.addProperty(field, value);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return infoJson;
    }

    public JsonObject applications_info(String projectname) {
        JsonObject infoJson = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();

            String query2 = "select * from appemphazize_applicationinfo where prjname in (" + projectname + ");";
            Statement statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query2);
            while (rs.next()) {
                String key = rs.getString("id");
                String value = rs.getString("appname");
                infoJson.addProperty(key, value);
            }
            logger.info("json obj----->" + infoJson);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return infoJson;
    }
}

package authorization.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class Role_Details_Service {
    final static Logger logger = Logger.getLogger(Role_Details_Service.class);

    public JsonArray role_details() {
        //JsonObject infoJson = new JsonObject();
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String role_query = "select * from Role_Details";
            Statement statement = connection.createStatement();
            ResultSet users_list = statement.executeQuery(role_query);
          /*  while (users_list.next()) {
                String key = users_list.getString("id");
                String value = users_list.getString("role")+"  "+(users_list.getString("admin"))+"  "+(users_list.getString("app_emp"))+"  "+(users_list.getString("intake"))+"  "+(users_list.getString("arch_exe"))+"  "+(users_list.getString("decomm"))+"  "+(users_list.getString("prgm_governance"))+"  "+(users_list.getString("reporting"))+"  "+(users_list.getString("finance"));
                infoJson.addProperty(key, value);
                System.out.println("testing---->" + infoJson);
            }*/
            while (users_list.next()) {
                JsonObject infoJson = new JsonObject();
                int total_rows = users_list.getMetaData().getColumnCount();
                for (int i = 0; i < total_rows; i++) {
                    infoJson.addProperty(users_list.getMetaData().getColumnLabel(i + 1).toLowerCase(), users_list.getString(i + 1));
                }
                jsonArray.add(infoJson);
                logger.info("json array---->" + jsonArray);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }

}




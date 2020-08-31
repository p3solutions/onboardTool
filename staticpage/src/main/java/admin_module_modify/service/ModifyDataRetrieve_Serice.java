package admin_module_modify.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;
import org.json.JSONArray;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ModifyDataRetrieve_Serice {
    final static Logger logger = Logger.getLogger(ModifyDataRetrieve_Serice.class);

    public JsonArray getModify_List_of_User_Service(String id) {
        //JsonObject infoJson = new JsonObject();
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            Statement st = connection.createStatement();
            //String query="select * from admin_userdetails where id="+id+";";
            String query = "select  uname, fname, lname, email, projects, application, id from admin_userdetails where id=" + id + ";";
            ResultSet users_list = st.executeQuery(query);
           /* while(users_list.next())
            {
             String key=users_list.getString("id");
             String value=users_list.getString("uname") + "!" + users_list.getString("fname")+ "!" + users_list.getString("lname")+ "!" + users_list.getString("email")+ "!" + users_list.getString("projects")+ "!" + users_list.getString("application")+"!"+users_list.getString("id");
             infoJson.addProperty(key, value);
            }*/
            while (users_list.next()) {
                JsonObject infoJson = new JsonObject();
                int total_rows = users_list.getMetaData().getColumnCount();
                for (int i = 0; i < total_rows; i++) {

                    infoJson.addProperty(users_list.getMetaData().getColumnLabel(i + 1).toLowerCase(), users_list.getString(i + 1));
                }
                jsonArray.add(infoJson);
                logger.info("json array 1---->" + jsonArray);
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;

    }


}




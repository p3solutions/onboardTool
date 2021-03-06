package service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

public class ListUserService {
    final static Logger LOGGER = Logger.getLogger(ListUserService.class);

    public JsonObject getUserList() {
        JsonObject infoJson = new JsonObject();
        try {
            Class.forName("org.gjt.mm.mysql.Driver").newInstance();
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding", "root", "password123");
            String user_query = "select * from admin_userdetails";
            /*String user_query = "select * from admin_userdetails where uname ='" + uname+ "'";*/
            Statement user_st = connection.createStatement();
            ResultSet users_list = user_st.executeQuery(user_query);
            while (users_list.next()) {
                String field = users_list.getString(12);
                String value = users_list.getString(1);
                infoJson.addProperty(field, value);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return infoJson;

    }

    public JsonArray getRecipients(List<Integer> recepientsId) {
        JsonArray recepients = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            //Class.forName("org.gjt.mm.mysql.Driver").newInstance();
            //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding", "root", "password123");
            String user_query = "select uname,email from admin_userdetails where id in ("+StringUtils.join(recepientsId, ',')+")";
            /*String user_query = "select * from admin_userdetails where uname ='" + uname+ "'";*/
            Statement user_st = connection.createStatement();
            ResultSet users_list = user_st.executeQuery(user_query);
            while (users_list.next()) {
                String key = users_list.getString("email");
                String value = users_list.getString("uname");
                JsonObject jsonObject=new JsonObject();
                jsonObject.addProperty(key, value);
                recepients.add(jsonObject);
                LOGGER.info("Testing--->"+recepients);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recepients;

    }

}




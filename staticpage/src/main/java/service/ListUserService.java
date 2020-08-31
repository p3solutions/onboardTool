package service;

import com.google.common.collect.HashBasedTable;
import com.google.common.collect.Table;
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
    final static Logger logger = Logger.getLogger(ListUserService.class);

    public JsonObject getUserList() {
        JsonObject infoJson = new JsonObject();
        try {
            Class.forName("org.gjt.mm.mysql.Driver").newInstance();
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool", "root", "password123");
            String user_query = "select * from admin_userdetails /*where stats='active'*/";
            /*String user_query = "select * from admin_userdetails where uname ='" + uname+ "'";*/
            Statement user_st = connection.createStatement();
            ResultSet users_list = user_st.executeQuery(user_query);
            while (users_list.next()) {
                String field = users_list.getString("id");
                //String value = users_list.getString("uname").concat(" ("+ users_list.getString("fname")).concat(users_list.getString("lname")+")");
                //String value = users_list.getString("id").concat("\t"+users_list.getString("uname")).concat("\t("+users_list.getString("email")+")");
                String value = users_list.getString("uname").concat("\t("+users_list.getString("email")+")");
                //String value = users_list.getString("uname");
                infoJson.addProperty(field, value);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return infoJson;

    }

    public Table<String, String, String> getRecipients(List<Integer> recepientsId) {

        Table<String, String, String> userTable = HashBasedTable.create();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            //Class.forName("org.gjt.mm.mysql.Driver").newInstance();
            //Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/decom3sixtytool", "root", "password123");
            String user_query = "select id,uname,email from admin_userdetails where id in (" + StringUtils.join(recepientsId, ',') + ")";
            /*String user_query = "select * from admin_userdetails where uname ='" + uname+ "'";*/
            Statement user_st = connection.createStatement();
            ResultSet users_list = user_st.executeQuery(user_query);
            while (users_list.next()) {
                String id = users_list.getString("id");
                String key = users_list.getString("email");
                String value = users_list.getString("uname");
                userTable.put(id, key, value);
                logger.info("usertable--->" + userTable);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userTable;

    }

}




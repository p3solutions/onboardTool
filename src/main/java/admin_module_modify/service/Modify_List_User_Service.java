package admin_module_modify.service;

import com.google.common.collect.HashBasedTable;
import com.google.common.collect.Table;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.json.JSONArray;
import org.json.JSONObject;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import logger.System;

public class Modify_List_User_Service {
    final static Logger logger = Logger.getLogger(Modify_List_User_Service.class);

    public JsonArray getModify_List_of_User() {
    PreparedStatement user_st=null;
    ResultSet users_list=null;
        //JSONArray jsonArray1 = new JSONArray();
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String user_query = "select  uname, fname, lname, email, projects, application, id from admin_userdetails";
            user_st = connection.prepareStatement(user_query);
            users_list = user_st.executeQuery();

            while (users_list.next()) {
                JsonObject infoJson = new JsonObject();
                int total_rows = users_list.getMetaData().getColumnCount();
                for (int i = 0; i < total_rows; i++) {

                    infoJson.addProperty(users_list.getMetaData().getColumnLabel(i + 1).toLowerCase(), users_list.getString(i + 1));
                }
                jsonArray.add(infoJson);
                logger.info("json array---->" + jsonArray);
            }
            user_st.close();
            users_list.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;

    }


}




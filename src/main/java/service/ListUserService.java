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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;
import logger.System;

public class ListUserService {
    final static Logger logger = Logger.getLogger(ListUserService.class);

    public JsonObject getUserList() {
    	PreparedStatement user_st=null;
    	ResultSet users_list=null;
        JsonObject infoJson = new JsonObject();
        try {
        	 DBconnection dBconnection = new DBconnection();
             Connection connection = (Connection) dBconnection.getConnection();        	       	
             String user_query = "select * from admin_userdetails /*where stats='active'*/";
             user_st = connection.prepareStatement(user_query);
             users_list = user_st.executeQuery();
             while (users_list.next()) {
                String field = users_list.getString("id");
                String value = users_list.getString("uname").concat("\t("+users_list.getString("email")+")");
                infoJson.addProperty(field, value);
             }
             user_st.close();
             users_list.close();
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        return infoJson;

    }

    public Table<String, String, String> getRecipients(List<Integer> recepientsId) {
    	PreparedStatement user_st=null;
    	ResultSet users_list=null;
        Table<String, String, String> userTable = HashBasedTable.create();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String user_query = "select id,uname,email from admin_userdetails where id in (" + StringUtils.join(recepientsId, ',') + ")";
            user_st = connection.prepareStatement(user_query);
            users_list = user_st.executeQuery();
            while (users_list.next()) {
                String id = users_list.getString("id");
                String key = users_list.getString("email");
                String value = users_list.getString("uname");
                userTable.put(id, key, value);
                logger.info("usertable--->" + userTable);
            }
            user_st.close();
            users_list.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userTable;

    }

}




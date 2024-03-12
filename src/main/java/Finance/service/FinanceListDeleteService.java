package Finance.service;

import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import logger.System;

public class FinanceListDeleteService {
    public JsonObject Delete_Finance(String Id) {
        JsonObject jsonobj = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("DB Connected...");
            String delete_query = "delete from finance_info WHERE Id=?;";
            PreparedStatement st2=connection.prepareStatement(delete_query);
            st2.setString(1, Id);
            st2.executeUpdate();
            System.out.println("Deleted From the finance.info");
            String delete_query1 = "delete from finance_application_screenshot WHERE AppId= ? ;";
            PreparedStatement st3=connection.prepareStatement(delete_query1);
            st3.setString(1, Id);
            st3.executeUpdate();
            System.out.println("Deleted From the finance.Screenshot");
        }
        catch(Exception e)
        {
            System.out.println("Execption Occurs");
        }
        return jsonobj;
    }
}

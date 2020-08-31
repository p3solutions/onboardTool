/*
package service;

import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class ExportPdfService
{
    public JsonObject getExportInformation(String appName) {
        JsonObject infoJson = new JsonObject();
        try {


            Class.forName("org.gjt.mm.mysql.Driver").newInstance();
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Onboarding", "root", "password123");

            DBconnection d = new DBconnection();
            Connection connection = (Connection) d.getConnection();
            String customizationQuery = "select * from intake_buisnesscustomization where appname ='" + appName + "'";
            Statement customizationStaement = connection.createStatement();
            ResultSet customizationResultSet = customizationStaement.executeQuery(customizationQuery);
            while (customizationResultSet.next()) {
                String field = customizationResultSet.getString(1);
                String detailsQuery = "select " + customizationResultSet.getString("idname") + " from intake_buisnessdetails where appname ='" + appName + "'";
                Statement detailsStaement = connection.createStatement();
                ResultSet detailsResultSet = detailsStaement.executeQuery(detailsQuery);
                if (detailsResultSet.next()) {
                    String value = detailsResultSet.getString(1) + "/" + customizationResultSet.getString(10);
                    infoJson.addProperty(field, value);
                }

                System.out.println();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return infoJson;

    }
}
*/

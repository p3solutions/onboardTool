package service;

import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;


public class IntakeInformationService {
    final static Logger logger = Logger.getLogger(IntakeInformationService.class);

    public JsonObject getInformation(String appName) {
        JsonObject infoJson = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String businesscustomizationQuery = "select * from intake_buisnesscustomization where appname ='" + appName + "'";
            Statement businesscustomizationStaement = connection.createStatement();
            ResultSet businesscustomizationResultSet = businesscustomizationStaement.executeQuery(businesscustomizationQuery);
            while (businesscustomizationResultSet.next()) {
                String businesskey = businesscustomizationResultSet.getString(1);
                String businessdetailsQuery = "select " + businesscustomizationResultSet.getString("idname") + " from intake_buisnessdetails where appname ='" + appName + "'";
                Statement businessdetailsStaement = connection.createStatement();
                ResultSet businessdetailsResultSet = businessdetailsStaement.executeQuery(businessdetailsQuery);
                if (businessdetailsResultSet.next()) {
                    String businessvalue = businessdetailsResultSet.getString(1) + "/" + businesscustomizationResultSet.getString(10);
                    infoJson.addProperty(businesskey, businessvalue);
                }


            }

            String technicalcustomizationQuery = "select * from intake_technicalcustomization where appname ='" + appName + "'";
            Statement technicalcustomizationStaement = connection.createStatement();
            ResultSet technicalcustomizationResultSet = technicalcustomizationStaement.executeQuery(technicalcustomizationQuery);
            while (technicalcustomizationResultSet.next()) {
                String technicalkey = technicalcustomizationResultSet.getString(1);
                if (technicalkey.equals(" ") && technicalcustomizationResultSet.getString(2).equals("Check box")) {
                    technicalkey = technicalcustomizationResultSet.getString("checkbox_labels");
                }
                String technicaldetailsQuery = "select " + technicalcustomizationResultSet.getString("idname") + " from intake_technicaldetails where appname ='" + appName + "'";
                Statement technicaldetailsStaement = connection.createStatement();
                ResultSet technicaldetailsResultSet = technicaldetailsStaement.executeQuery(technicaldetailsQuery);
                if (technicaldetailsResultSet.next()) {
                    String technicalvalue = technicaldetailsResultSet.getString(1) + "/" + technicalcustomizationResultSet.getString(10);
                    infoJson.addProperty(technicalkey, technicalvalue);
                }


            }

            String archivalrequirementcustomizationQuery = "select * from intake_archivalrequirementcustomization where appname ='" + appName + "'";
            Statement archivalrequirementcustomizationStaement = connection.createStatement();
            ResultSet archivalrequirementcustomizationResultSet = archivalrequirementcustomizationStaement.executeQuery(archivalrequirementcustomizationQuery);
            while (archivalrequirementcustomizationResultSet.next()) {
                String archivalrequirementkey = archivalrequirementcustomizationResultSet.getString(1);
                if (archivalrequirementkey.equals(" ") && archivalrequirementcustomizationResultSet.getString(2).equals("Check box")) {
                    archivalrequirementkey = archivalrequirementcustomizationResultSet.getString("checkbox_labels");
                }
                String archivalrequirementdetailsQuery = "select " + archivalrequirementcustomizationResultSet.getString("idname") + " from intake_archivalrequirement where appname ='" + appName + "'";
                Statement archivalrequirementdetailsStaement = connection.createStatement();
                ResultSet archivalrequirementdetailsResultSet = archivalrequirementdetailsStaement.executeQuery(archivalrequirementdetailsQuery);
                if (archivalrequirementdetailsResultSet.next()) {
                    String archivalrequirementvalue = archivalrequirementdetailsResultSet.getString(1) + "/" + archivalrequirementcustomizationResultSet.getString(10);
                    infoJson.addProperty(archivalrequirementkey, archivalrequirementvalue);
                }


            }


        } catch (Exception e) {
            e.printStackTrace();
        }

        return infoJson;

    }
}
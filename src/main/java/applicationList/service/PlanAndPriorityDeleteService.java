package applicationList.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
import java.util.UUID;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class PlanAndPriorityDeleteService {
         DBconnection dBconnection = null;
        Connection con = null;
        JsonArray jsonArray;
        String Id;
        String OppId;
        public PlanAndPriorityDeleteService(String OppId, String Id, JsonArray jsonArray)
                throws ClassNotFoundException, SQLException {
            dBconnection = new DBconnection();
            con = (Connection) dBconnection.getConnection();
            this.Id = Id;
            this.OppId = OppId;
            this.jsonArray = jsonArray;
        }
        public JsonObject planAndPriorityDelete() {
            JsonObject jsonObject = new JsonObject();
            Set<String> appExisting = new HashSet<String>();
            String applistExisting=null;
            try {
                boolean statusFlag = false;
                for (int i = 0; i < jsonArray.size(); i++) {
                    JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
                    String wave = jsonObj.get("wave").getAsString();
                    String appName = jsonObj.get("appName").getAsString();
                    String fetchdetailsFromWave = "select * from decom3sixtytool.Governance_Info where waveName=?";
                    PreparedStatement pst2 = con.prepareStatement(fetchdetailsFromWave);
                    pst2.setString(1, wave);
                    ResultSet rs1 = pst2.executeQuery();
                    while (rs1.next()) {
                        if (rs1.getString("column_name").equals("apps")) {
                            if (rs1.getString("value").isEmpty() == false) {
                                String[] apps = rs1.getString("value").split(",");
                                for (String app : apps) {
                                    if (app.equals(appName)) {
                                        continue;
                                    }
                                    appExisting.add(app);
                                }
                            }
                        }
                    }
                    rs1.close();
                    pst2.close();
                    applistExisting=String.join(",", appExisting);
                    String UpdateQueryExisting = "update Governance_Info set value=?"
                            + " where column_name ='apps' and waveName=?";
                    PreparedStatement prestmt = con.prepareStatement(UpdateQueryExisting);
                    // prestmt.setString(1, seq_no);
                    prestmt.setString(1, applistExisting);
                    prestmt.setString(2, wave);
                    prestmt.execute();
                    String appId=getAppId(appName);
                    deletePlanAndPriorityInfo(appId);
                    statusFlag = true;
                }
                jsonObject.addProperty("SaveStatus", statusFlag);
            } catch (Exception e) {
                e.printStackTrace();
            }
            return jsonObject;
        }
        public String getAppId(String appname) {
            String appId=null;
            try {
            String selectQuery = "select distinct Id from decom3sixtytool.Opportunity_Info where column_name='appName' and value=?;";
            PreparedStatement prestmt = con.prepareStatement(selectQuery);
            prestmt.setString(1, appname);
            ResultSet rs1 = prestmt.executeQuery();
                while (rs1.next()) {
                    appId=rs1.getString("Id");
                }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return appId;
        }
        public void deletePlanAndPriorityInfo(String appId) {
            try {
            String selectQuery = "select * from decom3sixtytool.planAndPriorityInfo where app_Id=?;";
            PreparedStatement prestmt = con.prepareStatement(selectQuery);
            prestmt.setString(1, appId);
            ResultSet rs1 = prestmt.executeQuery();
            boolean isExist=rs1.next();
            if(isExist)
            {
                String UpdateQuery = "delete from planAndPriorityInfo"
                        + " where app_Id=?;";
                PreparedStatement prestmt1 = con.prepareStatement(UpdateQuery);
                prestmt1.setString(1, appId);
                prestmt1.execute();
            }
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }
        protected void finalize() throws Throwable {
            con.close();
        }
    }
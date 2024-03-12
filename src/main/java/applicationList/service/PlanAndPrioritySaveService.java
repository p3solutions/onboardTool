package applicationList.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.UUID;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class PlanAndPrioritySaveService {
    DBconnection dBconnection = null;
    Connection con = null;
    JsonArray jsonArray;
    String Id;
    String OppId;
    public PlanAndPrioritySaveService(String OppId, String Id, JsonArray jsonArray)
            throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
        this.Id = Id;
        this.OppId = OppId;
        this.jsonArray = jsonArray;
    }
    public JsonObject planAndPrioritySave() {
        JsonObject jsonObject = new JsonObject();
        String UniqueId = null;
        String existingWave = null;
        boolean isAvailable = false;
        String applistExisting = null;
        Set<String> applistExist = new HashSet<String>();
        try {
            boolean statusFlag = false;
            for (int i = 0; i < jsonArray.size(); i++) {
                String rowId = generateRandomApprovalId();
                JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
                String phase = jsonObj.get("phase").getAsString();
                String wave = jsonObj.get("wave").getAsString();
                String appName = jsonObj.get("appName").getAsString();
                String flag = jsonObj.get("flag").getAsString();
                // String resource = jsonObj.get("resource").getAsString();
                if (flag.equals("S") || flag.equals("U")) {
                    boolean status = removeAppFromWave(appName, wave);
                }
                /*if (flag.equals("A")) {
                    String fetchdetailsFromWave = "select * from decom3sixtytool.Governance_Info"
                            + " where column_name ='apps' and waveName=?;";
                    PreparedStatement pst2 = con.prepareStatement(fetchdetailsFromWave);
                    pst2.setString(1, wave);
                    ResultSet rs1 = pst2.executeQuery();
                    while (rs1.next()) {
                        if (rs1.getString("column_name").equals("apps")) {
                            if (rs1.getString("value").isEmpty() == false) {
                                String[] apps = rs1.getString("value").split(",");
                                for (String app : apps) {
                                    if (app.equals(appName)) {
                                        isAvailable = true;
                                        existingWave = rs1.getString("value");
                                        continue;
                                    }
                                    if (app != "") {
                                        applistExist.add(app);
                                    }
                                }
                                applistExisting = String.join(",", applistExist);
                            }
                        }
                    }
                    rs1.close();
                    pst2.close();
                    if (isAvailable) {
                        String UpdateQueryExisting = "update Governance_Info set value=?"
                                + " where column_name ='apps' and waveName=?";
                        PreparedStatement prestmt = con.prepareStatement(UpdateQueryExisting);
                        // prestmt.setString(1, seq_no);
                        prestmt.setString(1, applistExisting);
                        prestmt.setString(2, existingWave);
                        prestmt.execute();
                    }
                    String listWithNewApp = null;
                    if (applistExisting != null) {
                        listWithNewApp = String.join(",", applistExisting, appName);
                    } else {
                        listWithNewApp = appName;
                    }
                    if (!isAvailable) {
                        String UpdateQueryNew = "update Governance_Info set value=?"
                                + " where column_name ='apps' and waveName=?";
                        PreparedStatement prestmt = con.prepareStatement(UpdateQueryNew);
                        // prestmt.setString(1, seq_no);
                        prestmt.setString(1, listWithNewApp);
                        prestmt.setString(2, wave);
                        prestmt.execute();
                    }
                    applistExisting = "";
                }*/
                String phaseId = getPhaseId(phase);
                String waveId = getWaveId(wave);
                String appId = getAppId(appName);
                updatePlanAndPriorityInfo(phaseId, waveId, rowId, appId);
                statusFlag = true;
            }
            jsonObject.addProperty("SaveStatus", statusFlag);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    public boolean removeAppFromWave(String appName, String wave) {
        boolean toReturn = false;
        boolean isFound = false;
        String applistExisting = "";
        String listWithNewApp = "";
        Set<String> applistExist = new HashSet<String>();
        String existingWave = "";
        String fetchdetailsFromWave = "select * from decom3sixtytool.Governance_Info;";
        PreparedStatement pst2;
        try {
            pst2 = con.prepareStatement(fetchdetailsFromWave);
            ResultSet rs1 = pst2.executeQuery();
            while (rs1.next()) {
                if (rs1.getString("column_name").equals("waveName")) {
                    existingWave = rs1.getString("waveName");
                }
                if (rs1.getString("column_name").equals("apps")) {
                    if (rs1.getString("value").isEmpty() == false) {
                        String[] apps = rs1.getString("value").split(",");
                        for (String app : apps) {
                            isFound = false;
                            if (app.equals(appName)) {
                                isFound = true;
                            }
                            if ((!app.equals("")) && isFound == false) {
                                applistExist.add(app);
                            }
                        }
                        if (!applistExist.isEmpty()) {
                            applistExisting = String.join(",", applistExist);
                        }
                    }
                    if (existingWave.equals(wave)) {
                        if (applistExisting != null) {
                            applistExist.add(appName);
                            listWithNewApp = String.join(",", applistExist);
                        } else {
                            listWithNewApp = appName;
                        }
                    }
                    String UpdateQueryExisting = "update Governance_Info set value=?"
                            + " where column_name ='apps' and waveName=?";
                    PreparedStatement prestmt = con.prepareStatement(UpdateQueryExisting);
                    // prestmt.setString(1, seq_no);
                    if (existingWave.equals(wave)) {
                        prestmt.setString(1, listWithNewApp);
                        prestmt.setString(2, wave);
                    } else {
                        prestmt.setString(1, applistExisting);
                        prestmt.setString(2, existingWave);
                    }
                    prestmt.execute();
                    applistExisting = "";
                    existingWave = "";
                    applistExist.clear();
                    toReturn = true;
                }
                applistExisting = "";
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return toReturn;
    }
    public String getPhaseId(String phasename) {
        String phaseId = null;
        try {
            String selectQuery = "select distinct phaseId from decom3sixtytool.Phase_Info where phaseName=?;";
            PreparedStatement prestmt = con.prepareStatement(selectQuery);
            prestmt.setString(1, phasename);
            ResultSet rs1 = prestmt.executeQuery();
            while (rs1.next()) {
                phaseId = rs1.getString("phaseId");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return phaseId;
    }
    public String getWaveId(String wavename) {
        String waveId = null;
        try {
            String selectQuery = "select distinct waveId from decom3sixtytool.Governance_Info where waveName=?;";
            PreparedStatement prestmt = con.prepareStatement(selectQuery);
            prestmt.setString(1, wavename);
            ResultSet rs1 = prestmt.executeQuery();
            while (rs1.next()) {
                waveId = rs1.getString("waveId");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return waveId;
    }
    public String getAppId(String appname) {
        String appId = null;
        try {
            String selectQuery = "select distinct Id from decom3sixtytool.Opportunity_Info where column_name='appName' and value=?;";
            PreparedStatement prestmt = con.prepareStatement(selectQuery);
            prestmt.setString(1, appname);
            ResultSet rs1 = prestmt.executeQuery();
            while (rs1.next()) {
                appId = rs1.getString("Id");
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return appId;
    }
    public void updatePlanAndPriorityInfo(String phaseId, String waveId, String rowId, String appId) {
        try {
            String selectQuery = "select * from decom3sixtytool.planAndPriorityInfo where app_Id=?;";
            PreparedStatement prestmt = con.prepareStatement(selectQuery);
            prestmt.setString(1, appId);
            ResultSet rs1 = prestmt.executeQuery();
            boolean isExist = rs1.next();
            if (isExist) {
                String UpdateQuery = "update planAndPriorityInfo set rowId=?,waveId=?,phaseId=?" + " where app_Id=?;";
                PreparedStatement prestmt1 = con.prepareStatement(UpdateQuery);
                // prestmt.setString(1, seq_no);
                prestmt1.setString(1, rowId);
                prestmt1.setString(2, waveId);
                prestmt1.setString(3, phaseId);
                // prestmt1.setString(4, resource);
                prestmt1.setString(4, appId);
                prestmt1.execute();
            } else {
                String insertQuery = "insert into planAndPriorityInfo(rowId,waveId,phaseId,app_Id)" + "values(?,?,?,?)";
                PreparedStatement prestmt1 = con.prepareStatement(insertQuery);
                // prestmt.setString(1, seq_no);
                prestmt1.setString(1, rowId);
                prestmt1.setString(2, waveId);
                prestmt1.setString(3, phaseId);
                // prestmt1.setString(4, resource);
                prestmt1.setString(4, appId);
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
    public String generateRandomApprovalId() throws SQLException {
        String uniqueID = "";
        boolean checkTermination = true;
        while (checkTermination) {
            uniqueID = UUID.randomUUID().toString();
            System.out.println("App Id : " + uniqueID);
            boolean checkDupilcateId = checkDuplicateApprovalId(uniqueID);
            if (checkDupilcateId == false) {
                checkTermination = false;
            }
        }
        return uniqueID;
    }
    public boolean checkDuplicateApprovalId(String uniqueID) throws SQLException {
    	PreparedStatement state=null;
    	ResultSet result=null;
        boolean checkDuplicate = false;
        String selectQuery = "select * from planAndPriorityInfo;";
        state = con.prepareStatement(selectQuery);
        result = state.executeQuery();
        while (result.next()) {
            String checkApprovalId = result.getString("rowId");
            if (checkApprovalId.equals(uniqueID)) {
                checkDuplicate = true;
            }
        }
        state.close();
        result.close();
        return checkDuplicate;
    }
}
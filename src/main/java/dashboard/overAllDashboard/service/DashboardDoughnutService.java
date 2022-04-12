package dashboard.overAllDashboard.service;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang3.ArrayUtils;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class DashboardDoughnutService {
    DBconnection dBconnection = null;
    Connection con = null;
    public DashboardDoughnutService() throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
    }
    public JsonArray dashboardDoughnutDetails(String phase, String wave) {
        JsonArray jsonArray = new JsonArray();
        try {
            System.out.println("phase " + phase + " wave " + wave);
            jsonArray = dashboardAppDetails(phase, wave);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonArray dashboardAppDetails(String phase, String wave) {
        JsonArray jsonArray = new JsonArray();
        // JsonObject jsonObject = new JsonObject();
        // int yettoStartCount = 0, inProgressCount = 0, completedCount = 0;
        try {
            /*
             * String selectPhases = "select * from phase_info where column_name='waves' ";
             * Statement st = con.createStatement(); ResultSet rs =
             * st.executeQuery(selectPhases); while (rs.next()) { if
             * (rs.getString("column_name").equals("waves")) { if
             * (rs.getString("value").isEmpty() == true) { yettoStartCount++; } } }
             */
            jsonArray = getPercentageByphase(phase, wave);
            /*
             * System.out.println("WaveArray " + waveArray); for (int i = 0; i <
             * waveArray.size(); i++) { jsonObject = (JsonObject) waveArray.get(i); String
             * completed = jsonObject.get("completed").getAsString();
             * System.out.println("cpompleted "+completed); if(completed.equals("100.0")) {
             * completedCount++; } else { inProgressCount++; } } //rs.close(); //st.close();
             * double totalCount = yettoStartCount + inProgressCount + completedCount;
             * DecimalFormat f = new DecimalFormat("##.##"); /* String yestoStart =
             * String.valueOf(f.format((yestoStartCount * 100) / totalCount)); String
             * inProgress = String.valueOf(f.format((inProgressCount * 100) / totalCount)) ;
             * String completed = String.valueOf(f.format((completedCount * 100) /
             * totalCount)) ;
             */
            /*
             * double yestoStart = Double.parseDouble(f.format((yettoStartCount * 100) /
             * totalCount)); double inProgress =
             * Double.parseDouble(f.format((inProgressCount * 100) / totalCount)); double
             * completed = Double.parseDouble(f.format((completedCount * 100) /
             * totalCount)); jsonObject.addProperty("yestoStart", yestoStart);
             * jsonObject.addProperty("inProgress", inProgress);
             * jsonObject.addProperty("completed", completed); jsonArray.add(jsonObject);
             */
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("jsonArray1 : " + jsonArray);
        return jsonArray;
    }
    public JsonArray getPercentageByphase(String phaseFilter, String wave) {
        JsonArray jsonArray = new JsonArray();
        List<String> waves = new ArrayList<String>();
        try {
            String whereCondn = phaseFilter.equals("All") ? "" : " where phaseName like '%" + phaseFilter + "%'";
            String selectPhases = "select * from phase_info" + whereCondn;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectPhases);
            while (rs.next()) {
                if (rs.getString("column_name").equals("waves")) {
                    if (rs.getString("value").isEmpty() == false) {
                        String waveArray[] = rs.getString("value").split(",");
                        for (String string : waveArray) {
                            waves.add(string);
                        }
                    }
                }
            }
            String[] allWave = new String[waves.size()];
            allWave = waves.toArray(allWave);
            jsonArray = (getWaveDetailsStatus(allWave, wave));
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("jsonArray2 : " + jsonArray);
        return jsonArray;
    }
    /*
     * public JsonArray getWaveDetails(String phaseFilter) { JsonArray jsonArray =
     * new JsonArray(); List<String> waves = new ArrayList<String>(); try { String
     * whereCondn = phaseFilter.equals("All") ? "" : " where phaseName like '" +
     * phaseFilter + "%'"; String selectPhases = "select * from phase_info" +
     * whereCondn; Statement st = con.createStatement(); ResultSet rs =
     * st.executeQuery(selectPhases); while (rs.next()) { if
     * (rs.getString("column_name").equals("waves")) { if
     * (rs.getString("value").isEmpty() == false) { String waveArray[] =
     * rs.getString("value").split(","); //
     * jsonArray.addAll(getArchiveReqWaveDetails(waves, rs.getString("phaseName")));
     * // System.out.println("phase " +rs.getString("phaseName")); for (String
     * string : waveArray) { waves.add(string); } } } } String[] allWave = new
     * String[waves.size()]; allWave = waves.toArray(allWave);
     * jsonArray.addAll(getWaveDetailsStatus(allWave)); rs.close(); st.close(); }
     * catch (Exception e) { e.printStackTrace(); }
     * 
     * return jsonArray; }
     */
    private JsonArray getWaveDetailsStatus(String[] waves, String wavestatus) {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        List<String> allappsList = new ArrayList<String>();
        String apps[] = {};
        String[] allapp = {};
        try {
            if (wavestatus.equals("All")) {
                for (String wave : waves) {
                    String selectWaves = "select * from governance_info where waveName='" + wave + "'";
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery(selectWaves);
                    while (rs.next()) {
                        if (rs.getString("column_name").equals("apps")) {
                            if (rs.getString("value").isEmpty() == false) {
                                apps = rs.getString("value").split(",");
                                System.out.println("app length: " + apps.length);
                                for (String string : apps) {
                                    allappsList.add(string);
                                }
                            }
                        }
                    }
                    System.out.println("All apps: " + allappsList);
                    allapp = new String[allappsList.size()];
                    allapp = allappsList.toArray(allapp);
                    rs.close();
                    st.close();
                }
                if (allapp.length > 0) {
                    jsonArray = dashboardAppDetails(allapp);
                } else {
                    jsonObject.addProperty("NoApp", 100.00);
                    jsonObject.addProperty("archiveReqPer", 0.00);
                    jsonObject.addProperty("archiveExePer", 0.00);
                    jsonObject.addProperty("completed", 0.00);
                    jsonArray.add(jsonObject);
                }
            } else {
                String selectWaves = "select * from governance_info where waveName='" + wavestatus + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(selectWaves);
                while (rs.next()) {
                    if (rs.getString("column_name").equals("apps")) {
                        if (rs.getString("value").isEmpty() == false) {
                            apps = rs.getString("value").split(",");
                        }
                    }
                }
                if (apps.length > 0) {
                    jsonArray = dashboardAppDetails(apps);
                } else {
                    jsonObject.addProperty("NoApp", 100.00);
                    jsonObject.addProperty("archiveReqPer", 0.00);
                    jsonObject.addProperty("archiveExePer", 0.00);
                    jsonObject.addProperty("completed", 0.00);
                    jsonArray.add(jsonObject);
                }
                rs.close();
                st.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("jsonArray3 : " + jsonArray);
        return jsonArray;
    }
    public JsonArray dashboardAppDetails(String apps[]) {
        int idIsthere=0;
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        int appCount = 0, archiveReqCount = 0, archiveExeCount = 0, completedCount = 0, noIntakeApproveApp = 0;
        try {
            for (String app : apps) {
                String selectApp = "select * from opportunity_info where column_name='appName' and value = '" + app
                        + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(selectApp);
                while (rs.next()) {
                    idIsthere++;
                    String Id = rs.getString("Id");
                    System.out.println("Id " + Id);
                    String selectAppdetail = "select intakeApproval,max(priority_order_num) pr,OppId from Intake_Stake_Holder_Info where OppId = '"
                            + Id + "' group by intakeApproval,OppId";
                    Statement st11 = con.createStatement();
                    ResultSet rs11 = st11.executeQuery(selectAppdetail);
                    while (rs11.next()) {
                        String value = rs11.getString("intakeApproval");
                        System.out.println("value of intake " + value);
                        if (value.equals("Decision pending") || value.equals("Rejected")) {
                            // Need to write
                            noIntakeApproveApp++;
                        } else if (value.equals("Approved")) {
                            System.out.println("Intake");
                            appCount++;
                            String selectStatus1 = "select intakeApproval,max(priority_order_num) pr,OppId from ArchiveReq_Roles_Info where priority_order_num!='' and intakeApproval is not null and OppId = '"
                                    + Id + "' group by intakeApproval,OppId;";
                            Statement st4 = con.createStatement();
                            ResultSet rs4 = st4.executeQuery(selectStatus1);
                            while (rs4.next()) {
                                String valueAr = rs4.getString("intakeApproval");
                                System.out.println("Archive");
                                if (valueAr.equals("Decision pending") || valueAr.equals("Rejected")) {
                                    archiveReqCount++;
                                } else if (valueAr.equals("Approved")) {
                                    String selectStatus2 = "select distinct * from `archive_execution_info` where oppId='"
                                            + Id + "'  and taskGroup='Closure' ;";
                                    Statement st5 = con.createStatement();
                                    ResultSet rs5 = st5.executeQuery(selectStatus2);
                                    if (rs5.next()) {
                                        boolean level = rs5.getString("level").equals("1");
                                        boolean actDate = rs5.getString("actEnd").isEmpty();
                                        if (level == true && actDate == false) {
                                            System.out.println("completed");
                                            completedCount++;
                                        } else {
                                            System.out.println("ExeCount");
                                            archiveExeCount++;
                                        }
                                    }
                                    rs5.close();
                                    st5.close();
                                }
                            }
                            rs4.close();
                            st4.close();
                        }
                        /*
                         * String selectStatus =
                         * "select intakeApproval from Intake_Stake_Holder_Info where  OppId = '" + Id +
                         * "' and priority_order_num is not null"; Statement st3 =
                         * con.createStatement(); ResultSet rs3 = st3.executeQuery(selectStatus); while
                         * (rs3.next()) { if
                         * (rs3.getString("intakeApproval").equals("Decision pending")) { check1 = true;
                         * break; } } rs3.close(); st3.close();
                         * 
                         * if (check1 == false) { String selectStatus1 =
                         * "select intakeApproval from ArchiveReq_Roles_Info where  OppId = '" + Id +
                         * "' and priority_order_num is not null"; Statement st4 =
                         * con.createStatement(); ResultSet rs4 = st4.executeQuery(selectStatus1); while
                         * (rs4.next()) { if
                         * (rs4.getString("intakeApproval").equals("Decision pending")) { check2 = true;
                         * break; } } rs4.close(); st4.close(); } if (check1 == false && check2 ==
                         * false) {
                         */
                        /*
                         * String selectStatus2 =
                         * "select distinct * from `archive_execution_info` where oppId='" + Id +
                         * "'  and taskGroup='Closure' ;"; Statement st5 = con.createStatement();
                         * ResultSet rs5 = st5.executeQuery(selectStatus2); if (rs5.next()) { check3 =
                         * true; boolean level = rs5.getString("level").equals("1"); boolean actDate =
                         * rs5.getString("actEnd").isEmpty(); if (level == true && actDate == false) {
                         * // System.out.println("Coming "+ rs5.getString("oppName")); check4 = true; }
                         * } rs5.close(); st5.close();
                         */
                    }
                    rs11.close();
                    st11.close();
                    if (apps.length == noIntakeApproveApp) {
                        jsonObject.addProperty("archiveReqPer", 0.00);
                        jsonObject.addProperty("archiveExePer", 0.00);
                        jsonObject.addProperty("completed", 0.00);
                        jsonObject.addProperty("NoApp", 100.00);
                    } else {
                        if (appCount > 0) {
                            double totalCount = archiveReqCount + archiveExeCount + completedCount;
                            if (totalCount == 0) {
                                jsonObject.addProperty("archiveReqPer", 0.00);
                                jsonObject.addProperty("archiveExePer", 0.00);
                                jsonObject.addProperty("completed", 0.00);
                                jsonObject.addProperty("NoApp", 100.00);
                            } else {
                                DecimalFormat f = new DecimalFormat("##.##");
                                /*
                                 * String yestoStart = String.valueOf(f.format((yestoStartCount * 100) /
                                 * totalCount)); String inProgress = String.valueOf(f.format((inProgressCount *
                                 * 100) / totalCount)) ; String completed =
                                 * String.valueOf(f.format((completedCount * 100) / totalCount)) ;
                                 */
                                double archiveReqPer = Double
                                        .parseDouble(f.format((archiveReqCount * 100) / totalCount));
                                double archiveExePer = Double
                                        .parseDouble(f.format((archiveExeCount * 100) / totalCount));
                                double completed = Double.parseDouble(f.format((completedCount * 100) / totalCount));
                                jsonObject.addProperty("archiveReqPer", archiveReqPer);
                                jsonObject.addProperty("archiveExePer", archiveExePer);
                                jsonObject.addProperty("completed", completed);
                                jsonObject.addProperty("NoApp", 0.00);
                            }
                        } else {
                            jsonObject.addProperty("archiveReqPer", 0.00);
                            jsonObject.addProperty("archiveExePer", 0.00);
                            jsonObject.addProperty("completed", 0.00);
                            jsonObject.addProperty("NoApp", 100.00);
                        }
                    }
                }
                if(idIsthere==0)
                {
                    jsonObject.addProperty("archiveReqPer", 0.00);
                    jsonObject.addProperty("archiveExePer", 0.00);
                    jsonObject.addProperty("completed", 0.00);
                    jsonObject.addProperty("NoApp", 100.00);
                }
                rs.close();
                st.close();
            }
            jsonArray.add(jsonObject);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("jsonArray4 : " + jsonArray);
        return jsonArray;
    }
    public JsonArray getCBADetail() {
        JsonArray jsonArray = new JsonArray();
        try {
            ArrayList<String> app = new ArrayList<String>();
            String selectApp = "select * from opportunity_info where column_name='appName'";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(selectApp);
            while (rs.next()) {
                app.add(rs.getString("value"));
            }
            String[] apps = new String[app.size()];
            apps = app.toArray(apps);
            jsonArray.addAll(getIntakeDetail(apps));
            rs.close();
            st.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
    public JsonArray getIntakeDetail(String apps[]) {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try {
            double intakeCBA = 0, inprogreeCBA = 0, realisedCBA = 0, appCBA = 0;
            for (String app : apps) {
                String selectApp = "select * from opportunity_info where column_name='appName' and value = '" + app
                        + "'";
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery(selectApp);
                while (rs.next()) {
                    String Id = rs.getString("Id");
                    String selectTriagedetail = "select case when (value=''|| value not regexp '^[0-9]+$') then '0' else value end 'CBAvalue' from decom3sixtytool.Triage_Info where column_name='Preliminary_CBA' and Id='"
                            + Id + "';";
                    Statement st12 = con.createStatement();
                    ResultSet rs12 = st12.executeQuery(selectTriagedetail);
                    while (rs12.next()) {
                        appCBA = Double.parseDouble(rs12.getString("CBAvalue"));
                    }
                    rs12.close();
                    st12.close();
                    String selectAppdetail = "select intakeApproval,max(priority_order_num) pr,OppId from Intake_Stake_Holder_Info where OppId = '"
                            + Id + "' group by intakeApproval,OppId";
                    Statement st11 = con.createStatement();
                    ResultSet rs11 = st11.executeQuery(selectAppdetail);
                    while (rs11.next()) {
                        String value = rs11.getString("intakeApproval");
                        if (value.equals("Decision pending") || value.equals("Rejected")) {
                            intakeCBA = intakeCBA + appCBA;
                        } else if (value.equals("Approved")) {
                            String selectStatus2 = "select distinct * from `archive_execution_info` where oppId='" + Id
                                    + "'  and taskGroup='Closure' ;";
                            Statement st5 = con.createStatement();
                            ResultSet rs5 = st5.executeQuery(selectStatus2);
                            if (rs5.next()) {
                                boolean level = rs5.getString("level").equals("1");
                                boolean actDate = rs5.getString("actEnd").isEmpty();
                                if (level == true && actDate == false) {
                                    realisedCBA = realisedCBA + appCBA;
                                } else {
                                    inprogreeCBA = inprogreeCBA + appCBA;
                                }
                            }
                            rs5.close();
                            st5.close();
                        }
                    }
                    rs11.close();
                    st11.close();
                }
                rs.close();
                st.close();
            }
            double totalCBA = inprogreeCBA + intakeCBA + realisedCBA;
            DecimalFormat f = new DecimalFormat("##.##");
            double sunmOfIntake = Double.parseDouble(f.format((intakeCBA * 100) / totalCBA));
            double sumOfInProgress = Double.parseDouble(f.format((inprogreeCBA * 100) / totalCBA));
            double sumOfRealised = Double.parseDouble(f.format((realisedCBA * 100) / totalCBA));
            jsonObject.addProperty("sunmOfIntake", sunmOfIntake);
            jsonObject.addProperty("sumOfInProgress", sumOfInProgress);
            jsonObject.addProperty("sumOfRealised", sumOfRealised);
            jsonArray.add(jsonObject);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
}
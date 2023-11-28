package Finance.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedHashMap;


public class FinanaceAppDataRetriveService {
    DBconnection dBconnection;
    Connection con;
    public String Id = null;
    public String oppName = null;

    public FinanaceAppDataRetriveService(String Id, String oppName) throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
        this.Id = Id;
        this.oppName = oppName;
    }

    public FinanaceAppDataRetriveService() throws SQLException, ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
    }

    public JsonArray financeTemplateToAppInput() throws SQLException {
        PreparedStatement st1 = null;
        ResultSet rs = null;
        JsonArray jsonArray = new JsonArray();

        String TemplateQuery = "select * from finance_Template_Details WHERE seq_no = 1;";
        st1 = con.prepareStatement(TemplateQuery);
        rs = st1.executeQuery();
        while (rs.next()) {
            JsonObject jsonObject = new JsonObject();

            jsonObject.addProperty("seq_num", rs.getString("seq_no"));
            jsonObject.addProperty("options", rs.getString("options"));
            jsonObject.addProperty("LabelName", rs.getString("label_name"));
            jsonObject.addProperty("ColumnName", rs.getString("column_name"));
            jsonObject.addProperty("Type", rs.getString("type"));
            jsonObject.addProperty("mandatory", rs.getString("mandatory"));
            jsonObject.addProperty("Value", rs.getString("value"));
            jsonArray.add(jsonObject);

        }
        return jsonArray;
    }

    public JsonArray financeTemplateToFinanceInfo() {
        PreparedStatement st1 = null;
        ResultSet rs1 = null;
        JsonArray jsonArray = new JsonArray();
        try {
            if (Id != null) {
                String selectQuery = "select * from finance_Info where Id = ?";
                PreparedStatement st = con.prepareStatement(selectQuery);
                st.setString(1, Id);
                ResultSet rs = st.executeQuery();


                if (!rs.next()) {

                    String TemplateQuery = "select * from finance_Template_Details order by seq_no;";
                    st1 = con.prepareStatement(TemplateQuery);
                    rs1 = st1.executeQuery();

                    while (rs1.next()) {
                        String column = rs1.getString("column_name");
                        String insertQuery = "insert into finance_Info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
                        PreparedStatement preparedStatement1 = con.prepareStatement(insertQuery);
                        preparedStatement1.setString(1, rs1.getString("seq_no"));
                        preparedStatement1.setString(2, Id);
                        preparedStatement1.setString(3, "");
                        preparedStatement1.setString(4, oppName);
                        preparedStatement1.setString(5, rs1.getString("options"));
                        preparedStatement1.setString(6, rs1.getString("label_name"));
                        preparedStatement1.setString(7, rs1.getString("column_name"));
                        preparedStatement1.setString(8, rs1.getString("type"));
                        preparedStatement1.setString(9, rs1.getString("mandatory"));
                        preparedStatement1.setString(10, rs1.getString("value"));
                        preparedStatement1.execute();
                    }
                    rs1.close();
                    st1.close();
                }
            }

            jsonArray = FinanceDataRetrieve();

        } catch (Exception e) {
            e.printStackTrace();
        }


        return jsonArray;
    }

    public JsonArray FinanceDataRetrieve() {

        JsonArray jsonArray = new JsonArray();
        try {

            String selectQuery = "select * from finance_Info where Id = ? AND seq_no > 1 order by seq_no  ;";
            PreparedStatement st = con.prepareStatement(selectQuery);
            st.setString(1, Id);
            ResultSet rs = st.executeQuery();
            LinkedHashMap<String, String> columnDetails = getAutoPopulateFields();
            while (rs.next()) {
                String column = rs.getString("column_name");
                JsonObject jsonObject = new JsonObject();

                jsonObject.addProperty("seq_num", rs.getString("seq_no"));
                jsonObject.addProperty("oppId", rs.getString("Id"));
                jsonObject.addProperty("prjName", rs.getString("prj_name"));
                jsonObject.addProperty("oppName", rs.getString("app_name"));
                jsonObject.addProperty("options", rs.getString("options"));
                jsonObject.addProperty("LabelName", rs.getString("label_name"));
                jsonObject.addProperty("ColumnName", rs.getString("column_name"));
                jsonObject.addProperty("Type", rs.getString("type"));
                jsonObject.addProperty("mandatory", rs.getString("mandatory"));
                jsonObject.addProperty("Value", columnDetails.containsKey(column) && rs.getString("value").equals("") ? getAutoPopulateValue(columnDetails.get(column), column) : rs.getString("value"));
                jsonObject.addProperty("umandatory", rs.getString("usermandatoryflag"));
                jsonArray.add(jsonObject);

            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }

    public LinkedHashMap<String, String> getAutoPopulateFields() {
        LinkedHashMap<String, String> columnDet = new LinkedHashMap<String, String>();
        try {
            columnDet.put("cba", "Preliminary_CBA-triage_info");
            columnDet.put("phase", "Phase-phase");
            columnDet.put("projnum", "PrjNumber-triage_summary_info");
            columnDet.put("fundtype", "Status-triage_info");
        } catch (Exception e) {
            e.printStackTrace();
        }

        return columnDet;
    }

    public String getAutoPopulateValue(String columnTablePair, String key) {
        String value = "";
        try {
            boolean checkValue = false;
            String columnName = columnTablePair.split("-")[0];
            String tableName = columnTablePair.split("-")[1];

            String selectQuery = "select * from " + tableName + " where column_name = ? and Id = ?";
            PreparedStatement st = con.prepareStatement(selectQuery);
            st.setString(1, columnName);
            st.setString(2, Id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                checkValue = true;
                value = rs.getString("value");
            }
            rs.close();
            st.close();
            if (checkValue && columnName.equals("Phase")) {
                tableName = "decom3sixtytool.phase";
                String selectQueryDB = "select * from " + tableName + " where Id = ?";
                PreparedStatement stDb = con.prepareStatement(selectQueryDB);
                stDb.setString(1, Id);
                ResultSet rsDb = stDb.executeQuery();
                if (rsDb.next()) {
                    checkValue = true;
                    value = value.equals("") ? rsDb.getString("Phase_Status") : value + "," + rsDb.getString("Phase_Status");
                }
                stDb.close();
                rsDb.close();

            }
            if (checkValue && columnName.equals("Status")) {
                tableName ="decom3sixtytool.phase";
                String selectQueryNumber = "select * from " + tableName + " where Id = ?";
                PreparedStatement st2 = con.prepareStatement(selectQueryNumber);
                st2.setString(1, Id);
                ResultSet rs2 = st2.executeQuery();
                if (rs2.next()) {
                    checkValue = true;
                    value = rs2.getString("Application_Status");
                }
                st2.close();
                rs2.close();
            }
            if (key.equals("totalsize")) {
                value = getTotalSize(value, tableName);
            }
            if (!checkValue && columnName.equals("AssessAppPlatform")) {
                tableName = "triage_info";
                columnName = "appPlatfrm";
                String selectQuery1 = "select * from " + tableName + " where column_name = ? and Id = ?";
                PreparedStatement st1 = con.prepareStatement(selectQuery1);
                st1.setString(1, columnName);
                st1.setString(2, Id);
                ResultSet rs1 = st1.executeQuery();

                if (rs1.next()) {
                    checkValue = true;
                    value = rs1.getString("value");
                }
                rs1.close();
                st1.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println();
        return value;
    }

    private String getTotalSize(String structDbSize, String tableName) {
        String totalSize = "";
        try {
            boolean checkValue = false;
            String value = "";
            int structureDataSize = !structDbSize.equals("") ? Integer.parseInt(structDbSize) : 0;
            String selectQueryDate = "select * from " + tableName + " where column_name = 'UnstrucDataVolume' and Id = ?;";
            PreparedStatement st2 = con.prepareStatement(selectQueryDate);
            st2.setString(1, Id);
            ResultSet rs2 = st2.executeQuery();


            if (rs2.next()) {
                checkValue = true;
                value = rs2.getString("value");
            }
            st2.close();
            rs2.close();
            int unstructureDataSize = !value.equals("") ? Integer.parseInt(value) : 0;
            totalSize = String.valueOf(structureDataSize + unstructureDataSize);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return totalSize;
    }

    protected void finalize() throws Throwable {
        con.close();
        System.out.println("DB connection closed");
    }

}

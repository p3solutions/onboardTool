package NewArchiveRequirements.Introduction.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import common.constant.APPROVAL_CONSTANT;
import onboard.DBconnection;
import logger.System;
public class archiveReqIntroRolesResponseTemplateService {
DBconnection dBconnection =null;
    Connection con = null;
    public String Id = null;
    public String OppName;
    public archiveReqIntroRolesResponseTemplateService(String Id,String OppName) throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
        this.Id = Id;
        this.OppName = OppName;
    }
    public void archiveReqRolesResponseDefaultRecords() {
         try {
             String oppName = "";
             String QueryAppName = "SELECT * FROM OPPORTUNITY_INFO WHERE COLUMN_NAME = 'appName' and Id = ?;";
             PreparedStatement st = con.prepareStatement(QueryAppName);
 			 st.setString(1, Id);
 			 ResultSet rs = st.executeQuery();
             if(rs.next())
                 oppName = rs.getString("value");
             st.close();
             rs.close();
            // String selectQuery = "select * from ArchiveReq_Roles_Info_Template_Details";
            // Statement st1 = con.createStatement();
            // ResultSet rs1 = st1.executeQuery(selectQuery);
        //   while(rs1.next()) {
                 String approval_id=generateRandomApprovalId();
                 String RolesResponse_InsertQuery = "insert into ArchiveReq_Roles_Info (seq_no, OppId, prj_name, app_name,role, name, emailId, username, approvalId, intakeApproval, moduleId, comments, priority_order_num, mail_flag) "
                            + "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
                 PreparedStatement preparedStatement1 = con.prepareStatement(RolesResponse_InsertQuery);
                    preparedStatement1.setInt(1, 1);
                    preparedStatement1.setString(2, Id);
                    preparedStatement1.setString(3, "");
                    preparedStatement1.setString(4, oppName);
                    preparedStatement1.setString(5, "");
                    preparedStatement1.setString(6, "");
                    preparedStatement1.setString(7, "");
                    preparedStatement1.setString(8, "");
                    preparedStatement1.setString(9, approval_id);
                    preparedStatement1.setString(10, APPROVAL_CONSTANT.DECISION_PENDING);
                    preparedStatement1.setString(11, "");
                    preparedStatement1.setString(12, "");
                    preparedStatement1.setString(13, "");
                    preparedStatement1.setString(14, "false");
                    preparedStatement1.execute();
                //}
                // st1.close();
                 //rs1.close();
             }
         catch(Exception e) {
             e.printStackTrace();
         }
    }
    public JsonArray archiveReqIntroRolesResponseDataRetrieve() {
        JsonArray jsonArray = new JsonArray();
        try {
             String selectQuery1 = "select * from ArchiveReq_Roles_Info where OppId = ?;";
             PreparedStatement st2 = con.prepareStatement(selectQuery1);
 			 st2.setString(1, Id);
 			 ResultSet rs2 = st2.executeQuery();
             if(!rs2.next()) {
                 archiveReqRolesResponseDefaultRecords();
             }
             jsonArray = getTableInfo();
             st2.close();
             rs2.close();
        }
             catch(Exception e) {
                 e.printStackTrace();
             }
        System.out.println("json array value : "+jsonArray);
        return jsonArray;
    }
    public JsonArray getTableInfo() {
        JsonArray jsonArray = new JsonArray();
        try {
             String selectQuery1 = "select * from ArchiveReq_Roles_Info where OppId = ? order by seq_no;";
             PreparedStatement st2 = con.prepareStatement(selectQuery1);
 			 st2.setString(1, Id);
 			 ResultSet rs2 = st2.executeQuery();
             while(rs2.next()) {
                 JsonObject jsonObject = new JsonObject();
                 jsonObject.addProperty("seq_no", rs2.getInt("seq_no"));
                 jsonObject.addProperty("OppId", rs2.getString("OppId"));
                 jsonObject.addProperty("prj_name", rs2.getString("prj_name"));
                 jsonObject.addProperty("app_name", rs2.getString("app_name"));
                 jsonObject.addProperty("role", rs2.getString("role"));
                 jsonObject.addProperty("name", rs2.getString("name"));
                 jsonObject.addProperty("emailId", rs2.getString("emailId"));
                 jsonObject.addProperty("username", rs2.getString("username"));
                 jsonObject.addProperty("priority_order_num", rs2.getString("priority_order_num"));
            //   jsonObject.addProperty("ApprovalStatus",getApprovalStatus(rs2.getString(5)));
                 jsonArray.add(jsonObject);
             }
             st2.close();
             rs2.close();
        }
             catch(Exception e) {
                 e.printStackTrace();
             }
        return jsonArray;
    }
    private boolean getApprovalStatus(String Role)
    {
        boolean checkStatus = true;
        try
        {
            String roleQuery = "select * from archiverequirements_stake_holder_info where OppId=? and role=?;";
            PreparedStatement st = con.prepareStatement(roleQuery);
			st.setString(1, Id);
			st.setString(2, Role);
			ResultSet rs = st.executeQuery();
            System.out.println(roleQuery);
            if(rs.next())
            {
                if(rs.getString("ArchiveRequirementApproval").equals(APPROVAL_CONSTANT.DECISION_PENDING))
                checkStatus = false;
            }
            else
            checkStatus = false;
            rs.close();
            st.close();
         }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return checkStatus;
    }
    protected void finalize() throws Throwable {
         con.close();
         System.out.println("DB connection closed");
        }
public String generateRandomApprovalId() throws SQLException {
        String uniqueID = "";
        boolean checkTermination = true;
        while(checkTermination) {
            uniqueID = UUID.randomUUID().toString();
            System.out.println("Approval Id : " + uniqueID);
            boolean checkDupilcateId = checkDuplicateApprovalId(uniqueID);
            if(checkDupilcateId == false) {
                checkTermination = false;
                }
        }
        return uniqueID;
    }
    public boolean checkDuplicateApprovalId(String uniqueID) throws SQLException {
    	PreparedStatement state=null;
    	ResultSet result=null;
        boolean checkDuplicate = false;
        String selectQuery = "select * from ArchiveReq_Roles_Info order by seq_no;";
        state = con.prepareStatement(selectQuery);
        result = state.executeQuery();
        while(result.next()) {
            String checkApprovalId = result.getString("approvalId");
            if(checkApprovalId.equals(uniqueID)) {
                checkDuplicate = true;
            }   
        }
        state.close();
        result.close();
        return checkDuplicate;
    }
}
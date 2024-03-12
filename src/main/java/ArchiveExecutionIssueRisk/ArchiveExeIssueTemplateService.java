package ArchiveExecutionIssueRisk;
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
public class ArchiveExeIssueTemplateService {
        DBconnection dBconnection =null;
        Connection con = null;
        public String Id = null;
        public String OppName;
        public ArchiveExeIssueTemplateService(String Id,String OppName) throws ClassNotFoundException, SQLException {
            dBconnection = new DBconnection();
            con = (Connection) dBconnection.getConnection();
            this.Id = Id;
            this.OppName = OppName;
        }
        public void archiveExeIssueDefaultRecords() {
             try {
                 String approval_id=generateRandomApprovalId();
                 String StakeHolderInsertQuery = "insert into ArchiveExe_Issue_Info (seq_no, app_Id,impact, type, description, start_date, raised_by, status, assigned_to, resolved, exp_date, end_date, comments,oppId,IssueId) "
                            + "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?);";
                      PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
                      prestmt.setInt(1, 1);
                      prestmt.setString(2, approval_id);
                      prestmt.setString(3, "MEDIUM");
                      prestmt.setString(4, "ISSUE");
                      prestmt.setString(5, "");
                      prestmt.setString(6, "");
                      prestmt.setString(7, "");
                      prestmt.setString(8, "");
                      prestmt.setString(9, "");
                      prestmt.setString(10, "OPEN");
                      prestmt.setString(11, "");
                      prestmt.setString(12, "");
                      prestmt.setString(13, "");
                      prestmt.setString(14, Id);
                      prestmt.setString(15, "");
                      prestmt.execute();
                 }
             catch(Exception e) {
                 e.printStackTrace();
             }
        }
        public JsonArray archiveExeIssueDataRetrieve() {
            JsonArray jsonArray = new JsonArray();
            try {
                 String selectQuery1 = "select * from ArchiveExe_Issue_Info where oppId=? ;";
                 PreparedStatement pst2 = con.prepareStatement(selectQuery1);
     			 pst2.setString(1, Id);
     			 ResultSet rs2 = pst2.executeQuery();
                 
                 if(!rs2.next()) {
                     archiveExeIssueDefaultRecords();
                 }
                 jsonArray = getTableInfo();
                 pst2.close();
                 rs2.close();
            }
                 catch(Exception e) {
                     e.printStackTrace();
                 }
            return jsonArray;
        }
        public JsonArray getTableInfo() {
            JsonArray jsonArray = new JsonArray();
            try {
                 String selectQuery1 = "select * from ArchiveExe_Issue_Info where oppId=? order by seq_no;";
                 PreparedStatement pst2 = con.prepareStatement(selectQuery1);
     			 pst2.setString(1, Id);
     			 ResultSet rs2 = pst2.executeQuery();
                 while(rs2.next()) {
                     JsonObject jsonObject = new JsonObject();
                     jsonObject.addProperty("seq_no", rs2.getInt("seq_no"));
                     jsonObject.addProperty("impact", rs2.getString("impact"));
                     jsonObject.addProperty("type", rs2.getString("type"));
                     jsonObject.addProperty("description", rs2.getString("description"));
                     jsonObject.addProperty("start_date", rs2.getString("start_date"));
                     jsonObject.addProperty("raised_by", rs2.getString("raised_by"));
                     jsonObject.addProperty("status", rs2.getString("status"));
                     jsonObject.addProperty("assigned_to", rs2.getString("assigned_to"));
                     jsonObject.addProperty("resolved", rs2.getString("resolved"));
                     jsonObject.addProperty("exp_date", rs2.getString("exp_date"));
                     jsonObject.addProperty("end_date", rs2.getString("end_date"));
                     jsonObject.addProperty("comments", rs2.getString("comments"));
                     jsonObject.addProperty("IssueId", rs2.getString("IssueId"));
                     jsonArray.add(jsonObject);
                 }
                 System.out.println( " ye aya retrive : "+jsonArray);
                 pst2.close();
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
                PreparedStatement pst2 = con.prepareStatement(roleQuery);
    			pst2.setString(1, Id);
    			pst2.setString(2, Role);
    			System.out.println(roleQuery);
    			ResultSet rs = pst2.executeQuery();                                             
                if(rs.next())
                {
                    if(rs.getString("ArchiveRequirementApproval").equals(APPROVAL_CONSTANT.DECISION_PENDING))
                    checkStatus = false;
                }
                else
                checkStatus = false;
                rs.close();
                pst2.close();
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
                System.out.println("App Id : " + uniqueID);
                boolean checkDupilcateId = checkDuplicateApprovalId(uniqueID);
                if(checkDupilcateId == false) {
                    checkTermination = false;
                    }
            }
            return uniqueID;
        }
        public boolean checkDuplicateApprovalId(String uniqueID) throws SQLException {
            boolean checkDuplicate = false;
            String selectQuery = "select * from ArchiveExe_Issue_Info where oppId=? order by seq_no;";
            PreparedStatement pst2 = con.prepareStatement(selectQuery);
			pst2.setString(1, Id);
			System.out.println(selectQuery);
			ResultSet result = pst2.executeQuery();
            
            while(result.next()) {
                String checkApprovalId = result.getString("app_id");
                if(checkApprovalId.equals(uniqueID)) {
                    checkDuplicate = true;
                }   
            }
            return checkDuplicate;
        }// TODO Auto-generated constructor stub
}

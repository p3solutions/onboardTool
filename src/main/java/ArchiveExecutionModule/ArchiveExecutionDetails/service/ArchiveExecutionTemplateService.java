package ArchiveExecutionModule.ArchiveExecutionDetails.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import onboard.DBconnection;
import logger.System;
public class ArchiveExecutionTemplateService {
DBconnection dBconnection =null;
    Connection con = null;
    public String Id = null;
    public ArchiveExecutionTemplateService(String Id) throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
        this.Id = Id;
    }
 public void archiveExecutionDefaultRecords() throws SQLException {
	 PreparedStatement st=null;
	 ResultSet rs=null;
     try {
         String selectQuery = "select * from Archive_Execution_Template_Info";
         st = con.prepareStatement(selectQuery);
         rs = st.executeQuery();
         if(!rs.next()) {
             ArchiveExecutionTemplateDetails archiveExecTemp[] = new ArchiveExecutionTemplateDetails[63];
             archiveExecTemp[0] = new ArchiveExecutionTemplateDetails("1","1","Initiation & Setup - General","");
             archiveExecTemp[1] = new ArchiveExecutionTemplateDetails("2","2","","Project Kickoff Meeting");
             archiveExecTemp[2] = new ArchiveExecutionTemplateDetails("3","2","","Stakeholder/Project Team Identification");
             archiveExecTemp[3] = new ArchiveExecutionTemplateDetails("4","2","","Consultants Remote access setup");
             archiveExecTemp[4] = new ArchiveExecutionTemplateDetails("5","2","","Secure link Access, Applications enablement");
             archiveExecTemp[5] = new ArchiveExecutionTemplateDetails("6","2","","Project Plan, Implementation Roadmap");
             archiveExecTemp[6] = new ArchiveExecutionTemplateDetails("7","1","Infrastructure","");
             archiveExecTemp[7] = new ArchiveExecutionTemplateDetails("8","2","InfoArchive","Access to Existing InfoArchive  - All regions");
             archiveExecTemp[8] = new ArchiveExecutionTemplateDetails("9","2","InfoArchive","Review InfoArchive Architecture");
             archiveExecTemp[9] = new ArchiveExecutionTemplateDetails("10","2","InfoArchive","Architecture Change recommendations (if any)");
             archiveExecTemp[10] = new ArchiveExecutionTemplateDetails("11","2","Archon","Archon - Architecture/Components list");
             archiveExecTemp[11] = new ArchiveExecutionTemplateDetails("12","2","Archon - Dev","Access to Archon Infrastructure");
             archiveExecTemp[12] = new ArchiveExecutionTemplateDetails("13","2","Archon - Dev","Install Archon");
             archiveExecTemp[13] = new ArchiveExecutionTemplateDetails("14","2","Archon - Dev","Test/Validation of Archon");
             archiveExecTemp[14] = new ArchiveExecutionTemplateDetails("15","2","Archon - Dev","LDAP Integration");
             archiveExecTemp[15] = new ArchiveExecutionTemplateDetails("16","2","Archon - Dev","Job Aid/Install Documentation");
             archiveExecTemp[16] = new ArchiveExecutionTemplateDetails("17","2","Archon - Test","Access to Archon Infrastructure");
             archiveExecTemp[17] = new ArchiveExecutionTemplateDetails("18","2","Archon - Test","Install Archon");
             archiveExecTemp[18] = new ArchiveExecutionTemplateDetails("19","2","Archon - Test","Test/Validation of Archon");
             archiveExecTemp[19] = new ArchiveExecutionTemplateDetails("20","2","Archon - Test","LDAP Integration");
             archiveExecTemp[20] = new ArchiveExecutionTemplateDetails("21","2","Archon - Test","Job Aid/Install Documentation");
             archiveExecTemp[21] = new ArchiveExecutionTemplateDetails("22","2","Archon - Prod","Access to Archon Infrastructure");
             archiveExecTemp[22] = new ArchiveExecutionTemplateDetails("23","2","Archon - Prod","Install Archon");
             archiveExecTemp[23] = new ArchiveExecutionTemplateDetails("24","2","Archon - Prod","Test/Validation of Archon");
             archiveExecTemp[24] = new ArchiveExecutionTemplateDetails("25","2","Archon - Prod","LDAP Integration");
             archiveExecTemp[25] = new ArchiveExecutionTemplateDetails("26","2","Archon - Prod","Job Aid/Install Documentation");
             archiveExecTemp[26] = new ArchiveExecutionTemplateDetails("27","1","Intake Process / Methodology","");
             archiveExecTemp[27] = new ArchiveExecutionTemplateDetails("28","2","","Intake Workshop");
             archiveExecTemp[28] = new ArchiveExecutionTemplateDetails("29","2","","Define Organizational structure");
             archiveExecTemp[29] = new ArchiveExecutionTemplateDetails("30","2","","Define characteristics of Opportunity Management");
             archiveExecTemp[30] = new ArchiveExecutionTemplateDetails("31","2","","Triage");
             archiveExecTemp[31] = new ArchiveExecutionTemplateDetails("32","2","","Assessment");
             archiveExecTemp[32] = new ArchiveExecutionTemplateDetails("33","2","","Legal (retention) Review");
             archiveExecTemp[33] = new ArchiveExecutionTemplateDetails("34","2","","Financial Models, Cost Benefit Analysis");
             archiveExecTemp[34] = new ArchiveExecutionTemplateDetails("35","2","","Finance & ROI Measurement");
             archiveExecTemp[35] = new ArchiveExecutionTemplateDetails("36","2","","Plan and Prioritize; Estimation");
             archiveExecTemp[36] = new ArchiveExecutionTemplateDetails("37","2","","Deliverables - Process flow, Templates, Recommendations");
             archiveExecTemp[37] = new ArchiveExecutionTemplateDetails("38","2","","Applications Intake assessment, Define Waves, Implementation Roadmap for 19 In-scope applications");
             archiveExecTemp[38] = new ArchiveExecutionTemplateDetails("39","1","Archive Implementation","");
             archiveExecTemp[39] = new ArchiveExecutionTemplateDetails("40","2","","Requirements Gathering");
             archiveExecTemp[40] = new ArchiveExecutionTemplateDetails("41","2","","Requirements Documentation/Approval");
             archiveExecTemp[41] = new ArchiveExecutionTemplateDetails("42","2","","Technical Design Document");
             archiveExecTemp[42] = new ArchiveExecutionTemplateDetails("43","2","","Technical Design Documentation/Approval");
             archiveExecTemp[43] = new ArchiveExecutionTemplateDetails("44","2","","Archon - Source system connectivity");
             archiveExecTemp[44] = new ArchiveExecutionTemplateDetails("45","2","","Data Archive in Test Environment");
             archiveExecTemp[45] = new ArchiveExecutionTemplateDetails("46","2","","Screens Configuration in Test Environment");
             archiveExecTemp[46] = new ArchiveExecutionTemplateDetails("47","2","","Perform System Testing");
             archiveExecTemp[47] = new ArchiveExecutionTemplateDetails("48","2","","System Test Documentation/Results Approval");
             archiveExecTemp[48] = new ArchiveExecutionTemplateDetails("49","2","","UAT Testing");
             archiveExecTemp[49] = new ArchiveExecutionTemplateDetails("50","2","","UAT Signoff");
             archiveExecTemp[50] = new ArchiveExecutionTemplateDetails("51","2","","Production implementation - Data Archival");
             archiveExecTemp[51] = new ArchiveExecutionTemplateDetails("52","2","","Production implementation - Screens configuration");
             archiveExecTemp[52] = new ArchiveExecutionTemplateDetails("53","2","","Production implementation - Users configuration");
             archiveExecTemp[53] = new ArchiveExecutionTemplateDetails("54","2","","Production implementation - Retention configuration");
             archiveExecTemp[54] = new ArchiveExecutionTemplateDetails("55","2","","Chain of Custody validation/documentation");
             archiveExecTemp[55] = new ArchiveExecutionTemplateDetails("56","2","","Chain of Custody documentation approval");
             archiveExecTemp[56] = new ArchiveExecutionTemplateDetails("57","2","","Implementation Signoff");
             archiveExecTemp[57] = new ArchiveExecutionTemplateDetails("58","1","Closure","");
             archiveExecTemp[58] = new ArchiveExecutionTemplateDetails("59","2","","Warranty Support - 6 Weeks");
             archiveExecTemp[59] = new ArchiveExecutionTemplateDetails("60","2","","Stakeholder Communication");
             archiveExecTemp[60] = new ArchiveExecutionTemplateDetails("61","2","","Lessons Learned");
             archiveExecTemp[61] = new ArchiveExecutionTemplateDetails("62","2","","Project Close Check List");
             archiveExecTemp[62] = new ArchiveExecutionTemplateDetails("63","2","","Final Finances and Invoices");
             for ( int index = 0; index<archiveExecTemp.length; index++) {
                 String archiveExecTemp_InsertQuery = "insert into Archive_Execution_Template_Info (seq_no, level, taskGroup, taskName, taskType, majorDependencies, assignedTo, planSrt, planEnd, actSrt, actEnd, completion, status, remark)"
                                                            +"value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                 PreparedStatement prestmt = con.prepareStatement(archiveExecTemp_InsertQuery);
                  prestmt.setString(1, archiveExecTemp[index].seq_no);
                  prestmt.setString(2, archiveExecTemp[index].level);
                  prestmt.setString(3, archiveExecTemp[index].taskGroup);
                  prestmt.setString(4, archiveExecTemp[index].taskName);
                  prestmt.setString(5, "");
                  prestmt.setString(6, "");
                  prestmt.setString(7, "");
                  prestmt.setString(8, "");
                  prestmt.setString(9, "");
                  prestmt.setString(10, "");
                  prestmt.setString(11, "");
                  prestmt.setString(12, "");
                  prestmt.setString(13, "");
                  prestmt.setString(14, "");
                  prestmt.execute();
             }
         }
     }
     catch(Exception e) {
         e.printStackTrace();
     }
     finally {
    	 st.close();
    	 rs.close();
     }
 }
 public void archiveTemplateToArchiveInfo() throws SQLException {
	 PreparedStatement st=null,st1=null;
	 ResultSet rs=null,rs1=null;
     try {
         String oppName = "";
         String QueryAppName = "SELECT * FROM OPPORTUNITY_INFO WHERE COLUMN_NAME = 'appName' and Id = '"+Id+"';";
         st = con.prepareStatement(QueryAppName);
         rs = st.executeQuery();
         if(rs.next())
             oppName = rs.getString("value");
         String SelectQuery = "select * from Archive_Execution_Template_Info order by seq_no";
            st1 = con.prepareStatement(SelectQuery);
            rs1 = st1.executeQuery();
            int number = 0, decimalNumber = 1;
            while(rs1.next()) {
                //String taskId = generateTaskId();
                String taskId = "";
                if(rs1.getString(2) .equals("1")) {
                    number++;
                    taskId =  number+"";
                    decimalNumber = 1;
                }
                else {
                    taskId =number+"."+((decimalNumber<10)?+decimalNumber:decimalNumber);
                    decimalNumber++;
                }
                String template_InsertQuery = "insert into Archive_Execution_Info (seq_no, oppId, oppName, level, taskId, taskGroup, taskName, taskType, majorDependencies, assignedTo, planSrt, planEnd, actSrt, actEnd, completion, status, remark)"
                                                +"value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement prestmt = con.prepareStatement(template_InsertQuery);
                prestmt.setInt(1, rs1.getInt(1));
                prestmt.setString(2, Id);
                prestmt.setString(3, oppName);
                prestmt.setString(4, rs1.getString(2));
                prestmt.setString(5, taskId);
                prestmt.setString(6, rs1.getString(3));
                prestmt.setString(7, rs1.getString(4));
                prestmt.setString(8, rs1.getString(5));
                prestmt.setString(9, rs1.getString(6));
                prestmt.setString(10, rs1.getString(7));
                prestmt.setString(11, rs1.getString(8));
                prestmt.setString(12, rs1.getString(9));
                prestmt.setString(13, rs1.getString(10));
                prestmt.setString(14, rs1.getString(11));
                prestmt.setString(15, rs1.getString(12));
                prestmt.setString(16, rs1.getString(13));
                prestmt.setString(17, rs1.getString(14));
                prestmt.execute();
            }
     }
     catch(Exception e) {
         e.printStackTrace();
     }
     finally {
    	 st.close();
    	 rs.close();
    	 st1.close();
    	 rs1.close();
     }
 }
 public String generateTaskId() throws SQLException {
        String uniqueID = "";
        boolean checkTermination = true;
        while(checkTermination) {
            uniqueID = UUID.randomUUID().toString();
            //System.out.println("Task Id : " + uniqueID);
            boolean checkDupilcateId = checkDuplicateTaskId(uniqueID);
            if(checkDupilcateId == false) {
                checkTermination = false;
                }
        }
        return uniqueID;
    }
    public boolean checkDuplicateTaskId(String uniqueID) throws SQLException {
        boolean checkDuplicate = false;
        String selectQuery = "select * from Archive_Execution_Info order by seq_no;";
        Statement state = con.createStatement();
        ResultSet result = state.executeQuery(selectQuery);
        while(result.next()) {
            String checkTaskId = result.getString("taskId");
            if(checkTaskId == uniqueID) {
                checkDuplicate = true;
            }   
        }
        state.close();
        result.close();
        return checkDuplicate;
    }
    protected void finalize() throws Throwable 
    { 
        System.out.println("Db connection closed.");
        con.close();
    }
}
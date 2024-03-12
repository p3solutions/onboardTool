package NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import org.checkerframework.checker.index.qual.GTENegativeOne;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import java.sql.Connection;
import onboard.DBconnection;
import logger.System;
public class archiveScreenReqAddService {
    DBconnection dBconnection;
    Connection con;
    String Id;
    String OppName;
    String displayName;
    public archiveScreenReqAddService(String Id, String OppName, String displayName) throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
        this.Id =Id;
        this.OppName = OppName;
        this.displayName = displayName;
    }
    public JsonObject archiveScreenReqAdd() {
        JsonObject jsonObject = new JsonObject();
        try {
            boolean statusFlag = false;
            boolean checkDisplay = checkDuplicateDisplayName();
            if(!checkDisplay) {
            int SeqNum = getMaxSeqNum("Archive_ScreenReq_Info")+1;
              String InsertQuery = "insert into Archive_ScreenReq_Info (seq_no, oppId, oppName, prjname, reqId, screenDisplay, purpose, equivalentLegacy)"
                        + " value(?, ?, ?, ?, ?, ?, ?, ?);";
              PreparedStatement prestmt = con.prepareStatement(InsertQuery);
              prestmt.setInt(1, SeqNum);
              prestmt.setString(2, Id);
              prestmt.setString(3, OppName);
              prestmt.setString(4, "");
              prestmt.setString(5, getReqId(SeqNum));
              prestmt.setString(6, displayName);
              prestmt.setString(7, "");
              prestmt.setString(8, "");
              prestmt.execute();
              prestmt.close();
              statusFlag =true;
              jsonObject = searchFormAdd(SeqNum);
            jsonObject.addProperty("AddStatus", statusFlag);
            jsonObject.addProperty("ReqId",getReqId(SeqNum));
            }
            jsonObject.addProperty("checkDisplay",checkDisplay);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    private int getMaxSeqNum(String tableName) {
        int maxSeqNum = 0;
        try {
            String selectQuery = "select max(seq_no) from "+tableName+" where oppId =?;";
            PreparedStatement st = con.prepareStatement(selectQuery);
            st.setString(1,Id);
            ResultSet rs = st.executeQuery();
            if(rs.next()) 
                maxSeqNum = rs.getInt(1);
            st.close();
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return maxSeqNum;
    }
    private String getReqId(int seqNum){
        String reqId = "SDR-";
        try {
            String seq_Num = String.valueOf(seqNum); 
            int length = seq_Num.length();
            if(length<=3)
            for(int i = 0; i<3-length; i++) 
                seq_Num ="0"+seq_Num;
          reqId+=seq_Num;   
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return reqId;
    }
    private boolean checkDuplicateDisplayName() {
        boolean checkDisplay = false;
        try {
            String selectQuery = "select * from Archive_ScreenReq_Info where oppId = ? and screenDisplay = ?;";
            PreparedStatement st = con.prepareStatement(selectQuery);
            st.setString(1,Id);
            st.setString(2,displayName);
            ResultSet rs = st.executeQuery();
            if(rs.next()) 
                checkDisplay = true;
            st.close();
            rs.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return checkDisplay;
    }
    private JsonObject searchFormAdd(int seqNum) {
        JsonObject jsonObject = new JsonObject();
        try {
            boolean statusFlag = false;
            int SeqNum = getMaxSeqNum("Archive_ScreenReq_SearchForm")+1;
              String InsertQuery = "insert into Archive_ScreenReq_SearchForm (seq_no, oppId, oppName, prjname, reqId, searchForm, searchField, fieldFormat, dataType, dataRetrieval, requiredField, additionalInfo)"
                        + " value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
              PreparedStatement prestmt = con.prepareStatement(InsertQuery);
              prestmt.setInt(1, SeqNum);
              prestmt.setString(2, Id);
              prestmt.setString(3, OppName);
              prestmt.setString(4, "");
              prestmt.setString(5, getReqId(seqNum));
              prestmt.setString(6, displayName);
              prestmt.setString(7, "");
              prestmt.setString(8, "");
              prestmt.setString(9, "");
              prestmt.setString(10, "");
              prestmt.setString(11, "");
              prestmt.setString(12, "");
              prestmt.execute();
              prestmt.close();
              statusFlag =true;
              jsonObject.addProperty("AddSearchForm", statusFlag);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }
    protected void finalize() throws Throwable {
         con.close();
         System.out.println("DB connection closed");
        }
}
package NewArchiveRequirements.ApprovalInfo.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import common.constant.APPROVAL_CONSTANT;
import common.constant.MODULE_NAME;
import common.email.service.EmailApprovalService;
import onboard.DBconnection;
import logger.System;
public class archiveReqDirectApprovalDataRetrieveService {
    DBconnection dBconnection;
    Connection con;
    String Id;
    String OppName;
    public archiveReqDirectApprovalDataRetrieveService(String Id,String OppName) throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
         con = (Connection) dBconnection.getConnection();
         this.Id = Id;
         this.OppName = OppName;
    }
    public JsonArray directApprovalArchiveReqDataRetrieve( String approverId,String uname,String priorityNo)
    {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try
        {
            String selectQuery ="update decom3sixtytool.ArchiveReq_Roles_Info set mail_flag='true' where intakeApproval='Approved' and priority_order_num=? and approvalId=? and OppId=?;";
            PreparedStatement st=con.prepareStatement(selectQuery);
            st.setString(1, priorityNo);
            st.setString(2, approverId);
            st.setString(3, Id);
            int update = st.executeUpdate();
            if(update>0) {
                jsonObject.addProperty("status", "true");
            }
            st.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        jsonArray.add(jsonObject);
        return jsonArray;
    }
    public JsonArray directApprovalIntakeDataRetrieve( String approverId,String uname,String priorityNo)
    {
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        try
        {
            String selectQuery ="update decom3sixtytool.intake_stake_holder_info set mail_flag='true' where intakeApproval='Approved' and priority_order_num=? and approvalId=? and OppId=?;";
            PreparedStatement st=con.prepareStatement(selectQuery);
            st.setString(1, priorityNo);
            st.setString(2, approverId);
            st.setString(3, Id);
           int update = st.executeUpdate();
            if(update>0) {
                jsonObject.addProperty("status", "true");
            }
            st.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        jsonArray.add(jsonObject);
        return jsonArray;
    }
    protected void finalize() throws Throwable {
        con.close();
        System.out.println("Db connection closed.");
    }
}
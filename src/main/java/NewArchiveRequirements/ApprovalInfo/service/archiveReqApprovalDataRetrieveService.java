package NewArchiveRequirements.ApprovalInfo.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import common.constant.APPROVAL_CONSTANT;
import common.constant.MODULE_NAME;
import common.email.service.EmailApprovalService;
import onboard.DBconnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;
import logger.System;
public class archiveReqApprovalDataRetrieveService {
    DBconnection dBconnection;
    Connection con;
    String Id;
    String OppName;
    public String oppId="";
	public String userName="";
	public String role = "";
	public String appname = "";
    public archiveReqApprovalDataRetrieveService(String Id,String OppName) throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
         con = (Connection) dBconnection.getConnection();
         this.Id = Id;
         this.OppName = OppName;
    }
    public JsonArray ApprovalDataRetrieve()
    {
        JsonArray jsonArray = new JsonArray();
        try
        {
            boolean checkData = false;
            String selectQuery ="select * from ArchiveReq_Roles_Info where oppid=?;";
            PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
        
            while(rs.next())
            {
                checkData = true;
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("seqNum",rs.getString("seq_no"));
                jsonObject.addProperty("name", rs.getString("name"));
                jsonObject.addProperty("role",rs.getString("role"));
                jsonObject.addProperty("approvalId",rs.getString("approvalId"));
                jsonObject.addProperty("approvalStatus",rs.getString("intakeApproval"));
                jsonObject.addProperty("username",rs.getString("username"));
                jsonObject.addProperty("oppId",rs.getString("OppId"));
                jsonObject.addProperty("app_name",rs.getString("app_name"));
                jsonObject.addProperty("priority_order_num",rs.getString("priority_order_num"));
                jsonObject.addProperty("CheckExistence",checkData);
                EmailApprovalService mailService = new EmailApprovalService(Id, "", MODULE_NAME.ARCHIVE_REQUIREMENTS_MODULE);
                jsonObject.addProperty("checkDecision", mailService.checkCurrentApproverCanDecide(rs.getString("approvalId")));
                jsonArray.add(jsonObject);
            }
            rs.close();
            st.close();
            if(!checkData)
            {
                int seq_no=0;
                    String selectQuery1 = "select * from archivereq_roles_info where oppid=?;";
                    PreparedStatement st1 = con.prepareStatement(selectQuery1);
        			st1.setString(1, Id);
        			ResultSet rs1 = st1.executeQuery();
                   
                    while(rs1.next())
                    {
                        jsonArray.add(InsertApprovalRow(rs1.getString("role"),rs1.getString("name"), ++seq_no));
                    }
                    rs1.close();
                    st1.close();
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return jsonArray;
    }
    
    public JsonArray ApprovalRetrieveUsingApprovalId(String Id, String UserName,String approverId,boolean isApprover,HttpServletRequest request)
    {
        JsonArray jsonArray = new JsonArray();
        try
        {
    		if(isApprover) {
    			getOppIdAndUserName(approverId);
    		  Id = oppId;
    		  UserName = userName;
    		  this.Id = oppId;
    		  this.OppName = appname;
    		  HttpSession details = request.getSession();
    		  details.setAttribute("ID", oppId);
    		  details.setAttribute("SelectedOpportunity", appname);
    		}
            boolean checkData = false;
            String selectQuery ="select * from ArchiveReq_Roles_Info where oppid=?;";
            PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();
        
            while(rs.next())
            {
                checkData = true;
                JsonObject jsonObject = new JsonObject();
                jsonObject.addProperty("seqNum",rs.getString("seq_no"));
                jsonObject.addProperty("name", rs.getString("name"));
                jsonObject.addProperty("role",rs.getString("role"));
                jsonObject.addProperty("approvalId",rs.getString("approvalId"));
                jsonObject.addProperty("approvalStatus",rs.getString("intakeApproval"));
                jsonObject.addProperty("username",rs.getString("username"));
                jsonObject.addProperty("oppId",rs.getString("OppId"));
                jsonObject.addProperty("app_name",rs.getString("app_name"));
                jsonObject.addProperty("priority_order_num",rs.getString("priority_order_num"));
                jsonObject.addProperty("CheckExistence",checkData);
                EmailApprovalService mailService = new EmailApprovalService(Id, "", MODULE_NAME.ARCHIVE_REQUIREMENTS_MODULE);
                jsonObject.addProperty("checkDecision", mailService.checkCurrentApproverCanDecide(rs.getString("approvalId")));
                jsonArray.add(jsonObject);
            }
            rs.close();
            st.close();
            if(!checkData)
            {
                int seq_no=0;
                    String selectQuery1 = "select * from archivereq_roles_info where oppid=?;";
                    PreparedStatement st1 = con.prepareStatement(selectQuery1);
        			st1.setString(1, Id);
        			ResultSet rs1 = st1.executeQuery();
                   
                    while(rs1.next())
                    {
                        jsonArray.add(InsertApprovalRow(rs1.getString("role"),rs1.getString("name"), ++seq_no));
                    }
                    rs1.close();
                    st1.close();
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return jsonArray;
    }
    
    
    
    private void getOppIdAndUserName(String approverId) {
  	  Id=null;
  	 try {
  		 String selectQuery = "select * from ArchiveReq_Roles_Info where approvalId = ?";
  		 PreparedStatement st = con.prepareStatement(selectQuery);
			 st.setString(1, approverId);
			 ResultSet rs = st.executeQuery();
  		 if(rs.next()) {
  			 oppId = rs.getString("oppId");
  			 userName =rs.getString("username");
  			 role =  rs.getString("role");
  			appname = rs.getString("app_name");
  		 }
  		 rs.close();
  		 st.close();
  	 }
  	 catch(Exception e) {
  		 e.printStackTrace();
  	 }
   }
    
    
    private JsonObject InsertApprovalRow(String role,String name, int seqNum)
    {
        JsonObject jsonObject = new JsonObject();
        try
        {
            String approvalId = getUUID();
            String Approval_InsertQuery = "insert into ArchiveRequirements_Stake_Holder_Info (seq_no, OppId, prj_name, OppName, role, name, approvalId,ArchiveRequirementApproval,moduleId)"
                     +" value(?,?,?,?,?,?,?,?,?)";
             PreparedStatement preparedStatement1 = con.prepareStatement(Approval_InsertQuery);
                preparedStatement1.setInt(1, seqNum);
                preparedStatement1.setString(2, Id);
                preparedStatement1.setString(3, "");
                preparedStatement1.setString(4, OppName);
                preparedStatement1.setString(5, role);
                preparedStatement1.setString(6, name);
                preparedStatement1.setString(7,approvalId);
                preparedStatement1.setString(8,APPROVAL_CONSTANT.DECISION_PENDING);
                preparedStatement1.setString(9,"");
                preparedStatement1.execute();
                preparedStatement1.close();
                jsonObject.addProperty("seqNum",seqNum);
                jsonObject.addProperty("name", name);
                jsonObject.addProperty("role",role);
                jsonObject.addProperty("approvalStatus",APPROVAL_CONSTANT.DECISION_PENDING);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return jsonObject;
    }
    private String getUUID()
    {
        boolean checkDuplicate = true;
        String ID ="";
        try
        {
            UUID uuid=UUID.randomUUID();
            ID =uuid.toString();
            while(checkDuplicate)
            {
                String selectQuery ="select * from ArchiveRequirements_Stake_Holder_Info where approvalId=?;";
                PreparedStatement st2 = con.prepareStatement(selectQuery);
    			st2.setString(1, ID);
    			ResultSet rs2 = st2.executeQuery();
                
                if(!rs2.next())
                    checkDuplicate =false;
                rs2.close();
                st2.close();
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return ID;
    }
    protected void finalize() throws Throwable {
        con.close();
        System.out.println("Db connection closed.");
    }
}
package NewArchiveRequirements.ApprovalInfo.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.google.gson.JsonObject;
import java.sql.Connection;

import common.constant.APPROVAL_CONSTANT;
import onboard.DBconnection;
import logger.System;

public class archiveReqApprovalSaveService {
	DBconnection dBconnection;
	Connection con;
	String Id;
	String approvalStatus;
	int seqNum;
	String OppName;
	String approverId; 
	public archiveReqApprovalSaveService(int seqNum,String Id,String OppName,String approverId,String approvalStatus) throws ClassNotFoundException, SQLException
	{
		dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.Id = Id;
		 this.approvalStatus = approvalStatus;
		 this.seqNum = seqNum;
		 this.approverId = approverId;
		 
	}
	
	public JsonObject approvalSave()
	{
		boolean statusFlag = false;
		JsonObject jsonObject = new JsonObject();
		try
		{
		   String updateQuery = "update ArchiveReq_Roles_Info set intakeApproval =?  where oppid=? and approvalId=?;";
		   PreparedStatement st = con.prepareStatement(updateQuery);
	          st.setString(1, approvalStatus);
	          st.setString(2, Id);
	          st.setString(3, approverId);
	          st.execute();
		 
		   statusFlag =true;
		   jsonObject.addProperty("statusFlag",statusFlag);
		   checkAndUpdateOverallApproval();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
	}
	 
	private boolean checkAndUpdateOverallApproval()
	{
		boolean checkOverallStatus = true;
		try
		{
			int seq_num = getSequenceNumber()+1;
			String checkQuery = "select * from ArchiveRequirements_Stake_Holder_Info where oppId=?";
			PreparedStatement st1 = con.prepareStatement(checkQuery);
			st1.setString(1, Id);
			ResultSet rs1 = st1.executeQuery();
		
			while(rs1.next())
			{
				if(!rs1.getString("ArchiveRequirementApproval").equals(APPROVAL_CONSTANT.APPROVED))
					checkOverallStatus = false;
			}
			
			String selectQuery = "select * from module_approval_info where oppId=? and moduleName = 'Archive_Requirement';";
			PreparedStatement st2 = con.prepareStatement(selectQuery);
			st2.setString(1, Id);
			ResultSet rs2 = st2.executeQuery();
		
			if(rs2.next()) {
				String UpdateQuery ="update Module_Approval_Info set overAllApproval =? where oppid=? and moduleName = 'Archive_Requirement' ";
				PreparedStatement st3 = con.prepareStatement(UpdateQuery);
		          st3.setString(1, Boolean.toString(checkOverallStatus));
		          st3.setString(2, Id);
		          st3.execute();
				  st3.close();
			}
			else {
				String insertQuery = "insert into Module_Approval_Info (seq_no, OppId, moduleName, overAllApproval)" + "values (?, ?, ?, ?);";
				PreparedStatement prestmt = con.prepareStatement(insertQuery);
		          prestmt.setInt(1, seq_num);
		          prestmt.setString(2, Id);
		          prestmt.setString(3, "Archive_Requirement");
		          prestmt.setString(4, Boolean.toString(checkOverallStatus));
		          prestmt.execute();
		          prestmt.close();
			}
			rs2.close();
			st2.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return checkOverallStatus;
	}
	
	private int getSequenceNumber()
    {
    	int seq_num =0;
		try
		{
		String MaxSeqNumQuery = "select max(seq_no) from Module_Approval_Info where OppId =?";
		PreparedStatement st = con.prepareStatement(MaxSeqNumQuery);
		st.setString(1, Id);
		ResultSet rs = st.executeQuery();
		if(rs.next())
		seq_num = rs.getInt(1);
		rs.close();
		st.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		
		return seq_num;
    }
	
	protected void finalize() throws Throwable {
		con.close();
		System.out.println("Db connection closed.");
	}
}

package IntakeDetails.IntakeApproval.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import common.constant.APPROVAL_CONSTANT;
import common.constant.MODULE_NAME;
import common.email.service.EmailApprovalService;
import onboard.DBconnection;
import logger.System;

public class IntakeApprovalService {

    DBconnection dBconnection =null;
	
	Connection con = null;
	
	private String oppId = "";
	private String approverId;
	private String appName;
	public IntakeApprovalService(String approverId) throws ClassNotFoundException, SQLException {
		dBconnection = new DBconnection();
		con = (Connection) dBconnection.getConnection();
		this.approverId = approverId;
		getOppId();
		getAppName();
	}
	
	
	private void getOppId() {
		try {
			String selectQuery ="select * from intake_stake_holder_info where approvalId=?";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, approverId);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				oppId =rs.getString("oppId");
			}
			st.close();
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	private void getAppName(){
		try {
			String selectQuery ="select * from opportunity_info where Id=? and column_name ='appName'";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, oppId);
			ResultSet rs = st.executeQuery();
			if(rs.next()) {
				appName =rs.getString("value");
			}
			st.close();
			rs.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	public boolean IntakeApprovalUpdate(String IntakeApproval, int seq_no,String comments) throws Throwable {
	
		boolean check = false;
		
		try
		{
			String UpdateQuery ="update intake_stake_holder_info set intakeApproval =?, comments =? where approvalId=?;";
			 PreparedStatement st = con.prepareStatement(UpdateQuery);
	          st.setString(1, IntakeApproval);
	          st.setString(2, comments);
	          st.setString(3, approverId);
	          st.execute();
		      st.close();
            check=true;
            
            
            if(IntakeApproval.equals(APPROVAL_CONSTANT.APPROVED)) {
             EmailApprovalService MailService = new EmailApprovalService(oppId,appName,MODULE_NAME.INTAKE_MODULE);
             MailService.getUserListAndSendApprovalMail();
             MailService.finalize();
             }
          //else if(IntakeApproval.equals(APPROVAL_CONSTANT.REJECTED)) {
            	//IntakeMailService.setFlagAndDecision("false","Decision pending");
                //IntakeMailService.finalize();
            //}
            
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return check;
	}
	
	public boolean checkIntakeStakeHolderApprovalInfo() {
		
		boolean checkStatus = true;
		
		try {
		
			String selectQuery = "select * from Intake_Stake_Holder_Info where OppId = ? order by seq_no;";
			PreparedStatement st1 = con.prepareStatement(selectQuery);
			st1.setString(1, oppId);
			ResultSet rs1 = st1.executeQuery();
			while(rs1.next()) {
				
				String intakeApprovalValue = rs1.getString("intakeApproval");
				if(!intakeApprovalValue.equals(APPROVAL_CONSTANT.APPROVED))
					checkStatus = false;
				
			}	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return checkStatus;
	}
	
	public void IntakeApprovalModuleInfo() {
		
		boolean checkStatus = checkIntakeStakeHolderApprovalInfo();
		int seq_num = getSequenceNumber();
		
		try {
				String selectQuery = "select * from Module_Approval_Info where OppId = ? and moduleName ='Intake' order by seq_no;";
				PreparedStatement st = con.prepareStatement(selectQuery);
				st.setString(1, oppId);
				ResultSet rs = st.executeQuery();
				if(rs.next()) {
					String UpdateQuery ="update Module_Approval_Info set overAllApproval =? where oppid=? and moduleName = 'Intake' ";
					 PreparedStatement st1 = con.prepareStatement(UpdateQuery);
			          st1.setString(1, Boolean.toString(checkStatus));
			          st1.setString(2, oppId);
			          st1.execute();
					}
				else {
					String insertQuery = "insert into Module_Approval_Info (seq_no, OppId, moduleName, overAllApproval)" + "values (?, ?, ?, ?);";
					PreparedStatement prestmt = con.prepareStatement(insertQuery);
			          prestmt.setInt(1, seq_num+1);
			          prestmt.setString(2, oppId);
			          prestmt.setString(3, "Intake");
			          prestmt.setString(4, Boolean.toString(checkStatus));
			          prestmt.execute();
				}
			}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}
	
	private int getSequenceNumber()
    {
    	int seq_num =0;
		try
		{
		String MaxSeqNumQuery = "select max(seq_no) from Module_Approval_Info where OppId =?";
		PreparedStatement st = con.prepareStatement(MaxSeqNumQuery);
		st.setString(1, oppId);
		ResultSet rs = st.executeQuery();
		if(rs.next())
		seq_num = rs.getInt(1);
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return seq_num;
    }
	
	 protected void finalize() throws Throwable 
	    { 
			System.out.println("Db connection closed.");
	        con.close();
	    }
	
}

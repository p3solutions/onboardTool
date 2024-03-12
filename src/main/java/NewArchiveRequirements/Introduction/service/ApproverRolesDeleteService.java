
package NewArchiveRequirements.Introduction.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.google.gson.JsonObject;

import common.constant.APPROVAL_CONSTANT;

import java.sql.Connection;

import onboard.DBconnection;
import logger.System;

public class ApproverRolesDeleteService {
	DBconnection dBconnection;
	Connection con;
	int SeqNum;
	String Id;
	
	
	public ApproverRolesDeleteService(int SeqNum,String Id) throws ClassNotFoundException, SQLException {
		 dBconnection = new DBconnection();
		 con = (Connection) dBconnection.getConnection();
		 this.SeqNum = SeqNum;
		 this.Id = Id;
	}

	public JsonObject DeleteRow()
	{
		JsonObject jsonObject = new JsonObject();
		try
		{
			boolean statusFlag = false;
			ArrayList<String> seqNum = new ArrayList<String>();
			ArrayList<String> role = new ArrayList<String>();
			ArrayList<String> name = new ArrayList<String>();
			ArrayList<String> emailId = new ArrayList<String>();
			ArrayList<String> username = new ArrayList<String>();
			ArrayList<String> priority = new ArrayList<String>();
			ArrayList<String> approval_id = new ArrayList<String>();
			ArrayList<String> intakeApproval = new ArrayList<String>();
			ArrayList<String> mailflag = new ArrayList<String>();
			
			ArrayList<String> seqNumRes = new ArrayList<String>();
			ArrayList<String> roleRes = new ArrayList<String>();
			ArrayList<String> nameRes = new ArrayList<String>();
			ArrayList<String> emailIdRes = new ArrayList<String>();
			ArrayList<String> usernameRes = new ArrayList<String>();
			ArrayList<String> priorityRes = new ArrayList<String>();
			ArrayList<String> approval_idRes = new ArrayList<String>();
			ArrayList<String> intakeApprovalRes = new ArrayList<String>();
			ArrayList<String> mailflagRes = new ArrayList<String>();
			
			String appname ="";
			int newSeqNum = SeqNum+1;
			String selectQuery = "select * from archivereq_roles_info where oppid=? order by seq_no;";
			PreparedStatement st = con.prepareStatement(selectQuery);
			st.setString(1, Id);
			ResultSet rs = st.executeQuery();				
			while(rs.next())
			{
			   seqNum.add(rs.getString("seq_no"));
			   role.add(rs.getString("role"));
			   name.add(rs.getString("name"));
			   emailId.add(rs.getString("emailId"));
			   username.add(rs.getString("username"));
			   appname=(rs.getString("app_name"));
			   priority.add(rs.getString("priority_order_num"));
			   approval_id.add(rs.getString("approvalId"));
			   intakeApproval.add(rs.getString("intakeApproval"));
			   mailflag.add(rs.getString("mail_flag"));
			}
			
			for(int i=0;i<seqNum.size();i++)
			{
				if(SeqNum<Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(seqNum.get(i));
					roleRes.add(role.get(i));
					nameRes.add(name.get(i));
					emailIdRes.add(emailId.get(i));
					usernameRes.add(username.get(i));
					priorityRes.add(priority.get(i));
					approval_idRes.add(approval_id.get(i));
					intakeApprovalRes.add(intakeApproval.get(i));
					mailflagRes.add(mailflag.get(i));
				}
				else if(SeqNum>Integer.parseInt(seqNum.get(i)))
				{
					seqNumRes.add(String.valueOf(Integer.parseInt(seqNum.get(i))-1));
					roleRes.add(role.get(i));
					nameRes.add(name.get(i));
					emailIdRes.add(emailId.get(i));
					usernameRes.add(username.get(i));
					priorityRes.add(priority.get(i));
					approval_idRes.add(approval_id.get(i));
					intakeApprovalRes.add(intakeApproval.get(i));
					mailflagRes.add(mailflag.get(i));

				}
			}
	
			
			String deleteQuery ="delete from archivereq_roles_info where oppid=?;";
			PreparedStatement st1 = con.prepareStatement(deleteQuery);
			st1.setString(1,Id);
			st1.executeUpdate();	
			st1.close();
			
			
			for(int i=0;i<seqNumRes.size();i++)
			{
			  System.out.println(seqNumRes.get(i)+" "+roleRes.get(i)+" "+nameRes.get(i)+" "+emailIdRes.get(i)+" "+usernameRes.get(i)+" "+priorityRes.get(i)+" ");	
			  String StakeHolderInsertQuery = "insert into ArchiveReq_Roles_Info ("
			  		+ "seq_no, OppId, prj_name, app_name, role,name, emailId, username, priority_order_num,approvalId, intakeApproval, moduleId, comments, mail_flag)"
						+ "value(?, ?, ?, ?, ?, ?, ?, ?,?,?,?,?,?,?);";
	          PreparedStatement prestmt = con.prepareStatement(StakeHolderInsertQuery);
	          prestmt.setInt(1, Integer.parseInt(seqNum.get(i)));
	          prestmt.setString(2, Id);
	          prestmt.setString(3, "");
	          prestmt.setString(4, appname);
	          prestmt.setString(5, roleRes.get(i));
	          prestmt.setString(6, nameRes.get(i));
	          prestmt.setString(7, emailIdRes.get(i));
	          prestmt.setString(8, usernameRes.get(i));
	          prestmt.setString(9, priorityRes.get(i));
	          prestmt.setString(10, approval_idRes.get(i));
	          prestmt.setString(11, intakeApprovalRes.get(i));
	          prestmt.setString(12, "");
	          prestmt.setString(13, "");
	          prestmt.setString(14, mailflagRes.get(i));
	          prestmt.execute();
	          statusFlag =true;
			}
			jsonObject.addProperty("DeleteStatus", statusFlag);
			
		}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return jsonObject;
		
	}
	protected void finalize() throws Throwable {
      con.close();
	}

}

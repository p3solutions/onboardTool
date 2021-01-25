package NewArchiveRequirements.ApprovalInfo.service;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.mysql.jdbc.Connection;

import onboard.DBconnection;

public class archiveReqApprovalDataRetrieveService {

	DBconnection dBconnection;
	Connection con;
	String Id;
	String OppName;
	
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
			String selectQuery ="select * from ArchiveRequirements_Stake_Holder_Info where oppid='"+Id+"';";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(selectQuery);
			while(rs.next())
			{
				checkData = true;
				JsonObject jsonObject = new JsonObject();
				jsonObject.addProperty("seqNum",rs.getString("seq_no"));
				jsonObject.addProperty("name", rs.getString("name"));
				jsonObject.addProperty("role",rs.getString("role"));
				jsonObject.addProperty("approvalStatus",rs.getString("ArchiveRequirementApproval"));
				jsonArray.add(jsonObject);
			}
			rs.close();
			st.close();
			if(!checkData)
			{
				int seq_no=0;
					String selectQuery1 = "select * from archivereq_roles_info where oppid='"+Id+"';";
					Statement st1 = con.createStatement();
					ResultSet rs1 = st1.executeQuery(selectQuery1);
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
				preparedStatement1.setString(8,"Decision pending");
				preparedStatement1.setString(9,"");
				preparedStatement1.execute();
				preparedStatement1.close();
				jsonObject.addProperty("seqNum",seqNum);
				jsonObject.addProperty("name", name);
				jsonObject.addProperty("role",role);
				jsonObject.addProperty("approvalStatus","Decision pending");
	
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
				String selectQuery ="select * from ArchiveRequirements_Stake_Holder_Info where approvalId='"+ID+"';";
				Statement st2 = con.createStatement();
				ResultSet rs2 = st2.executeQuery(selectQuery);
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
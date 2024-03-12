package admin_module_modify.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.UUID;
import java.security.*;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class Change_pwd {
	public static JsonObject change_pwd(String username,String current_pwd,String new_pwd) {
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonObject jsonobj = new JsonObject();
		String db_u_prev_pwd="";
		try {
			String s_u_pwd = generate_u_encrypt_pwd(current_pwd);
			String e_new_pwd = generate_u_encrypt_pwd(new_pwd);
			System.out.println("S_U_Pwd:"+s_u_pwd);
			String random_id = generateRandomApprovalId();
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			System.out.println("Connected...");
			String selectQuery = "select u_pwd from users where random_id IS NOT NULL and uname=?";
			st = connection.prepareStatement(selectQuery);
			st.setString(1, username);
			rs = st.executeQuery();
			if(rs.next())
			{		
				db_u_prev_pwd=rs.getString("u_pwd");

			}
			System.out.println("DB Prev Pwd : "+db_u_prev_pwd);
			if(db_u_prev_pwd.equals(s_u_pwd) && new_pwd.length()>=8) {
				System.out.println("Prev Password Matched");
				String update_query = "update users set u_pwd =? where uname = ?;";
		        PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
		        preparedStmt1.setString(1, e_new_pwd);
		        preparedStmt1.setString(2, username);
		        preparedStmt1.execute();
		        jsonobj.addProperty("Prev_Pwd","True");
		        jsonobj.addProperty("username", username);
		        jsonobj.addProperty("New Password", new_pwd);
		        }
			if(!db_u_prev_pwd.equals(s_u_pwd)) {
				jsonobj.addProperty("Prev_Pwd","False");
				System.out.println("Prev Password Not Matched");
			}
		
		}
		catch(Exception e)
		{
			System.out.println("Execption Occurs");
		}
		return jsonobj;
	}
	public static String generate_u_encrypt_pwd(String u_pwd) throws SQLException {
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-512");
			md.update(u_pwd.getBytes());
			byte[] pwdresultarray =md.digest();
			StringBuilder psb=new StringBuilder();
			for(byte b:pwdresultarray)
			{
				psb.append(String.format("%02x",b));
			}
			return psb.toString();
		}
		catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	public static String generateRandomApprovalId() throws SQLException {
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
	public static boolean checkDuplicateApprovalId(String uniqueID) throws SQLException {
		PreparedStatement state=null;
		ResultSet result=null;
		boolean checkDuplicate = false;

		try {
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			System.out.println("Connected...");
			String selectQuery = "select * from users order by seq_no;";
			state = connection.prepareStatement(selectQuery);
			result= state.executeQuery();
			while(result.next()) {
				String checkApprovalId = result.getString("random_id");
				if(checkApprovalId.equals(uniqueID)) {
					checkDuplicate = true;
				}   
			}
			state.close();
			result.close();
		}
		catch(Exception e)
		{

		}
		return checkDuplicate;

	}
}
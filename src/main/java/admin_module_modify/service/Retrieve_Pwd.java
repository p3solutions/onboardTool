package admin_module_modify.service;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class Retrieve_Pwd {
	public JsonObject retrieve_pwd(String username) {
		PreparedStatement st=null;
		ResultSet rs=null;
		JsonObject jsonObj = new JsonObject();
		try {
			//String random_id = generateRandomApprovalId();
			DBconnection dBconnection = new DBconnection();
			Connection connection = (Connection) dBconnection.getConnection();
			System.out.println("Connected...");
			String selectQuery = "select u_role from users where random_id IS NOT NULL and uname=?";
			st = connection.prepareStatement(selectQuery);
			st.setString(1, username);
			rs = st.executeQuery();
			if(rs.next())
			{		
				jsonObj.addProperty("User_Role",rs.getString("u_role"));
				
			}
			st.close();
			rs.close();
		}
		catch(Exception e)
		{
			System.out.println("Execption Occurs");
		}
		System.out.println("JSON"+jsonObj);
		return jsonObj;
	}


}
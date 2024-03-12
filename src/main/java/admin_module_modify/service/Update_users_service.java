package admin_module_modify.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import logger.System;
public class Update_users_service {
    public static JsonObject update_users(String uname_modify,String ufname_modify,String ulname_modify,String u_email_modify,String u_role_modify,String random_id_modify) {
        JsonObject jsonobj = new JsonObject();
    try {
        DBconnection dBconnection = new DBconnection();
        int uemailcount=0,unamecount=0;
        String prev_email="",prev_uname="";
        boolean partial_update_flag=false;
        Connection connection = (Connection) dBconnection.getConnection();
        System.out.println("Connected...");
        String usersupdatequery = "select uname,ufname,ulname,u_email,u_role from users where random_id = ?;";
        PreparedStatement st = connection.prepareStatement(usersupdatequery);
		st.setString(1, random_id_modify);
		ResultSet rs = st.executeQuery();
        if (rs.next()) {
        	prev_email=rs.getString(4);
        	prev_uname=rs.getString(1);
            jsonobj.addProperty("prev_uname", rs.getString(1));
            jsonobj.addProperty("prev_ufname", rs.getString(2));
            jsonobj.addProperty("prev_ulname", rs.getString(3));
            jsonobj.addProperty("prev_u_email", rs.getString(4));
            jsonobj.addProperty("prev_u_role", rs.getString(5));
        }        
        if((prev_email.equals(u_email_modify.toLowerCase()) && prev_uname.equals(uname_modify)))
        {	   partial_update_flag=true;
        	   String update_query = "update users set uname =?,ufname=?,ulname=?,u_email=?,u_role=? where random_id = ?;";
               PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
               preparedStmt1.setString(1, uname_modify);
               preparedStmt1.setString(2, ufname_modify);
               preparedStmt1.setString(3, ulname_modify);
               preparedStmt1.setString(4, u_email_modify.toLowerCase());
               preparedStmt1.setString(5, u_role_modify);
               preparedStmt1.setString(6, random_id_modify);
               preparedStmt1.execute();
               jsonobj.addProperty("partial_update", "Success");
        }
        String select_query ="select count(*) from users where uname=?";
		PreparedStatement preparedStmt = connection.prepareStatement(select_query);
		preparedStmt.setString(1, uname_modify);
		ResultSet rs1=preparedStmt.executeQuery();
		String select_query1 ="select count(*) from users where u_email=?";
		PreparedStatement preparedStmt2 = connection.prepareStatement(select_query1);
		preparedStmt2.setString(1, u_email_modify.toLowerCase());
		ResultSet rs2=preparedStmt2.executeQuery();
		rs1.next();
	    unamecount = rs1.getInt(1);	
	    rs2.next();
	    uemailcount = rs2.getInt(1);		
		if((unamecount!=0 && uemailcount!=0) && !partial_update_flag)
		{
			if(!prev_email.equals(u_email_modify.toLowerCase()) && !prev_uname.equals(uname_modify)) {
			jsonobj.addProperty("unameduplicate", "Yes");
			jsonobj.addProperty("uemailduplicate", "Yes");
		}
		}
		if(unamecount!=0 && !partial_update_flag)
		{
			if(!prev_uname.equals(uname_modify)) {
			jsonobj.addProperty("unameduplicate", "Yes");
			}
		}
		if(uemailcount!=0 && !partial_update_flag)
		{
			if(!prev_email.equals(u_email_modify.toLowerCase())) {
			jsonobj.addProperty("uemailduplicate", "Yes");
			}
		}		
		if((unamecount==0 && uemailcount==0) && !partial_update_flag)
		{
		System.out.println("Uname Count : "+unamecount);
		System.out.println("UEmail Count : "+uemailcount);
		System.out.println("Username"+uname_modify);
		System.out.println("Firstname"+ufname_modify);
        String update_query = "update users set uname =?,ufname=?,ulname=?,u_email=?,u_role=? where random_id = ?;";
        PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
        preparedStmt1.setString(1, uname_modify);
        preparedStmt1.setString(2, ufname_modify);
        preparedStmt1.setString(3, ulname_modify);
        preparedStmt1.setString(4, u_email_modify.toLowerCase());
        preparedStmt1.setString(5, u_role_modify);
        preparedStmt1.setString(6, random_id_modify);
        preparedStmt1.execute();
        jsonobj.addProperty("flag", "Success");
        jsonobj.addProperty("uname", uname_modify);
        jsonobj.addProperty("ufname", ufname_modify);
        jsonobj.addProperty("ulname", ulname_modify);
        jsonobj.addProperty("u_email", u_email_modify);
        jsonobj.addProperty("u_role", u_role_modify);
    }		
    }
    catch(Exception e)
        {
        System.out.println("Execption Occurs");
        }
        return jsonobj;
    }
    }
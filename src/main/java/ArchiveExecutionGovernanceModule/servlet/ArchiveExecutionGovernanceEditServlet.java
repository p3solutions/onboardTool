package ArchiveExecutionGovernanceModule.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import onboard.DBconnection;
import logger.System;

@WebServlet("/ArchiveExecutionGovernanceEditServlet")
public class ArchiveExecutionGovernanceEditServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 DBconnection dBconnection =null;
		 Connection con = null;
		
		HttpSession details = request.getSession();
        String waveId=(String)details.getAttribute("selectedWaveId");
        String waveName =(String)details.getAttribute("selectedWaveName");
        int seqNum = Integer.parseInt((String)request.getParameter("seqNum"));
        String taskName = (String)request.getParameter("TaskName");
        String taskGroup = (String)request.getParameter("TaskGroup");
        boolean check = false;
        
        try {
        	
        	dBconnection = new DBconnection();
			con = (Connection) dBconnection.getConnection();
        	
        	String updateQuery = "update archive_execution_governance_info set taskGroup = ?, taskName = ? where waveId = ? and seq_no = ?;";
        	 PreparedStatement prestmt = con.prepareStatement(updateQuery);
	         prestmt.setString(1, taskGroup);
	         prestmt.setString(2, taskName);
	         prestmt.setString(3, waveId);
	         prestmt.setInt(4, seqNum);
        	 prestmt.execute();
		    check = true; 
        }
        
        catch(Exception e) {
        	e.printStackTrace();
        }
        finally {
        	if(con != null)
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
        }
        
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("CheckEdit", check);
        System.out.println("JSON Object"+jsonObject);
		 String json = new Gson().toJson(jsonObject);
       response.setContentType("application/json");
       response.setCharacterEncoding("UTF-8");
       response.getWriter().write(json);
	}
}

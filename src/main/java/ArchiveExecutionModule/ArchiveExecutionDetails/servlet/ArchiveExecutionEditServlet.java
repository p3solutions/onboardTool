package ArchiveExecutionModule.ArchiveExecutionDetails.servlet;

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

/**
 * Servlet implementation class ArchiveExecutionEditServlet
 */
@WebServlet("/ArchiveExecutionEditServlet")
public class ArchiveExecutionEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchiveExecutionEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		 DBconnection dBconnection =null;
		 Connection con = null;
		
		HttpSession details = request.getSession();
        String Id=(String)details.getAttribute("ID");
        String oppName =(String)details.getAttribute("SelectedOpportunity");
        int seqNum = Integer.parseInt((String)request.getParameter("seqNum"));
        String taskName = (String)request.getParameter("TaskName");
        String taskGroup = (String)request.getParameter("TaskGroup");
        boolean check = false;
        
        try {
        	
        	dBconnection = new DBconnection();
			con = (Connection) dBconnection.getConnection();
        	
			
			System.out.println("Here");
        	String updateQuery = "update archive_execution_info set taskGroup = ?, taskName = ? where oppId = ? and seq_no = ?;";
        	PreparedStatement st = con.prepareStatement(updateQuery);
        	st.setString(1,taskGroup);
        	st.setString(2,taskName);
        	st.setString(3,Id);
        	st.setInt(4,seqNum);
        	st.execute();
        	
        	
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

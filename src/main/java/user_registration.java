

import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.owasp.encoder.Encode;

import onboard.DBconnection;
import logger.System;


/**
 * Servlet implementation class user_registration
 */
@WebServlet("/user_registration")

public class user_registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_registration() {
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
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed User Registration servlet-----[INFO]");  
		String roles=request.getParameter("reg_roles");
		String username=request.getParameter("reg_uname");
		String firstname=request.getParameter("reg_fname");
		String lastname=request.getParameter("reg_lname");
		String email=request.getParameter("reg_email");
		String confmemail=request.getParameter("reg_cemail");
		String pass=request.getParameter("reg_pwd");
		String confmpass=request.getParameter("reg_cpwd");
		String projects=request.getParameter("reg_projects");
		String question=request.getParameter("reg_qn");
		String answer=request.getParameter("reg_ans");
		String app=request.getParameter("reg_app");
		String passw=request.getParameter("reg_pwd");
		//encryption et=new encryption();
		
	//System.out.println("enpt pass is "+passw);
	 try
      {
		 DBconnection dBconnection = new DBconnection();
	     Connection connection = (Connection) dBconnection.getConnection();
        String query = " insert into Admin_UserDetails (uname, fname, lname, email, pwd, projects, roles,stats,question,answer,application)"
	            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	          PreparedStatement preparedStmt = connection.prepareStatement(query);
	          preparedStmt.setString(1, username);
	          preparedStmt.setString(2, firstname);
	          preparedStmt.setString(3, lastname);
	          preparedStmt.setString(4, email);
	          preparedStmt.setString(5, passw);
	          preparedStmt.setString(6, projects);
	          preparedStmt.setString(7, roles);
	          preparedStmt.setString(8, "active");
	          preparedStmt.setString(9, question);
	          preparedStmt.setString(10, answer);
	          preparedStmt.setString(11, app);
	          
         preparedStmt.execute();
	          
	         
        
         connection.close();
        response.sendRedirect(Encode.forJava("confirmation?email="+email));
      }
      catch (Exception e)
      {
    	  //System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
      }		
	}

}

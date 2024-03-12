package Login;


import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import onboard.DBconnection;
import logger.System;

/**
 * Servlet implementation class Login_1
 */
public class LoggedIn_1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoggedIn_1() {
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
		// TODO Auto-generated method stub
		
		HttpSession details=request.getSession(); 
		HttpSession session=request.getSession();
		String uname=request.getParameter("usr");
		String pwd=request.getParameter("pwd");
		session.setAttribute("username",uname);
			try
			{	
				 DBconnection dBconnection = new DBconnection();
			        Connection connection = (Connection) dBconnection.getConnection();
				PreparedStatement ps=connection.prepareStatement("SELECT * FROM user_table WHERE ufname=? AND pwd=?");
				ps.setString(1, uname);
				ps.setString(2,pwd);
				ResultSet rs=ps.executeQuery();
				
				if(rs.next())
				{
					String dbuname=rs.getString("ufname");
					String dbpwd=rs.getString("pwd");
									
					if(uname.equals(dbuname) && pwd.equals(dbpwd)) 
		            {
	
							session.setAttribute("USER",dbuname); 
		                    response.sendRedirect("DashBoard.jsp");
						}

					}
				else {
					response.sendRedirect("Login_Error.jsp");
				}
				}
					
	                 
					catch(Exception e)
					{
						
					
					
					}
		
		doGet(request, response);
	}

}



import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class delete_users
 */
@WebServlet("/delete_users")
public class delete_users extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delete_users() {
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
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Delete_Users servlet-----[INFO]");  
		String x=request.getParameter("array");
		String names[]=x.split(",");
		try
	      {
	        // create a mysql database connection
	        String myDriver = "org.gjt.mm.mysql.Driver";
	        String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
	        Class.forName(myDriver);
	        Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	        Statement st = conn.createStatement();
	      
	        for(int i=0;i<names.length;i++)
	        {
	        	String z=names[i];
	        	st.executeUpdate("delete from Admin_UserDetails where uname='"+z+"'");
	        }

		         
	        
	        conn.close();
	      }
	      catch (Exception e)
	      {
	      	 
	    	  System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
	      }
		response.sendRedirect("Admin_Userslist.jsp");
	}

}

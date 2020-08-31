

import onboard.encryption;

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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class update_pass
 */
@WebServlet("/update_pass")
public class update_pass extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_pass() {
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
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Update Pass servlet-----[INFO]");  
		String pwd=request.getParameter("new_pass");
		HttpSession passwd=request.getSession();
		String email=(String)passwd.getAttribute("email");
		 try
	      {
	        // create a mysql database connection
	        String myDriver = "org.gjt.mm.mysql.Driver";
	        String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
	        Class.forName(myDriver);
	        Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	      
	        Statement st=conn.createStatement();
			  encryption et=new encryption();
			  String passw=et.encrypt(pwd);
		   st.executeUpdate("update Admin_UserDetails set pwd='"+passw+"' where email='"+email+"'");
		             
	        
	        conn.close();
	      }
	      catch (Exception e)
	      {
	      	 
	    	  System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
	      }		
		 response.sendRedirect("Login.jsp");
	}

}

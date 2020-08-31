

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.MDC;

/**
 * Servlet implementation class NewRequirements
 */
@WebServlet("/NewRequirements")
public class NewRequirements extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewRequirements() {
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
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed NewRequirement servlet-----[INFO]");  
		HttpSession details=request.getSession(); 
		String u_name=(String)details.getAttribute("username");
		String u_role=(String)details.getAttribute("role");
		
			
	String new_Requirements = request.getParameter("newRequirements");
	      
	       
	       
	       // do some processing here...
	        
	       // get response writer
	       
	       try
	       {
	    	   String idd=(String)details.getAttribute("appidd");
	         // create a mysql database connection
	         String myDriver = "org.gjt.mm.mysql.Driver";
	         String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
	         Class.forName(myDriver);
	         Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	         
	         // the mysql insert statement
	         String query = " insert into Intake_NewRequirements (requirements,appname)" + " values (?,'"+idd+"')";

	        // System.out.println("Insert query :" +  query);
	         PreparedStatement preparedStmt = conn.prepareStatement(query);
	         preparedStmt.setString (1, new_Requirements);
	        
	        

	         // execute the preparedstatement
	         preparedStmt.execute();
	         
	         conn.close();
	       }
	       catch (Exception e)
	       {
	       
	    	   System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
	       }
	       // return response
	       response.sendRedirect("Intake_ArchiveRequirements.jsp");
	}

	}

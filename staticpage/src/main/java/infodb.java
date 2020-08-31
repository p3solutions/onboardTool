

import java.io.IOException;
import java.io.PrintWriter;
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

/**
 * Servlet implementation class infodb
 */
@WebServlet("/infodb")
public class infodb extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public infodb() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Infodb servlet-----[INFO]");  
		HttpSession app_details=request.getSession();
		
		 String proj_name = (String)app_details.getAttribute("proj_name");
		String complexity = (String)app_details.getAttribute("complexity");
		String est_db_size = (String)app_details.getAttribute("est_db_size");
		String est_cst = (String)app_details.getAttribute("est_cst");
		
	         
	        final String myDriver = "org.gjt.mm.mysql.Driver";
	          final String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
	       
	        try
	        {
	          // create a mysql database connection
	        	Class.forName(myDriver);
	          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
	          
	          PreparedStatement preparedStmt = conn.prepareStatement("update AppEmphazize_ApplicationInfo set complexity=?, est_db_size=?, est_cst=? where appname=?");
	          preparedStmt.setString(1, complexity);
	          preparedStmt.setString(2, est_db_size);
	          preparedStmt.setString(3, est_cst);
	          preparedStmt.setString(4, proj_name);
preparedStmt.execute();
	          
	          conn.close();
	        
	        }
	        catch (Exception e)
	        {
	        	 System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
	        }
	        response.sendRedirect("AppEmphasize_CostCalculation.jsp");	

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		}
	

}

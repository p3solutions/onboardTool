import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.BasicConfigurator;

import org.apache.log4j.Logger;

import org.apache.log4j.MDC;
import javax.servlet.ServletConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class EditProject
 */
@WebServlet("/EditProject")
public class EditProject extends HttpServlet {
private static final long serialVersionUID = 1L;
private Logger logger = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditProject() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init(ServletConfig config) throws ServletException

    {

              logger=Logger.getRootLogger();

              BasicConfigurator.configure();
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
    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed EditProject servlet-----[INFO]");  
	HttpSession details=request.getSession(); 
	String u_name=(String)details.getAttribute("username");
	String u_role=(String)details.getAttribute("role");
		String userid=u_name;
				MDC.put("USERID", userid);
				MDC.put("USERROLE", u_role);
				
    String id = request.getParameter("pid");
String projectname = request.getParameter("projectname");
logger.info("modified project "+projectname); 
        String descr = request.getParameter("descr");
        String appno = request.getParameter("appno");
        String Startdate = request.getParameter("Startdate");
        String Intdate = request.getParameter("Intdate");
        String Plandate = request.getParameter("Plandate");
        String Execdate = request.getParameter("Execdate");
        String Hyperdate = request.getParameter("Hyperdate");
        String Enddate = request.getParameter("Enddate"); 
      
        String prjname=(String)details.getAttribute("Myproject");
  
try
        {
          // create a mysql database connection
          String myDriver = "org.gjt.mm.mysql.Driver";
          String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
          Class.forName(myDriver);
          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
     
          String query = "update AppEmphazize_ProjectDetails set projectname=?, descr=?, appno=? ,Startdate=?, Intdate=?, Plandate=?, Execdate=?, Hyperdate=?, Enddate=? where id=?";

          PreparedStatement preparedStmt = conn.prepareStatement(query);
          preparedStmt.setString (1, projectname);
          preparedStmt.setString   (2, descr);
          preparedStmt.setString (3, appno);
          preparedStmt.setString   (4, Startdate);
          preparedStmt.setString (5, Intdate);
          preparedStmt.setString   (6, Plandate);
          preparedStmt.setString (7, Execdate);
          preparedStmt.setString   (8, Hyperdate);
          preparedStmt.setString (9, Enddate);
          preparedStmt.setString (10, id);
          preparedStmt.execute();
          
          String query1="update AppEmphazize_ApplicationPrioritization set prj_name=? where prj_name=?";
          PreparedStatement preparedStmt1 = conn.prepareStatement(query1);
          preparedStmt1.setString (1, projectname);
          preparedStmt1.setString   (2, prjname);
          preparedStmt1.execute();
          
          String query2="update AppEmphazize_ApplicationInfo set prjname=? where prjname=?";
          PreparedStatement preparedStmt2 = conn.prepareStatement(query2);
          preparedStmt2.setString (1, projectname);
          preparedStmt2.setString   (2, prjname);
          preparedStmt2.execute();
          
          String query3="update ArchiveExecution_Details set projects=? where projects=?";
          PreparedStatement preparedStmt3 = conn.prepareStatement(query3);
          preparedStmt3.setString (1, projectname);
          preparedStmt3.setString   (2, prjname);
          preparedStmt3.execute();
          //HttpSession details=request.getSession()
          if (!(projectname) .equals (prjname)) {
        	 details.setAttribute("nameofproject",projectname); 
          }
        }
  catch (Exception e)
        {
         
	  System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
        }
        // return response
        response.sendRedirect("AppEmphasize_Application.jsp");
}

}
import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import org.apache.log4j.MDC;
import javax.servlet.ServletConfig;
/**
 * Servlet implementation class updatedb
 */
@WebServlet("/updatedb")
public class updatedb extends HttpServlet {
private static final long serialVersionUID = 1L;
private Logger logger = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatedb() {
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
String proj_name = request.getParameter("proj_name");
}

/**
* @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
*/
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	HttpSession details=request.getSession(); 
	
	SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
    Date date = new Date();  
    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Updated servlet-----[INFO]");  
	String u_name=(String)details.getAttribute("username");
	String Project_Name=(String)details.getAttribute("nameofproject");

		String userid=u_name;
				MDC.put("USERID", userid);
String project_name[]=new String[10];
String complexity[]=new String[10];
String priority[]=new String[10];
int cnt=(Integer.parseInt(request.getParameter("appname_size")));
int count=0;
for(int i=0;i<cnt;i++){
project_name[i]=request.getParameter("project_name"+i);
complexity[i]=request.getParameter("complexity"+i);
priority[i]=request.getParameter("priority"+i);
//System.out.println(project_name[i]);
if(priority[i]!=null)
	 count++;
}


    PrintWriter writer = response.getWriter();
  
     
        try
        {
          // create a mysql database connection
          String myDriver = "org.gjt.mm.mysql.Driver";
          String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
          Class.forName(myDriver);
          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
        
       
          
          Statement st=conn.createStatement();
          
          for(int a=0;a<count;a++){
          String projectname=project_name[a];
          String complexitye=complexity[a];
          String priorities=priority[a];

        		 logger.info("modified priority of the application "+projectname); 
        		 
         // System.out.println("update AppEmphazize_ApplicationPrioritization set complexity='"+complexitye+"',priorities='"+priorities+"' where proj_name='"+projectname+"'and prj_name='"+Project_Name+"'");
                
     st.executeUpdate("update AppEmphazize_ApplicationPrioritization set complexity='"+complexitye+"',priorities='"+priorities+"' where proj_name='"+projectname+"' and prj_name='"+Project_Name+"'");
 
          }
          
          conn.close();
        }
        catch (Exception e)
        {
         
        	  System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
        }
        // return response
        response.sendRedirect("AppEmphasize_Preview.jsp");

}

}


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

/**
 * Servlet implementation class priority_details
 */
@WebServlet("/priority_details")
public class priority_details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public priority_details() {
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
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Priority_details servlet-----[INFO]");  
		String project_name[]=new String[10];
		String complexity[]=new String[10];
		String est_db_size[]=new String[10];
		String est_cst[]=new String[10];
		String priority[]=new String[10];
		
	
		
		
		for(int i=0;i<10;i++){
			project_name[i]=request.getParameter("project_name"+i);
			complexity[i]=request.getParameter("complexity"+i);
			est_db_size[i]=request.getParameter("est_db_size"+i);
			est_cst[i]=request.getParameter("est_cst"+i);
			priority[i]=request.getParameter("priority"+i);

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
          
          for(int a=0;a<4;a++){
        	  String projectname=project_name[a];
        	  String complexitye=complexity[a];
          String estdbsize=est_db_size[a];
          String estcst=est_cst[a];
          String priorities=priority[a];
 
      st.executeUpdate("update AppEmphazize_ApplicationPrioritization set complexity='"+complexitye+"',est_db_size='"+estdbsize+"',est_cst='"+estcst+"',priorities='"+priorities+"' where proj_name='"+projectname+"'");
  	
      //System.out.println("update AppEmphazize_ApplicationPrioritization set complexity='"+complexitye+"',est_db_size='"+estdbsize+"',est_cst='"+estcst+"',priorities='"+priorities+"' where proj_name='"+projectname+"'");
           }
          
          conn.close();
        }
        catch (Exception e)
        {
        	 
        	  System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
        }
        // return response
        response.sendRedirect("AppEmphasize_PrioritizedApplications.jsp");

	}

}

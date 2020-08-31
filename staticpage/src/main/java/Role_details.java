

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
 * Servlet implementation class Role_details
 */
@WebServlet("/Role_details")
public class Role_details extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Role_details() {
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
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Role_Details servlet-----[INFO]");  
		String role[]=new String[10];
		String admin[]=new String[10];
		String app_emp[]=new String[10];
		String intake[]=new String[10];
		String arch_exe[]=new String[10];
		String decomm[]=new String[10];
		String prgm_gov[]=new String[10];
		String report[]=new String[10];
		String finance[]=new String[10];
		
	
		
	//	System.out.println("________1___________");
		for(int i=0;i<10;i++){
			role[i]=request.getParameter("role"+i);
			admin[i]=request.getParameter("admin"+i);
			app_emp[i] = request.getParameter("app_emp"+i);
			intake[i]=request.getParameter("intake"+i);
			arch_exe[i]=request.getParameter("arch_exe"+i);
			decomm[i]=request.getParameter("decomm"+i);
			prgm_gov[i]=request.getParameter("prgm_gov"+i);
			report[i]=request.getParameter("report"+i);
			finance[i]=request.getParameter("finance"+i);
}
	    PrintWriter writer = response.getWriter();
	  
     
        try
        {
          // create a mysql database connection
          String myDriver = "org.gjt.mm.mysql.Driver";
          String myUrl = "jdbc:mysql://localhost:3306/Onboarding";
          Class.forName(myDriver);
          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
        
       
          
          Statement st=conn.createStatement();
          for(int a=0;a<10;a++){
        	  String _role=role[a];
        	  String _admin=admin[a];
          String _app_emp=app_emp[a];
          String _intake=intake[a];
          String _arch_exe=arch_exe[a];
          String _decomm=decomm[a];
          String _prgm_gov=prgm_gov[a];
          String _report=report[a];
          String _finance=finance[a];
      st.executeUpdate("update Role_Details set admin='"+_admin+"',app_emp='"+_app_emp+"',intake='"+_intake+"',arch_exe='"+_arch_exe+"',decomm='"+_decomm+"',prgm_governance='"+_prgm_gov+"',reporting='"+_report+"',finance='"+_finance+"' where role='"+_role+"'");                                           
  	//System.out.println("update Role_Details set admin='"+_admin+"',app_emp='"+_app_emp+"',intake='"+_intake+"',arch_exe='"+_arch_exe+"',decomm='"+_decomm+"',prgm_governance='"+_prgm_gov+"',reporting='"+_report+"',finance='"+_finance+"' where role='"+_role+"'");
           }
          
          conn.close();
        }
        catch (Exception e)
        {
        	 
        	System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
        }
        response.sendRedirect("Admin_RoleDetails.jsp");

	}

}

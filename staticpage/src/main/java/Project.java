

import java.io.IOException;
import org.apache.log4j.BasicConfigurator;

import org.apache.log4j.Logger;

import org.apache.log4j.MDC;
import javax.servlet.ServletConfig;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
 * Servlet implementation class Project
 */
@WebServlet("/Project")
public class Project extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   private Logger logger = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Project() {
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
		// TODO Auto-generated method stub
		
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	    Date date = new Date();  
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Project servlet-----[INFO]");  
		HttpSession details=request.getSession(); 
		String u_name=(String)details.getAttribute("username");
		String u_role=(String)details.getAttribute("role");

			String userid=u_name;
					MDC.put("USERID", userid);
					MDC.put("USERROLE", u_role);
					
				     

				String projectname = request.getParameter("projectname");
				 logger.info("created project "+projectname); 
				 
		        String descr = request.getParameter("descr");
		        String appno = request.getParameter("appno");
		        String Startdate = request.getParameter("Startdate");
		        String Intdate = request.getParameter("Intdate");
		        String Plandate = request.getParameter("Plandate");
		        String Execdate = request.getParameter("Execdate");
		        String Hyperdate = request.getParameter("Hyperdate");
		        String Enddate = request.getParameter("Enddate"); 
		        try
		        {
		        	
		          // create a mysql database connection
		          String myDriver = "org.gjt.mm.mysql.Driver";
		          String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";
		          Class.forName(myDriver);
		          Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
		     
		          String query = " insert into AppEmphazize_ProjectDetails (projectname, descr,appno,Startdate,Intdate,Plandate,Execdate,Hyperdate,Enddate)"
		            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
		          preparedStmt.execute();
		          
		          String query4 = " insert into AppEmphazize_ApplicationPrioritization (prj_name, IA_lic_cst, IA_maint_cst, Infrastrct_cst, strg_est, lab_cst, proj_name, data_size, data_source, curnt_users, complexity, est_archive, est_scrn, est_db_size, est_hrs, est_cst, ttl_IA_cst, ttl_infra_cst, ttl_IA_prdct_cst, ttl, ttl_cst_fr_app, add_cst_fr_contigency, add_cst, IA_app_sprt_cst, est_archive_cst,no_of_app_complexity, read_date,sme_date)"
		  	            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
          
		  	          PreparedStatement preparedStmt1 = conn.prepareStatement(query4);
		  	          preparedStmt1.setString(1,projectname);
		  	          preparedStmt1.setString(2, " ");
		  	          preparedStmt1.setString(3, " ");
		  	          preparedStmt1.setString(4, " ");
		  	          preparedStmt1.setString(5, " ");
		  	          preparedStmt1.setString(6, " ");
		  	          preparedStmt1.setString(7, " ");
		  	          preparedStmt1.setString(8, " ");
		  	          preparedStmt1.setString(9, " ");
		  	          preparedStmt1.setString (10, " ");
		  	          preparedStmt1.setString   (11, " ");
		  	          preparedStmt1.setString (12, " ");
		  	          preparedStmt1.setString(13, " ");
		  	          preparedStmt1.setString(14, " ");
		  	          preparedStmt1.setString (15, " ");
		  	          preparedStmt1.setString   (16, " ");
		  	          preparedStmt1.setString (17, " ");
		  	          preparedStmt1.setString(18, " ");
		  	          preparedStmt1.setString(19, " ");
		  	          preparedStmt1.setString (20, " ");
		  	          preparedStmt1.setString(21, " ");
		  	          preparedStmt1.setString(22, " ");
		  	          preparedStmt1.setString(23, " ");
		  	          preparedStmt1.setString(24, " ");
		  	          preparedStmt1.setString(25, " ");
		  	        preparedStmt1.setString(26, " ");
		  	      preparedStmt1.setString(27, " ");
		  	        preparedStmt1.setString(28, " ");	
		           preparedStmt1.execute();
		           
		          String query1="select * from ArchiveExecution_Defaultvalues";
		          Statement st1 = conn.createStatement();
				     ResultSet rs1 = st1.executeQuery(query1);
				     while(rs1.next())
				     {
				    	 
				    	 String query2="insert into ArchiveExecution_Details(seq_num,level,name,mem_ass,act_srt_date,act_end_date,pln_srt_date,pln_end_date,hours,planned_hrs,id,ref_id,projects,progressbar)"+ " values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				    	 PreparedStatement preparedStmt2 = conn.prepareStatement(query2);
				          preparedStmt2.setInt (1,rs1.getInt(1));
				          preparedStmt2.setInt (2,rs1.getInt(2));
				          preparedStmt2.setString (3,rs1.getString(3));
				          preparedStmt2.setString (4,rs1.getString(4));
				          preparedStmt2.setString (5,rs1.getString(5));
				          preparedStmt2.setString (6,rs1.getString(6));
				          preparedStmt2.setString (7,rs1.getString(7));
				          preparedStmt2.setString (8,rs1.getString(8));
				          preparedStmt2.setString (9,rs1.getString(9));
				          preparedStmt2.setString (10,rs1.getString(13));
				          preparedStmt2.setString (11,rs1.getString(10));
				          preparedStmt2.setString (12,rs1.getString(11));
				          preparedStmt2.setString (13,projectname);
				          preparedStmt2.setString (14,"0");
				          preparedStmt2.execute(); 
				     }
		          
		          conn.close();
		        }
		        catch (Exception e)
		        {
		        	System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
		        }
		        // return response
		        response.sendRedirect("Project_List.jsp");
				


	}

}

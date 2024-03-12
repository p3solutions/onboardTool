

import java.io.IOException;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.log4j.BasicConfigurator;

import org.apache.log4j.Logger;

import org.apache.log4j.MDC;
import org.owasp.encoder.Encode;

import onboard.DBconnection;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logger.System;



/**
 * Servlet implementation class comp
 */
@WebServlet("/comp")
public class comp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	   private Logger logger = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public comp() {
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
	    System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed java servlet-----[INFO]");  
		HttpSession details=request.getSession(); 
		String u_name=(String)details.getAttribute("username");
		String u_role=(String)details.getAttribute("role");

			String userid=u_name;
					MDC.put("USERID", userid);
					MDC.put("USERROLE", u_role);
					String projectname=request.getParameter("project_name");
					logger.info("modified project "+Encode.forJava(projectname)); 
		
				String datatype_char = request.getParameter("datatype_char");
		        String extracting_process = request.getParameter("extracting_process");
		        String archival_flg = request.getParameter("archival_flg");
		        String special_lang_flg = request.getParameter("special_lang_flg");
		        String db_size = request.getParameter("db_size");
		        String estimated_table_count = request.getParameter("estimated_table_count");
		        String estimated_rec_count = request.getParameter("estimated_rec_count");
		        String xml_count_db = request.getParameter("xml_count_db");
		        String loc_data = request.getParameter("loc_data");
		        String site_loc_data = request.getParameter("site_loc_data");
		        String contact_name = request.getParameter("contact_name");
		        String hosted_service_flg = request.getParameter("hosted_service_flg");
		        String external_facing = request.getParameter("external_facing");
		        String web_url = request.getParameter("web_url");
		        String citrix_access_flg = request.getParameter("citrix_access_flg");
		        String citix_access_app = request.getParameter("citix_access_app");
		       
		        String data_integrate_flg = request.getParameter("data_integrate_flg");
		        String ready_date = request.getParameter("ready_date");
		     
		         
		        
		        // do some processing here...
		         
		        // get response writer
		        PrintWriter writer = response.getWriter();
		         
		        // build HTML code
		        String htmlRespone = "<html>";
		        htmlRespone += "<h2>Your Order Has been Taken</h2>";  
		        htmlRespone += "</html>";
		        writer.println(htmlRespone);
		        try
		        {
		          // create a mysql database connection
		        	DBconnection dBconnection = new DBconnection();
			        Connection conn = (Connection) dBconnection.getConnection();
		        
		    
		          
		          // the mysql insert statement
		          String query = " insert into component (datatype_char, extracting_process, archival_flg, special_lang_flg, db_size, estimated_table_count, estimated_rec_count, xml_count_db, loc_data, site_loc_data, contact_name, hosted_service_flg, external_facing, web_url, citrix_access_flg, citix_access_app, data_integrate_flg, ready_date)"
		            + " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		          // create the mysql insert preparedstatement
		          //Scanner sin=new Scanner(System.in);
		          //String id,food,extra;
		          //System.out.println("Enter Your id");
		          //id=sin.next();
		          //System.out.println("Please tell what food you want");
		          //food=sin.next();
		          //System.out.println("would you like to have extra food today say y or n");
		          //extra=sin.next();
		          PreparedStatement preparedStmt = conn.prepareStatement(query);
		          preparedStmt.setString (1, datatype_char);
		          preparedStmt.setString   (2, extracting_process);
		          preparedStmt.setString (3, archival_flg);
		          preparedStmt.setString(4, special_lang_flg);
		          preparedStmt.setString(5, db_size);
		          preparedStmt.setString (6, estimated_table_count);
		          preparedStmt.setString   (7, estimated_rec_count);
		          preparedStmt.setString (8, xml_count_db);
		          preparedStmt.setString(9, loc_data);
		          preparedStmt.setString(10, site_loc_data);
		          preparedStmt.setString (11, contact_name);
		          preparedStmt.setString   (12, hosted_service_flg);
		          preparedStmt.setString (13, external_facing);
		          preparedStmt.setString(14, web_url);
		          preparedStmt.setString(15, citrix_access_flg);
		          preparedStmt.setString (16, citix_access_app);
		          preparedStmt.setString   (17, data_integrate_flg);
		          preparedStmt.setDate (18, java.sql.Date.valueOf(ready_date));
		         
		          
		          
		          

		          // execute the preparedstatement
		          preparedStmt.execute();
		          
		          conn.close();
		        }
		        catch (Exception e)
		        {
		        	
		        	
		        	//  System.err.println("[ERROR]-----Got an exception!"+formatter.format(date)+"-----"+e.getMessage()+"----[ERROR]");
		        
		        }
		        // return response
		        response.sendRedirect("Intake_TechnicalDetails.jsp");
				


	}

}

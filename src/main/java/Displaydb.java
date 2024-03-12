import java.io.IOException;



import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Iterator;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;

import org.apache.log4j.MDC;
import org.owasp.encoder.Encode;

import bean.PriorityComparator;
import bean.ProjectComplexity;
import onboard.DBconnection;

import javax.servlet.ServletConfig;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logger.System;



@WebServlet("/Displaydb")
public class Displaydb extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger logger = null;

	public Displaydb() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void init(ServletConfig config) throws ServletException

	{

		logger=Logger.getRootLogger();

		BasicConfigurator.configure();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
		Date date = new Date();
		System.out.println("[INFO]-----"+formatter.format(date)+"-----Accessed Displaydb servlet-----[INFO]");
		HttpSession details=request.getSession();
		String u_name=(String)details.getAttribute("username");
		String u_role=(String)details.getAttribute("role");

		String userid=u_name;
		MDC.put("USERID", userid);
		MDC.put("USERROLE", u_role);
		String prj_name = request.getParameter("prj_name");
		logger.info("modified project "+Encode.forJava(prj_name));
		String IA_lic_cst = request.getParameter("IA_lic_cst");
		String IA_maint_cst = request.getParameter("IA_maint_cst");
		String Infrastrct_cst = request.getParameter("Infrastrct_cst");
		String strg_est = request.getParameter("strg_est");
		String lab_cst = request.getParameter("lab_cst");
		String proj_name = request.getParameter("proj_name");
		String data_size = request.getParameter("data_size");
		String data_source = request.getParameter("data_source");
		String curnt_users = request.getParameter("curnt_users");
		String complexity = request.getParameter("complexity");
		String est_archive = request.getParameter("est_archive");
		String est_scrn = request.getParameter("est_scrn");
		String est_db_size = request.getParameter("est_db_size");
		String est_hrs = request.getParameter("est_hrs");

		String est_cst = request.getParameter("est_cst");
		String ttl_IA_cst = request.getParameter("ttl_IA_cst");
		String ttl_infra_cst = request.getParameter("ttl_infra_cst");
		String ttl_IA_prdct_cst = request.getParameter("ttl_IA_prdct_cst");
		String ttl = request.getParameter("ttl");
		String ttl_cst_fr_app = request.getParameter("ttl_cst_fr_app");
		String add_cst_fr_contigency = request.getParameter("add_cst_fr_contigency");
		String add_cst = request.getParameter("add_cst");
		String IA_app_sprt_cst = request.getParameter("IA_app_sprt_cst");
		String est_archive_cst = request.getParameter("est_archive_cst");
		String no_of_app_complexity = request.getParameter("no_of_app_complexity");
		String read_date = request.getParameter("read_date");
		String sme_date = request.getParameter("sme_date");
		String data_retained = request.getParameter("data_retained");
		String Decommission;
		if (Boolean.parseBoolean(data_retained) == false)
		{
			Decommission = null;
		}
		else
		{
			Decommission = request.getParameter("Decommission");
		}



	        HttpSession app_details=request.getSession();
	        app_details.setAttribute("proj_name",proj_name);
	        app_details.setAttribute("complexity",complexity);
	        app_details.setAttribute("est_db_size",est_db_size);
	        app_details.setAttribute("est_cst",est_cst);



		PrintWriter writer = response.getWriter();
		String htmlRespone = "<html>";
		htmlRespone += "<h2>Your Order Has been Taken</h2>";
		htmlRespone += "</html>";
		writer.println(htmlRespone);

		

		try
		{
			 DBconnection dBconnection = new DBconnection();
		     Connection connection = (Connection) dBconnection.getConnection();
		     String query2 = "select * from AppEmphazize_ApplicationPrioritization where proj_name=? and prj_name=?";
		     PreparedStatement Stmt1 = connection.prepareStatement(query2);
		     Stmt1.setString(1,proj_name);
		     Stmt1.setString(2,prj_name);
		     ResultSet rs1 = Stmt1.executeQuery();
			if(rs1.next())
			{
				String query = "update AppEmphazize_ApplicationPrioritization set IA_lic_cst=?, IA_maint_cst=?, Infrastrct_cst=?, strg_est=?, lab_cst=?, data_size=?, data_source=?, curnt_users=?, complexity=?, est_archive=?, est_scrn=?, est_db_size=?, est_hrs=?, est_cst=?, ttl_IA_cst=?, ttl_infra_cst=?, ttl_IA_prdct_cst=?, ttl=?, ttl_cst_fr_app=?, add_cst_fr_contigency=?, add_cst=?, IA_app_sprt_cst=?, est_archive_cst=?, no_of_app_complexity=?,read_date=?, sme_date=?, data_retained=?, Decommission=? where prj_name=? and  proj_name=?";
				PreparedStatement preparedStmt1 = connection.prepareStatement(query);
				preparedStmt1.setString(1, IA_lic_cst);
				preparedStmt1.setString(2, IA_maint_cst);
				preparedStmt1.setString(3, Infrastrct_cst);
				preparedStmt1.setString(4, strg_est);
				preparedStmt1.setString(5, lab_cst);
				preparedStmt1.setString(6, data_size);
				preparedStmt1.setString(7, data_source);
				preparedStmt1.setString (8, curnt_users);
				preparedStmt1.setString (9, complexity);
				preparedStmt1.setString (10, est_archive);
				preparedStmt1.setString(11, est_scrn);
				preparedStmt1.setString(12, est_db_size);
				preparedStmt1.setString (13, est_hrs);
				preparedStmt1.setString   (14, est_cst);
				preparedStmt1.setString (15, ttl_IA_cst);
				preparedStmt1.setString(16, ttl_infra_cst);
				preparedStmt1.setString(17, ttl_IA_prdct_cst);
				preparedStmt1.setString (18, ttl);
				preparedStmt1.setString(19, ttl_cst_fr_app);
				preparedStmt1.setString(20, add_cst_fr_contigency);
				preparedStmt1.setString(21, add_cst);
				preparedStmt1.setString(22, IA_app_sprt_cst);
				preparedStmt1.setString(23, est_archive_cst);
				preparedStmt1.setString(24, no_of_app_complexity);
				preparedStmt1.setString(25, read_date);
				preparedStmt1.setString(26, sme_date);
				preparedStmt1.setString(27, data_retained);
				preparedStmt1.setString(28, Decommission);
				preparedStmt1.setString(29, prj_name);
				preparedStmt1.setString(30, proj_name);

				preparedStmt1.execute();
				// System.out.println("est_scrn value from if pstmt1 "+est_scrn);

				PreparedStatement preparedStmt2 = connection.prepareStatement(
						"update AppEmphazize_ApplicationInfo set complexity=?, est_db_size=?, est_scrn=? where appname=? and prjname=?");
				preparedStmt2.setString(1, complexity);
				preparedStmt2.setString(2, est_db_size);
				preparedStmt2.setString(3, est_scrn);
				preparedStmt2.setString(4, proj_name);
				preparedStmt2.setString(5, prj_name);
				preparedStmt2.execute();
				//System.out.println("est_scrn value from if pstmt2 "+est_scrn);
				// System.out.println(est_scrn);

			}
			else{
				String query = " insert into AppEmphazize_ApplicationPrioritization (prj_name, IA_lic_cst, IA_maint_cst, Infrastrct_cst, strg_est, lab_cst, proj_name, data_size, data_source, curnt_users, complexity, est_archive, est_scrn, est_db_size, est_hrs, est_cst, ttl_IA_cst, ttl_infra_cst, ttl_IA_prdct_cst, ttl, ttl_cst_fr_app, add_cst_fr_contigency, add_cst, IA_app_sprt_cst, est_archive_cst,no_of_app_complexity,read_date,sme_date,data_retained,Decommission)"
						+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

				PreparedStatement preparedStmt = connection.prepareStatement(query);
				preparedStmt.setString(1, prj_name);
				preparedStmt.setString(2, IA_lic_cst);
				preparedStmt.setString(3, IA_maint_cst);
				preparedStmt.setString(4, Infrastrct_cst);
				preparedStmt.setString(5, strg_est);
				preparedStmt.setString(6, lab_cst);
				preparedStmt.setString(7, proj_name);
				preparedStmt.setString(8, data_size);
				preparedStmt.setString(9, data_source);
				preparedStmt.setString (10, curnt_users);
				preparedStmt.setString   (11, complexity);
				preparedStmt.setString (12, est_archive);
				preparedStmt.setString(13, est_scrn);
				preparedStmt.setString(14, est_db_size);
				preparedStmt.setString (15, est_hrs);
				preparedStmt.setString   (16, est_cst);
				preparedStmt.setString (17, ttl_IA_cst);
				preparedStmt.setString(18, ttl_infra_cst);
				preparedStmt.setString(19, ttl_IA_prdct_cst);
				preparedStmt.setString (20, ttl);
				preparedStmt.setString(21, ttl_cst_fr_app);
				preparedStmt.setString(22, add_cst_fr_contigency);
				preparedStmt.setString(23, add_cst);
				preparedStmt.setString(24, IA_app_sprt_cst);
				preparedStmt.setString(25, est_archive_cst);
				preparedStmt.setString(26, no_of_app_complexity);
				preparedStmt.setString(27, read_date);
				preparedStmt.setString(28, sme_date);
				preparedStmt.setString(29, data_retained);
				preparedStmt.setString(30,Decommission);
				preparedStmt.execute();

				// System.out.println("est_scrn value from else pstmt1 "+est_scrn);
				PreparedStatement preparedStmt2 = connection.prepareStatement(
						"update AppEmphazize_ApplicationInfo set complexity=?, est_db_size=?, est_scrn=? where appname=? and prjname=?");
				preparedStmt2.setString(1, complexity);
				preparedStmt2.setString(2, est_db_size);
				preparedStmt2.setString(3, est_scrn);
				preparedStmt2.setString(4, proj_name);
				preparedStmt2.setString(5, prj_name);
				preparedStmt2.execute();
//System.out.println("est_scrn value from else pstmt2 "+est_scrn);

			}
			PreparedStatement preparedStmt3 = connection.prepareStatement("SELECT appname, complexity, est_scrn "
					+ "from AppEmphazize_ApplicationInfo where prjname=? and complexity is not null");
			preparedStmt3.setString(1, prj_name);
			ResultSet rs2 = preparedStmt3.executeQuery();
			String appName = "";
			String priority = "";
			String est = "";
			String complex = "";
			String ptext ="";
			int pr=0;
			ArrayList projectPriorities = new ArrayList();
			while(rs2.next()) {
				appName = rs2.getString("appname");
				complex = rs2.getString("complexity");
				est = rs2.getString("est_scrn");
				if(complex.equals("High")) {
					priority="P1";
					pr =1;
				}
				if(complex.equals("Medium to High")) {
					priority="P2";
					pr =2;
				}
				if(complex.equals("Medium")) {
					priority="P3";
					pr =3;
				}
				if(complex.equals("Low to Medium")) {
					priority="P4";
					pr=4;
				}
				if(complex.equals("Low")) {
					priority="P5";
					pr =5;
				}	projectPriorities.add(new ProjectComplexity(appName, complex, est, pr, priority));
			}
			Collections.sort(projectPriorities, new PriorityComparator());
			connection.close();
			app_details.setAttribute("proj_priorities", projectPriorities);
			
		} catch (Exception e) {
			//System.err.println("[ERROR]-----Got an exception!" + formatter.format(date) + "-----" + e.getMessage()
				//	+ "----[ERROR]");
			e.printStackTrace();
		}
		response.sendRedirect("AppEmphasize_PrioritizedApplications.jsp");

	}
}

package authorization.servlet;

import admin_module_modify.service.Update_User_Registration_Service;
import onboard.DBconnection;
import org.apache.log4j.Logger;
import servlet.Intake_Review_Data;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class Role_details
 */
@WebServlet("/Authorization_Role_details")
public class Authorization_Role_details extends HttpServlet {
    final static Logger logger = Logger.getLogger(Authorization_Role_details.class);
    private static final long serialVersionUID = 1L;

    public Authorization_Role_details() {
        super();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        logger.info("[INFO]-----" + formatter.format(date) + "-----Accessed Role_Details servlet-----[INFO]");
        String role[] = new String[10];
        String admin[] = new String[10];
        String app_emphasize[] = new String[10];
        String intake[] = new String[10];
        String archive_execution[] = new String[10];
        String decommission[] = new String[10];
        String program_governance[] = new String[10];
        String reporting[] = new String[10];
        String finance[] = new String[10];

        for (int i = 0; i < 10; i++) {
            role[i] = request.getParameter("role" + i);
            admin[i] = request.getParameter("admin" + i);
            app_emphasize[i] = request.getParameter("app_emp" + i);
            intake[i] = request.getParameter("intake" + i);
            archive_execution[i] = request.getParameter("arch_exe" + i);
            decommission[i] = request.getParameter("decomm" + i);
            program_governance[i] = request.getParameter("prgm_gov" + i);
            reporting[i] = request.getParameter("report" + i);
            finance[i] = request.getParameter("finance" + i);
        }

        PrintWriter writer = response.getWriter();
        try {
            // create a mysql database connection
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            Statement st = connection.createStatement();

            for (int j = 0; j < 10; j++) {
                String role_details = role[j];
                String admin_details = admin[j];
                String app_emp_details = app_emphasize[j];
                String intake_details = intake[j];
                String archive_execution_details = archive_execution[j];
                String decommission_details = decommission[j];
                String program_governance_details = program_governance[j];
                String reporting_details = reporting[j];
                String finance_details = finance[j];
                st.executeUpdate("update Role_Details set admin='" + admin_details + "',app_emp='" + app_emp_details + "',intake='" + intake_details + "',arch_exe='" + archive_execution_details + "',decomm='" + decommission_details + "',prgm_governance='" + program_governance_details + "',reporting='" + reporting_details + "',finance='" + finance_details + "' where role='" + role_details + "'");
                logger.info("update Role_Details set admin='" + admin_details + "',app_emp='" + app_emp_details + "',intake='" + intake_details + "',arch_exe='" + archive_execution_details + "',decomm='" + decommission_details + "',prgm_governance='" + program_governance_details + "',reporting='" + reporting_details + "',finance='" + finance_details + "' where role='" + role_details + "'");
            }

            connection.close();
        } catch (Exception ex) {
            ex.printStackTrace();
            logger.error("[ERROR]-----Got an exception!" + formatter.format(date) + "-----" + ex.getMessage() + "----[ERROR]");
        }
        response.sendRedirect("Admin_Role_Details.jsp");

    }

}

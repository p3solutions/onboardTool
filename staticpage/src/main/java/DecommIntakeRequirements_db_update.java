import java.io.IOException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import onboard.DBconnection;
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
@WebServlet("/DecommIntakeRequirements_db_update")
public class DecommIntakeRequirements_db_update extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Logger logger = null;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public DecommIntakeRequirements_db_update() {
        super();
        // TODO Auto-generated constructor stub
    }

    public void init(ServletConfig config) throws ServletException {

        logger = Logger.getRootLogger();

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

        System.out.println("In servlet for update ");
        String BUGL_Tablelength = request.getParameter("BULUClassLength");
        int BUGL_TableLength = Integer.parseInt(BUGL_Tablelength);
        String projectname = request.getParameter("projectname");
        String applicationname = request.getParameter("appname");
        try {
            final String myDriver = "org.gjt.mm.mysql.Driver";
            final String myUrl = "jdbc:mysql://localhost:3306/decom3sixtytool";

            Connection conn = DriverManager.getConnection(myUrl, "root", "password123");
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String delete_query = "delete from Decomm_BusinessUnit_GeographicCode where prj_name='" + projectname + "' and app_name='" + applicationname + "' ";
            Statement st1 = connection.createStatement();
            st1.executeUpdate(delete_query);

            for (int i = 0; i < BUGL_TableLength; i++) {
                String business = request.getParameter("BusinessUnit" + i);
                String operation = request.getParameter("OperationUnit" + i);
                String location = request.getParameter("LocationUnit" + i);
                String department = request.getParameter("Department" + i);
                String insert_query = "insert into Decomm_BusinessUnit_GeographicCode( prj_name,app_name,business_unit,operation_unit,location_unit,dept,id)"
                        + "values(?,?,?,?,?,?,?)";
                PreparedStatement preparedStmt = conn.prepareStatement(insert_query);
                preparedStmt.setString(1, projectname);
                preparedStmt.setString(2, applicationname);
                preparedStmt.setString(3, business);
                preparedStmt.setString(4, operation);
                preparedStmt.setString(5, location);
                preparedStmt.setString(6, department);
                preparedStmt.setInt(7, (i + 1));
                preparedStmt.execute();
                /*BusinessUnitAndLocationUnit(projectname,applicationname,business,operation,location,department);*/
            }

            //Site location assets : submit functionality code for decomm_sitelocation_assets table.

            String SLA_Tablelength = request.getParameter("SLAClassLength");
            int SLA_TableLength = Integer.parseInt(SLA_Tablelength);
            String delete_query1 = "delete from decomm_sitelocation_assets where prj_name='" + projectname + "' and app_name='" + applicationname + "' ";
            Statement st2 = connection.createStatement();
            st2.executeUpdate(delete_query1);

            for (int i = 0; i < SLA_TableLength; i++) {
                String country = request.getParameter("Country"+i);
                String city = request.getParameter("City"+i);
                String state = request.getParameter("State"+i);
                String officeDesignation = request.getParameter("OfficeDesignation"+i);
                String insert_query1 = "insert into decomm_sitelocation_assets( prj_name,app_name,country,city,state,office_designation,id)"
                        + "values(?,?,?,?,?,?,?)";
                PreparedStatement preparedStmt = conn.prepareStatement(insert_query1);
                preparedStmt.setString(1, projectname);
                preparedStmt.setString(2, applicationname);
                preparedStmt.setString(3, country);
                preparedStmt.setString(4, city);
                preparedStmt.setString(5, state);
                preparedStmt.setString(6, officeDesignation);
                preparedStmt.setInt(7, (i + 1));
                preparedStmt.execute();

            }

            int id=1;
            String select_query = "select max(Id) from decomm_intake_req";
            Statement st3 = connection.createStatement();
            ResultSet rs = st3.executeQuery(select_query);

            if (rs.next())
            {
                if(rs.getString(1)!=null)
                {
                    id =Integer.parseInt(rs.getString(1))+1;
                }
            }

            String appname = request.getParameter("appname");
            String legacyappname = request.getParameter("legacyappname");
            String projectnumber = request.getParameter("projectnumber");
            String ain = request.getParameter("ain");
            String infraprojectnumber = request.getParameter("infraprojectnumber");
            String read_date = request.getParameter("read_date");
            String select_query1 = "select * from decomm_intake_req where prj_name='" + projectname + "' and app_name='" + applicationname + "' ";
            Statement st4 = connection.createStatement();
            ResultSet rs1 = st4.executeQuery(select_query1);
            if(rs1.next())
            {
                String update_query = "update decomm_intake_req set id=?, prj_name=?, app_name=?, legacy_app_name=?, enterprise_team_decomm_prj_no=?, app_identification_no=?, infra_prj_no=?, read_only_date=? where prj_name='" + projectname + "' and app_name='" + applicationname + "' ";
                PreparedStatement preparedStmt1 = conn.prepareStatement(update_query);
                preparedStmt1.setInt(1, id);
                preparedStmt1.setString(2, projectname);
                preparedStmt1.setString(3, appname);
                preparedStmt1.setString(4, legacyappname);
                preparedStmt1.setString(5, projectnumber);
                preparedStmt1.setString(6, ain);
                preparedStmt1.setString(7, infraprojectnumber);
                preparedStmt1.setString(8, read_date);
                preparedStmt1.execute();

            }
            else
            {
                String insert_query = "insert into decomm_intake_req (id, prj_name, app_name, legacy_app_name, enterprise_team_decomm_prj_no, app_identification_no, infra_prj_no, read_only_date)"
                        +"values(?,?,?,?,?,?,?,?)";
                PreparedStatement preparedStmt = conn.prepareStatement(insert_query);
                preparedStmt.setInt(1, id);
                preparedStmt.setString(2, projectname);
                preparedStmt.setString(3, appname);
                preparedStmt.setString(4, legacyappname);
                preparedStmt.setString(5, projectnumber);
                preparedStmt.setString(6, ain);
                preparedStmt.setString(7, infraprojectnumber);
                preparedStmt.setString(8, read_date);
                preparedStmt.execute();
                conn.close();
            }
        } catch (Exception e) {
            System.out.println("Exception..." + e);
        }
        response.sendRedirect("ContactInfo.jsp");

    }
}

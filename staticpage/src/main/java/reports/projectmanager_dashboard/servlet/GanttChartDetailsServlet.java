package reports.projectmanager_dashboard.servlet;

import ArchiveExecution.Service.Weekday;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import reports.projectmanager_dashboard.service.Project_Manager_Dashboard;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/GanttChartDetailsServlet")
public class GanttChartDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession details=request.getSession();
        String projectnameid=(String)details.getAttribute("theName");
        String projectname="";
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String projectnameQuery = "select * from AppEmphazize_ProjectDetails where id='"+projectnameid+"';";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(projectnameQuery);
            if(rs.next())
            {
                projectname=rs.getString("projectname");
            }
            JsonArray infojson = new Project_Manager_Dashboard().GanttChartDetails(projectname);
            String json = new Gson().toJson(infojson);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        }
        catch(Exception e)
        {
            System.out.println("Exception--------[info]-------"+e);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

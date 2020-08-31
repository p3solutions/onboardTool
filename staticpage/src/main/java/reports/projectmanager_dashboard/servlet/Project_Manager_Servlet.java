package reports.projectmanager_dashboard.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.apache.log4j.Logger;
import reports.projectmanager_dashboard.service.Project_Manager_Dashboard;
import service.IntakeInformationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Project_Manager_Servlet")
public class Project_Manager_Servlet extends HttpServlet {
    final static Logger logger = Logger.getLogger(Project_Manager_Dashboard.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //String projectname=request.getParameter("ProjectName");
            HttpSession details=request.getSession();
            String uname=(String)details.getAttribute("username");
            System.out.println("user name"+uname);
            String projectname = request.getParameter("projectname");
            String applicationname=request.getParameter("appname");
            System.out.println("in servslet"+applicationname);

            JsonObject infojson = new Project_Manager_Dashboard().project_manager_dashboard(uname,projectname,applicationname);
            String json = new Gson().toJson(infojson);
            logger.info("json--->" + json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            logger.info("json data--->" + json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

    }
}

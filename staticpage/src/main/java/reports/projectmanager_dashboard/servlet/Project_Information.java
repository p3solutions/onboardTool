package reports.projectmanager_dashboard.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.apache.log4j.Logger;
import reports.projectmanager_dashboard.service.Project_Manager_Dashboard;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/Project_Information")
public class Project_Information extends HttpServlet {
    final static Logger logger = Logger.getLogger(Project_Information.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            //String projectname=request.getParameter("ProjectName");
            HttpSession details=request.getSession();
            String uname=(String)details.getAttribute("username");
            System.out.println("user name"+uname);
            String det=(String)details.getAttribute("theName");
            String projectname = request.getParameter("projectname");
            String applicationname=request.getParameter("appname");
            System.out.println("in servslet"+applicationname);
            JsonArray infojson = new Project_Manager_Dashboard().ProjectManagerDashBoardAppDetails(projectname);
            String json = new Gson().toJson(infojson);
            logger.info("project manager board--->" + json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            logger.info("json data234sss4--->" + json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {

    }
}

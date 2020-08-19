package DecommManager.servlet;

import DecommManager.service.DecommManageExecuteInfoService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DecommManageServiceCategoriesServerServlet")
public class DecommManageServiceCategoriesServerServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String applicationname = request.getParameter("ApplicationName");
        String projectname = request.getParameter("ProjectName");
        JsonArray jsonArray = new DecommManageExecuteInfoService().DecommManageServiceCategoriesCheckServerService(projectname,applicationname);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
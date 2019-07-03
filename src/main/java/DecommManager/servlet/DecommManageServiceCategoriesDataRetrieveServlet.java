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

@WebServlet("/DecommManageServiceCategoriesDataRetrieveServlet")
public class DecommManageServiceCategoriesDataRetrieveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String projectname = request.getParameter("ProjectName");
        String applicationname = request.getParameter("ApplicationName");
        JsonArray jsonArray = new DecommManageExecuteInfoService().DecommManageServiceCategoriesDataRetrieveService(projectname,applicationname);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
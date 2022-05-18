package DecommManager.servlet;

import DecommManager.service.DecommManageExecuteInfoService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import service.IntakeInformationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/DecommManageExecuteInfoDataRetrieveServlet")
public class DecommManageExecuteInfoDataRetrieveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("I'm in Decomm Servlet");
        String applicationname=request.getParameter("ApplicationName");
        String projectname=request.getParameter("ProjectName");
        JsonArray jsonArray=new DecommManageExecuteInfoService().DecommManageExecuteInfoDataRetrieveService(projectname,applicationname);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
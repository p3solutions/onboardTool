package ArchiveExecution.Servlet;

import ArchiveExecution.Service.ArchiveExecutionDataRetrieve;
import ArchiveExecution.Service.Archive_User_List_Service;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Archive_User_List")
public class Archive_User_List extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String projectname = request.getParameter("projectname");
        try {
            JsonObject jsonObject = new Archive_User_List_Service().ArchiveUserlist(projectname);
            String json = new Gson().toJson(jsonObject);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

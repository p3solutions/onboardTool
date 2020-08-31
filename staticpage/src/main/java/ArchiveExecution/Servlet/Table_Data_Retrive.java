package ArchiveExecution.Servlet;

import ArchiveExecution.Service.ArchiveExecutionDataRetrieve;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Table_Data_Retrive")
public class Table_Data_Retrive extends HttpServlet {
    final static Logger logger = Logger.getLogger(Table_Data_Retrive.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*String project_name = request.getParameter("projectName");*/
        HttpSession httpSession=request.getSession();
        String project_id=(String) httpSession.getAttribute("theName");
        try {
            JsonArray jsonArray = new ArchiveExecutionDataRetrieve().TabledataRetrieval(project_id);
            String json = new Gson().toJson(jsonArray);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

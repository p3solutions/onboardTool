package ArchiveExecution.Servlet;

import ArchiveExecution.Service.ArchiveExecutionDataRetrieve;
import adminmodule.service.Admin_Module_Service;
import com.google.gson.Gson;
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

@WebServlet("/ProgresssbarRetrieveData")
public class ProgresssbarRetrieveData extends HttpServlet {
    final static Logger logger = Logger.getLogger(ProgresssbarRetrieveData.class);

    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
       // String project_name = request.getParameter("projectName");
        String id = (String) session.getAttribute("theName");

        try {
            JsonObject infojson=new ArchiveExecutionDataRetrieve().ProgressBarDataRetrieve(id);
            String json = new Gson().toJson(infojson);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}

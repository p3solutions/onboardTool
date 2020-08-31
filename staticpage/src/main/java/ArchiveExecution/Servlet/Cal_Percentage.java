package ArchiveExecution.Servlet;

import ArchiveExecution.Service.Archive_execution_db_update;
import com.google.gson.JsonObject;
import org.apache.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import java.io.IOException;

@WebServlet("/Cal_Percentage")
public class Cal_Percentage extends HttpServlet {
    final static Logger logger = Logger.getLogger(Cal_Percentage.class);

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int sequence = Integer.parseInt(request.getParameter("sequence"));
        String selectedproject = request.getParameter("ProjectName");
        String percent = Float.toString(Archive_execution_db_update.progress_bar_percent(sequence, selectedproject));
        response.setContentType(MediaType.APPLICATION_JSON);
        response.setCharacterEncoding("UTF-8");
        JsonObject result = new JsonObject();
        result.addProperty("value", percent);
        response.getWriter().write(result.toString());
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

package servlet;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import logger.System;

@WebServlet("/Archive_Intake_Servlet")
public class Archive_Intake_Servlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession details=request.getSession();
        String Project_name = (String) details.getAttribute("projects");
        String Applications = (String) details.getAttribute("applications");
        String username = (String) details.getAttribute("u_Name");
        String ID = (String) details.getAttribute("theName");
        String uname=(String)details.getAttribute("username");
        String roles=(String)details.getAttribute("role");
		/*
		 * JsonArray infojson = new
		 * IntakeInformationService().archive_intake_app(Project_name,Applications,ID,
		 * uname,roles); String json = new Gson().toJson(infojson);
		 * response.setContentType("application/json");
		 * response.setCharacterEncoding("UTF-8"); response.getWriter().write(json);
		 */
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

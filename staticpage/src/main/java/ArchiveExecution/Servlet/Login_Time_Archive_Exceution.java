package ArchiveExecution.Servlet;

import ArchiveExecution.Service.ArchiveExecutionDataRetrieve;
import ArchiveExecution.Service.Login_Time_Archive_Exceution_Service;
import authorization.service.Role_Details_Service;
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

@WebServlet("/Login_Time_Archive_Exceution")
public class Login_Time_Archive_Exceution extends HttpServlet {
    final static Logger logger = Logger.getLogger(Login_Time_Archive_Exceution.class);

    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        /*String project_name = request.getParameter("projectName");
        String id = (String) session.getAttribute("theName");*/
        String det = (String) session.getAttribute("theName");
        String username = (String) session.getAttribute("u_Name");
        String Project_Name = (String) session.getAttribute("nameofproject");
        String authority_info=(String)session.getAttribute("archive_exec");

       try
       {
           Login_Time_Archive_Exceution_Service.login_time_archive(det,username,Project_Name);
       }
       catch (Exception e)
       {
           e.printStackTrace();
       }
        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(authority_info);
    }
}

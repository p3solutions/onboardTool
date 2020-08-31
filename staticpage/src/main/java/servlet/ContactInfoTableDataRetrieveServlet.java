package servlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import service.IntakeInformationService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.Console;
import java.io.IOException;

@WebServlet("/ContactInfoTableDataRetrieveServlet")
public class ContactInfoTableDataRetrieveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Roles = request.getParameter("Roles");
        String ProjectName = request.getParameter("ProjectName");
        String AppName = request.getParameter("ApplicationName");
        String roles[]=Roles.split(",");
        System.out.println("Roles:"+Roles + "Project:"+ProjectName+ "AppName:"+AppName);
        System.out.println("Roles:" + roles[0]);
        JsonArray jsonarr=new IntakeInformationService().DecommIntakeContactInfoDataRetrieve(ProjectName,AppName,roles);
        String json = new Gson().toJson(jsonarr);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

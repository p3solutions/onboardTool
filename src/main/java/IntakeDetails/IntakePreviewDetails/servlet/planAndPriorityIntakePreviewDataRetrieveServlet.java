package IntakeDetails.IntakePreviewDetails.servlet;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import IntakeDetails.IntakePreviewDetails.service.IntakePreviewDetailsService;
import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;
import logger.System;

@WebServlet("/planAndPriorityIntakePreviewDataRetrieveServlet")
public class planAndPriorityIntakePreviewDataRetrieveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
       // String Id=(String)details.getAttribute("ID");
        String Id=request.getParameter("demo");
        System.out.println("Demo Id"+Id);
        String user = (String)details.getAttribute("username");
       System.out.println("Opportunity Id "+Id);
		JsonArray jsonArray = new JsonArray();
		try {
			jsonArray = new IntakePreviewDetailsService(Id,user).IntakePreviewDataRetrieve(Id);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("JSON ARRAY"+jsonArray);
		 String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

}
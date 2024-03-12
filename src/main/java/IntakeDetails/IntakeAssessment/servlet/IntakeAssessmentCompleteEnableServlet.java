package IntakeDetails.IntakeAssessment.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import IntakeDetails.IntakeAssessment.service.IntakeAssessmentCompleteEnableService;
import logger.System;

@WebServlet("/IntakeAssessmentCompleteEnableServlet1")
public class IntakeAssessmentCompleteEnableServlet extends HttpServlet { 
	private static final long serialVersionUID = 1L;
    
	   
    public IntakeAssessmentCompleteEnableServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String id = (String)details.getAttribute("ID");
        JsonObject jsonObject = new JsonObject();
        try {
        IntakeAssessmentCompleteEnableService service = new IntakeAssessmentCompleteEnableService(id);
        
        System.out.println("This is app Id in completed portion"+id);
        jsonObject=service.getCompleteEnableStatus(id);
       System.out.println("completed status: "+jsonObject);
       service=null;
		System.gc();
        }catch (Exception e) {
        	e.printStackTrace();
		}
        String json = new Gson().toJson(jsonObject);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8"); 
		response.getWriter().write(json);
	}

}









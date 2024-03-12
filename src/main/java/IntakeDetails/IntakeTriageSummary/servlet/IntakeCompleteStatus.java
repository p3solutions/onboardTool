package IntakeDetails.IntakeTriageSummary.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.io.IOException;
import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;
import logger.System;

@WebServlet("/IntakeCompleteStatus")

public class IntakeCompleteStatus extends HttpServlet { 
	
	
	
		private static final long serialVersionUID = 1L;
		       
		   
		    public IntakeCompleteStatus() {
		        super();
		    }

			protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				// TODO Auto-generated method stub
				response.getWriter().append("Served at: ").append(request.getContextPath());
			}

			protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession details = request.getSession();
				String id = (String)details.getAttribute("ID");
		        String JsonString= (String)request.getParameter("completeType");
		        JsonObject jsonObject = new JsonObject();
		        try {
		        IntakeTriageSummaryService intTriSumService = new IntakeTriageSummaryService();
		        
		        System.out.println("This is app Id in completed portion"+id);
		        jsonObject=intTriSumService.getCompleteStatus(id,JsonString);
		       System.out.println("completed : "+jsonObject);
		       intTriSumService=null;
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




	
	



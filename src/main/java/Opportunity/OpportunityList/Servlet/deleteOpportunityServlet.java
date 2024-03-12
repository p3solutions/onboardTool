package Opportunity.OpportunityList.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Opportunity.Service.deleteOpportunityService;
import logger.System;
@WebServlet("/deleteOpportunityServlet")
public class deleteOpportunityServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  String oppId =request.getParameter("OppId");
		  String oppName = request.getParameter("OppName");
		  JsonObject jsonObject = new JsonObject();
		  try
		  {
			  
		  deleteOpportunityService deleteService =  new deleteOpportunityService(oppId,oppName,"Application", true);  
		  jsonObject = deleteService.deleteService();
		  deleteService =null;
		 
		  System.gc();
		  }
		  catch(Exception e)
		  {
			  e.printStackTrace();
		  }
		  System.out.println("JSON ARRAY"+jsonObject);
			 String json = new Gson().toJson(jsonObject);
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write(json);
	}

}

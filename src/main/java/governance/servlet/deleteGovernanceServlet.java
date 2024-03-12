package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.annotation.WebServlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Opportunity.Service.deleteOpportunityService;
import logger.System;

@WebServlet("/deleteGovernanceServlet")
public class deleteGovernanceServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String id = request.getParameter("Id");
     String name = request.getParameter("Name");
     String deleteType = request.getParameter("deleteType");
     boolean includeAll =  Boolean.parseBoolean(request.getParameter("includeAll"));
     JsonObject jsonObject = new JsonObject();
	 try
	 {
		 deleteOpportunityService deleteObj = new deleteOpportunityService(id, name, deleteType, includeAll);
		jsonObject=deleteObj.deleteService();
		deleteObj = null;
		System.gc();
	 }
	 catch(Exception e)
	 {
		 e.printStackTrace();
	 }
	 String json = new Gson().toJson(jsonObject);
     response.setContentType("application/json");
     response.setCharacterEncoding("UTF-8");
     response.getWriter().write(json);
	}

}

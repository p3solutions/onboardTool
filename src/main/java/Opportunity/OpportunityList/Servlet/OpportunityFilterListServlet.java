package Opportunity.OpportunityList.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import Opportunity.OpportunityList.Service.OpportunityFilterList;
import logger.System;

@WebServlet("/OpportunityFilterListServlet")
public class OpportunityFilterListServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
		String category = request.getParameter("category");
		String phase = request.getParameter("phase");
		String wave = request.getParameter("wave");
		boolean bySearch =Boolean.parseBoolean(request.getParameter("bySearch"));
		JsonArray jsonArray = new JsonArray();
		try
		{   if(!bySearch) {
			OpportunityFilterList opportunityList = new OpportunityFilterList(category, phase, wave);
			jsonArray = opportunityList.getAppList();
			opportunityList = null;
			System.gc();
		} else {
		String appName =request.getParameter("appName");
		OpportunityFilterList opportunityList = new OpportunityFilterList();
		jsonArray = opportunityList.getAppListBySearch(appName);
		opportunityList = null;
		System.gc();
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println("JSON ARRAY"+jsonArray);
		 String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

}

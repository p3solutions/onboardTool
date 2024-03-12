package Opportunity.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

import Opportunity.Service.NewOpportunityCreateService;
import logger.System;

/**
 * Servlet implementation class NewOpportunitySave
 */
@WebServlet("/NewOpportunitySave")
public class NewOpportunitySave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewOpportunitySave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Im in save servlet");
		JsonParser parser = new JsonParser();
		JsonElement tradeElement = parser.parse(request.getParameter("Json_Sample"));
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		System.out.println("jsonArray : "+jsonArray);
		NewOpportunityCreateService.NewOpportunityDetailsSave(jsonArray);
		response.sendRedirect("/onboardTool/OpportunityList.jsp");
		
	}

}

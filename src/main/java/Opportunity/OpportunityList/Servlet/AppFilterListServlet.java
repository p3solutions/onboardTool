package Opportunity.OpportunityList.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import Opportunity.OpportunityList.Service.AppFilterList;
import admin_module_modify.service.Retrieve_users_service;

/**
 * Servlet implementation class AppFilterListServlet
 */
@WebServlet("/AppFilterListServlet")
public class AppFilterListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AppFilterListServlet() {
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
		JsonArray jsonArray = null;
		AppFilterList retrieveapps =  new AppFilterList();
		jsonArray = retrieveapps.retrieve_apps();
		retrieveapps =null;
		System.gc();
		System.out.println("JSON ARRAY"+jsonArray);
		String json = new Gson().toJson(jsonArray);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}

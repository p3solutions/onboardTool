package NewArchiveRequirements.AbbreviationList.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import NewArchiveRequirements.AbbreviationList.service.Retrieve_Abbreviations_Service;
import admin_module_modify.service.Retrieve_users_service;
import logger.System;

/**
 * Servlet implementation class AbbreviationRetrieveServlet
 */
@WebServlet("/Retrieve_Abbreviations_Servlet")
public class Retrieve_Abbreviations_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Retrieve_Abbreviations_Servlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession details = request.getSession();
	    String Id=(String)details.getAttribute("ID");
	    JsonArray jsonArray = null;
		Retrieve_Abbreviations_Service retrieveabbreviations = new Retrieve_Abbreviations_Service();
		jsonArray = retrieveabbreviations.retrieve_abbreviations(Id);
		retrieveabbreviations = null;
		// calling finalize method and garbage collector
		System.gc();
		System.out.println("JSON ARRAY" + jsonArray);
		String json = new Gson().toJson(jsonArray);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);
	}

}

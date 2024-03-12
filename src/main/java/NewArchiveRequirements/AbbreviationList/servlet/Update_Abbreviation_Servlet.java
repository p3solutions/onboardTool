package NewArchiveRequirements.AbbreviationList.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import NewArchiveRequirements.AbbreviationList.service.Update_Abbreviation_Service;
import admin_module_modify.service.Update_users_service;
import logger.System;

/**
 * Servlet implementation class update_abbreviations_servlet
 */
@WebServlet("/Update_Abbreviation_Servlet")
public class Update_Abbreviation_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update_Abbreviation_Servlet() {
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
	     	HttpSession details = request.getSession();
		    String app_id=(String)details.getAttribute("ID");
	        String random_id=request.getParameter("random_id");
	        String abbreviation_acronym_modify=request.getParameter("abbreviation_acronym_modify");
	        String description_modify=request.getParameter("description_modify");
	       
	        //String seq_num = request.getParameter("seq_num");
	        System.out.println("App ID :"+app_id);
	        System.out.println("Random ID: "+random_id);
	        System.out.println("Updated Abbreviations : "+abbreviation_acronym_modify);
	        System.out.println("Updated Description: "+description_modify);
	        
	        JsonObject jsonObj =Update_Abbreviation_Service.update_Abbreviation(app_id,random_id,abbreviation_acronym_modify,description_modify);
	        String json = new Gson().toJson(jsonObj);
	        System.out.println("JSON"+json);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8"); 
	        response.getWriter().write(json);
	}

}

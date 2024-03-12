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

import NewArchiveRequirements.AbbreviationList.service.Add_Abbreviation_Service;
import admin_module_modify.service.Add_users_service;
import logger.System;

/**
 * Servlet implementation class add_abbreviations_servlet
 */
@WebServlet("/Add_Abbreviation_Servlet")
public class Add_Abbreviation_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_Abbreviation_Servlet() {
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
        String abbreviation_acronym=request.getParameter("abbreviation_acronym");
        String description=request.getParameter("abb_description");

        System.out.println("App ID"+app_id);
        System.out.println("Abbreviations/Acronyms : "+abbreviation_acronym);
        System.out.println("Descriptions: "+description);
        JsonObject jsonObj =Add_Abbreviation_Service.add_Abbreviation(app_id, abbreviation_acronym, description);
         String json = new Gson().toJson(jsonObj);
         System.out.println("JSON"+json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
            }

}

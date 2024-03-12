package admin_module_modify.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import admin_module_modify.service.View_Profile_service;
import logger.System;

/**
 * Servlet implementation class View_Profile_servlet
 */
@WebServlet("/View_Profile_servlet")
public class View_Profile_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public View_Profile_servlet() {
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
			HttpSession details = request.getSession();
	        String uname=request.getParameter("user_Name");
	        JsonArray jsonArray = null;
	        View_Profile_service viewprofile =  new View_Profile_service();
	        jsonArray = viewprofile.view_profile(uname);
	        viewprofile =null;
	        //calling finalise method and garbage collector
	        System.gc();
	        System.out.println("JSON ARRAY from view profile servlet "+jsonArray);
	        String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

}

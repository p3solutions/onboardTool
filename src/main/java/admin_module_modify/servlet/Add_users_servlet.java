package admin_module_modify.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import admin_module_modify.service.Add_users_service;
import logger.System;

/**
 * Servlet implementation class Add_users_servlet
 */
@WebServlet("/Add_users_servlet")
public class Add_users_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Add_users_servlet() {
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
        String id=request.getParameter("id");
        String uname=request.getParameter("uname");
        String ufname=request.getParameter("ufname");
        String ulname=request.getParameter("ulname");
        String u_email=request.getParameter("u_email");
        String u_pwd=request.getParameter("u_pwd");
        String u_role=request.getParameter("u_role");
        System.out.println("ID"+id);
        System.out.println("User Name : "+uname);
        System.out.println("User First Name: "+ufname);
        System.out.println("User Last Name: "+ulname);
        System.out.println("User Email: "+u_email);
        System.out.println("User Pwd: "+u_pwd);
        System.out.println("User Role: "+u_role);
        JsonObject jsonObj =Add_users_service.add_users(uname, ufname, ulname, u_email, u_pwd, u_role);
         String json = new Gson().toJson(jsonObj);
         System.out.println("JSON"+json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
	}

}

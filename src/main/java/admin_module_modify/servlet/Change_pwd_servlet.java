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

import admin_module_modify.service.Change_pwd;
import admin_module_modify.service.Update_users_service;
import logger.System;

/**
 * Servlet implementation class Change_pwd
 */
@WebServlet("/Change_pwd_servlet")
public class Change_pwd_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Change_pwd_servlet() {
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

		String username=request.getParameter("user_Name");
		String current_pwd=request.getParameter("prev_pwd");
		String new_pwd=request.getParameter("new_pwd");
		System.out.println("User Name : "+username);
		System.out.println("Current Pwd : "+current_pwd);
		System.out.println("New Pwd : "+new_pwd);
		JsonObject jsonObj =Change_pwd.change_pwd(username, current_pwd, new_pwd);
		String json = new Gson().toJson(jsonObj);
		System.out.println("JSON"+json);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);

	}

}

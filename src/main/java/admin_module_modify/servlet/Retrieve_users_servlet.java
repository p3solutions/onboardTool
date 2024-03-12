package admin_module_modify.servlet;

import admin_module_modify.service.Retrieve_users_service;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import logger.System;
/**
 * Servlet implementation class Retrieve_users_servlet
 */
@WebServlet("/Retrieve_users_servlet")
public class Retrieve_users_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Retrieve_users_servlet() {
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
        String uname=request.getParameter("uname");
        String ufname=request.getParameter("ufname");
        String ulname=request.getParameter("ulname");
        String u_email=request.getParameter("u_email");
        String u_role=request.getParameter("u_role");
        JsonArray jsonArray = null;
        Retrieve_users_service retrieveusers =  new Retrieve_users_service();
        jsonArray = retrieveusers.retrieve_users();
        retrieveusers =null;
        //calling finalize method and garabage collector
        System.gc();
        System.out.println("JSON ARRAY"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
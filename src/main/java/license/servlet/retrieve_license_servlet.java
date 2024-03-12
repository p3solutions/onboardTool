package license.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import license.service.retrieve_license_info;
import logger.System;

/**
 * Servlet implementation class retrieve_license_servlet
 */
@WebServlet("/retrieve_license_servlet")
public class retrieve_license_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public retrieve_license_servlet() {
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
        String issue_to=request.getParameter("issue_to");
        String issue_date=request.getParameter("issue_date");
        String valid_till=request.getParameter("valid_till");
        JsonArray jsonArray = null;
        retrieve_license_info retrievelicense =  new retrieve_license_info();
        jsonArray = retrievelicense.retrieve_license_details();
        retrievelicense =null;
        //calling finalize method and garabage collector
        System.gc();
        System.out.println("JSON ARRAY"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

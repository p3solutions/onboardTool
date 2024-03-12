package license.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import license.service.update_license;
import logger.System;

/**
 * Servlet implementation class update_license_servlet
 */
@WebServlet("/update_license_servlet")
public class update_license_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_license_servlet() {
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
		String pattern = "dd-MMM-yyyy";
    	String last_update_date =new SimpleDateFormat(pattern).format(new Date());
		String license_info=request.getParameter("license_info");
		JsonObject jsonObj =update_license.license_update(license_info,last_update_date);
		System.out.println("License Info : "+license_info);
		
		System.out.println("Last Updated Date : "+last_update_date);
        String json = new Gson().toJson(jsonObj);
        
        System.out.println("JSON"+json);
           response.setContentType("application/json");
           response.setCharacterEncoding("UTF-8");
           response.getWriter().write(json);
	}

}

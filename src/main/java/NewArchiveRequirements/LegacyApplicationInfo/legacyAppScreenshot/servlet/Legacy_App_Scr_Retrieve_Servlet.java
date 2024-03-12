package NewArchiveRequirements.LegacyApplicationInfo.legacyAppScreenshot.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import NewArchiveRequirements.LegacyApplicationInfo.legacyAppScreenshot.service.Legacy_App_Scr_Retrieve;
import logger.System;

/**
 * Servlet implementation class Legacy_App_Scr_Retrieve_Servlet
 */
@WebServlet("/Legacy_App_Scr_Retrieve_Servlet")
public class Legacy_App_Scr_Retrieve_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Legacy_App_Scr_Retrieve_Servlet() {
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
	    String Id=(String)details.getAttribute("ID");
	    String File_Name=request.getParameter("File_Name");
	    JsonArray jsonArray = null;
	    Legacy_App_Scr_Retrieve scr_retrive=new Legacy_App_Scr_Retrieve();
	    jsonArray=scr_retrive.screenshot_retrieve(Id);
        scr_retrive =null;
        //calling finalize method and garabage collector
        System.gc();
        System.out.println("LEGACY SCREENSHOT JSON ARRAY"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);	
		
		
	}

}

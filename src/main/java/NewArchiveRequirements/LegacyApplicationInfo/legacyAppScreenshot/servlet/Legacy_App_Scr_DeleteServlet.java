package NewArchiveRequirements.LegacyApplicationInfo.legacyAppScreenshot.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import NewArchiveRequirements.LegacyApplicationInfo.legacyAppScreenshot.service.Legacy_App_Scr_Delete;
import admin_module_modify.service.Delete_users_service;

/**
 * Servlet implementation class Legacy_App_Scr_DeleteServlet
 */
public class Legacy_App_Scr_DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Legacy_App_Scr_DeleteServlet() {
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
	    JsonObject jsonObj =Legacy_App_Scr_Delete.delete_screenshots(Id,File_Name);
        String json = new Gson().toJson(jsonObj);
        System.out.println("JSON"+json);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
       
		
		
	}

}

package NewArchiveRequirements.Introduction.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import NewArchiveRequirements.Introduction.service.ArchiveIntroSaveService;
import logger.System;

/**
 * Servlet implementation class ArchiveIntroSave
 */
 @WebServlet("/ArchiveIntroSave")
public class ArchiveIntroSave extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchiveIntroSave() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String id = (String)details.getAttribute("ID");
		String appName = (String)details.getAttribute("SelectedOpportunity");
		String columnName = request.getParameter("columnName");
		String value=request.getParameter("value");
		System.out.println("val: "+value);
		JsonObject jsonObj = new JsonObject();
		try {
			jsonObj = new ArchiveIntroSaveService(columnName, value, id, appName).ArchiveIntroRequirementSave();
			System.gc();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		String json = new Gson().toJson(jsonObj);
		
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8"); response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

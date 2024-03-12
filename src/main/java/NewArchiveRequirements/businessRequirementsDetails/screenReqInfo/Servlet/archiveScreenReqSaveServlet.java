package NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service.archiveScreenReqSaveService;
import logger.System;

/**
 * Servlet implementation class archiveScreenReqSaveServlet
 */
@WebServlet("/archiveScreenReqSaveServlet")
public class archiveScreenReqSaveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession details = request.getSession();
		String id = (String)details.getAttribute("ID");
		String oppName =(String)details.getAttribute("SelectedOpportunity");
		String tableName = request.getParameter("tableName");
		
        String JsonString= request.getParameter("JsonArray");
        
        JsonParser parser = new JsonParser();
		JsonElement tradeElement = parser.parse(JsonString);
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		JsonObject jsonObj = new JsonObject();

		try
		{
			archiveScreenReqSaveService saveService = new archiveScreenReqSaveService(id, jsonArray, tableName);
			jsonObj=saveService.archiveFunctionalReqScreenReqSave();
			saveService = null;
			System.gc();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		String json = new Gson().toJson(jsonObj);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8"); 
		response.getWriter().write(json);
	}
}

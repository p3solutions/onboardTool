package NewArchiveRequirements.addendumInfo.servlet;

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

import NewArchiveRequirements.addendumInfo.service.archiveReqAddendumSaveService;
import NewArchiveRequirements.documentRevisions.service.archiveReqDocRevSaveService;
import logger.System;

/**
 * Servlet implementation class archiveReqAddendumSaveServlet
 */
@WebServlet("/archiveReqAddendumSaveServlet")

public class archiveReqAddendumSaveServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String id = (String)details.getAttribute("ID");
		String oppName =(String)details.getAttribute("SelectedOpportunity");
		
        String JsonString= request.getParameter("JsonArray");
        
        JsonParser parser = new JsonParser();
		JsonElement tradeElement = parser.parse(JsonString);
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		JsonObject jsonObj = new JsonObject();

		try
		{
			archiveReqAddendumSaveService saveService = new archiveReqAddendumSaveService(id, jsonArray);
			jsonObj=saveService.archiveReqAddendumSave();
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
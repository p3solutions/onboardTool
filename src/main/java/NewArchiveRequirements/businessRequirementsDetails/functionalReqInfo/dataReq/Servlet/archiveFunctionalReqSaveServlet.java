package NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Servlet;

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

import NewArchiveRequirements.LegacyApplicationInfo.ArchiveEnvironmentInfo.Service.archiveEnvironmentSaveService;
import NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service.archiveFunctionalReqSaveService;
import logger.System;

/**
 * Servlet implementation class archiveFunctionalReqSaveServlet
 */
@WebServlet("/archiveFunctionalReqSaveServlet")
public class archiveFunctionalReqSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public archiveFunctionalReqSaveServlet() {
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
			archiveFunctionalReqSaveService saveService = new archiveFunctionalReqSaveService(id, jsonArray, tableName);
			jsonObj=saveService.archiveFunctionalReqSave();
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

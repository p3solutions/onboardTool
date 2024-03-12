package exportPdf.servlet;

import java.io.IOException;
import java.sql.SQLException;

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

import ArchiveExecutionGovernanceModule.service.ArchiveExecutionGovernanceAddService;
import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionAddService;
import common.constant.MODULE_NAME;
import exportPdf.service.exportPdfService;
import logger.System;
@WebServlet("/exportPdfServlet")
public class exportPdfServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String jsonContent = (String)request.getParameter("jsonContent");
		String modulename = (String)request.getParameter("modulename");

		String appName = (String) details.getAttribute("SelectedOpportunity");
		String appId = (String) details.getAttribute("ID");
		JsonParser parser = new JsonParser();

		JsonElement tradeElement = parser.parse(jsonContent);
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		
		exportPdfService export = null;
		JsonObject jsonObject = null;
		try {
			jsonObject = new JsonObject();
			export = new exportPdfService(jsonArray,appName,appId,modulename); 
			jsonObject.addProperty("path",export.startExportPdf());
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		String json = new Gson().toJson(jsonObject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

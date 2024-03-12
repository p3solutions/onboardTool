package governance.servlet;

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

import NewArchiveRequirements.LegacyApplicationInfo.Service.archiveLegacyAppInfoSaveService;
import governance.service.governanceSaveService;
import governance.service.phaseSaveService;
import logger.System;
@WebServlet("/phaseSaveServlet")

public class phaseSaveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String phaseId = request.getParameter("phaseId");
		String id =request.getParameter("id");
		String phaseName =request.getParameter("phaseName");
		String operation = request.getParameter("operation");
		boolean checkMandatory = Boolean.parseBoolean(request.getParameter("checkMandatory"));
        String JsonString= (String)request.getParameter("JsonString");
        JsonParser parser = new JsonParser();
		JsonElement tradeElement = parser.parse(JsonString);
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		JsonObject jsonObject = new JsonObject();
		try {
			phaseSaveService phase = new phaseSaveService(phaseId, phaseName, jsonArray,id,operation);
			boolean checkphaseName = phase.checkDuplicateData("phaseName", phaseName);
			boolean checkphaseId = phase.checkDuplicateData("phaseId", phaseId);
			jsonObject.addProperty("checkphaseName", checkphaseName);
			jsonObject.addProperty("checkphaseId", checkphaseId);

			if(!checkphaseName&&!checkphaseId&&checkMandatory)
			{
			boolean statusFlag = phase.SaveService();
			jsonObject.addProperty("SaveStatus", statusFlag);
			}
			else
				jsonObject.addProperty("SaveStatus", false);
			phase = null;
			System.gc();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String json = new Gson().toJson(jsonObject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	
	}

}

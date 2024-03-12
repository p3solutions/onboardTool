package governance.servlet;

import logger.System;
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
@WebServlet("/governanceSaveServlet")

public class governanceSaveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String waveId = request.getParameter("waveId");
		String id = request.getParameter("id");
		String operation =  request.getParameter("operation");
		String waveName =request.getParameter("waveName");
		boolean checkMandatory = Boolean.parseBoolean(request.getParameter("checkMandatory"));
        String JsonString= (String)request.getParameter("JsonString");
        JsonParser parser = new JsonParser();
		JsonElement tradeElement = parser.parse(JsonString);
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		JsonObject jsonObject = new JsonObject();
		try {
			governanceSaveService governance = new governanceSaveService(waveId, waveName, jsonArray,id,operation);
			boolean checkWaveName = governance.checkDuplicateData("waveName", waveName);
			boolean checkWaveId = governance.checkDuplicateData("waveId", waveId);
			jsonObject.addProperty("checkWaveName", checkWaveName);
			jsonObject.addProperty("checkWaveId", checkWaveId);

			if(!checkWaveName&&!checkWaveId&&checkMandatory)
			{
			boolean statusFlag = governance.SaveService();
			jsonObject.addProperty("SaveStatus", statusFlag);
			}
			else
				jsonObject.addProperty("SaveStatus", false);
			governance = null;
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

package governance.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import governance.service.governanceSaveService;
import logger.System;

@WebServlet("/addOpportunityToGovernance")

public class addOpportunityToGovernance extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("waveId");
		String oppName =request.getParameter("oppName");
		JsonObject jsonObject = new JsonObject();
        try {
			governanceSaveService governance = new governanceSaveService(id, oppName);
			governance.AddOpportunityToExistingWave();
			governance = null;
			System.gc();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		String json = new Gson().toJson(jsonObject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

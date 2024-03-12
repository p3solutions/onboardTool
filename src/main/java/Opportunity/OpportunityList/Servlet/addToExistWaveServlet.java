package Opportunity.OpportunityList.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import governance.service.governanceSaveService;
import logger.System;

@WebServlet("/addToExistWaveServlet")

public class addToExistWaveServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oppName = request.getParameter("oppName");
		String waveName = request.getParameter("waveName");
		JsonObject jsonObject = new JsonObject();
		try {
			governanceSaveService goverService = new governanceSaveService(waveName, oppName);
			jsonObject.addProperty("checkStatus", goverService.AddOpportunityToExistingWave());
			goverService = null;
			System.gc();
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

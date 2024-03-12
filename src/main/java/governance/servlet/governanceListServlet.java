package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import governance.service.governanceListService;
import logger.System;
@WebServlet("/governanceListServlet")

public class governanceListServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
	    String waves=(String)details.getAttribute("projects");
	    
	    JsonArray jsonArray = new JsonArray();
	    try
	    {
	    	governanceListService waveService = new governanceListService(waves);
	    	jsonArray = waveService.governanceListDetails();
	    	waveService = null;
	    	System.gc();
	    }
	    catch(Exception e)
	    {
	    	e.printStackTrace();
	    }
	    String json = new Gson().toJson(jsonArray);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);
	}

}

package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import governance.service.selectListService;
import logger.System;
@WebServlet("/filteringListServlet")
public class filteringListServlet extends HttpServlet {

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String category = request.getParameter("category");
	
	String phase = request.getParameter("phase");
	
	String wave = request.getParameter("wave");
	
	String application = request.getParameter("application");
	
	boolean searchByApp = Boolean.parseBoolean(request.getParameter("searchByApp"));
	
	JsonArray jsonArray = new JsonArray();
	
	try
	{
		
		selectListService service = new selectListService(category, phase, wave, application,searchByApp);
		
		jsonArray = service.getList();
		
		service = null;		
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

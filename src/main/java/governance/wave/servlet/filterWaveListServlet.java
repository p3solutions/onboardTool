package governance.wave.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import governance.wave.service.filterWaveList;
import logger.System;
@WebServlet("/filterWaveListServlet")

public class filterWaveListServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     String phaseName = request.getParameter("phaseName");
     String waveName =  request.getParameter("waveName");
     String appName = request.getParameter("appName");
     
     JsonArray jsonArray = new JsonArray();
     try {
    	 
    	 filterWaveList filter = new filterWaveList(phaseName, waveName, appName);
    	 jsonArray  = filter.getWaveList();
    	 
    	 filter = null;
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

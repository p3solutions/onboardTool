package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import governance.service.phaseDataRetrieveService;
import logger.System;

@WebServlet("/phaseDataRetrieveServlet")

public class phaseDataRetrieveServlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			JsonArray jsonArray = new JsonArray(); 
			String operation = request.getParameter("operation");
			String phaseId = request.getParameter("phaseId");
		    try
		     {
		    	 phaseDataRetrieveService phase = new phaseDataRetrieveService(phaseId,operation);
		    	 jsonArray=phase.phaseDataRetrieve();
		    	 phase=null;
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

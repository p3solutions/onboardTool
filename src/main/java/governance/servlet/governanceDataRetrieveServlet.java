package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import governance.service.governanceDataRetrieveService;
import logger.System;
@WebServlet("/governanceDataRetrieveServlet")

public class governanceDataRetrieveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    JsonArray jsonArray = new JsonArray(); 
    String waveId = request.getParameter("waveId");
    String purpose = request.getParameter("operation");
    try
     {
    	 governanceDataRetrieveService governance = new governanceDataRetrieveService(waveId,purpose);
    	 jsonArray=governance.governanceDataRetrieve();
    	 governance=null;
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

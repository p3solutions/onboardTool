package dashboard.overAllDashboard.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import dashboard.overAllDashboard.service.dashboardGanttChartService;
import logger.System;

@WebServlet("/dashboardGanttChartServlet")

public class dashboardGanttChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    		String oppName = request.getParameter("oppName");
    		
    		JsonArray jsonArray = new JsonArray();
    		
    		try {
    			
    			dashboardGanttChartService ganttChart = new dashboardGanttChartService(oppName);
    			jsonArray = ganttChart.getArchiveExecution();
    			ganttChart = null;
    			System.gc();
    			
    		}
    		catch(Exception e) {
    			e.printStackTrace();
    		}
    		
    		String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

}

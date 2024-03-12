package dashboard.overAllDashboard.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import dashboard.overAllDashboard.service.dashboardService;
import logger.System;

@WebServlet("/FilteredApplicationServlet")
public class FilteredApplicationServlet extends HttpServlet { 
	
	    private static final long serialVersionUID = 1L;
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        JsonArray jsonArray =  new JsonArray();
	        String phase = request.getParameter("phase");
	        String wave = request.getParameter("wave");
	        if(phase==null||wave==null) {
	        	phase="All";
	        	wave="All";
	        }
	       
	        try {
	            dashboardService dashboard = new dashboardService();
	            // dashboard.getphasewaveinfo("All");
	         // System.out.println( " app phsae wave :   "+  array);
	            jsonArray.add(dashboard.getApplicationFromPhaseDataTable(phase,wave));
	            jsonArray.add(dashboard.getApplicationArchiveReqDataFromPhase(phase,wave));
	            jsonArray.add(dashboard.getArchiveExeDataFromPhase(phase,wave));
	            dashboard = null;
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
	
	



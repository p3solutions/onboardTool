package applicationList.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import Opportunity.OpportunityList.Service.OpportunityListService;
import applicationList.service.PlanAndPriorityWithPhaseService;
import logger.System;
@WebServlet("/PlanAndPriorityWithoutPhaseWaveServlet")
public class PlanAndPriorityWithoutPhaseWaveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession details = request.getSession();
    	 String Projects=(String)details.getAttribute("projects");
        JsonArray jsonArray =  new JsonArray();
        try {
        	JsonArray jsonArray1 = OpportunityListService.OpportunityListDetails(Projects);
            PlanAndPriorityWithPhaseService service = new PlanAndPriorityWithPhaseService();
            jsonArray.add(service.GetAppWithoutPhaseWave());
            jsonArray.add(jsonArray1);
            service = null;
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
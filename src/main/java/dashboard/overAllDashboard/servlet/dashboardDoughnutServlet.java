package dashboard.overAllDashboard.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import dashboard.overAllDashboard.service.DashboardDoughnutService;
import logger.System;
@WebServlet("/dashboardDoughnutServlet")
public class dashboardDoughnutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonArray jsonArray =  new JsonArray();
        String phase = request.getParameter("phase");
        String wave = request.getParameter("wave");
        try {
            DashboardDoughnutService dashboard = new DashboardDoughnutService();
            jsonArray.add(dashboard.dashboardDoughnutDetails(phase,wave));
            jsonArray.add(dashboard.getCBADetail());
            dashboard = null;
            System.gc();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        System.out.println("JsonArray last: "+jsonArray);
         String json = new Gson().toJson(jsonArray);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
    }
}
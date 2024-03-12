package applicationList.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import applicationList.service.PlanAndPriorityWithPhaseService;
import logger.System;
@WebServlet("/PlanAndPriorityWithinPhase")
public class PlanAndPriorityWithinPhase extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JsonArray jsonArray =  new JsonArray();
        try {
            PlanAndPriorityWithPhaseService service = new PlanAndPriorityWithPhaseService();
            jsonArray.add(service.GetAppWithPhaseWave("All","All"));
            jsonArray.add(service.getResources());
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
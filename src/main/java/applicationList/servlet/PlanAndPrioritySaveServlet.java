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
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import applicationList.service.PlanAndPrioritySaveService;
import logger.System;
@WebServlet("/PlanAndPrioritySaveServlet")
public class PlanAndPrioritySaveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession details = request.getSession();
        String OppId = (String)details.getAttribute("ID");
        String id = (String)details.getAttribute("app_Id");
        String JsonString= request.getParameter("JsonArray");
        JsonParser parser = new JsonParser();
        JsonElement tradeElement = parser.parse(JsonString);
        JsonArray jsonArray = tradeElement.getAsJsonArray();
        JsonObject jsonObj = new JsonObject();
        try
        {
        	System.out.println("appName : " + jsonArray + " appId : " +" oppId : " +OppId);
            PlanAndPrioritySaveService service = new PlanAndPrioritySaveService(OppId,id, jsonArray);
            jsonObj=service.planAndPrioritySave();
            service = null;
            System.gc();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        String json = new Gson().toJson(jsonObj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8"); 
        response.getWriter().write(json);
    }
}
package NewArchiveRequirements.ApprovalInfo.servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import NewArchiveRequirements.ApprovalInfo.service.archiveReqApprovalDataRetrieveService;
import logger.System;
@WebServlet("/archiveReqApprovalDataRetrieveServlet")
public class archiveReqApprovalDataRetrieveServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession details = request.getSession();
        String Id = (String)details.getAttribute("ID");
        String OppName = (String)details.getAttribute("SelectedOpportunity");
        String role = (String)details.getAttribute("role");
        String username = (String)details.getAttribute("username");
        String approverId = request.getParameter("aproverId");
        boolean isApprover = Boolean.parseBoolean(request.getParameter("isApprover"));
        /* String approverId = request.getParameter("aproverId"); */
        JsonArray jsonArray = new JsonArray();
        JsonObject jsonObject = new JsonObject();
        jsonObject.addProperty("role", role);
        jsonObject.addProperty("user", username);
        jsonArray.add(jsonObject);
        System.out.println("Json Array 1:"+jsonArray);
        try
        {
            archiveReqApprovalDataRetrieveService dataService = new archiveReqApprovalDataRetrieveService(Id, OppName);
            if(approverId.isBlank() || approverId.isEmpty())
            {
                jsonArray.addAll(dataService.ApprovalDataRetrieve());

            }
            else {
            jsonArray.addAll(dataService.ApprovalRetrieveUsingApprovalId(Id,username,approverId,isApprover,request));
            }
            dataService = null;
            System.gc();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        System.out.println("Json Array:"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
        }
}
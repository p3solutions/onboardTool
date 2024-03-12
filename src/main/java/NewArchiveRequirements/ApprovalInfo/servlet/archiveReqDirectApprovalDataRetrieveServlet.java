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
import NewArchiveRequirements.ApprovalInfo.service.archiveReqDirectApprovalDataRetrieveService;
import logger.System;
@WebServlet("/archiveReqDirectApprovalDataRetrieveServlet")
public class archiveReqDirectApprovalDataRetrieveServlet extends HttpServlet {
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession details = request.getSession();
    String Id = (String)details.getAttribute("ID");
    String OppName = (String)details.getAttribute("SelectedOpportunity");
    String role = (String)details.getAttribute("role");
    String username = (String)details.getAttribute("username");
     String approverId = request.getParameter("aproverId"); 
     String uname = request.getParameter("username"); 
     String priorityNo = request.getParameter("priorityNo"); 
     String type = request.getParameter("type"); 
    JsonArray jsonArray = new JsonArray();
    try
    {
        archiveReqDirectApprovalDataRetrieveService dataService = new archiveReqDirectApprovalDataRetrieveService(Id, OppName);
        if(type.equals("ArchiveReq")) {
        jsonArray = dataService.directApprovalArchiveReqDataRetrieve(approverId,uname,priorityNo);
        }else if(type.equals("StakeHolder")) {
            jsonArray = dataService.directApprovalIntakeDataRetrieve(approverId,uname,priorityNo);
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
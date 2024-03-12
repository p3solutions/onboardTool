package ArchiveExecutionIssueRisk;
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
import NewArchiveRequirements.Introduction.service.ApproverRolesSaveService;
import logger.System;
/**
 * Servlet implementation class ArchiveExeIssueSaveServlet
 */@WebServlet("/archiveExeIssueSaveServlet")
public class ArchiveExeIssueSaveServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchiveExeIssueSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
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
            ArchiveExeIssueSaveService archiveIssue = new ArchiveExeIssueSaveService(OppId,id, jsonArray);
            jsonObj=archiveIssue.archiveExeIssueSave();
            archiveIssue = null;
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

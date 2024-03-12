package NewArchiveRequirements.ApprovalInfo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import NewArchiveRequirements.ApprovalInfo.service.archiveReqApprovalSaveService;
import logger.System;

@WebServlet("/archiveReqApprovalSaveServlet")
public class archiveReqApprovalSaveServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession details = request.getSession();
    String Id = (String)details.getAttribute("ID");
    String OppName = (String)details.getAttribute("SelectedOpportunity");
    int seqNum = Integer.parseInt(request.getParameter("SeqNum"));
    String approvalStatus = request.getParameter("approvalStatus");
    String approverId = request.getParameter("a_Id");
    JsonObject jsonObject = new JsonObject();
    try
    {
    	archiveReqApprovalSaveService saveService = new archiveReqApprovalSaveService(seqNum,Id,OppName,approverId,approvalStatus);
    	jsonObject=saveService.approvalSave();
    	saveService =null;
    	System.gc();
    }
    catch(Exception e)
    {
    	e.printStackTrace();
    }
    String json = new Gson().toJson(jsonObject);
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");
    response.getWriter().write(json);
	}
}
package common.email.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import common.constant.MODULE_NAME;
import common.email.service.EmailApprovalService;
import logger.System;
@WebServlet("/EmailApproval")
public class EmailApproval extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String oppId = (String)details.getAttribute("ID");
		String appName = (String)details.getAttribute("SelectedOpportunity");
		String moduleName = request.getParameter("moduleName");
		JsonObject jsonObject = null;
		try {
			EmailApprovalService mailService = new EmailApprovalService(oppId,appName,moduleName);
			jsonObject = mailService.getUserListAndSendApprovalMail();
			mailService=null;
		    System.gc();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		String json = new Gson().toJson(jsonObject);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8"); 
		response.getWriter().write(json);
	}
}

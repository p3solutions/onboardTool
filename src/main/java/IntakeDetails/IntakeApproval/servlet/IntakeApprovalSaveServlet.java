package IntakeDetails.IntakeApproval.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import IntakeDetails.IntakeApproval.service.IntakeApprovalService;
import IntakeDetails.IntakeTriage.Service.IntakeTriageService;
import onboard.DBconnection;
import logger.System;
@WebServlet("/IntakeApprovalSaveServlet")
public class IntakeApprovalSaveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int seq_no = Integer.parseInt(request.getParameter("seq_no"));
		HttpSession details = request.getSession();
		boolean isApproval = Boolean.parseBoolean(request.getParameter("isApproval"));
		//String OppId = (String)details.getAttribute("ID");
		String approvalId = request.getParameter("approverId");
		String IntakeApproval = request.getParameter("IntakeApproval");
		String comments = request.getParameter("ApprovalComments");
		boolean check = false;
		try {
			IntakeApprovalService intake = new IntakeApprovalService(approvalId);		
		check = intake.IntakeApprovalUpdate(IntakeApproval, seq_no,comments);
		
		intake.IntakeApprovalModuleInfo();
		intake=null;
		System.gc();
				} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (Throwable e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			JsonObject jsonObj = new JsonObject();
			jsonObj.addProperty("checkStatus",check);
			String json = new Gson().toJson(jsonObj);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8"); 
			response.getWriter().write(json);
	}

}

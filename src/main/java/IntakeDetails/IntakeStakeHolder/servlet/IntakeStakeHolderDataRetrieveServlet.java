package IntakeDetails.IntakeStakeHolder.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import IntakeDetails.IntakeAssessment.service.IntakeAssessmentService;
import IntakeDetails.IntakePreviewDetails.service.IntakePreviewDetailsService;
import IntakeDetails.IntakeStakeHolder.service.IntakeStakeHolderService;
import logger.System;
@WebServlet("/IntakeStakeHolderDataRetrieveServlet")
public class IntakeStakeHolderDataRetrieveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
        String Id=(String)details.getAttribute("ID");
        String UserName = (String)details.getAttribute("username");
        String approverId = request.getParameter("aproverId");
        boolean isApprover = Boolean.parseBoolean(request.getParameter("isApprover"));
       System.out.println("Opportunity Id "+Id);
		JsonArray jsonArray = null;
		try {
			IntakeStakeHolderService intakeStake =  new IntakeStakeHolderService();
			jsonArray = new JsonArray();
			jsonArray.add(intakeStake.IntakeStakeHolderDataRetrieve(Id,UserName,approverId,isApprover));
			if(isApprover) {
				jsonArray.add(new IntakePreviewDetailsService(intakeStake.oppId,intakeStake.userName).IntakeApprovalPreviewDataRetrieve(intakeStake.oppId,intakeStake.role));
			}
			intakeStake =null;
			//calling finalize method and garabage collector
			System.gc();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("JSON ARRAY"+jsonArray);
		 String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}
}

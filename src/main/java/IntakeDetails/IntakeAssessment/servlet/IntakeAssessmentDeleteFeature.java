package IntakeDetails.IntakeAssessment.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import IntakeDetails.IntakeAssessment.service.IntakeAssessmentEditDeleteFeatureService;
import IntakeDetails.IntakeAssessment.service.IntakeAssessmentService;
import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;
import logger.System;

/**
 * Servlet implementation class IntakeAssessmentDeleteFeature
 */
@WebServlet("/IntakeAssessmentDeleteFeature")
public class IntakeAssessmentDeleteFeature extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeAssessmentDeleteFeature() {
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
		JsonObject jsonobj = new JsonObject();
		HttpSession details = request.getSession();
        String Id=(String)details.getAttribute("ID");
        System.out.println("Opportunity Id "+Id);
        String DeleteSection = request.getParameter("DeleteSection");
		int seq_num = Integer.parseInt(request.getParameter("seq_num"))+1;
		
		try {
		  jsonobj =	new IntakeAssessmentEditDeleteFeatureService(Id, DeleteSection, seq_num).DeleteFeature();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		String json = new Gson().toJson(jsonobj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

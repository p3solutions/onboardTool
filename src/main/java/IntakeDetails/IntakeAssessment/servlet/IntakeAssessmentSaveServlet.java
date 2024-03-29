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
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import IntakeDetails.IntakeAssessment.service.IntakeAssessmentSaveFunctionalityService;
import IntakeDetails.IntakeTriage.Service.IntakeTriageService;
import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;

/**
 * Servlet implementation class IntakeAssessmentSaveServlet
 */
@WebServlet("/IntakeAssessmentSaveServlet")
public class IntakeAssessmentSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeAssessmentSaveServlet() {
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
		
		//String section[] = {"ApplicationInformation" , "DataCharacteristics" , "ComplianceCharacteristics" , "ArchivalConsumption","ContractInformation"};
		System.out.println("Response");
		HttpSession details = request.getSession();
		String id = (String)details.getAttribute("ID");
		String JsonString= (String)request.getParameter("JsonString");
		String section= (String)request.getParameter("section");

	    JsonParser parser = new JsonParser();
		JsonElement tradeElement = parser.parse(JsonString);
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		boolean check = false;
		for(int i = 0; i<jsonArray.size(); i++) {
			try {
				JsonArray jsonArraySection = jsonArray.get(i).getAsJsonArray();
				new IntakeAssessmentSaveFunctionalityService(section,id).Save(jsonArraySection,id);
				check = true;
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
		}
		JsonObject jsonObj = new JsonObject();
		jsonObj.addProperty("CheckExistence", check);
		String json = new Gson().toJson(jsonObj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
}
	
}
package IntakeDetails.IntakeOpportunity.Servlet;

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

import IntakeDetails.IntakeOpportunity.Service.IntakeOpportunityService;
import Opportunity.Service.NewOpportunityCreateService;

/**
 * Servlet implementation class IntakeDetailsOpportunityValidationAndUpdate
 */
@WebServlet("/IntakeDetailsOpportunityValidationAndUpdate")
public class IntakeDetailsOpportunityValidationAndUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeDetailsOpportunityValidationAndUpdate() {
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
		String id = (String)details.getAttribute("ID");
		String APMID =request.getParameter("APMID");
		String AppName =request.getParameter("AppName");
        String JsonString= (String)request.getParameter("JsonString");
        boolean checkMandatory =Boolean.parseBoolean(request.getParameter("checkMandatory"));
        JsonParser parser = new JsonParser();
		JsonElement tradeElement = parser.parse(JsonString);
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		JsonObject jsonObject = IntakeOpportunityService.intakeDetailsOpportunityValidation(AppName, jsonArray, checkMandatory, APMID, id);
		String json = new Gson().toJson(jsonObject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

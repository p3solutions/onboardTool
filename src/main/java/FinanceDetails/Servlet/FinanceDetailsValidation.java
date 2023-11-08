package FinanceDetails.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import FinanceDetails.Service.FinanceDetailRetrieveService;
import Opportunity.Service.NewOpportunityCreateService;

/**
 * Servlet implementation class NewOpportunityCreateValidationAndUpdate
 */
@WebServlet("/FinanceDetailsValidation")
public class FinanceDetailsValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceDetailsValidation() {
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
		String AppName =request.getParameter("AppName");
		System.out.println("Application Name in the Servlet"+AppName);
        String JsonString= (String)request.getParameter("JsonString");
        System.out.println("Connected to validation Servlet");
        boolean checkMandatory =Boolean.parseBoolean(request.getParameter("checkMandatory"));
        JsonParser parser = new JsonParser();
		JsonElement tradeElement = parser.parse(JsonString);
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		System.out.println("The values of the form"+jsonArray);
		JsonObject jsonObject = FinanceDetailRetrieveService.InputDetailsValidation(AppName,jsonArray,checkMandatory);
		String json = new Gson().toJson(jsonObject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

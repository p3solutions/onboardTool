package IntakeDetails.IntakeTriageSummary.servlet;

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
import com.google.gson.JsonParser;

import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;
import logger.System;

/**
 * Servlet implementation class IntakeTriageSummarySaveFeature
 */
@WebServlet("/IntakeTriageSummarySaveFeature")
public class IntakeTriageSummarySaveFeature extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeTriageSummarySaveFeature() {
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
        String JsonString= (String)request.getParameter("JsonString");
        JsonParser parser = new JsonParser();
		JsonElement tradeElement = parser.parse(JsonString);
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		new IntakeTriageSummaryService().Save(jsonArray, id);
		String json = new Gson().toJson("");
		
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8"); response.getWriter().write(json);
	}

}

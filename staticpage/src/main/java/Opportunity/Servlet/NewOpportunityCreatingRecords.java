package Opportunity.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import Opportunity.Service.NewOpportunityService;

/**
 * Servlet implementation class NewOpportunityCreatingRecords
 */
@WebServlet("/NewOpportunityCreatingRecords")
public class NewOpportunityCreatingRecords extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewOpportunityCreatingRecords() {
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
		// TODO Auto-generated method stub
		//JsonObject jsonObj = NewOpportunityService.RandomIdGenerator();
		 //String json = new Gson().toJson(jsonObj);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	       // response.getWriter().write(json);
		
	}

}

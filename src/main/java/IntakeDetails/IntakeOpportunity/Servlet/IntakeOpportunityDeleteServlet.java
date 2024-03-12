package IntakeDetails.IntakeOpportunity.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import IntakeDetails.IntakeOpportunity.Service.IntakeOpportunityService;
import Opportunity.Service.NewOpportunityService;
import logger.System;

/**
 * Servlet implementation class IntakeOpportunityDeleteServlet
 */
@WebServlet("/IntakeOpportunityDeleteServlet")
public class IntakeOpportunityDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeOpportunityDeleteServlet() {
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
		int seq_num = Integer.parseInt(request.getParameter("seq_num"))+1;
		System.out.println("SEQ NUM : "+seq_num);
		jsonobj.addProperty("index",seq_num-1);
		IntakeOpportunityService.IntakeOpportunityDeleteService(seq_num, Id);
		String json = new Gson().toJson(jsonobj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

package Opportunity.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import Opportunity.Service.NewOpportunityService;
import logger.System;

/**
 * Servlet implementation class NewOpportunityAddTemplateFields
 */
@WebServlet("/NewOpportunityAddTemplateFields")
public class NewOpportunityAddTemplateFields extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewOpportunityAddTemplateFields() {
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
		String selected_index[] = request.getParameter("Selected_Index").split(",");
		String tempmandatory=request.getParameter("templateMandatory");
		String umandatory=request.getParameter("umandatory");
		int[] Sel_seq = new int[selected_index.length];
		
		for(int i = 0; i< selected_index.length; i++)
		{
			Sel_seq[i] = Integer.parseInt(selected_index[i]);
		}
		JsonArray jsonArray = NewOpportunityService.AddTemplateFields1(Sel_seq,tempmandatory,umandatory);
		
		 String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

}

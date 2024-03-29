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
 * Servlet implementation class NewOpportunityDeleteOperation
 */
@WebServlet("/NewOpportunityDeleteOperation")
public class NewOpportunityDeleteOperation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewOpportunityDeleteOperation() {
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
		//doGet(request, response);
		JsonObject jsonobj = new JsonObject();
		int seq_num = Integer.parseInt(request.getParameter("seq_num"))+1;
		jsonobj.addProperty("index",seq_num-1);
		NewOpportunityService.NewOportunityDeleteOperationService(seq_num);
		String json = new Gson().toJson(jsonobj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

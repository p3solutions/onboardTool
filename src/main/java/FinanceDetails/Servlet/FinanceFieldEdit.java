package FinanceDetails.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import FinanceDetails.Service.FinanceDetailsValidateAndSave;
import FinanceDetails.Service.FinanceInputLabelEdit;
import Opportunity.Service.NewOpportunityService;
/**
 * Servlet implementation class FinanceTableDetails
 */
@WebServlet("/FinanceFieldEdit")
public class FinanceFieldEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceFieldEdit() {
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
		String label_name = request.getParameter("label");
		int sequencenumber = Integer.parseInt(request.getParameter("seq_num"))+1;
		JsonObject jsonObj =FinanceInputLabelEdit.FinanceLabelEdit(label_name, sequencenumber);
		 String json = new Gson().toJson(jsonObj);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

}

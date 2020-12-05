package IntakeDetails.IntakeApproval.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import IntakeDetails.IntakeApproval.service.IntakeApprovalService;
import IntakeDetails.IntakeTriage.Service.IntakeTriageService;
import onboard.DBconnection;

/**
 * Servlet implementation class IntakeApprovalSaveServlet
 */
@WebServlet("/IntakeApprovalSaveServlet")
public class IntakeApprovalSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeApprovalSaveServlet() {
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
		int seq_no = Integer.parseInt(request.getParameter("seq_no"));
		HttpSession details = request.getSession();
		String OppId =(String)details.getAttribute("ID");
		String IntakeApproval = request.getParameter("IntakeApproval");
		boolean check = false;
		try {
			IntakeApprovalService intake = new IntakeApprovalService(OppId);		
		check = intake.IntakeApprovalUpdate(IntakeApproval, seq_no);
		intake.IntakeApprovalModuleInfo();
		intake=null;
		System.gc();
				} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			JsonObject jsonObj = new JsonObject();
			jsonObj.addProperty("checkStatus",check);
			String json = new Gson().toJson(jsonObj);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8"); 
			response.getWriter().write(json);
	}

}
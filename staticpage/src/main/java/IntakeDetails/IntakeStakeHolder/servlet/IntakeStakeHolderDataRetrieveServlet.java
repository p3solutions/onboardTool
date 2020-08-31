package IntakeDetails.IntakeStakeHolder.servlet;

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

import IntakeDetails.IntakeAssessment.service.IntakeAssessmentService;
import IntakeDetails.IntakeStakeHolder.service.IntakeStakeHolderService;

/**
 * Servlet implementation class IntakeStakeHolderDataRetrieveServlet
 */
@WebServlet("/IntakeStakeHolderDataRetrieveServlet")
public class IntakeStakeHolderDataRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeStakeHolderDataRetrieveServlet() {
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
        String Id=(String)details.getAttribute("ID");
        String UserName = (String)details.getAttribute("username");
       System.out.println("Opportunity Id "+Id);
		JsonArray jsonArray = null;
		try {
			IntakeStakeHolderService intakeStake =  new IntakeStakeHolderService();
			jsonArray = intakeStake.IntakeStakeHolderDataRetrieve(Id,UserName);
			intakeStake =null;
			//calling finalize method and garabage collector
			System.gc();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("JSON ARRAY"+jsonArray);
		 String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}
}

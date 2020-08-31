package IntakeDetails.IntakeAssessment.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import IntakeDetails.IntakeAssessment.service.IntakeAssessmentEditDeleteFeatureService;
import IntakeDetails.IntakeTriage.Service.IntakeTriageService;

/**
 * Servlet implementation class IntakeAssessmentEditFeature
 */
@WebServlet("/IntakeAssessmentEditFeature")
public class IntakeAssessmentEditFeature extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeAssessmentEditFeature() {
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
		String label_name = request.getParameter("label");
		String EditSection = request.getParameter("EditSection");
		int sequencenumber = Integer.parseInt(request.getParameter("seq_num"))+1;
		JsonObject jsonObj = new JsonObject();
		try {
			jsonObj = new IntakeAssessmentEditDeleteFeatureService(Id, EditSection, sequencenumber).EditField(label_name);
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		 String json = new Gson().toJson(jsonObj);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

}

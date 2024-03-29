package IntakeDetails.IntakeAssessment.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import IntakeDetails.IntakeAssessment.service.IntakeAssessmentScrRetrieve;

/**
 * Servlet implementation class IntakeAssessmentScrRetrieveServlet
 */
@WebServlet("/IntakeAssessmentScrRetrieveServlet")
public class IntakeAssessmentScrRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeAssessmentScrRetrieveServlet() {
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
	    JsonArray jsonArray = null;
	    IntakeAssessmentScrRetrieve intake_scr_retrive=new IntakeAssessmentScrRetrieve();
	    jsonArray=intake_scr_retrive.intake_screenshot_retrieve(Id);
        intake_scr_retrive =null;
        //calling finalize method and garabage collector
        System.gc();
        System.out.println("INTAKE JSON ARRAY"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

package IntakeDetails.IntakeAssessment.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import IntakeDetails.IntakeAssessment.service.IntakeAssessmentService;
import IntakeDetails.IntakeTriage.Service.IntakeTriageService;
import onboard.DBconnection;

/**
 * Servlet implementation class IntakeAssessmentAddFeatureServlet
 */
@WebServlet("/IntakeAssessmentAddFeatureServlet")
public class IntakeAssessmentAddFeatureServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeAssessmentAddFeatureServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String ID = (String) details.getAttribute("ID");
		JsonObject jsonObject = new JsonObject();
        
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String label_name = request.getParameter("LabelName");
            //String column_name = request.getParameter("ColumnName");
            String mandatory = request.getParameter("Mandatory");
            String type = request.getParameter("Type");
            String option=request.getParameter("Options");
            String Section = request.getParameter("Section");
            /*String Field_Name=request.getParameter("FieldName");*/
            int NumberofInputfields=Integer.parseInt(request.getParameter("Number"));
         jsonObject = new IntakeAssessmentService().AddFeature(ID, label_name, mandatory, type, NumberofInputfields, option, Section);            
        }
        catch(Exception e)
        {
        	e.printStackTrace();
            System.out.println("Exception----------[info]-----"+e);
        }
        String json = new Gson().toJson(jsonObject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

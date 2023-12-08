package compliance.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import compliance.service.*;

/**
 * Servlet implementation class ReportExportservlet
 */
@WebServlet("/ReportExportServlet")
public class ReportExportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportExportServlet() {
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
		String ReportName = request.getParameter("reportname");
		System.out.println("ReportName :"+ReportName);
		JsonArray jsonArray = null;
		ReportExportService  exportreportgenerationService = new ReportExportService ();
	     
	     switch (ReportName) {
		 case "IntakeReport1":
			 jsonArray = exportreportgenerationService.fetchExportDataForIntakeReport1(ReportName);
		     break;

		 case "IntakeReport2":
			 jsonArray = exportreportgenerationService.fetchExportDataForIntakeReport2(ReportName);
		     break;

		 case "IntakeReport3":
			 jsonArray = exportreportgenerationService.fetchExportDataForIntakeReport3(ReportName);
		     break;

		 default:
		     throw new IllegalArgumentException("Invalid report name: " + ReportName);
       }
	     System.out.println("ReportGeneration Servlet : "+jsonArray);
	     String json = new Gson().toJson(jsonArray);
	     response.setContentType("application/json");
	     response.setCharacterEncoding("UTF-8");
	     response.getWriter().write(json);
	}

}

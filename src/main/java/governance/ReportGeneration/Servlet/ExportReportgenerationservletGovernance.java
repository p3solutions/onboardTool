package governance.ReportGeneration.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import governance.ReportGeneration.Service.ExportreportgenerationService;

/**
 * Servlet implementation class ExportReportgenerationservletGovernance
 */
public class ExportReportgenerationservletGovernance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExportReportgenerationservletGovernance() {
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
		ExportreportgenerationService exportreportgenerationService = new ExportreportgenerationService();
	     
	     switch (ReportName.toLowerCase()) {
		 case "intake_report_1":
			 jsonArray = exportreportgenerationService.fetchExportDataForIntakeReport1(ReportName);
		     break;

		 case "intake_report_2":
			 jsonArray = exportreportgenerationService.fetchExportDataForIntakeReport2(ReportName);
		     break;

		 case "intake_report_3":
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

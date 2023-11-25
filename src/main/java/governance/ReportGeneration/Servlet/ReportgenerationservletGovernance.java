package governance.ReportGeneration.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import governance.ReportGeneration.Service.GovernanceReportGenerationService;


@WebServlet("/ReportgenerationservletGovernance")
public class ReportgenerationservletGovernance extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportgenerationservletGovernance() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ReportName = request.getParameter("category");
		System.out.println("ReportName  : "+ReportName);
	     String page = request.getParameter("page");
	     System.out.println("Page : "+page);
	     String maxRows = request.getParameter("maxRows");
	     System.out.println("maxRows : "+maxRows);

	     JsonObject jsonObj = null;
	     GovernanceReportGenerationService governanceReportGenerationService = new GovernanceReportGenerationService();
	     
	     try {
	    	 switch (ReportName.toLowerCase()) {
             case "intake_report_1":
            	 jsonObj = governanceReportGenerationService.fetchDataForIntakeReport1(page, maxRows);
                 break;

             case "intake_report_2":
            	 jsonObj = governanceReportGenerationService.fetchDataForIntakeReport2(page, maxRows);
                 break;

             case "intake_report_3":
            	 jsonObj = governanceReportGenerationService.fetchDataForIntakeReport3(page, maxRows);
                 break;

             default:
                 throw new IllegalArgumentException("Invalid report name: " + ReportName);
         }
	        
	     } catch (SQLException e) {
	         // Handle the exception more gracefully, e.g., log it or send an error response
	         e.printStackTrace();
	     }
	     System.out.println("ReportGeneration Servlet : "+jsonObj);
	     String json = new Gson().toJson(jsonObj);
	     response.setContentType("application/json");
	     response.setCharacterEncoding("UTF-8");
	     response.getWriter().write(json);
	}

}




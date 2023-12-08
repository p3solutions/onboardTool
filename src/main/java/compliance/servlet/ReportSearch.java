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


@WebServlet("/ReportSearch")

/**
 * Servlet implementation class ReportSearchservlet
 */
public class ReportSearch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportSearch() {
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
		String ReportName = request.getParameter("category");
		System.out.println("ReportName 123 : "+ReportName);
		String page = request.getParameter("page");
//		String page="1";
	     System.out.println("Page 123: "+page);
	    String maxRows =request.getParameter("maxRows");
	     //String maxRows = "50";
	     System.out.println("maxRows 123 : "+maxRows);
	     String ColumnName = request.getParameter("columnName");
	     System.out.println("ColumnName : "+ColumnName);
	     String SearchValue = request.getParameter("searchValue");
	     System.out.println("SearchValue : "+SearchValue);
	     
	    
	     JsonObject jsonObj = null;
	     ReportSearchService reportGenerationSearchService = new ReportSearchService();
		
		 try {
			 jsonObj = reportGenerationSearchService.reportcolumnname(ReportName);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 if((ColumnName != "") && (SearchValue != null)) {
		    	System.out.println("Checkinggg-------------------------------===========");
		    try {
		    	 switch (ReportName) {
	             case "IntakeReport1":
	            	 jsonObj = reportGenerationSearchService.fetchDataForIntakeReport1(page, maxRows,SearchValue,ColumnName);
	                 break;

	             case "IntakeReport2":
	            	 jsonObj = reportGenerationSearchService.fetchDataForIntakeReport2(page, maxRows,SearchValue,ColumnName);
	                 break;

	             case "IntakeReport3":
	            	 jsonObj = reportGenerationSearchService.fetchDataForIntakeReport3(page, maxRows,SearchValue,ColumnName);
	                 break;

	             default:
	                 throw new IllegalArgumentException("Invalid report name: " + ReportName);
	         }
		        
		     } catch (SQLException e) {
		         // Handle the exception more gracefully, e.g., log it or send an error response
		         e.printStackTrace();
		     }
		    }
	     System.out.println("ReportGeneration Servlet : "+jsonObj);
	     String json = new Gson().toJson(jsonObj);
	     response.setContentType("application/json");
	     response.setCharacterEncoding("UTF-8");
	     response.getWriter().write(json);
	}

}

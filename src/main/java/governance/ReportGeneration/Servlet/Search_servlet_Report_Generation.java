package governance.ReportGeneration.Servlet;

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

import governance.ReportGeneration.Service.ReportGenerationSearchService;


@WebServlet("/Search_servlet_Report_Generation")

/**
 * Servlet implementation class ReportgenerationSearchservletGovernance
 */
public class Search_servlet_Report_Generation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Search_servlet_Report_Generation() {
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
	     System.out.println("Page 123: "+page);
	    String maxRows =request.getParameter("maxRows");
	     System.out.println("maxRows 123 : "+maxRows);
	     String ColumnName = request.getParameter("columnName");
	     System.out.println("ColumnName : "+ColumnName);
	     String SearchValue = request.getParameter("searchValue");
	     System.out.println("SearchValue : "+SearchValue);
	     
	    
	     JsonObject jsonArray = null;
		ReportGenerationSearchService reportGenerationSearchService = new ReportGenerationSearchService();
		
		 jsonArray = reportGenerationSearchService.reportcolumnname(ReportName);
		 if((ColumnName != "") && (SearchValue != null) && (ReportName !="" )) {
		    	System.out.println("Checkinggg-------------------------------===========");
		    jsonArray = reportGenerationSearchService.searchdata(ReportName,page,maxRows,ColumnName,SearchValue);
		    }
	     System.out.println("ReportGeneration Servlet : "+jsonArray);
	     String json = new Gson().toJson(jsonArray);
	     response.setContentType("application/json");
	     response.setCharacterEncoding("UTF-8");
	     response.getWriter().write(json);
	}

}

package FinanceDetails.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import com.google.gson.JsonObject;

import FinanceDetails.Service.*;


@WebServlet("/TableDetailsSearchServlet")

/**
 * Servlet implementation class TableDetailsSearchServlet
 */
public class TableDetailsSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableDetailsSearchServlet() {
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
		
		String page = request.getParameter("page");

	     System.out.println("Page 123: "+page);
	    String maxRows =request.getParameter("maxRows");
	    
	     System.out.println("maxRows 123 : "+maxRows);
	     String ColumnName = request.getParameter("columnName");
	     System.out.println("ColumnName : "+ColumnName);
	     String SearchValue = request.getParameter("searchValue");
	     System.out.println("SearchValue : "+SearchValue);
	     
	     String Operator = request.getParameter(" Operator");
	     System.out.println(" Operator : "+ Operator);
	     JsonObject jsonObj = null;
		TableDetailsSearchService SearchDetails = new TableDetailsSearchService();
		
		 try {
			 jsonObj = SearchDetails.columnname();
			 
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 if((ColumnName != "") && (SearchValue != null)) {
		    	System.out.println("Checkinggg-------------------------------===========");
		    try {
		    	
	             
	            	 jsonObj = TableDetailsSearchService.fetchData(page, maxRows,SearchValue,ColumnName);
	             

		    }
		        
		     catch (SQLException e) {
		         // Handle the exception more gracefully, e.g., log it or send an error response
		         e.printStackTrace();
		     
		    }}
	     System.out.println("ReportGeneration Servlet : "+jsonObj);
	     String json = new Gson().toJson(jsonObj);
	     response.setContentType("application/json");
	     response.setCharacterEncoding("UTF-8");
	     response.getWriter().write(json);
	
	}
}
package FinanceDetails.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import FinanceDetails.Service.TableDetailEditService;

/**
 * Servlet implementation class TableDetailEditServlet
 */

@WebServlet("/TableDetailEditServlet")
public class TableDetailEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableDetailEditServlet() {
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
       String id=request.getParameter("Id");
		
        
       System.out.println("Finance App Id "+id);
		JsonArray jsonArray = TableDetailEditService.FinanceTableEdit(id);
		System.out.println("JSON ARRAY from Update"+jsonArray);
		 String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
		
	}

}

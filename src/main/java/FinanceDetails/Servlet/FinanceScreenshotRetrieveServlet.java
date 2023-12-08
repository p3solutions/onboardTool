package FinanceDetails.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import FinanceDetails.Service.FinanceScreenShotService;


/**
 * Servlet implementation class Retrive_screenshot_finance_module
 */
@WebServlet("/FinanceScreenshotRetrieveServlet")
public class FinanceScreenshotRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceScreenshotRetrieveServlet() {
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
		//HttpSession details = request.getSession();
	    String Id=request.getParameter("Id");
	    JsonArray jsonArray = null;
	   FinanceScreenShotService scr_retrive=new FinanceScreenShotService();
	    jsonArray=scr_retrive.finance_screenshot_retrieve(Id);
        scr_retrive =null;
        System.gc();
        System.out.println("FINANCE SCREENSHOT JSON ARRAY"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);	
		
	}

}

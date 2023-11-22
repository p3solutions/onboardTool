package finance_module_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import finance_module_service.Retrieve_FinanceList_service;

/**
 * Servlet implementation class Retrieve_Finance_List_Servlet
 */
@WebServlet("/Retrieve_Finance_list_Servlet")
public class Retrieve_Finance_List_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Retrieve_Finance_List_Servlet() {
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
		// TODO Auto-generated method stub
		int page = Integer.parseInt(request.getParameter("page"));
        int maxRows = Integer.parseInt(request.getParameter("maxRows"));

        JsonObject result = null;
        Retrieve_FinanceList_service retrieve_financeList_service = new Retrieve_FinanceList_service();
        result = retrieve_financeList_service.retrieveDataWithCount(page, maxRows);
        retrieve_financeList_service = null;

        System.gc();
        String json = new Gson().toJson(result);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

	}



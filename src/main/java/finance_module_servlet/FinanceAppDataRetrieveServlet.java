package finance_module_servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import finance_module_service.FinanceAppDataRetrieveService;

/**
 * Servlet implementation class FinanceAppDataRetrieveServlet
 */
@WebServlet("/FinanceAppDataRetrieve")
public class FinanceAppDataRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceAppDataRetrieveServlet() {
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
		HttpSession details = request.getSession();
        String Id=(String)details.getAttribute("Id");
        String oppName=(String)details.getAttribute("SelectedOpportunity");
        
        JsonArray jsonArray = null;
        FinanceAppDataRetrieveService Appinfo;
		try {
			Appinfo = new FinanceAppDataRetrieveService(Id,oppName);
			jsonArray = Appinfo.FinanceTemplateToFinanceInfo();
			Appinfo =null;
			//calling finalize method and garbage collector
			System.gc();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.out.println("JSON ARRAY"+jsonArray);
			String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

	}



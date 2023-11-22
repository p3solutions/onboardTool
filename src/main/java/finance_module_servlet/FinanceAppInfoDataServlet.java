package finance_module_servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import finance_module_service.FinanceAppInfoService;



/**
 * Servlet implementation class FinanceAppInfoDataServlet
 */
@WebServlet("/FinanceAppInfoDataServlet")
public class FinanceAppInfoDataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceAppInfoDataServlet() {
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
        String app_name=(String)details.getAttribute("app_name");
        String Opportunityname=(String)details.getAttribute("SelectedOpportunity");
        
        System.out.println("Legacy Application Name : "+Opportunityname);
        JsonArray jsonArray = null;
		FinanceAppInfoService Appinfo =  new FinanceAppInfoService();
		jsonArray = Appinfo.FinanceAppInfoDataRetrieveService(app_name);
		Appinfo =null;
		//calling finalize method and garbage collector
		System.gc();
		System.out.println("JSON ARRAY"+jsonArray);
			String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}
	}



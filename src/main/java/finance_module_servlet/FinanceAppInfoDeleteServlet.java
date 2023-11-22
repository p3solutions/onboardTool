package finance_module_servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import NewArchiveRequirements.LegacyApplicationInfo.Service.archiveLegacyAppInfoDeleteService;
import finance_module_service.FinanceAppInfoDeleteService;

/**
 * Servlet implementation class FinanceAppInfoDeleteServlet
 */
public class FinanceAppInfoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceAppInfoDeleteServlet() {
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
		JsonObject jsonobj = new JsonObject();
		HttpSession details = request.getSession();
        String appName=(String)details.getAttribute("app_name");
       System.out.println("Application Name:"+appName);
		int seq_num = Integer.parseInt(request.getParameter("seq_num"))+1;
		
		try {
		     FinanceAppInfoDeleteService FinanceAppInfo = new FinanceAppInfoDeleteService(appName, seq_num);
			jsonobj = FinanceAppInfo.Delete();
		    jsonobj.addProperty("index",seq_num-1);
		    FinanceAppInfo =null;
		    System.gc();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String json = new Gson().toJson(jsonobj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

	}



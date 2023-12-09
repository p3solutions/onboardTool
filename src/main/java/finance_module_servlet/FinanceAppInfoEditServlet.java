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

import NewArchiveRequirements.LegacyApplicationInfo.Service.archiveLegacyAppInfoEditService;
import finance_module_service.FinanceAppInfoEditService;

/**
 * Servlet implementation class FinanceAppInfoEditServlet
 */
public class FinanceAppInfoEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceAppInfoEditServlet() {
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
        String appName=(String)details.getAttribute("app_name");
      
		String label_name = request.getParameter("label_name");
		int seqnum = Integer.parseInt(request.getParameter("seq_no"))+1;
		JsonObject jsonObj = new JsonObject();
		try {
			
			FinanceAppInfoEditService FinanceAppInfo = new FinanceAppInfoEditService(appName, seqnum, label_name);
		    boolean checkDuplicate = FinanceAppInfo.checkDuplicateLabelName();
		    boolean statusFlag =false;
		    jsonObj.addProperty("checkDuplicate",checkDuplicate);
		    if(checkDuplicate)
		    {
		    jsonObj.addProperty("previous_label_name",FinanceAppInfo.getPreviousLabelName());
			statusFlag = FinanceAppInfo.Edit();
			
		    }
			jsonObj.addProperty("checkEditStatus",statusFlag);
			jsonObj.addProperty("seq_no",seqnum);
		    jsonObj.addProperty("label_name",label_name);
		    FinanceAppInfo = null;
		    System.gc();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
		String json = new Gson().toJson(jsonObj);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

	}



package NewArchiveRequirements.LegacyApplicationInfo.Servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import NewArchiveRequirements.LegacyApplicationInfo.Service.archiveLegacyAppInfoEditService;
import logger.System;

/**
 * Servlet implementation class archiveLegacyAppInfoEditServlet
 */
@WebServlet("/archiveLegacyAppInfoEditServlet")
public class archiveLegacyAppInfoEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public archiveLegacyAppInfoEditServlet() {
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
        String Id=(String)details.getAttribute("ID");
       System.out.println("Opportunity Id "+Id);
		String label_name = request.getParameter("label");
		int sequencenumber = Integer.parseInt(request.getParameter("seq_num"))+1;
		JsonObject jsonObj = new JsonObject();
		try {
			
			archiveLegacyAppInfoEditService LegacyAppInfo = new archiveLegacyAppInfoEditService(Id, sequencenumber, label_name);
		    boolean checkDuplicate = LegacyAppInfo.checkDuplicateLabelName();
		    boolean statusFlag =false;
		    jsonObj.addProperty("checkDuplicate",checkDuplicate);
		    if(checkDuplicate)
		    {
		    jsonObj.addProperty("previous_label_name",LegacyAppInfo.getPreviousLabelName());
			statusFlag = LegacyAppInfo.Edit();
			
		    }
			jsonObj.addProperty("checkEditStatus",statusFlag);
			jsonObj.addProperty("seq_no",sequencenumber);
		    jsonObj.addProperty("label_name",label_name);
		    LegacyAppInfo = null;
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

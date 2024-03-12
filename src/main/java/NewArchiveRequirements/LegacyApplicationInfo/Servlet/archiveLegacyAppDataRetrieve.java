package NewArchiveRequirements.LegacyApplicationInfo.Servlet;

import NewArchiveRequirements.LegacyApplicationInfo.Service.archiveReqLegacyDataRetrieveService;
import com.google.gson.Gson;
import com.google.gson.JsonArray;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import logger.System;

/**
 * Servlet implementation class archiveLegacyAppDataRetrieve
 */
@WebServlet("/archiveLegacyAppDataRetrieve")
public class archiveLegacyAppDataRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public archiveLegacyAppDataRetrieve() {
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
        String Id=(String)details.getAttribute("ID");//D3SBB577JAWES
        String oppName=(String)details.getAttribute("SelectedOpportunity"); // intelliji
        JsonArray jsonArray = null;
        archiveReqLegacyDataRetrieveService Appinfo;
		try {
			Appinfo = new archiveReqLegacyDataRetrieveService(Id, oppName);
			jsonArray = Appinfo.archiveReqLegacyTemplateToArchiveReqLegacyInfo();
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

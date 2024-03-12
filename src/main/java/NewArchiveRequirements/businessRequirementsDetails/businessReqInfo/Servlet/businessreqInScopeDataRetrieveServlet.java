package NewArchiveRequirements.businessRequirementsDetails.businessReqInfo.Servlet;

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
import com.google.gson.JsonObject;

import NewArchiveRequirements.businessRequirementsDetails.businessReqInfo.Service.businessReqInScopeService;
import logger.System;



/**
 * Servlet implementation class archiveReqIntroRolesResTemplateServlet
 */
 @WebServlet("/businessreqInScopeDataRetrieveServlet")
public class businessreqInScopeDataRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public businessreqInScopeDataRetrieveServlet() {
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
        String oppName =(String)details.getAttribute("SelectedOpportunity");
        JsonArray jsonArray = null;
        businessReqInScopeService businesssreqscope;
 		try {
 			businesssreqscope = new businessReqInScopeService(Id,oppName);
 			jsonArray = businesssreqscope.BusinessRequirementsDataRetrieve();
 			businesssreqscope = null;
 			System.gc();
 		} catch (ClassNotFoundException | SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
        
    	 String json = new Gson().toJson(jsonArray);
         response.setContentType("application/json");
         response.setCharacterEncoding("UTF-8");
         response.getWriter().write(json);
      
	

	}

}

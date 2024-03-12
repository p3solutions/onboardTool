package NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Servlet;

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

import NewArchiveRequirements.Introduction.service.ApproverRolesAddService;
import NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service.archiveFunctionalReqAddService;
import logger.System;

/**
 * Servlet implementation class archiveFunctionalDataReqAddServlet
 */
@WebServlet("/archiveFunctionalDataReqAddServlet")
public class archiveFunctionalDataReqAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public archiveFunctionalDataReqAddServlet() {
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
		String ID = (String) details.getAttribute("ID");
		String oppName =(String)details.getAttribute("SelectedOpportunity");
		int seqNum = Integer.parseInt(request.getParameter("seqNum")); 
		String tableName = request.getParameter("tableName");
		JsonObject jsonObject = new JsonObject();
        
			archiveFunctionalReqAddService addService;
    		try {
	        	addService = new archiveFunctionalReqAddService(seqNum, ID, oppName,tableName);
	        	jsonObject = addService.AddRow();
	        	
	        	addService = null;
	        	System.gc();

    		} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
    	
        String json = new Gson().toJson(jsonObject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

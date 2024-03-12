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

import NewArchiveRequirements.businessRequirementsDetails.functionalReqInfo.dataReq.Service.archiveFunctionDataRetrieveService;
import logger.System;

/**
 * Servlet implementation class archiveDataReqDataRetrieve
 */
@WebServlet("/archiveDataReqDataRetrieve")
public class archiveDataReqDataRetrieve extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public archiveDataReqDataRetrieve() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession details = request.getSession();
		String Id = (String) details.getAttribute("ID");
		String oppName = (String) details.getAttribute("SelectedOpportunity");

		JsonArray jsonArray = new JsonArray();

		String[] tableNamesFunctionReq = { "Archive_DataReq_Info", "Archive_RetentionLegalReq_Info",
				"Archive_SecurityReq_Info", "Archive_UsabilityReq_Info", "Archive_AuditReq_Info" };
		for (int index = 0; index < tableNamesFunctionReq.length; index++) {
			archiveFunctionDataRetrieveService dataReqDetails;
			try {
				dataReqDetails = new archiveFunctionDataRetrieveService(Id, oppName, tableNamesFunctionReq[index]);
				jsonArray.add(dataReqDetails.archiveFunctionDataRetrieve());
				dataReqDetails = null;
				System.gc();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// calling finalize method and garbage collector

		System.out.println("JSON ARRAY" + jsonArray);
		String json = new Gson().toJson(jsonArray);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);

	}

}

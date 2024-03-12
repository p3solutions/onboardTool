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
import com.google.gson.JsonObject;

import NewArchiveRequirements.businessRequirementsDetails.businessReqInfo.Service.businessReqDataRetrieveService;
import logger.System;


/**
 * Servlet implementation class archiveReqIntroDataRetrieveServlet
 */
 @WebServlet("/businessReqDataRetrieveServlet")
public class businessReqDataRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public businessReqDataRetrieveServlet() {
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
       JsonObject JsonObj = null;
       businessReqDataRetrieveService archivebusReq;
		try {
			archivebusReq = new businessReqDataRetrieveService(Id);
			JsonObj = archivebusReq.archiveReqDataRetrieve();
			archivebusReq = null;
			System.gc();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       
   		System.out.println(" Archive Business Requirements JSON ARRAY"+JsonObj);
   		String json = new Gson().toJson(JsonObj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

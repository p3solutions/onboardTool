package NewArchiveRequirements.Introduction.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import NewArchiveRequirements.Introduction.service.ApproverRolesAddService;
import NewArchiveRequirements.Introduction.service.ApproverRolesDeleteService;
import logger.System;

/**
 * Servlet implementation class archiveReqRolesResponseDeleteServlet
 */
 @WebServlet("/archiveReqRolesResponseDeleteServlet")
public class archiveReqRolesResponseDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public archiveReqRolesResponseDeleteServlet() {
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
		JsonObject jsonobject = new JsonObject();
        
        try {
        	ApproverRolesDeleteService deleteService = new ApproverRolesDeleteService(seqNum, ID);
        	jsonobject = deleteService.DeleteRow();
        	deleteService = null;
        	System.gc();

        }
        catch(Exception e)
        {
            System.out.println("Exception----------[info]-----"+e);
        }
        String json = new Gson().toJson(jsonobject);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

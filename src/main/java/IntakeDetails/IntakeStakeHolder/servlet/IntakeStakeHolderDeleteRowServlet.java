package IntakeDetails.IntakeStakeHolder.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import IntakeDetails.IntakeStakeHolder.service.IntakeStakeHolderService;
import logger.System;

/**
 * Servlet implementation class IntakeStakeHolderDeleteRowServlet
 */
@WebServlet("/IntakeStakeHolderDeleteRowServlet")
public class IntakeStakeHolderDeleteRowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeStakeHolderDeleteRowServlet() {
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
        int SeqNum =  Integer.parseInt((String)request.getParameter("DeleteSeqNum"))+1;
       System.out.println("Opportunity Id "+Id);
		JsonObject jsonObj = new JsonObject();
		boolean check = false;
		try
		{	
			IntakeStakeHolderService intakeStake = new IntakeStakeHolderService();
			
			intakeStake.delete(SeqNum,Id);
			
			intakeStake = null;
			
			//calling finalize method
			System.gc();
		 
			check = true;
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		jsonObj.addProperty("checkExistence",check);
		String json = new Gson().toJson(jsonObj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

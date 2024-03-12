package IntakeDetails.IntakeTriage.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import IntakeDetails.IntakeTriage.Service.IntakeTriageService;
import logger.System;


	/**
	 * Servlet implementation class IntakeDetailsTriageAddTemplateFields
	 */
	@WebServlet("/IntakeDetailsTriageAddTemplateFields")
	public class IntakeDetailsTriageAddTemplateFields extends HttpServlet {
		private static final long serialVersionUID = 1L;
	       
	    /**
	     * @see HttpServlet#HttpServlet()
	     */
	    public IntakeDetailsTriageAddTemplateFields() {
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
			String id = (String)details.getAttribute("ID");
			String selected_index[] = request.getParameter("Selected_Index").split(",");
			String templateMandatory = request.getParameter("Mandatory");
			String umandatory = request.getParameter("umandatory");
			int[] Sel_seq = new int[selected_index.length];
			for(int i = 0; i<selected_index.length; i++)
			{
				Sel_seq[i] = Integer.parseInt(selected_index[i]);
			}
			JsonArray jsonArray = new IntakeTriageService().AddTemplateFields(Sel_seq, id,templateMandatory,umandatory);
			
			 String json = new Gson().toJson(jsonArray);
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write(json);

		}

	}




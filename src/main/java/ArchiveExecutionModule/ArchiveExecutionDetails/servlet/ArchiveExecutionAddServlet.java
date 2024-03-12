package ArchiveExecutionModule.ArchiveExecutionDetails.servlet;

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

import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionAddService;
import logger.System;

/**
 * Servlet implementation class ArchiveExecutionAddServlet
 */
@WebServlet("/ArchiveExecutionAddServlet")
public class ArchiveExecutionAddServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArchiveExecutionAddServlet() {
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
        int seqNum = Integer.parseInt((String)request.getParameter("seqNum"));
        String taskName = (String)request.getParameter("TaskName");
        String taskGroup = (String)request.getParameter("TaskGroup");
        String typeRow = (String)request.getParameter("Type");
        String planStDt = (String)request.getParameter("PlanStartDate");
        JsonArray jsonArray = new JsonArray();
		/*
		 * JsonObject jsonObject = new JsonObject(); jsonObject.addProperty("Opp_Id",
		 * Id); jsonObject.addProperty("appName", oppName); jsonArray.add(jsonObject);
		 */
        try {
        	ArchiveExecutionAddService archiveExecAdd = new ArchiveExecutionAddService(Id,oppName,seqNum,taskGroup,taskName,typeRow,planStDt);
        	jsonArray = archiveExecAdd.archiveExecutionAdd();
        	System.gc();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        System.out.println("JSON ARRAY"+jsonArray);
		 String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

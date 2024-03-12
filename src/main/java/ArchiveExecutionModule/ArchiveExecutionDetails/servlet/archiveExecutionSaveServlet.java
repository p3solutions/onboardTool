package ArchiveExecutionModule.ArchiveExecutionDetails.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionSaveService;
import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;
import logger.System;

/**
 * Servlet implementation class archiveExecutionSaveServlet
 */
@WebServlet("/archiveExecutionSaveServlet")
public class archiveExecutionSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public archiveExecutionSaveServlet() {
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
        String columnName = (String)request.getParameter("colName");
        String value = (String)request.getParameter("Value");
        int seq_num = Integer.parseInt(request.getParameter("seqNum"));
        JsonObject jsonObj= null;
        try
        {
        	System.out.println("Save function"+seq_num+" "+value+" "+columnName );
        	ArchiveExecutionSaveService archive = new ArchiveExecutionSaveService(id, seq_num, columnName, value);
        	jsonObj = archive.ArchiveExecutionSave();
        	archive=null;
        	System.gc();
        }
        catch(Exception e)
        {
        	e.printStackTrace();
        }
		String json = new Gson().toJson(jsonObj);
		
		  response.setContentType("application/json");
		  response.setCharacterEncoding("UTF-8"); response.getWriter().write(json);
	}

}

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

import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionDeleteService;
import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionDetailService;
import logger.System;

@WebServlet("/ArchiveExecutionDeleteServlet")
public class ArchiveExecutionDeleteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
        String Id=(String)details.getAttribute("ID");
        String oppName =(String)details.getAttribute("SelectedOpportunity");
        int seqNum = Integer.parseInt((String)request.getParameter("seqNum"));
        JsonArray jsonArray = new JsonArray();
        try {
			ArchiveExecutionDeleteService archiveExecution =  new ArchiveExecutionDeleteService(Id,oppName,seqNum);
			jsonArray = archiveExecution.archiveExecutionDeleteService();
			archiveExecution =null;
			//calling finalize method and garabage collector
			System.gc();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        
        System.out.println("JSON Object"+jsonArray);
		 String json = new Gson().toJson(jsonArray);
      response.setContentType("application/json");
      response.setCharacterEncoding("UTF-8");
      response.getWriter().write(json);
	}

}

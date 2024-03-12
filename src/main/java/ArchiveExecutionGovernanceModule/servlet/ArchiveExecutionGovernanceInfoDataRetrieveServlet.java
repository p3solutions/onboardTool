package ArchiveExecutionGovernanceModule.servlet;

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

import ArchiveExecutionGovernanceModule.service.ArchiveExecutionGovernanceDetailService;
import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionDetailService;
import logger.System;
@WebServlet("/ArchiveExecutionGovernanceInfoDataRetrieveServlet")
public class ArchiveExecutionGovernanceInfoDataRetrieveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession details = request.getSession();
        
		/* String waveId=(String)details.getAttribute("selectedWaveId"); */
        
		/* String waveName =(String)details.getAttribute("selectedWaveName"); */
		String waveName=request.getParameter("wave");
		System.out.println("wave Name "+waveName);
		
		JsonArray jsonArray = null;
		
		try {
			ArchiveExecutionGovernanceDetailService archiveExecution =  new ArchiveExecutionGovernanceDetailService();
			jsonArray = archiveExecution.archiveExecutionGovernanceDataRetrieve(waveName);
			
			archiveExecution =null;
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

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
import com.google.gson.JsonObject;

import ArchiveExecutionGovernanceModule.service.ArchiveExecutionGovernanceAddService;
import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionAddService;
import logger.System;
@WebServlet("/ArchiveExecutionGovernanceAddServlet")
public class ArchiveExecutionGovernanceAddServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession details = request.getSession();
        
		String waveId=(String)details.getAttribute("selectedWaveId");
        
		String waveName =(String)details.getAttribute("selectedWaveName");
        
        int seqNum = Integer.parseInt((String)request.getParameter("seqNum"));
        
        String taskName = (String)request.getParameter("TaskName");
        String taskGroup = (String)request.getParameter("TaskGroup");
        String typeRow = (String)request.getParameter("Type");
        String planStDt = (String)request.getParameter("PlanStartDate");
        
        JsonArray jsonArray = new JsonArray();
        try {
        	ArchiveExecutionGovernanceAddService archiveExecAdd = new ArchiveExecutionGovernanceAddService(waveId,waveName,seqNum,taskGroup,taskName,typeRow,planStDt);
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

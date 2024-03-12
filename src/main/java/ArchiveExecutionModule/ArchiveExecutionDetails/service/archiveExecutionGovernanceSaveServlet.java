package ArchiveExecutionModule.ArchiveExecutionDetails.service;

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

import ArchiveExecutionGovernanceModule.service.ArchiveExecutionGovernanceSaveService;
import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionSaveService;
import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;
import logger.System;
@WebServlet("/archiveExecutionGovernanceSaveServlet")
public class archiveExecutionGovernanceSaveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String waveId = (String)details.getAttribute("selectedWaveId");
        String columnName = (String)request.getParameter("colName");
        String value = (String)request.getParameter("Value");
        int seq_num = Integer.parseInt(request.getParameter("seqNum"));
        JsonObject jsonObj= null;
        try
        {
        	System.out.println("Save function"+seq_num+" "+value+" "+columnName );
        	ArchiveExecutionGovernanceSaveService archive = new ArchiveExecutionGovernanceSaveService(waveId, seq_num, columnName, value);
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

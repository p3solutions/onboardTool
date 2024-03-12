package ArchiveExecutionGovernanceModule.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.annotation.WebServlet;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import ArchiveExecutionGovernanceModule.service.ArchiveExecutionSaveAppToGovernanceService;
import ArchiveExecutionModule.ArchiveExecutionDetails.service.ArchiveExecutionSaveService;
import logger.System;
@WebServlet("/governanceArchiveExecutionSaveServlet")
public class governanceArchiveExecutionSaveServlet extends HttpServlet {
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
        	ArchiveExecutionSaveAppToGovernanceService archive = new ArchiveExecutionSaveAppToGovernanceService(id, seq_num, columnName, value);
        	boolean statusFlag = archive.saveArchivExecGovernance();
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

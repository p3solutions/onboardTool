package NewArchiveRequirements.addendumInfo.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import NewArchiveRequirements.addendumInfo.service.archiveReqAddendumAddService;
import NewArchiveRequirements.documentRevisions.service.archiveReqDocRevAddService;
import logger.System;

/**
 * Servlet implementation class archiveReqAddendumAddServlet
 */
@WebServlet("/archiveReqAddendumAddServlet")
public class archiveReqAddendumAddServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String ID = (String) details.getAttribute("ID");
		String oppName =(String)details.getAttribute("SelectedOpportunity");
		int seqNum = Integer.parseInt(request.getParameter("seqNum")); 
		String labelName = request.getParameter("labelName");
		
		JsonObject jsonobject = new JsonObject();
        
        try {
        	archiveReqAddendumAddService addService = new archiveReqAddendumAddService(seqNum, ID, oppName, labelName);
        	boolean checkDuplicate= addService.checkDuplicateLabelName();
        	if(!checkDuplicate)
        	jsonobject = addService.archiveReqAddendumAdd();
        	else
        	jsonobject.addProperty("AddStatus", false);
        	jsonobject.addProperty("checkDuplicate",checkDuplicate);
        	addService = null;
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

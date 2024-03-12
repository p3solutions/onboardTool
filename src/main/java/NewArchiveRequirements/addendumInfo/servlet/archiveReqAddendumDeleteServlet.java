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

import NewArchiveRequirements.addendumInfo.service.archiveReqAddendumDeleteService;
import NewArchiveRequirements.documentRevisions.service.archiveReqDocRevDeleteService;
import logger.System;
@WebServlet("/archiveReqAddendumDeleteServlet")

public class archiveReqAddendumDeleteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String ID = (String) details.getAttribute("ID");
		String oppName =(String)details.getAttribute("SelectedOpportunity");
		int seqNum = Integer.parseInt(request.getParameter("seqNum")); 
		JsonObject jsonobject = new JsonObject();
        
        try {
        	archiveReqAddendumDeleteService deleteService = new archiveReqAddendumDeleteService(seqNum, ID);
        	jsonobject = deleteService.archiveReqAddendumDelete();
        	deleteService = null;
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

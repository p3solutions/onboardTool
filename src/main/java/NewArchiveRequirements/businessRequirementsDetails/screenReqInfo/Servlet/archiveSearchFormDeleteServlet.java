package NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service.archiveScreenReqDeleteService;
import NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service.archiveScreenSearchFormDeleteService;
import logger.System;
@WebServlet("/archiveSearchFormDeleteServlet")
public class archiveSearchFormDeleteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String ID = (String) details.getAttribute("ID");
		String oppName =(String)details.getAttribute("SelectedOpportunity");
		int seqNum = Integer.parseInt(request.getParameter("seqNum")); 
		
		JsonObject jsonobject = new JsonObject();
        
        try {
        	archiveScreenSearchFormDeleteService deleteService = new archiveScreenSearchFormDeleteService(seqNum, ID, oppName);
        	jsonobject = deleteService.deleteSearchForm();
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

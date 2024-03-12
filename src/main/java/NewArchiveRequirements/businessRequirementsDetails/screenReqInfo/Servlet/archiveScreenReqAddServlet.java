package NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service.archiveScreenReqAddService;
import NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service.archiveScreenReqDataRetrieveService;
import logger.System;

/**
 * Servlet implementation class archiveScreenReqAddServlet
 */
@WebServlet("/archiveScreenReqAddServlet")
public class archiveScreenReqAddServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			HttpSession details = request.getSession();
			String Id = (String)details.getAttribute("ID");
			String oppName=(String)details.getAttribute("SelectedOpportunity");
			String displayName = request.getParameter("displayName");
			JsonObject jsonObject = new JsonObject();
			try
			{
				archiveScreenReqAddService ScreenReq = new archiveScreenReqAddService(Id, oppName, displayName);
				jsonObject = ScreenReq.archiveScreenReqAdd();
				ScreenReq = null;
				System.gc();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
			System.out.println("JSON ARRAY"+jsonObject);
			String json = new Gson().toJson(jsonObject);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

}

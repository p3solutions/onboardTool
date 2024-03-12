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

import NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service.archiveScreenReqAddService;
import NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service.archiveScreenReqSearchFormAddService;
import logger.System;

/**
 * Servlet implementation class archiveScreenSearchFormAddServlet
 */
@WebServlet("/archiveScreenSearchFormAddServlet")
public class archiveScreenSearchFormAddServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String Id = (String)details.getAttribute("ID");
		String oppName=(String)details.getAttribute("SelectedOpportunity");
		String searchFormName = request.getParameter("searchFormName");
		int seqNum = Integer.parseInt(request.getParameter("seqNum"));
		String reqId = request.getParameter("reqId");
		JsonObject jsonObject = new JsonObject();
		try
		{
			archiveScreenReqSearchFormAddService ScreenReq = new archiveScreenReqSearchFormAddService(Id, oppName, searchFormName,seqNum,reqId);
			jsonObject = ScreenReq.secreenReqSeachFormAdd();
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

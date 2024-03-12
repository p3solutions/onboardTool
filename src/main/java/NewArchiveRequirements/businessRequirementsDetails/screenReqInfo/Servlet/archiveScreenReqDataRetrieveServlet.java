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

import NewArchiveRequirements.businessRequirementsDetails.screenReqInfo.Service.archiveScreenReqDataRetrieveService;
import logger.System;

/**
 * Servlet implementation class archiveScreenReqDataRetrieveServlet
 */
@WebServlet("/archiveScreenReqDataRetrieveServlet")
public class archiveScreenReqDataRetrieveServlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
		String Id = (String)details.getAttribute("ID");
		JsonArray jsonArray = new JsonArray();
		try
		{
			archiveScreenReqDataRetrieveService ScreenReq = new archiveScreenReqDataRetrieveService(Id);
			jsonArray.add(ScreenReq.archiveScreenInfoDataRetrieve());
			jsonArray.add(ScreenReq.searchFormDataRetrieve());
			ScreenReq = null;
			System.gc();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		System.out.println("JSON ARRAY"+jsonArray);
		String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

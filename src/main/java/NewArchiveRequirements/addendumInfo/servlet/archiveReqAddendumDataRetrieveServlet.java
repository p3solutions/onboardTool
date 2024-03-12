package NewArchiveRequirements.addendumInfo.servlet;

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

import NewArchiveRequirements.addendumInfo.service.archiveReqAddendumDataRetrieveService;
import NewArchiveRequirements.documentRevisions.service.archiveReqDocRevDataRetrieveService;
import logger.System;

/**
 * Servlet implementation class archiveReqAddendumDataRetrieveServlet
 */
@WebServlet("/archiveReqAddendumDataRetrieveServlet")

public class archiveReqAddendumDataRetrieveServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession details = request.getSession();
        String Id=(String)details.getAttribute("ID");
        String oppName=(String)details.getAttribute("SelectedOpportunity");
        
        JsonArray jsonArray = null;
        archiveReqAddendumDataRetrieveService docRevData;
		
			try {
				docRevData = new archiveReqAddendumDataRetrieveService(Id, oppName);
				jsonArray = docRevData.archiveReqAddendumDataRetrieve();
				docRevData =null;
				System.gc();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			//calling finalize method and garbage collector
			
			System.out.println("JSON ARRAY"+jsonArray);
			String json = new Gson().toJson(jsonArray);
	        response.setContentType("application/json");
	        response.setCharacterEncoding("UTF-8");
	        response.getWriter().write(json);
	}

}

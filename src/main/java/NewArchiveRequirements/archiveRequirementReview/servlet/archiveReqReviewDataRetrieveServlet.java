package NewArchiveRequirements.archiveRequirementReview.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

import NewArchiveRequirements.archiveRequirementReview.service.archiveReqReviewService;
import logger.System;
@WebServlet("/archiveReqReviewDataRetrieveServlet")

public class archiveReqReviewDataRetrieveServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession details =request.getSession();
        String Id = (String)details.getAttribute("ID");
	    String OppName = (String)details.getAttribute("SelectedOpportunity");
	    JsonArray jsonArray = new JsonArray();
	    try
	    {
	    	archiveReqReviewService Review  = new archiveReqReviewService(Id, OppName);
	    	jsonArray=Review.archiveReqReviewDataRetrieve();
	    }
	    catch (Exception e) {
			e.printStackTrace();
		}
	    
	    System.out.println(" Archive Requirements JSON ARRAY"+jsonArray);
   		String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

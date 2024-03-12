package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import governance.service.phaseEditService;
import logger.System;
@WebServlet("/phaseEditServlet")

public class phaseEditServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JsonObject jsonObject = new JsonObject();
		int seqNum = Integer.parseInt(request.getParameter("seq_num"))+1;
		String labelName = request.getParameter("label");
		String phaseId= request.getParameter("phaseId");
		String operation = request.getParameter("operation");
	    try
		{
		phaseEditService phase = new phaseEditService( labelName, seqNum, phaseId, operation);	
		jsonObject.addProperty("previous_label_name", phase.getPreviousLabelName());
		boolean checkLabel = phase.checkDuplicateLabelName();
		jsonObject.addProperty("checkDuplicate",checkLabel);
		if(!checkLabel)
		jsonObject.addProperty("EditStatus",phase.EditService());
		else
		jsonObject.addProperty("EditStatus",false);

		jsonObject.addProperty("label_name", labelName);
		phase =null;
		System.gc();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	    String json = new Gson().toJson(jsonObject);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);

	}

}

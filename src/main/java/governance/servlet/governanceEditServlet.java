package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import governance.service.governanceEditService;
import logger.System;
@WebServlet("/governanceEditServlet")

public class governanceEditServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	JsonObject jsonObject = new JsonObject();
	int seqNum = Integer.parseInt(request.getParameter("seq_num"))+1;
	String labelName = request.getParameter("label");
	String waveId = request.getParameter("waveId");
	String operation = request.getParameter("operation");
	
    try
	{
	governanceEditService governance = new governanceEditService( labelName, seqNum,waveId,operation);	
	jsonObject.addProperty("previous_label_name", governance.getPreviousLabelName());
	boolean checkLabel = governance.checkDuplicateLabelName();
	jsonObject.addProperty("checkDuplicate",checkLabel);
	if(!checkLabel)
	jsonObject.addProperty("EditStatus",governance.EditService());
	else
	jsonObject.addProperty("EditStatus",false);

	jsonObject.addProperty("label_name", labelName);
	governance =null;
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

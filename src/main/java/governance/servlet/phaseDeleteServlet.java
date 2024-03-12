package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import governance.service.phaseDeleteService;
import logger.System;
@WebServlet("/phaseDeleteServlet")

public class phaseDeleteServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		JsonObject jsonObject = new JsonObject();
	    int seqNum = Integer.parseInt(request.getParameter("seq_num"))+1;
	    String id = request.getParameter("phaseId");
	    String operation = request.getParameter("operation");
	    //String Id = request.getParameter("waveId");
	    try
	    {
	    	phaseDeleteService phase = new phaseDeleteService(seqNum,id,operation);
	      jsonObject.addProperty("DeleteStatus",phase.DeleteService());
	      phase=null;
	      System.gc();
	    }
	    catch(Exception e)
	    {
	      e.printStackTrace();	
	    }
	    String json = new Gson().toJson(jsonObject);
	    response.setContentType("application/json");
	    response.setCharacterEncoding("UTF-8");
	    response.getWriter().write(json);	}

}

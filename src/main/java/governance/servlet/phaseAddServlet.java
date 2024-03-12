package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import governance.service.phaseAddService;
import logger.System;

@WebServlet("/phaseAddServlet")

public class phaseAddServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String phaseId = request.getParameter("phaseId");
	    
		String operation = request.getParameter("operation");
		
	     String type = request.getParameter("Type");
	     
	     String column_name = request.getParameter("ColumnName");
	     
	     String label_name = request.getParameter("LabelName");
	     
	     String options = request.getParameter("Options");
	     
	     options = options==null?"":options;
	     
	     String mandatory = request.getParameter("Mandatory");
	     
	     JsonObject jsonObject = new JsonObject();
	     
	     try
	     {
	    	 
	    	 jsonObject.addProperty("LabelName",label_name);
	    	 
	    	 jsonObject.addProperty("ColumnName",column_name);
	    	 
	    	 jsonObject.addProperty("Options",options);
	    	 
	    	 jsonObject.addProperty("Type",type);
	    	 
	    	 jsonObject.addProperty("Mandatory",mandatory);

	    	 phaseAddService phase = new phaseAddService(phaseId,operation);
	    	 
	    	 
	    	 boolean checkLabel =  phase.checkLabelName(label_name);
	    	 
	    	 jsonObject.addProperty("checkLabel",checkLabel);
	    	 
	    	 if(!checkLabel) {
	    		 int seqNum =phase.getSeqNum();
		    	 jsonObject.addProperty("Seq_Num",seqNum);
		    	 jsonObject.addProperty("ColumnName","phaseAddInfo");
	    		 jsonObject.addProperty("AddStatus",phase.phaseAdd(type, label_name, options, mandatory));
	    	 }
	    	 else
	    		 jsonObject.addProperty("AddStatus",false);
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
	     
	     response.getWriter().write(json);
		

	}

}

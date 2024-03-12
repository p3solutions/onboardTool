package governance.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import governance.service.governanceAddService;
import logger.System;

/**
 * Servlet implementation class governanceAddServlet
 */
@WebServlet("/governanceAddServlet")

public class governanceAddServlet extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
	     String waveId = request.getParameter("waveId");
	     	     
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

	    	 governanceAddService governance = new governanceAddService(waveId,operation);
	    	 
	    	 
	    	 boolean checkLabel =  governance.checkLabelName(label_name);
	    	 
	    	 jsonObject.addProperty("checkLabel",checkLabel);
	    	 
	    	 if(!checkLabel) {
	    		 int seqNum =governance.getSeqNum();
		    	 jsonObject.addProperty("Seq_Num",seqNum);
		    	 jsonObject.addProperty("ColumnName","GovernanceAddInfo");
	    		 jsonObject.addProperty("AddStatus",governance.governanceAdd(type, label_name, options, mandatory));
	    	 }
	    	 else
	    		 jsonObject.addProperty("AddStatus",false);
	    	 governance=null;
	    	 
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

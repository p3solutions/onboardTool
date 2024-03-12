package IntakeDetails.IntakeTriage.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import IntakeDetails.IntakeTriage.Service.IntakeTriageService;
import logger.System;

/**
 * Servlet implementation class IntakeTriageSaveServlet
 */
@WebServlet("/IntakeTriageSaveServlet")
public class IntakeTriageSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeTriageSaveServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				System.out.println("Response");
				HttpSession details = request.getSession();
				String id = (String)details.getAttribute("ID");
				String JsonString= (String)request.getParameter("JsonString");
			    boolean checkMandatory =Boolean.parseBoolean(request.getParameter("checkMandatory"));
			    JsonParser parser = new JsonParser();
				JsonElement tradeElement = parser.parse(JsonString);
				JsonArray jsonArray = tradeElement.getAsJsonArray();
				JsonObject jsonObject = new JsonObject();
				boolean check = true;
				for(int i=0;i<jsonArray.size();i++)
				{
					
					JsonObject jsonObj = jsonArray.get(i).getAsJsonObject();
					String name = jsonObj.get("Name").getAsString();
					String value = jsonObj.get("Value").getAsString();
					if(value.contains("$") && name.equals("Preliminary_CBA"))
					{
						 value = value.substring(1);
					}
					if(name.equals("appId")||name.equals("applicationName"))
					{
						   boolean duplicateCheck =IntakeTriageService.DuplicateValueCheck(id, name, value);
						   jsonObject.addProperty(name,duplicateCheck);
						   if(!duplicateCheck)
							   check = false;
					}
				}
				
				if(check)
				new IntakeTriageService().Save(jsonArray,id);
				
				String json = new Gson().toJson(jsonObject);
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        response.getWriter().write(json);
	}
}



package IntakeDetails.IntakeStakeHolder.servlet;

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

import IntakeDetails.IntakeStakeHolder.service.IntakeStakeHolderService;
import IntakeDetails.IntakeTriageSummary.service.IntakeTriageSummaryService;

/**
 * Servlet implementation class IntakeStakeHolderSaveServlet
 */
@WebServlet("/IntakeStakeHolderSaveServlet")
public class IntakeStakeHolderSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeStakeHolderSaveServlet() {
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
		HttpSession details = request.getSession();
		String id = (String)details.getAttribute("ID");
        String JsonString= request.getParameter("JsonArray");
        JsonParser parser = new JsonParser();
		JsonElement tradeElement = parser.parse(JsonString);
		JsonArray jsonArray = tradeElement.getAsJsonArray();
		JsonObject jsonObj = new JsonObject();
		boolean CheckSave = false;
		try
		{
			IntakeStakeHolderService intake = new IntakeStakeHolderService();
			
			jsonObj = intake.CheckUserDetails(jsonArray, id);
			if(jsonObj.get("checkUser").getAsBoolean() && jsonObj.get("checkName").getAsBoolean() && jsonObj.get("checkEmail").getAsBoolean() && jsonObj.get("checkRole").getAsBoolean())
			{
			 intake.Save(jsonArray, id);
			 CheckSave = true;
			}
			intake = null;
			
			//garbage collector
			System.gc();
			
			jsonObj.addProperty("CheckSave", CheckSave);
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		String json = new Gson().toJson(jsonObj);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8"); 
		response.getWriter().write(json);
	}

}

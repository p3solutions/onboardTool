package NewArchiveRequirements.LegacyApplicationInfo.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import NewArchiveRequirements.LegacyApplicationInfo.Service.LegacyAppSrcService;
import logger.System;

/**
 * Servlet implementation class LegacyAppSrcDataRetrieveServlet
 */
@WebServlet("/LegacyAppSrcDataRetrieveServlet")
public class LegacyAppSrcDataRetrieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LegacyAppSrcDataRetrieveServlet() {
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
        String Id=(String)details.getAttribute("ID");
        String value=(String)details.getAttribute("value");
        System.out.println("Application Platform Id "+Id);
        JsonObject JsonObj = null;
        JsonObj = new LegacyAppSrcService().LegacyAppSrcDataRetrieveService(Id,value);
   		System.out.println("Application Platform JSON ARRAY" +JsonObj);
   		String json = new Gson().toJson(JsonObj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}

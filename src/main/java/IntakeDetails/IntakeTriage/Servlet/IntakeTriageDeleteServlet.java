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
import com.google.gson.JsonObject;

import IntakeDetails.IntakeTriage.Service.IntakeTriageService;


/**
 * Servlet implementation class IntakeTriageDeleteServlet
 */
@WebServlet("/IntakeTriageDeleteServlet")
public class IntakeTriageDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IntakeTriageDeleteServlet() {
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
		JsonArray jsonArray = new JsonArray();
		JsonObject jsonobj = new JsonObject();
		HttpSession details = request.getSession();
        String Id=(String)details.getAttribute("ID");
       System.out.println("Triage Id "+Id);
		int seq_num = Integer.parseInt(request.getParameter("seq_num"))+1;
		jsonobj.addProperty("index",seq_num-1);
		jsonArray.add(jsonobj);
       	jsonArray.add(new IntakeTriageService().deleteField(seq_num, Id));
		String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
	}

}


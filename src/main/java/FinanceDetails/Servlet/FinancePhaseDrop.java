package FinanceDetails.Servlet;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import FinanceDetails.Service.FinanceDropService;

/**
 * Servlet implementation class FinanceTableDetails
 */
@WebServlet("/FinancePhaseDrop")
public class FinancePhaseDrop extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinancePhaseDrop() {
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
        // TODO Auto-generated method stub
        HttpSession details = request.getSession();
       String Id=request.getParameter("filteredId");
       String value="Intelliji";
       System.out.println("the value of Id from js"+Id);
       System.out.println("the value of App from js"+value);
        JsonArray jsonArray = null;
        FinanceDropService Details =  new  FinanceDropService();
        System.out.println("Connected to Application");
    		jsonArray = Details.FinanceDropDownStatus( Id,value);
        Details =null;
        //calling finalize method and garabage collector
        System.gc();
//        System.out.println("JSON ARRAY"+jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
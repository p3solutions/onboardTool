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
 
import FinanceDetails.Service.FinanceTableDetailsService;
/**
* Servlet implementation class FinanceTableDetails
*/
@WebServlet("/FinanceTableDetailsServlet")
public class FinanceTableDetailsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FinanceTableDetailsServlet() {
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
       
       String name=request.getParameter("appName");
       System.out.println("the value from from js"+name);
       String page = request.getParameter("page");
	     
	    String maxRows =request.getParameter("maxRows");
	    
        JsonObject jsonArray = null;
        FinanceTableDetailsService Details =  new FinanceTableDetailsService();
        
    		jsonArray = Details.FinanceDetails(page,maxRows);
        Details =null;
        
        System.gc();

        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
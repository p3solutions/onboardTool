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
 
import FinanceDetails.Service.FinanceTableDetails;
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
        HttpSession details = request.getSession();
       String name=request.getParameter("appName");
       System.out.println("the value from from js"+name);
       String page = request.getParameter("page");
	     System.out.println("Page 123: "+page);
	    String maxRows =request.getParameter("maxRows");
	     System.out.println("maxRows 123 : "+maxRows);
        JsonObject jsonArray = null;
        FinanceTableDetails Details =  new FinanceTableDetails();
        System.out.println("Connected to TableDetails");
    		jsonArray = Details.FinanceDetails(page,maxRows);
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
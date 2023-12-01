package FinanceDetails.Servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import FinanceDetails.Service.TableDetailDeleteService;

/**
 * Servlet implementation class FinanceTableDetails
 */
@WebServlet("/TableDetailDeleteServlet")
public class TableDetailDeleteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TableDetailDeleteServlet() {
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
        //int seq_num = Integer.parseInt(request.getParameter("seq_num"))+1;
        String Id=request.getParameter("Id");
        System.out.println("Random ID : "+Id);
        JsonObject jsonObj =TableDetailDeleteService.DeleteDetais(Id);
         String json = new Gson().toJson(jsonObj);
         System.out.println("JSON"+json);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        doGet(request, response);
    }
}

package Finance.servlet;

import Finance.service.FinanceListDeleteService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Finance_List_Delete_Servlet")
public class Finance_List_Delete_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Finance_List_Delete_Servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {


        String Id=request.getParameter("random_id");
        FinanceListDeleteService financeListDeleteService = new FinanceListDeleteService();
        JsonObject jsonObj = financeListDeleteService.Delete_Finance(Id);
        System.out.println("Entered the delete servlet ");

        String json = new Gson().toJson(jsonObj);
        System.out.println("JSON"+json);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}

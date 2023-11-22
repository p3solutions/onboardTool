package Finance.servlet;

import Finance.service.Retrieve_FinanceList_service;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Retrieve_Finance_list_Servlet")
public class Retrieve_Finance_list_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Retrieve_Finance_list_Servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int page = Integer.parseInt(request.getParameter("page"));
        int maxRows = Integer.parseInt(request.getParameter("maxRows"));

        JsonObject result = null;
        Retrieve_FinanceList_service retrieve_financeList_service = new Retrieve_FinanceList_service();
        result = retrieve_financeList_service.retrieveDataWithCount(page, maxRows);
        retrieve_financeList_service = null;

        System.gc();
        String json = new Gson().toJson(result);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }

}

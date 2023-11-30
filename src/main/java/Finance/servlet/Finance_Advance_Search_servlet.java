package Finance.servlet;

import Finance.service.Finance_Advance_Search;
import Finance.service.SearchFinanceService;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/Finance_Advance_Search_servlet")
public class Finance_Advance_Search_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Finance_Advance_Search_servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] selectedColumnsArray = request.getParameterValues("column[]");

// Check if the array is null before converting to a List
        List<String> selectedColumnsList = Arrays.asList(selectedColumnsArray);

        String condition = request.getParameter("condition");
        String searchTerm = request.getParameter("searchTerm");
        int page = Integer.parseInt(request.getParameter("page"));
        int maxRows = Integer.parseInt(request.getParameter("maxRows"));
        String tableName = "decom3sixtytool.financelist";

        JsonObject result = null;
        try {
            Finance_Advance_Search financeAdvanceSearch =new Finance_Advance_Search();
            result =financeAdvanceSearch.getDataBasedOnFilter(tableName,selectedColumnsList,condition,searchTerm,maxRows,page);
            financeAdvanceSearch =null;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        System.out.println(result);
        System.gc();
        String json = new Gson().toJson(result);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}

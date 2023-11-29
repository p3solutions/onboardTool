package Report;

import Finance.service.Finance_Advance_Search;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Report_Advance_Search_Servlet")
public class Report_Advance_Search_Servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Report_Advance_Search_Servlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String column = request.getParameter("column");
        String condition = request.getParameter("condition");
        String searchTerm = request.getParameter("searchTerm");
        int page = Integer.parseInt(request.getParameter("page"));
        int maxRows = Integer.parseInt(request.getParameter("maxRows"));
        String tableName = request.getParameter("SelectedReport");

        JsonObject result = null;
        try {
            Report_Advance_Search reportAdvanceSearch =new Report_Advance_Search();
            //result =reportAdvanceSearch.getDataBasedOnFilter();
            reportAdvanceSearch =null;
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        System.gc();
        String json = new Gson().toJson(result);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}
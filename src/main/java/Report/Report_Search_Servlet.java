package Report;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Report_Search_Servlet")
public class Report_Search_Servlet  extends HttpServlet{

        private static final long serialVersionUID = 1L;

    public Report_Search_Servlet() {
        super();
    }

        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String column = request.getParameter("column");
        String searchTerm = request.getParameter("searchTerm");
        int page = Integer.parseInt(request.getParameter("page"));
        int maxRows = Integer.parseInt(request.getParameter("maxRows"));
        String selectedOption = request.getParameter("SelectedReport");
        JsonObject result = null;
        Report_Search_Service reportSearchService = new Report_Search_Service();
        result = reportSearchService.searchView(column,searchTerm,maxRows,page,selectedOption);
        reportSearchService=null;


        System.gc();
        String json = new Gson().toJson(result);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}

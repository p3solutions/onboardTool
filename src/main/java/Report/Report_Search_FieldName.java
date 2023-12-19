package Report;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Report_Search_FieldName")
public class Report_Search_FieldName extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public Report_Search_FieldName() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String selectedOption = request.getParameter("SelectedReport");
        JsonObject jsonObj = null;
        try {
            Report_Advance_Search reportAdvanceSearch = new Report_Advance_Search();
            jsonObj = reportAdvanceSearch.reportColumnName(selectedOption);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        System.out.println("ReportGeneration Servlet : "+jsonObj);
        String json = new Gson().toJson(jsonObj);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);


    }

}

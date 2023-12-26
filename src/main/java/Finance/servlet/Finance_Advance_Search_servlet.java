package Finance.servlet;

import Finance.service.Finance_Advance_Search;
import Finance.service.SearchFinanceService;
import Report.Report_Advance_Search;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
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
        try (BufferedReader reader = request.getReader()) {
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            String jsonString = sb.toString();

            JsonParser parser = new JsonParser();
            JsonObject json = parser.parse(jsonString).getAsJsonObject();

            String columnName = getStringOrNull(json, "columnName");
            String operators = getStringOrNull(json, "Operators");
            String searchValue1 = getStringOrNull(json, "searchValue1");
            String searchValue2 = getStringOrNull(json, "searchValue2");
            String yesnofiled = getStringOrNull(json, "yesnofiled");
            int page = getIntOrDefault(json, "Page", 0);
            int maxRows = getIntOrDefault(json, "maxRows", 10);
            String colType = getStringOrNull(json, "Type");
            
           
            System.out.println("columnName: " + columnName);
            System.out.println("Operators: " + operators);
            System.out.println("searchValue1: " + searchValue1);
            System.out.println("searchValue2: " + searchValue2);
            System.out.println("yesnofiled: " + yesnofiled);
            System.out.println("page: " + page);
            System.out.println("maxRows: " + maxRows);
            System.out.println("colType"+colType);
            JsonObject result = null;
            try {
            	 Finance_Advance_Search financeAdvanceSearch =new Finance_Advance_Search();
                 result =financeAdvanceSearch.getDataBasedOnFilter(columnName, operators, searchValue1, searchValue2, yesnofiled, page, maxRows,colType);
                 financeAdvanceSearch =null;
            } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String jsonResponse = new Gson().toJson(result);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);
        }
    }
    private String getStringOrNull(JsonObject json, String key) {
        return json.has(key) && !json.get(key).isJsonNull() ? json.get(key).getAsString() : null;
    }

    private int getIntOrDefault(JsonObject json, String key, int defaultValue) {
        return json.has(key) && !json.get(key).isJsonNull() ? json.get(key).getAsInt() : defaultValue;
    }
}

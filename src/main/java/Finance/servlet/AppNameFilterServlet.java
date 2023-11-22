package Finance.servlet;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashSet;
import java.util.Set;

@WebServlet("/AppNameFilterServlet")
public class AppNameFilterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        JsonArray jsonArray = new JsonArray();

        try {
            DBconnection dbConnection = new DBconnection();
            Connection connection = dbConnection.getConnection();

            String sql = "SELECT Id, value FROM decom3sixtytool.opportunity_info WHERE column_name = 'appName' AND value LIKE ?;";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name + "%");
            ResultSet resultSet = statement.executeQuery();

            String sql1 = "SELECT DISTINCT Id, app_name FROM decom3sixtytool.finance_info WHERE Id IN ( SELECT DISTINCT Id FROM decom3sixtytool.finance_info WHERE value IS NOT NULL AND TRIM(value) <> '');";
            Statement statement1 = connection.createStatement();
            ResultSet rs = statement1.executeQuery(sql1);

            // Create a set to store the emptyIds
            Set<String> emptyIds = new HashSet<>();

            while (rs.next()) {
                emptyIds.add(rs.getString(1));
            }

            while (resultSet.next()) {
                String applicationId = resultSet.getString("Id");

                if (!emptyIds.contains(applicationId)) {
                    JsonObject jsonObj = new JsonObject();
                    jsonObj.addProperty("Id", resultSet.getString("Id"));
                    jsonObj.addProperty("Application_Name", resultSet.getString("value"));
                    jsonArray.add(jsonObj);
                }
            }

            resultSet.close();
            statement.close();
            rs.close();
            statement1.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.gc();
        System.out.println("JSON ARRAY " + jsonArray);
        String json = new Gson().toJson(jsonArray);
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
    }
}

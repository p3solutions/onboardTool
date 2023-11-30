package Finance.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;



public class Finance_Advance_Search {
    DBconnection dBconnection;
    Connection connection;
    FinanceListMapping financeListMapping = new FinanceListMapping();
    public Finance_Advance_Search() throws SQLException, ClassNotFoundException {
        dBconnection = new DBconnection();
        connection = (Connection) dBconnection.getConnection();

    }

    public JsonObject getDataBasedOnFilter(String tableName,List<String> selectedColumns, String condition, String searchTerm, int maxRows, int page) throws SQLException {
        int start = (page - 1) * maxRows;
        int totalCount = 0;
        // Build the SQL query based on the selected columns and condition
        String sql = buildSqlQuery(tableName, selectedColumns, condition,start,maxRows);
        PreparedStatement st1 = connection.prepareStatement(sql);

            // Set the search term as a parameter in the prepared statement
            for (int i = 0; i < selectedColumns.size(); i++) {
                st1.setString(i + 1, "%" + searchTerm + "%");
            }
            // Execute the query and process the resultSet
                ResultSet rs = st1.executeQuery();
                JsonArray jsonArray = new JsonArray();
                financeListMapping.FinanceMapping(rs,jsonArray);


        String countQuery = buildCountQuery(tableName, selectedColumns, condition, searchTerm);
        st1 = connection.prepareStatement(countQuery);
        for (int i = 0; i < selectedColumns.size(); i++) {
            st1.setString(i + 1, "%" + searchTerm + "%");
        }
        rs = st1.executeQuery();
        if (rs.next()) {
            totalCount = rs.getInt("total");
        }
        JsonObject result = new JsonObject();
        result.addProperty("total", totalCount);
        result.add("data", jsonArray);
        System.out.println("JSON" + result);
        return result;


    }
    private String buildSqlQuery(String tableName, List<String> selectedColumns, String condition, int start , int maxRows) {
        StringBuilder sql = new StringBuilder("SELECT * FROM " + tableName + " WHERE ");

        for (int i = 0; i < selectedColumns.size(); i++) {
            if (i > 0) {
                sql.append(" ").append(condition).append(" ");
            }
            sql.append(selectedColumns.get(i)).append(" LIKE ?");

            if (i < selectedColumns.size() - 1) {
                sql.append(" ");
            }
        }
        sql.append(" LIMIT ").append(start).append(",").append(maxRows).append(";");
        return sql.toString();
    }
    private  String buildCountQuery(String tableName, List<String> columns, String condition, String searchTerm) {
        // Validate that there are columns in the list
        if (columns == null || columns.isEmpty()) {
            throw new IllegalArgumentException("List of columns cannot be null or empty");
        }

        StringBuilder countSql = new StringBuilder("SELECT COUNT(*) AS total FROM ").append(tableName).append(" WHERE ");

        // Add conditions for each column
        for (int i = 0; i < columns.size(); i++) {
            if (i > 0) {
                countSql.append(" ").append(condition).append(" ");
            }
            countSql.append(columns.get(i)).append(" LIKE ?");

            // Add parameter placeholders for prepared statement
            if (i < columns.size() - 1) {
                countSql.append(" ");
            }
        }

        return countSql.toString();
    }


}

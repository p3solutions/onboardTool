package Report;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Report_Advance_Search {
//    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        List<String> columns = new ArrayList<>();
//        columns.add("LegacyAppName");
//        columns.add("Isapplicationtheonlysourceoftruthforthedata");
//        System.out.println("The list of columns" + columns);
//        String tableName = "intakeReport3";
//        String condition = "AND";
//        String searchTerm = "n";
//        int maxRows = 15;
//        int page =1;
//
//        Report_Advance_Search financeAdvanceSearch = new Report_Advance_Search();
//        financeAdvanceSearch.getDataBasedOnFilter(tableName,columns,condition,searchTerm,maxRows,page);
//    }
    DBconnection dBconnection;
    Connection connection;
    ReportMapping reportMapping =new ReportMapping();
    public Report_Advance_Search() throws SQLException, ClassNotFoundException {
        dBconnection = new DBconnection();
        connection = (Connection) dBconnection.getConnection();

    }

    public JsonObject getDataBasedOnFilter(String tableName, List<String> selectedColumns, String condition, String searchTerm, int maxRows, int page) throws SQLException {
        int start = (page - 1) * maxRows;
        int totalCount = 0;
        String ReportName = null;
        switch(tableName){
            case "intakeReport1" : {
                ReportName = "decom3sixtytool.applicationdataview1";
                break;
            }
            case "intakeReport2" : {
                ReportName = "decom3sixtytool.applicationdataview2";
                break;
            }
            case "intakeReport3" : {
                ReportName = "decom3sixtytool.applicationdataview3";
                break;
            }

        }
        String sql = buildSqlQuery(ReportName, selectedColumns, condition,start,maxRows);
        PreparedStatement st1 = connection.prepareStatement(sql);

        for (int i = 0; i < selectedColumns.size(); i++) {
            st1.setString(i + 1, "%" + searchTerm + "%");
        }

        ResultSet rs = st1.executeQuery();
            JsonArray jsonArray = new JsonArray();
            switch (tableName){
                case "intakeReport1" : {
                    reportMapping.reportMapping1(rs, jsonArray);
                    break;
                }
                case "intakeReport2" : {
                    reportMapping.reportMapping2(rs, jsonArray);
                    break;
                }
                case "intakeReport3" : {
                    reportMapping.reportMapping3(rs, jsonArray);
                    break;
                }
            }

        String countQuery = buildCountQuery(ReportName, selectedColumns, condition, searchTerm);
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
    private  String buildCountQuery(String ReportName, List<String> columns, String condition, String searchTerm) {
        // Validate that there are columns in the list
        if (columns == null || columns.isEmpty()) {
            throw new IllegalArgumentException("List of columns cannot be null or empty");
        }

        // Build the SQL query to count the total number of records
        StringBuilder countSql = new StringBuilder("SELECT COUNT(*) AS total FROM ").append(ReportName).append(" WHERE ");

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

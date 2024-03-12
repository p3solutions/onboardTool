package Finance.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import logger.System;



public class Finance_Advance_Search {
    DBconnection dBconnection;
    Connection connection;
    FinanceListMapping financeListMapping = new FinanceListMapping();
    public Finance_Advance_Search() throws SQLException, ClassNotFoundException {
        dBconnection = new DBconnection();
        connection = (Connection) dBconnection.getConnection();

    }

//    public JsonObject getDataBasedOnFilter(String tableName,List<String> selectedColumns, String condition, String searchTerm, int maxRows, int page) throws SQLException {
//        int start = (page - 1) * maxRows;
//        int totalCount = 0;
//        // Build the SQL query based on the selected columns and condition
//        String sql = buildSqlQuery(tableName, selectedColumns, condition,start,maxRows);
//        PreparedStatement st1 = connection.prepareStatement(sql);
//
//            // Set the search term as a parameter in the prepared statement
//            for (int i = 0; i < selectedColumns.size(); i++) {
//                st1.setString(i + 1, "%" + searchTerm + "%");
//            }
//            // Execute the query and process the resultSet
//                ResultSet rs = st1.executeQuery();
//                JsonArray jsonArray = new JsonArray();
//                financeListMapping.FinanceMapping(rs,jsonArray);
//
//
//        String countQuery = buildCountQuery(tableName, selectedColumns, condition, searchTerm);
//        st1 = connection.prepareStatement(countQuery);
//        for (int i = 0; i < selectedColumns.size(); i++) {
//            st1.setString(i + 1, "%" + searchTerm + "%");
//        }
//        rs = st1.executeQuery();
//        if (rs.next()) {
//            totalCount = rs.getInt("total");
//        }
//        JsonObject result = new JsonObject();
//        result.addProperty("total", totalCount);
//        result.add("data", jsonArray);
//        System.out.println("JSON" + result);
//        return result;
//
//
//    }

    public JsonObject getDataBasedOnFilter(String columnName, String operators, String searchValue1, String searchValue2, String yesnofiled, int page, int maxRows,String colType) {
        JsonArray jsonArray = new JsonArray();
        int start = (page - 1) * maxRows;
        int totalCount = 0;
        String reportName = null;
     if (!"Select".equals(columnName) && "Select".equals(operators) && !"".equals(searchValue1) && "".equals(searchValue2)&& "Select".equals(yesnofiled)) {
            Connection connection = null;
            PreparedStatement st = null;
            PreparedStatement st1 = null;

            try {
                DBconnection dBconnection = new DBconnection();
                connection = dBconnection.getConnection();

                st = connection.prepareStatement("SELECT * FROM financelist  WHERE `" + columnName + "` LIKE ? LIMIT ?,?");
                st.setString(1, "%" + searchValue1 + "%");
                st.setInt(2, start);
                st.setInt(3, maxRows);

                ResultSet rs = st.executeQuery();

                financeListMapping.FinanceMapping(rs,jsonArray);

                String countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM financelist  WHERE `" + columnName + "` LIKE ?";
                st1 = connection.prepareStatement(countQuery);
                st1.setString(1, "%" + searchValue1 + "%");
                ResultSet rs1 = st1.executeQuery();

                if (rs1.next()) {
                    totalCount = rs1.getInt("total");
                }

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                    if (st1 != null) {
                        st1.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        else if(!"Select".equals(columnName) && "Select".equals(operators) && "".equals(searchValue1) && "".equals(searchValue2)&& !"Select".equals(yesnofiled)) {
        	Connection connection = null;
            PreparedStatement st = null;
            PreparedStatement st1 = null;

            try {
                DBconnection dBconnection = new DBconnection();
                connection = dBconnection.getConnection();

                st = connection.prepareStatement("SELECT * FROM financelist WHERE `" + columnName + "`='"+yesnofiled+"' LIMIT ?,?");
                st.setInt(1, start);
                st.setInt(2, maxRows);

                ResultSet rs = st.executeQuery();
                financeListMapping.FinanceMapping(rs,jsonArray);

                String countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM financelist WHERE `" + columnName + "` = '"+yesnofiled+"'";
                st1 = connection.prepareStatement(countQuery);
                ResultSet rs1 = st1.executeQuery();

                if (rs1.next()) {
                    totalCount = rs1.getInt("total");
                }

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                    if (st1 != null) {
                        st1.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        else if(!"Select".equals(columnName) && !"Select".equals(operators) && !"".equals(searchValue1) && "".equals(searchValue2)&& "Select".equals(yesnofiled)) {
        	Connection connection = null;
            PreparedStatement st = null;
            PreparedStatement st1 = null;
            System.out.println("operators : "+operators);
            System.out.println("I am Without Between");

            try {
                DBconnection dBconnection = new DBconnection();
                connection = dBconnection.getConnection();
                if("date".equals(colType)) {
                	st = connection.prepareStatement("SELECT * FROM financelist WHERE STR_TO_DATE(`" + columnName + "`,'%m/%d/%Y') "+operators+" STR_TO_DATE('"+searchValue1+"','%m/%d/%Y') LIMIT ?,?");
                }
                else {
                	st = connection.prepareStatement("SELECT * FROM financelist WHERE `" + columnName + "`"+operators+" "+searchValue1+" LIMIT ?,?");
                }
                st.setInt(1, start);
                st.setInt(2, maxRows);

                ResultSet rs = st.executeQuery();
                financeListMapping.FinanceMapping(rs,jsonArray);
                String countQuery = null;
                if("date".equals(colType)) {
                	 countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM financelist  WHERE STR_TO_DATE(`" + columnName + "`,'%m/%d/%Y') "+operators+" STR_TO_DATE('"+searchValue1+"','%m/%d/%Y');";
                } else {
                	countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM financelist WHERE `" + columnName + "`"+operators+" "+searchValue1+";";
                }
                st1 = connection.prepareStatement(countQuery);
                ResultSet rs1 = st1.executeQuery();

                if (rs1.next()) {
                    totalCount = rs1.getInt("total");
                }

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                    if (st1 != null) {
                        st1.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        else if(!"Select".equals(columnName) && "BETWEEN".equals(operators) && !"".equals(searchValue1) && !"".equals(searchValue2)&& "Select".equals(yesnofiled)) {
        	Connection connection = null;
            PreparedStatement st = null;
            PreparedStatement st1 = null;
            System.out.println("operators : "+operators);
            System.out.println("I am Between");
            System.out.println("");

            try {
                DBconnection dBconnection = new DBconnection();
                connection = dBconnection.getConnection();
                if ("date".equals(colType)) {
                    st = connection.prepareStatement("SELECT * FROM financelist  WHERE `" + columnName + "` BETWEEN '"+searchValue1+"' AND '"+searchValue2+"' LIMIT ?, ?");
                } else {
                    st = connection.prepareStatement("SELECT * FROM  financelist WHERE `" + columnName + "` BETWEEN "+searchValue1+" AND "+searchValue2+" LIMIT ?, ?");
                }
                st.setInt(1, start);
                st.setInt(2, maxRows);
                System.out.println("Query: " + st.toString());
                ResultSet rs = st.executeQuery();
                financeListMapping.FinanceMapping(rs,jsonArray);
                String countQuery = null;
                if("date".equals(colType)) {
                	countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM financelist WHERE `" + columnName + "` BETWEEN '"+searchValue1+"' AND '"+searchValue2+"' ;";
                }else {
                	countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM financelist WHERE `" + columnName + "` BETWEEN "+searchValue1+" AND "+searchValue2+"";
                }
                st1 = connection.prepareStatement(countQuery);
                ResultSet rs1 = st1.executeQuery();

                if (rs1.next()) {
                    totalCount = rs1.getInt("total");
                }

            } catch (SQLException | ClassNotFoundException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (st != null) {
                        st.close();
                    }
                    if (st1 != null) {
                        st1.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        else {
        	System.out.println("Invalid Operators");
        }
        JsonObject result = new JsonObject();
        result.addProperty("total", totalCount);
        result.add("data", jsonArray);

        System.out.println("JSON Search Service Pagination: " + result);
        return result;
    }

}

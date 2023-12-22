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
    DBconnection dBconnection;
    Connection connection;
    ReportMapping reportMapping =new ReportMapping();
    public Report_Advance_Search() throws SQLException, ClassNotFoundException {
        dBconnection = new DBconnection();
        connection = (Connection) dBconnection.getConnection();

    }
    public JsonObject reportColumnName(String reportName) throws SQLException{
        JsonArray jsonArray = new JsonArray();
        String ReportName = null;
        switch(reportName){
            case "intakeReport1" : {
                ReportName = "applicationdataview1";
                break;
            }
            case "intakeReport2" : {
                ReportName = "applicationdataview2";
                break;
            }
            case "intakeReport3" : {
                ReportName = "applicationdataview3";
                break;
            }
            default:
                ReportName = "applicationdataview1";
        }
        try {
            String query = "DESC " + ReportName + ";";

            try (PreparedStatement st = connection.prepareStatement(query);
                 ResultSet rs = st.executeQuery()) {

                while (rs.next()) {
                    JsonObject jsonObj = new JsonObject();
                    jsonObj.addProperty("Field", rs.getString(1));
                    jsonArray.add(jsonObj);
                }

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        JsonObject result = new JsonObject();
        result.add("data", jsonArray);
        return result;
    }

    public JsonObject getDataBasedOnFilter(String selectedReport, String columnName, String operators, String searchValue1, String searchValue2, String yesnofiled, int page, int maxRows,String colType) {
        JsonArray jsonArray = new JsonArray();
        int start = (page - 1) * maxRows;
        int totalCount = 0;
        String reportName = null;

        switch (selectedReport) {
            case "intakeReport1":
                reportName = "applicationdataview1";
                break;
            case "intakeReport2":
                reportName = "applicationdataview2";
                break;
            case "intakeReport3":
                reportName = "applicationdataview3";
                break;
        }

        if (!"Select".equals(columnName) && "Select".equals(operators) && !"".equals(searchValue1) && "".equals(searchValue2)&& "Select".equals(yesnofiled)) {
            Connection connection = null;
            PreparedStatement st = null;
            PreparedStatement st1 = null;

            try {
                DBconnection dBconnection = new DBconnection();
                connection = dBconnection.getConnection();

                st = connection.prepareStatement("SELECT * FROM "+reportName+" WHERE `" + columnName + "` LIKE ? LIMIT ?,?");
                st.setString(1, "%" + searchValue1 + "%");
                st.setInt(2, start);
                st.setInt(3, maxRows);

                ResultSet rs = st.executeQuery();

                switch (reportName) {
                    case "applicationdataview1":
                        reportMapping.reportMapping1(rs, jsonArray);
                        break;
                    case "applicationdataview2":
                        reportMapping.reportMapping2(rs, jsonArray);
                        break;
                    case "applicationdataview3":
                        reportMapping.reportMapping3(rs, jsonArray);
                        break;
                }

                String countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM "+reportName+" WHERE `" + columnName + "` LIKE ?";
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

                st = connection.prepareStatement("SELECT * FROM "+reportName+" WHERE `" + columnName + "`='"+yesnofiled+"' LIMIT ?,?");
                st.setInt(1, start);
                st.setInt(2, maxRows);

                ResultSet rs = st.executeQuery();

                switch (reportName) {
                    case "applicationdataview1":
                        reportMapping.reportMapping1(rs, jsonArray);
                        break;
                    case "applicationdataview2":
                        reportMapping.reportMapping2(rs, jsonArray);
                        break;
                    case "applicationdataview3":
                        reportMapping.reportMapping3(rs, jsonArray);
                        break;
                }

                String countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM "+reportName+" WHERE `" + columnName + "` = '"+yesnofiled+"'";
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
                	st = connection.prepareStatement("SELECT * FROM "+reportName+" WHERE STR_TO_DATE(`" + columnName + "`,'%m/%d/%Y') "+operators+" STR_TO_DATE('"+searchValue1+"','%m/%d/%Y') LIMIT ?,?");
                }
                else {
                	st = connection.prepareStatement("SELECT * FROM "+reportName+" WHERE `" + columnName + "`"+operators+" "+searchValue1+" LIMIT ?,?");
                }
                st.setInt(1, start);
                st.setInt(2, maxRows);

                ResultSet rs = st.executeQuery();

                switch (reportName) {
                    case "applicationdataview1":
                        reportMapping.reportMapping1(rs, jsonArray);
                        break;
                    case "applicationdataview2":
                        reportMapping.reportMapping2(rs, jsonArray);
                        break;
                    case "applicationdataview3":
                        reportMapping.reportMapping3(rs, jsonArray);
                        break;
                }
                String countQuery = null;
                if("date".equals(colType)) {
                	 countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM "+reportName+"  WHERE STR_TO_DATE(`" + columnName + "`,'%m/%d/%Y') "+operators+" STR_TO_DATE('"+searchValue1+"','%m/%d/%Y');";
                } else {
                	countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM "+reportName+" WHERE `" + columnName + "`"+operators+" "+searchValue1+";";
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
                    st = connection.prepareStatement("SELECT * FROM " + reportName +
                            " WHERE `" + columnName + "` BETWEEN '"+searchValue1+"' AND '"+searchValue2+"' LIMIT ?, ?");
                } else {
                    st = connection.prepareStatement("SELECT * FROM " + reportName +
                            " WHERE `" + columnName + "` BETWEEN "+searchValue1+" AND "+searchValue2+" LIMIT ?, ?");
                }
                st.setInt(1, start);
                st.setInt(2, maxRows);
                System.out.println("Query: " + st.toString());
                ResultSet rs = st.executeQuery();

                switch (reportName) {
                    case "applicationdataview1":
                        reportMapping.reportMapping1(rs, jsonArray);
                        break;
                    case "applicationdataview2":
                        reportMapping.reportMapping2(rs, jsonArray);
                        break;
                    case "applicationdataview3":
                        reportMapping.reportMapping3(rs, jsonArray);
                        break;
                }
                String countQuery = null;
                if("date".equals(colType)) {
                	countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM "+reportName+" WHERE `" + columnName + "` BETWEEN '"+searchValue1+"' AND '"+searchValue2+"' ;";
                }else {
                	countQuery = "SELECT COUNT(`" + columnName + "`) AS total FROM "+reportName+" WHERE `" + columnName + "` BETWEEN "+searchValue1+" AND "+searchValue2+"";
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

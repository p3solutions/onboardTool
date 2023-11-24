package Report;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;

public class Report_Search_Service {
    ReportMapping reportMapping =new ReportMapping();
    public JsonObject searchView(String column, String searchTerm, int maxRows, int page, String SelectedReport) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        JsonArray jsonArray = new JsonArray();
        int totalCount = 0;
        String ReportName = null;
        switch (SelectedReport){
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

        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            System.out.println("Connected...");
            int start = (page - 1) * maxRows;

            String selectQuery = "SELECT * FROM " + ReportName + " WHERE " + column + " LIKE ? LIMIT ?, ?";
            st = connection.prepareStatement(selectQuery);
            st.setString(1, "%" + searchTerm + "%");
            st.setInt(2, start);
            st.setInt(3, maxRows);
            rs = st.executeQuery();
            switch (SelectedReport) {
                case "intakeReport1": {
                    reportMapping.reportMapping1(rs, jsonArray);
                    String countQuery = "SELECT COUNT(" + column + ") AS total FROM " + ReportName + " WHERE " + column + " LIKE ?";
                    st = connection.prepareStatement(countQuery);
                    st.setString(1, "%" + searchTerm + "%");
                    rs = st.executeQuery();
                    if (rs.next()) {
                        totalCount = rs.getInt("total");
                    }

                    break;
                }
                case "intakeReport2": {
                    reportMapping.reportMapping2(rs, jsonArray);
                    String countQuery = "SELECT COUNT(" + column + ") AS total FROM " + ReportName + " WHERE " + column + " LIKE ?";
                    st = connection.prepareStatement(countQuery);
                    st.setString(1, "%" + searchTerm + "%");
                    rs = st.executeQuery();

                    if (rs.next()) {
                        totalCount = rs.getInt("total");
                    }
                    break;
                }
                case "intakeReport3": {
                    reportMapping.reportMapping3(rs, jsonArray);
                    String countQuery = "SELECT COUNT(" + column + ") AS total FROM " + ReportName + " WHERE " + column + " LIKE ?";
                    st = connection.prepareStatement(countQuery);
                    st.setString(1, "%" + searchTerm + "%");
                    rs = st.executeQuery();
                    if (rs.next()) {
                        totalCount = rs.getInt("total");
                    }
                    break;
                }
            }
        } catch (Exception e) {

            System.out.println("Exception Occurs");
        }
        finally {
            assert st != null;
            st.close();
            assert rs != null;
            rs.close();
        }

        JsonObject result = new JsonObject();
        result.addProperty("total", totalCount);
        result.add("data", jsonArray);
        System.out.println("JSON" + result);
        return result;
    }
}

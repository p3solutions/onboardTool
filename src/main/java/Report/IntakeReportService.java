package Report;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class IntakeReportService {
ReportMapping reportMapping =new ReportMapping();
        public JsonObject getIntakeReport1(int page, int maxRows) throws SQLException {

            PreparedStatement st=null;
            ResultSet rs=null;

            DBconnection dBconnection = null;
            Connection connection = null;
            JsonArray jsonArray = new JsonArray();
            int totalCount = 0;
            try {

                dBconnection = new DBconnection();
                connection = (Connection) dBconnection.getConnection();
                int start = (page - 1) * maxRows;

                String selectQuery = "SELECT * FROM ApplicationDataView1 LIMIT ?, ?";
                st = connection.prepareStatement(selectQuery);
                st.setInt(1, start);
                st.setInt(2, maxRows);
                rs = st.executeQuery();

                reportMapping.reportMapping1(rs, jsonArray);
                String countQuery = "SELECT COUNT(*) AS total FROM ApplicationDataView1";
                st = connection.prepareStatement(countQuery);
                rs = st.executeQuery();
                if (rs.next()) {
                    totalCount = rs.getInt("total");
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

            // Create a JSON object to hold both data and total count
            JsonObject result = new JsonObject();
            result.addProperty("total", totalCount);
            result.add("data", jsonArray);

            System.out.println("JSON" + result);
            return result;
        }



    public JsonObject getIntakeReport2(int page, int maxRows) throws SQLException {

        PreparedStatement st=null;
        ResultSet rs=null;

        DBconnection dBconnection = null;
        Connection connection = null;
        JsonArray jsonArray = new JsonArray();
        int totalCount = 0;

        try {

            dBconnection = new DBconnection();
            connection = (Connection) dBconnection.getConnection();

            int start = (page - 1) * maxRows;

            String selectQuery = "SELECT * FROM ApplicationDataView2 LIMIT ?, ?";
            st = connection.prepareStatement(selectQuery);
            st.setInt(1, start);
            st.setInt(2, maxRows);
            rs = st.executeQuery();
            reportMapping.reportMapping2(rs, jsonArray);
            String countQuery = "SELECT COUNT(*) AS total FROM ApplicationDataView2";
            st = connection.prepareStatement(countQuery);
            rs = st.executeQuery();
            if (rs.next()) {
                totalCount = rs.getInt("total");
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

        // Create a JSON object to hold both data and total count
        JsonObject result = new JsonObject();
        result.addProperty("total", totalCount);
        result.add("data", jsonArray);

        System.out.println("JSON" + result);
        return result;
    }
    public JsonObject getIntakeReport3(int page, int maxRows) throws SQLException, ClassNotFoundException {

        PreparedStatement st = null;
        ResultSet rs = null;

        DBconnection dBconnection = null;
        Connection connection = null;
        int totalCount = 0;

        int start = (page - 1) * maxRows;

        JsonArray jsonArray = new JsonArray();
            try {


                dBconnection = new DBconnection();
                connection = (Connection) dBconnection.getConnection();

                String selectQuery = "SELECT * FROM ApplicationDataView3  LIMIT ?, ?";
                st = connection.prepareStatement(selectQuery);
                st.setInt(1, start);
                st.setInt(2, maxRows);
                rs = st.executeQuery();

                reportMapping.reportMapping3(rs, jsonArray);
                String countQuery = "SELECT COUNT(*) AS total FROM ApplicationDataView3";
                st = connection.prepareStatement(countQuery);
                rs = st.executeQuery();
                if (rs.next()) {
                    totalCount = rs.getInt("total");
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
        public JsonObject getIntakeReport4 (int page, int maxRows) throws SQLException {

            PreparedStatement st = null;
            ResultSet rs = null;

            DBconnection dBconnection = null;
            Connection connection = null;
            int totalCount = 0;

            int start = (page - 1) * maxRows;

            JsonArray jsonArray = new JsonArray();
            try {

                dBconnection = new DBconnection();
                connection = (Connection) dBconnection.getConnection();

                String selectQuery = "SELECT * FROM ApplicationDataView4 LIMIT ?, ?";
                st = connection.prepareStatement(selectQuery);
                st.setInt(1, start);
                st.setInt(2, maxRows);
                rs = st.executeQuery();

                reportMapping.reportMapping3(rs, jsonArray);
                String countQuery = "SELECT COUNT(*) AS total FROM ApplicationDataView4";
                st = connection.prepareStatement(countQuery);
                rs = st.executeQuery();
                if (rs.next()) {
                    totalCount = rs.getInt("total");
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

            // Create a JSON object to hold both data and total count
            JsonObject result = new JsonObject();
            result.addProperty("total", totalCount);
            result.add("data", jsonArray);

            System.out.println("JSON" + result);
            return result;
        }
    }




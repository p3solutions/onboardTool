package Report;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ReportExportService {

    ReportMapping reportMapping =new ReportMapping();

    public JsonArray getIntakeReport1() throws SQLException, ClassNotFoundException {

        PreparedStatement st = null;
        ResultSet rs = null;

        DBconnection dBconnection = null;
        Connection connection = null;

        JsonArray jsonArray = new JsonArray();
        try {
            dBconnection = new DBconnection();
            connection = (Connection) dBconnection.getConnection();

            String selectQuery = "SELECT * FROM decom3sixtytool.ApplicationDataView1 ";
            st = connection.prepareStatement(selectQuery);

            rs = st.executeQuery();

            reportMapping.reportMapping1(rs, jsonArray);


        } catch (Exception e) {
            System.out.println("Exception Occurs");
        }
        finally {
            assert st != null;
            st.close();
            assert rs != null;
            rs.close();
        }

        System.out.println("JSON" + jsonArray);
        return jsonArray;
    }


    public JsonArray getIntakeReport2() throws SQLException, ClassNotFoundException {

        PreparedStatement st = null;
        ResultSet rs = null;

        DBconnection dBconnection = null;
        Connection connection = null;

        JsonArray jsonArray = new JsonArray();
        try {
            dBconnection = new DBconnection();
            connection = (Connection) dBconnection.getConnection();

            String selectQuery = "SELECT * FROM decom3sixtytool.ApplicationDataView2 ";
            st = connection.prepareStatement(selectQuery);

            rs = st.executeQuery();

            reportMapping.reportMapping2(rs, jsonArray);


        } catch (Exception e) {
            System.out.println("Exception Occurs");
        }
        finally {
            assert st != null;
            st.close();
            assert rs != null;
            rs.close();
        }

        System.out.println("JSON" + jsonArray);
        return jsonArray;
    }
    public JsonArray getIntakeReport3() throws SQLException, ClassNotFoundException {

        PreparedStatement st = null;
        ResultSet rs = null;

        DBconnection dBconnection = null;
        Connection connection = null;

        JsonArray jsonArray = new JsonArray();
        try {
            dBconnection = new DBconnection();
            connection = (Connection) dBconnection.getConnection();

            String selectQuery = "SELECT * FROM decom3sixtytool.ApplicationDataView3 ";
            st = connection.prepareStatement(selectQuery);

            rs = st.executeQuery();

            reportMapping.reportMapping3(rs, jsonArray);


        } catch (Exception e) {
            System.out.println("Exception Occurs");
        }
        finally {
            assert st != null;
            st.close();
            assert rs != null;
            rs.close();
        }

        System.out.println("JSON" + jsonArray);
        return jsonArray;
    }
}

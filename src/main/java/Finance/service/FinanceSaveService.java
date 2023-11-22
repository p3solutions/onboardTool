package Finance.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.ResultSetMetaData;

public class FinanceSaveService {

    public void CreateNewFinanceSave(JsonArray array, String Id, String oppName) {
        PreparedStatement st = null, st1 = null;
        ResultSet rs = null;
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();

            // Print the number of columns in the result set
            String SelectQuery = "select * from decom3sixtytool.finance_template_details order by seq_no";
            st1 = connection.prepareStatement(SelectQuery);
            rs = st1.executeQuery();

            // Print the number of columns in the result set
            ResultSetMetaData metaData = rs.getMetaData();
            int columnCount = metaData.getColumnCount();
            System.out.println("Number of columns in result set: " + columnCount);

            // Print column names and indexes
            for (int i = 1; i <= columnCount; i++) {
                System.out.println("Column " + i + ": " + metaData.getColumnName(i));
            }

            while (rs.next()) {
                if (rs.getInt(1) <= 16) {
                    String Opportunity_InsertQuery = "insert into decom3sixtytool.finance_info (seq_no,Id, prj_name, app_name, options, label_name, column_name, type, mandatory, value)"
                            + "value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    PreparedStatement prestmt = connection.prepareStatement(Opportunity_InsertQuery);
                    prestmt.setInt(1, rs.getInt(1));
                    prestmt.setString(2, Id);
                    prestmt.setString(3, "");
                    prestmt.setString(4, "");
                    prestmt.setString(5, rs.getString(2));
                    prestmt.setString(6, rs.getString(3));
                    prestmt.setString(7, rs.getString(4));
                    prestmt.setString(8, rs.getString(5));
                    prestmt.setString(9, rs.getString(6));
                    prestmt.setString(10, rs.getString(7));
                    prestmt.execute();
                    prestmt.close(); // Close the statement after execution
                }
            }

            for (int i = 0; i < array.size(); i++) {
                JsonObject jsonObj = array.get(i).getAsJsonObject();
                String name = jsonObj.get("Name").getAsString();
                String value = jsonObj.get("Value").getAsString();
                String SelectQuery1 = "select * from finance_Info where id =? and column_name=?;";
                PreparedStatement sta1 = connection.prepareStatement(SelectQuery1);
                sta1.setString(1, Id);
                sta1.setString(2, name);
                ResultSet rs1 = sta1.executeQuery();
                if (rs1.next()) {
                    String UpdateQuery = "update finance_Info set value=?, app_name = ? where id =? and column_name =?";
                    PreparedStatement sta2 = connection.prepareStatement(UpdateQuery);
                    sta2.setString(1, value);
                    sta2.setString(2, oppName);
                    sta2.setString(3, Id);
                    sta2.setString(4, name);
                    sta2.execute();
                    sta2.close(); // Close the statement after execution
                }
                sta1.close(); // Close the statement after execution
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("SQL Exception: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception: " + e.getMessage());
        } finally {
            try {
                if (st1 != null) {
                    st1.close();
                }
                if (rs != null) {
                    rs.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("Error closing resources: " + e.getMessage());
            }
        }
    }
}

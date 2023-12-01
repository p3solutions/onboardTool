package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class FinanceFieldEditService {

public static JsonObject FinanceLabelEdit(String label_name, int sequencenumber) {
		PreparedStatement st=null,st1=null;
		ResultSet rs=null,rs1=null;
        JsonObject jsonobj = new JsonObject();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String PreviouslabelQuery = "select label_name from Finance_Informations_Details where seq_no ='"
                    + sequencenumber + "';";
			st1 = connection.prepareStatement(PreviouslabelQuery);
			rs1 = st1.executeQuery();
            if (rs1.next()) {
                jsonobj.addProperty("previous_label_name", rs1.getString(1));
            }
            String update_query = "update Finance_Informations_Details set label_name =? where seq_no='" + sequencenumber
                    + "'";
            PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
            preparedStmt1.setString(1, label_name);
            preparedStmt1.execute();
            String SelectQuery = "select * from Finance_Informations_Details where seq_no ='" + sequencenumber + "';";
			st = connection.prepareStatement(SelectQuery);
			rs = st.executeQuery();
            int i = 1;
            if (rs.next()) {
                ResultSetMetaData rsmd = rs.getMetaData();
                while (i <= rsmd.getColumnCount()) {
                    jsonobj.addProperty(rs.getMetaData().getColumnName(i), rs.getString(i));
                    i++;
                }
            }
		st.close();
		rs.close();
		st1.close();
		rs1.close();
        } catch (Exception e) {
            System.out.println("Exception---->>>>" + e);
        }
        System.out.println("Json object " + jsonobj);
        return jsonobj;
    }}
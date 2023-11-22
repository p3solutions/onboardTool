package Finance.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Finance_Template_Retrieve_Service {
    public JsonArray templateRetrieve() {
        PreparedStatement statementforcheck = null;
        ResultSet Resultset=null;
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String query = "select * from finance_template_details order by seq_no;";
            statementforcheck = connection.prepareStatement(query);
            Resultset = statementforcheck.executeQuery();
            if (Resultset.next()) {
                String value = Resultset.getString("value");
                JsonObject jsonObject1 = new JsonObject();
                jsonObject1.addProperty("seq_num", Resultset.getString("seq_no"));
                jsonObject1.addProperty("options", Resultset.getString("options"));
                jsonObject1.addProperty("LabelName", Resultset.getString("label_name"));
                jsonObject1.addProperty("ColumnName", Resultset.getString("column_name"));
                jsonObject1.addProperty("Type", Resultset.getString("type"));
                jsonObject1.addProperty("Mandatory", Resultset.getString("mandatory"));
                jsonObject1.addProperty("Value", value);
                jsonArray.add(jsonObject1);
                while (Resultset.next()) {
                    //String value1 = Resultset.getString("column_name").equals("apmid") ? randomNumber
                    //  : Resultset.getString("value");
                    String value1 = Resultset.getString("value");
                    JsonObject jsonObject2 = new JsonObject();
                    jsonObject2.addProperty("seq_num", Resultset.getString("seq_no"));
                    jsonObject2.addProperty("options", Resultset.getString("options"));
                    jsonObject2.addProperty("LabelName", Resultset.getString("label_name"));
                    jsonObject2.addProperty("ColumnName", Resultset.getString("column_name"));
                    jsonObject2.addProperty("Type", Resultset.getString("type"));
                    jsonObject2.addProperty("Mandatory", Resultset.getString("mandatory"));
                    jsonObject2.addProperty("Value", value1);
                    jsonArray.add(jsonObject2);
                }
            }
            statementforcheck.close();
            Resultset.close();
        } catch (Exception e) {
            System.out.println("Exception--->>" + e);
        }
        return jsonArray;
    }
}

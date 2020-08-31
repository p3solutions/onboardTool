package ArchiveExecution.Service;

import admin_module_modify.service.Modify_List_User_Service;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;
import org.json.JSONObject;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ArchiveExecutionDataRetrieve {
    final static Logger logger = Logger.getLogger(ArchiveExecutionDataRetrieve.class);

    public JsonObject ProgressBarDataRetrieve(String id) throws SQLException, ClassNotFoundException {
        DBconnection dBconnection = new DBconnection();
        String projectname="";
        Connection connection = (Connection) dBconnection.getConnection();
        String query = "select * from AppEmphazize_ProjectDetails where id = " + id + ";";
        Statement st = connection.createStatement();
        ResultSet rs = st.executeQuery(query);
        if(rs.next()) {
           projectname = rs.getString("projectname");
        }
        JsonObject json = new JsonObject();
        String progress_bar_query = "select * from archiveexecution_details where projects='" + projectname + "' and level=1;";
        Statement statement = connection.createStatement();
        ResultSet resultSet = statement.executeQuery(progress_bar_query);
        while (resultSet.next()) {
            String key = resultSet.getString(3);
            String value = resultSet.getString(15);
            json.addProperty(key, value);
            // System.out.println("prgb "+json);
        }
        connection.close();
        return json;
    }

    public JsonArray TabledataRetrieval(String project_id) {
        JsonArray jsonArray = new JsonArray();
        String projectname="";
        try {

            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            //query for retrieving the table data
            String query7 = "select * from AppEmphazize_ProjectDetails where id = " + project_id;
            Statement st7 = connection.createStatement();
            ResultSet rs7 = st7.executeQuery(query7);
            if(rs7.next())
            {
                projectname=rs7.getString("projectname");
            }

            String query = "select * from archiveexecution_details where projects='"+projectname+"'order by seq_num;";
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(query);

            while (resultSet.next()) {
                JsonObject infoJson = new JsonObject();
                int total_rows = resultSet.getMetaData().getColumnCount();
                for (int i = 0; i < total_rows; i++) {

                    infoJson.addProperty(resultSet.getMetaData().getColumnLabel(i + 1).toLowerCase(), resultSet.getString(i + 1));
                }
                jsonArray.add(infoJson);
            }
            JsonObject lastobject = new JsonObject();
            String dummy_query="select * from dummy;";
            Statement dummy_statement=connection.createStatement();
            ResultSet dummy_value=dummy_statement.executeQuery(dummy_query);
            if(dummy_value.next())
            {
                lastobject.addProperty(dummy_value.getMetaData().getColumnLabel(1).toLowerCase(),dummy_value.getString(1));
            }
            String level1_query="select * from archiveexecution_details where projects='"+projectname+"' and level=1 order by seq_num";
            Statement level1_statement=connection.createStatement();
            ResultSet level1_value=level1_statement.executeQuery(level1_query);
            while(level1_value.next())
            {
                lastobject.addProperty(level1_value.getString(3).replace(" ",""),level1_value.getString(1));
            }
            lastobject.addProperty("projectname",projectname);
            jsonArray.add(lastobject);
            JsonObject parent_seq_num=new Read_Only_Seq_Number().Read_Seq_Number(project_id);
            jsonArray.add(parent_seq_num);
            System.out.println("hello"+jsonArray);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonArray;
    }
}

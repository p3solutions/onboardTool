package DecommManager.service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class DecommManageExecuteInfoService {
    public static JsonArray DecommManageExecuteInfoDataRetrieveService(String projectname, String applicationname)
    {
        JsonArray jsonArray = new JsonArray();
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String query = "select * from decomm_manage_execution_info where prj_name = '"+projectname+"' and app_name = '"+applicationname+"'";
            Statement statementforcheck=connection.createStatement();
            ResultSet Resultset=statementforcheck.executeQuery(query);
            if(Resultset.next()){
                JsonObject jsonObject1=new JsonObject();
                jsonObject1.addProperty("seq_num",Resultset.getString("seq_num"));
                jsonObject1.addProperty("Project_Name",Resultset.getString("prj_name"));
                jsonObject1.addProperty("App_Name",Resultset.getString("app_name"));
                jsonObject1.addProperty("options",Resultset.getString("options"));
                jsonObject1.addProperty("LabelName",Resultset.getString("label_name"));
                jsonObject1.addProperty("ColumnName",Resultset.getString("column_name"));
                jsonObject1.addProperty("Type",Resultset.getString("type"));
                jsonObject1.addProperty("Mandatory",Resultset.getString("mandatory"));
                jsonObject1.addProperty("Value",Resultset.getString("value"));
                jsonArray.add(jsonObject1);
                while(Resultset.next())
                {
                    JsonObject jsonObject2=new JsonObject();
                    jsonObject2.addProperty("seq_num",Resultset.getString("seq_num"));
                    jsonObject2.addProperty("Project_Name",Resultset.getString("prj_name"));
                    jsonObject2.addProperty("App_Name",Resultset.getString("app_name"));
                    jsonObject2.addProperty("options",Resultset.getString("options"));
                    jsonObject2.addProperty("LabelName",Resultset.getString("label_name"));
                    jsonObject2.addProperty("ColumnName",Resultset.getString("column_name"));
                    jsonObject2.addProperty("Type",Resultset.getString("type"));
                    jsonObject2.addProperty("Mandatory",Resultset.getString("mandatory"));
                    jsonObject2.addProperty("Value",Resultset.getString("value"));
                    jsonArray.add(jsonObject2);
                }
            }
        }
        catch(Exception e){
            System.out.println("Exception--->>"+e);
        }
        return jsonArray;
    }
    public static void DecommManagerAddOperationService(String projectname,String applicationname,String label_name,String column_name,String mandatory,String type,int NumberofInputfields,String options)
    {
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String select_query = "select * from decomm_manage_execution_info where prj_name='" + projectname + "' and app_name='" + applicationname + "' order by seq_num;";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(select_query);
            String name = "ExecuteInfo";
            int max_seq_num = 1;
            if (rs.next()) {
                String max_seqnum = "select max(seq_num) from decomm_manage_execution_info where prj_name='" + projectname + "'and app_name='" + applicationname + "';";
                Statement st1 = connection.createStatement();
                ResultSet rs1 = st1.executeQuery(max_seqnum);

                if (rs1.next()) {
                    max_seq_num = Integer.parseInt(rs1.getString(1));
                    max_seq_num++;
                }
            }
            if (!type.equals("Text box") && !type.equals("Datepicker")) {
                options = options.substring(0, options.length() - 1);
            }
            String insert_query = "insert into decomm_manage_execution_info (seq_num,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?,?,?,?,?,?,?,?,?);";
            PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
            preparedStatement1.setInt(1, max_seq_num);
            preparedStatement1.setString(2, projectname);
            preparedStatement1.setString(3, applicationname);
            preparedStatement1.setString(4, options);
            preparedStatement1.setString(5, label_name);
            preparedStatement1.setString(6, (name+max_seq_num));
            preparedStatement1.setString(7, type);
            preparedStatement1.setString(8, mandatory);
            preparedStatement1.setString(9, "");
            preparedStatement1.execute();
        }
        catch(Exception e)
        {
            System.out.println("Exception---[info]------"+e);
        }
    }
    public static void DecommManagerModifyOperationService(String projectname,String applicationname, String label_name,int sequencenumber)
    {
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            /*String option="";
            for(int i=0;i<options.length;i++)
            {
                option+=options[i]+",";
            }
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            if(type.equals("Radio box")||type.equals("Check box")||type.equals("Dropdown")) {
               String updatequery="update decomm_legacy_add_table set label_name=?,type=?,mandatory=?,options=? where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and seq_num='"+sequencenumber+"'";
                PreparedStatement preparedStmt1 = connection.prepareStatement(updatequery);
                preparedStmt1.setString(1, label_name);
                preparedStmt1.setString(2, type);
                preparedStmt1.setString(3, mandatory);
                preparedStmt1.setString(4,option);
                preparedStmt1.execute();
            }
            else {
                String update_query = "update decomm_legacy_add_table set label_name =?, type =?, mandatory=? where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and seq_num='"+sequencenumber+"'";
                PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
                preparedStmt1.setString(1, label_name);
                preparedStmt1.setString(2, type);
                preparedStmt1.setString(3, mandatory);
                preparedStmt1.execute();
            }*/

            String update_query = "update decomm_manage_execution_info set label_name =? where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and seq_num='"+sequencenumber+"'";
            PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
            preparedStmt1.setString(1, label_name);
            preparedStmt1.execute();
        }
        catch(Exception e){
            System.out.println("Exception---->>>>"+e);
        }
    }
    public static void DecommManagerDeleteOperationService(String projectname,String applicationname, int  delete_seqnum)
    {
        try{
            int seqmax = 0;
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            ArrayList<Integer> arr_seqmax = new ArrayList<Integer>();
            ArrayList<String> arr_prj = new ArrayList<String>();
            ArrayList<String> arr_app = new ArrayList<String>();
            ArrayList<String> arr_options = new ArrayList<String>();
            ArrayList<String> arr_label_name = new ArrayList<String>();
            ArrayList<String> arr_column_name = new ArrayList<String>();
            ArrayList<String> arr_type = new ArrayList<String>();
            ArrayList<String> arr_mandatory = new ArrayList<String>();
            ArrayList<String> arr_value = new ArrayList<String>();

            ArrayList<Integer> arr_seqmax_split = new ArrayList<Integer>();
            ArrayList<String> arr_prj_split = new ArrayList<String>();
            ArrayList<String> arr_app_split = new ArrayList<String>();
            ArrayList<String> arr_options_split = new ArrayList<String>();
            ArrayList<String> arr_label_name_split = new ArrayList<String>();
            ArrayList<String> arr_column_name_split = new ArrayList<String>();
            ArrayList<String> arr_type_split = new ArrayList<String>();
            ArrayList<String> arr_mandatory_split = new ArrayList<String>();
            ArrayList<String> arr_value_split = new ArrayList<String>();


            String select_query="select max(seq_num) from decomm_manage_execution_info where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by seq_num;";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(select_query);
            if(rs.next()) {
                seqmax = Integer.parseInt(rs.getString(1));
            }

            String query = "select * from decomm_manage_execution_info where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by seq_num;";
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query);
            while(rs1.next()){
                arr_seqmax.add(rs1.getInt(1));
                arr_prj.add(rs1.getString(2));
                arr_app.add(rs1.getString(3));
                arr_options.add(rs1.getString(4));
                arr_label_name.add(rs1.getString(5));
                arr_column_name.add(rs1.getString(6));
                arr_type.add(rs1.getString(7));
                arr_mandatory.add(rs1.getString(8));
                arr_value.add(rs1.getString(9));
            }

            for (int i=0; i<seqmax; i++)
            {
                if(arr_seqmax.get(i)< delete_seqnum )
                {
                    arr_seqmax_split.add(arr_seqmax.get(i));
                    arr_prj_split.add(arr_prj.get(i));
                    arr_app_split.add(arr_app.get(i));
                    arr_options_split.add(arr_options.get(i));
                    arr_label_name_split.add(arr_label_name.get(i));
                    arr_column_name_split.add(arr_column_name.get(i));
                    arr_type_split.add(arr_type.get(i));
                    arr_mandatory_split.add(arr_mandatory.get(i));
                    arr_value_split.add(arr_value.get(i));
                }
                else if(arr_seqmax.get(i)> delete_seqnum){
                    arr_seqmax_split.add((arr_seqmax.get(i)-1));
                    arr_prj_split.add(arr_prj.get(i));
                    arr_app_split.add(arr_app.get(i));
                    arr_options_split.add(arr_options.get(i));
                    arr_label_name_split.add(arr_label_name.get(i));
                    arr_column_name_split.add("ExecuteInfo"+(arr_seqmax.get(i)-1));
                    arr_type_split.add(arr_type.get(i));
                    arr_mandatory_split.add(arr_mandatory.get(i));
                    arr_value_split.add(arr_value.get(i));
                }
            }

            String delete_query = "delete from decomm_manage_execution_info where prj_name='"+projectname+"' and app_name='"+applicationname+"' ";
            Statement st2=connection.createStatement();
            st2.executeUpdate(delete_query);
            for  (int j=0; j<seqmax-1; j++){
                String insert_query = "insert into decomm_manage_execution_info (seq_num,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?,?,?,?,?,?,?,?,?);";
                PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
                preparedStatement1.setInt(1,arr_seqmax_split.get(j));
                preparedStatement1.setString(2, arr_prj_split.get(j));
                preparedStatement1.setString(3, arr_app_split.get(j));
                preparedStatement1.setString(4,arr_options_split.get(j));
                preparedStatement1.setString(5, arr_label_name_split.get(j));
                preparedStatement1.setString(6, arr_column_name_split.get(j));
                preparedStatement1.setString(7, arr_type_split.get(j));
                preparedStatement1.setString(8, arr_mandatory_split.get(j));
                preparedStatement1.setString(9, arr_value_split.get(j));
                preparedStatement1.execute();
            }

        }
        catch(Exception e){
            System.out.println("Exception---->>>"+e);
        }
    }
    public static JsonArray DecommManageExecuteInfraCompDataRetrieveService(String projectname, String applicationname)
        {
            JsonArray jsonArray = new JsonArray();
            try {
                DBconnection dBconnection = new DBconnection();
                Connection connection = (Connection) dBconnection.getConnection();
                String select_query = "select * from decomm_manage_infra_comp where prj_name = '"+projectname+"' and app_name = '"+applicationname+"' order by seq_num";
                Statement statementforcheck=connection.createStatement();
                ResultSet rs=statementforcheck.executeQuery(select_query);
                if(rs.next()){
                    JsonObject jsonObject1 = new JsonObject();
                    jsonObject1.addProperty("CheckExistance",true);
                    jsonArray.add(jsonObject1);
                    JsonObject jsonObject = new JsonObject();
                    jsonObject.addProperty("Seq_Num", rs.getString("seq_num"));
                    jsonObject.addProperty("Prj_Name", rs.getString("prj_name"));
                    jsonObject.addProperty("App_Name", rs.getString("app_name"));
                    jsonObject.addProperty("Infra_Comp_Type", rs.getString("infra_comp_type"));
                    jsonObject.addProperty("Comp_Name", rs.getString("Comp_Name"));
                    jsonObject.addProperty("Managed_Legacy", rs.getString("managed_legacy"));
                    jsonObject.addProperty("Server_App", rs.getString("Server_App"));
                    jsonObject.addProperty("Dev", rs.getString("dev"));
                    jsonObject.addProperty("Test", rs.getString("test"));
                    jsonObject.addProperty("Stage", rs.getString("stage"));
                    jsonObject.addProperty("Prod", rs.getString("prod"));
                    jsonObject.addProperty("Retired", rs.getString("retired"));
                    jsonObject.addProperty("Comments", rs.getString("comments"));
                    jsonArray.add(jsonObject);
                    while(rs.next()){
                        JsonObject jsonObject2 = new JsonObject();
                        jsonObject2.addProperty("Seq_Num", rs.getString("seq_num"));
                        jsonObject2.addProperty("Prj_Name", rs.getString("prj_name"));
                        jsonObject2.addProperty("App_Name", rs.getString("app_name"));
                        jsonObject2.addProperty("Infra_Comp_Type", rs.getString("infra_comp_type"));
                        jsonObject2.addProperty("Comp_Name", rs.getString("Comp_Name"));
                        jsonObject2.addProperty("Managed_Legacy", rs.getString("managed_legacy"));
                        jsonObject2.addProperty("Server_App", rs.getString("Server_App"));
                        jsonObject2.addProperty("Dev", rs.getString("dev"));
                        jsonObject2.addProperty("Test", rs.getString("test"));
                        jsonObject2.addProperty("Stage", rs.getString("stage"));
                        jsonObject2.addProperty("Prod", rs.getString("prod"));
                        jsonObject2.addProperty("Retired", rs.getString("retired"));
                        jsonObject2.addProperty("Comments", rs.getString("comments"));
                        jsonArray.add(jsonObject2);
                    }
                }
                else{
                    JsonObject jsonObject3=new JsonObject();
                    jsonObject3.addProperty("CheckExistance",false);
                    jsonArray.add(jsonObject3);
                }

              } catch (Exception e) {
                System.out.println("Exception......" + e);
            }
            return jsonArray;
        }
    public static void DecommManageInfraCompDataAddService(String projectname, String applicationname)
    {
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String  max_seq_num_Query="select max(seq_num) from decomm_manage_infra_comp where prj_name='"+projectname+"' and app_name='"+applicationname+"';";
            Statement max_seqnum_statement=connection.createStatement();
            ResultSet result_max_seqnum=max_seqnum_statement.executeQuery(max_seq_num_Query);
            int Max_Seq_Number=1;
            if(result_max_seqnum.next())
            {
                if(result_max_seqnum.getString(1)!= null)
                Max_Seq_Number=Integer.parseInt(result_max_seqnum.getString(1))+1;
            }
            String insertQuery="insert into decomm_manage_infra_comp(seq_num,prj_name,app_name,infra_comp_type,comp_name,managed_legacy,server_app,dev,test,stage,prod,retired,comments) values('"+Max_Seq_Number+"','"+projectname+"','"+applicationname +"','','','','','','','','','','');";
            Statement update_statement=connection.createStatement();
            update_statement.executeUpdate(insertQuery);
        }
        catch(Exception e){
            System.out.println("Exception---->>>"+e);
        }
    }
    public static void DecommManagerInfraCompDeleteService(String projectname,String applicationname, int  delete_seqnum)
    {
        try{
            int seqmax = 0;
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            ArrayList<Integer> arr_seqmax = new ArrayList<Integer>();
            ArrayList<String> arr_prj = new ArrayList<String>();
            ArrayList<String> arr_app = new ArrayList<String>();
            ArrayList<String> arr_infra_comp_type = new ArrayList<String>();
            ArrayList<String> arr_comp_name = new ArrayList<String>();
            ArrayList<String> arr_managed_legacy = new ArrayList<String>();
            ArrayList<String> arr_server_app = new ArrayList<String>();
            ArrayList<String> arr_dev = new ArrayList<String>();
            ArrayList<String> arr_test = new ArrayList<String>();
            ArrayList<String> arr_stage = new ArrayList<String>();
            ArrayList<String> arr_prod = new ArrayList<String>();
            ArrayList<String> arr_retired = new ArrayList<String>();
            ArrayList<String> arr_comments = new ArrayList<String>();

            ArrayList<Integer> arr_seqmax_split = new ArrayList<Integer>();
            ArrayList<String> arr_prj_split = new ArrayList<String>();
            ArrayList<String> arr_app_split = new ArrayList<String>();
            ArrayList<String> arr_infra_comp_type_split = new ArrayList<String>();
            ArrayList<String> arr_comp_name_split = new ArrayList<String>();
            ArrayList<String> arr_managed_legacy_split = new ArrayList<String>();
            ArrayList<String> arr_server_app_split = new ArrayList<String>();
            ArrayList<String> arr_dev_split = new ArrayList<String>();
            ArrayList<String> arr_test_split = new ArrayList<String>();
            ArrayList<String> arr_stage_split = new ArrayList<String>();
            ArrayList<String> arr_prod_split = new ArrayList<String>();
            ArrayList<String> arr_retired_split = new ArrayList<String>();
            ArrayList<String> arr_comments_split = new ArrayList<String>();

            String select_query="select max(seq_num) from decomm_manage_infra_comp where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by seq_num;";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(select_query);
            if(rs.next()) {
                seqmax = Integer.parseInt(rs.getString(1));
            }

            String query = "select * from decomm_manage_infra_comp where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by seq_num;";
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query);
            while(rs1.next()) {
                arr_seqmax.add(rs1.getInt(1));
                arr_prj.add(rs1.getString(2));
                arr_app.add(rs1.getString(3));
                arr_infra_comp_type.add(rs1.getString(4));
                arr_comp_name.add(rs1.getString(5));
                arr_managed_legacy.add(rs1.getString(6));
                arr_server_app.add(rs1.getString(7));
                arr_dev.add(rs1.getString(8));
                arr_test.add(rs1.getString(9));
                arr_stage.add(rs1.getString(10));
                arr_prod.add(rs1.getString(11));
                arr_retired.add(rs1.getString(12));
                arr_comments.add(rs1.getString(13));
            }
            for (int i=0; i<seqmax; i++) {
                if (arr_seqmax.get(i) < delete_seqnum) {
                    arr_seqmax_split.add(arr_seqmax.get(i));
                    arr_prj_split.add(arr_prj.get(i));
                    arr_app_split.add(arr_app.get(i));
                    arr_infra_comp_type_split.add(arr_infra_comp_type.get(i));
                    arr_comp_name_split.add(arr_comp_name.get(i));
                    arr_managed_legacy_split.add(arr_managed_legacy.get(i));
                    arr_server_app_split.add(arr_server_app.get(i));
                    arr_dev_split.add(arr_dev.get(i));
                    arr_test_split.add(arr_test.get(i));
                    arr_stage_split.add(arr_stage.get(i));
                    arr_prod_split.add(arr_prod.get(i));
                    arr_retired_split.add(arr_retired.get(i));
                    arr_comments_split.add(arr_comments.get(i));
                }
                else if(arr_seqmax.get(i) > delete_seqnum){
                    arr_seqmax_split.add((arr_seqmax.get(i)-1));
                    arr_prj_split.add(arr_prj.get(i));
                    arr_app_split.add(arr_app.get(i));
                    arr_infra_comp_type_split.add(arr_infra_comp_type.get(i));
                    arr_comp_name_split.add(arr_comp_name.get(i));
                    arr_managed_legacy_split.add(arr_managed_legacy.get(i));
                    arr_server_app_split.add(arr_server_app.get(i));
                    arr_dev_split.add(arr_dev.get(i));
                    arr_test_split.add(arr_test.get(i));
                    arr_stage_split.add(arr_stage.get(i));
                    arr_prod_split.add(arr_prod.get(i));
                    arr_retired_split.add(arr_retired.get(i));
                    arr_comments_split.add(arr_comments.get(i));
                }
            }

            String delete_query = "delete from decomm_manage_infra_comp where prj_name='"+projectname+"' and app_name='"+applicationname+"' ";
            Statement st2=connection.createStatement();
            st2.executeUpdate(delete_query);
            for  (int j=0; j<seqmax-1; j++) {
                String insert_query = "insert into decomm_manage_infra_comp (seq_num,prj_name,app_name,infra_comp_type,comp_name,managed_legacy,server_app,dev,test,stage,prod,retired,comments) values(?,?,?,?,?,?,?,?,?,?,?,?,?);";
                PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
                preparedStatement1.setInt(1, arr_seqmax_split.get(j));
                preparedStatement1.setString(2, arr_prj_split.get(j));
                preparedStatement1.setString(3, arr_app_split.get(j));
                preparedStatement1.setString(4, arr_infra_comp_type_split.get(j));
                preparedStatement1.setString(5, arr_comp_name_split.get(j));
                preparedStatement1.setString(6, arr_managed_legacy_split.get(j));
                preparedStatement1.setString(7, arr_server_app_split.get(j));
                preparedStatement1.setString(8, arr_dev_split.get(j));
                preparedStatement1.setString(9, arr_test_split.get(j));
                preparedStatement1.setString(10, arr_stage_split.get(j));
                preparedStatement1.setString(11, arr_prod_split.get(j));
                preparedStatement1.setString(12, arr_retired_split.get(j));
                preparedStatement1.setString(13, arr_comments_split.get(j));
                preparedStatement1.execute();
            }
        }
        catch(Exception e){
            System.out.println("Exception---->>>"+e);
        }
    }
    public static void DecommManageInfraCompSaveService(String projectname, String applicationname, int seq_num, String infra_comp, String comp_name, String manage_legacy, String server_app, String dev, String test, String stage, String prod, String retired, String textarea)
    {
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String select_query = "select * from decomm_manage_infra_comp where prj_name = '"+projectname+"' and app_name = '"+applicationname+"' and seq_num = '"+seq_num+"'";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(select_query);
            if (rs.next()){
                String update_query = "update decomm_manage_infra_comp set infra_comp_type =?, comp_name=?, managed_legacy=?, server_app=?, dev=?, test=?, stage=?, prod=?, retired=?, comments=? where prj_name = '"+projectname+"' and app_name = '"+applicationname+"' and seq_num = '"+seq_num+"'";
                PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
                preparedStmt1.setString(1, infra_comp);
                preparedStmt1.setString(2, comp_name);
                preparedStmt1.setString(3, manage_legacy);
                preparedStmt1.setString(4, server_app);
                preparedStmt1.setString(5, dev);
                preparedStmt1.setString(6, test);
                preparedStmt1.setString(7, stage);
                preparedStmt1.setString(8, prod);
                preparedStmt1.setString(9, retired);
                preparedStmt1.setString(10, textarea);
                preparedStmt1.execute();
            }
            else{
                String insert_query = "insert into decomm_manage_infra_comp (seq_num,prj_name,app_name,infra_comp_type,comp_name,managed_legacy,server_app,dev,test,stage,prod,retired,comments) values(?,?,?,?,?,?,?,?,?,?,?,?,?);";
                PreparedStatement preparedStmt2 = connection.prepareStatement(insert_query);
                preparedStmt2.setInt(1, seq_num);
                preparedStmt2.setString(2, projectname);
                preparedStmt2.setString(3, applicationname);
                preparedStmt2.setString(4, infra_comp);
                preparedStmt2.setString(5, comp_name);
                preparedStmt2.setString(6, manage_legacy);
                preparedStmt2.setString(7, server_app);
                preparedStmt2.setString(8, dev);
                preparedStmt2.setString(9, test);
                preparedStmt2.setString(10, stage);
                preparedStmt2.setString(11, prod);
                preparedStmt2.setString(12, retired);
                preparedStmt2.setString(13, textarea);
                preparedStmt2.execute();
            }
        }
        catch(Exception e){
            System.out.println("Exception---->>>"+e);
        }
    }

    public static JsonArray DecommManageServiceCategoriesDataRetrieveService(String projectname, String applicationname)
    {
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String query = "select * from decomm_manage_service_categories_checklist where prj_name = '"+projectname+"' and app_name = '"+applicationname+"'";
            Statement statementforcheck=connection.createStatement();
            ResultSet Resultset=statementforcheck.executeQuery(query);
            String others_value_if[];
            String others_value_while[];
            if(Resultset.next()){
                JsonObject jsonObject1=new JsonObject();
                jsonObject1.addProperty("seq_num",Resultset.getString("seq_num"));
                jsonObject1.addProperty("Project_Name",Resultset.getString("prj_name"));
                jsonObject1.addProperty("App_Name",Resultset.getString("app_name"));
                jsonObject1.addProperty("options",Resultset.getString("options"));
                jsonObject1.addProperty("LabelName",Resultset.getString("label_name"));
                jsonObject1.addProperty("ColumnName",Resultset.getString("column_name"));
                jsonObject1.addProperty("Type",Resultset.getString("type"));
                jsonObject1.addProperty("Mandatory",Resultset.getString("mandatory"));
                jsonObject1.addProperty("Value",Resultset.getString("value"));

                if(Resultset.getString("type").equals("Others"))
                {
                    others_value_while=Resultset.getString("value").split(",");
                    JsonArray others_jsonArray = new JsonArray();
                    for(int index2=0;index2<others_value_while.length;index2++) {
                        String OthersTableQuery = "select * from decomm_manage_service_categories_checklist_others where prj_name='" + projectname + "' and app_name='" + applicationname + "' and others='" + others_value_while[index2] + "';";
                        Statement statement_others = connection.createStatement();
                        ResultSet resultset_others = statement_others.executeQuery(OthersTableQuery);
                        if(!others_value_while[index2].equals("Application Security")) {
                            while (resultset_others.next()) {
                                JsonObject others_jsonobject = new JsonObject();
                                others_jsonobject.addProperty("Others", resultset_others.getString("others"));
                                others_jsonobject.addProperty("Questions", resultset_others.getString("questions"));
                                others_jsonobject.addProperty("Type", resultset_others.getString("type"));
                                others_jsonobject.addProperty("Value", resultset_others.getString("value"));
                                others_jsonArray.add(others_jsonobject);
                            }
                        }
                        else
                        {
                            JsonObject jsonobjectothers=new JsonObject();
                            jsonobjectothers.addProperty("Others","Application Security");
                            JsonArray jsonarrayAppSec=new JsonArray();
                            while (resultset_others.next()) {
                                JsonObject others_jsonobject = new JsonObject();
                                others_jsonobject.addProperty("Others", resultset_others.getString("others"));
                                others_jsonobject.addProperty("Questions", resultset_others.getString("questions"));
                                others_jsonobject.addProperty("Type", resultset_others.getString("type"));
                                others_jsonobject.addProperty("Value", resultset_others.getString("value"));
                                jsonarrayAppSec.add(others_jsonobject);
                            }
                            jsonobjectothers.add("values",jsonarrayAppSec);
                            others_jsonArray.add(jsonobjectothers);
                        }
                        System.out.println("jaon object in if"+others_jsonArray);
                        jsonObject1.add("OthersJsonArray", others_jsonArray);
                    }
                }
                jsonArray.add(jsonObject1);
                while(Resultset.next())
                {
                    JsonObject jsonObject2=new JsonObject();
                    jsonObject2.addProperty("seq_num",Resultset.getString("seq_num"));
                    jsonObject2.addProperty("Project_Name",Resultset.getString("prj_name"));
                    jsonObject2.addProperty("App_Name",Resultset.getString("app_name"));
                    jsonObject2.addProperty("options",Resultset.getString("options"));
                    jsonObject2.addProperty("LabelName",Resultset.getString("label_name"));
                    jsonObject2.addProperty("ColumnName",Resultset.getString("column_name"));
                    jsonObject2.addProperty("Type",Resultset.getString("type"));
                    jsonObject2.addProperty("Mandatory",Resultset.getString("mandatory"));
                    jsonObject2.addProperty("Value",Resultset.getString("value"));
                    if(Resultset.getString("type").equals("Others"))
                    {
                        others_value_while=Resultset.getString("value").split(",");
                        JsonArray others_jsonArray = new JsonArray();
                        for(int index2=0;index2<others_value_while.length;index2++) {
                            String OthersTableQuery = "select * from decomm_manage_service_categories_checklist_others where prj_name='" + projectname + "' and app_name='" + applicationname + "' and others='" + others_value_while[index2] + "';";
                            Statement statement_others = connection.createStatement();
                            ResultSet resultset_others = statement_others.executeQuery(OthersTableQuery);
                            if(!others_value_while[index2].equals("Application Security")) {
                                while (resultset_others.next()) {
                                    JsonObject others_jsonobject = new JsonObject();
                                    others_jsonobject.addProperty("Others", resultset_others.getString("others"));
                                    others_jsonobject.addProperty("Questions", resultset_others.getString("questions"));
                                    others_jsonobject.addProperty("Type", resultset_others.getString("type"));
                                    others_jsonobject.addProperty("Value", resultset_others.getString("value"));
                                    others_jsonArray.add(others_jsonobject);
                                }
                            }
                            else
                            {
                                JsonObject jsonobjectothers=new JsonObject();
                                jsonobjectothers.addProperty("Others","Application Security");
                                JsonArray jsonarrayAppSec=new JsonArray();
                                while (resultset_others.next()) {
                                    JsonObject others_jsonobject = new JsonObject();
                                    others_jsonobject.addProperty("Others", resultset_others.getString("others"));
                                    others_jsonobject.addProperty("Questions", resultset_others.getString("questions"));
                                    others_jsonobject.addProperty("Type", resultset_others.getString("type"));
                                    others_jsonobject.addProperty("Value", resultset_others.getString("value"));
                                    jsonarrayAppSec.add(others_jsonobject);
                                }
                                jsonobjectothers.add("values",jsonarrayAppSec);
                                others_jsonArray.add(jsonobjectothers);
                            }
                            System.out.println("others_json_array in while"+others_jsonArray);
                            jsonObject2.add("OthersJsonArray", others_jsonArray);
                        }
                        }
                    jsonArray.add(jsonObject2);
                }
            }
        }
        catch (Exception e) {
            System.out.println("Exception......" + e);
        }
        System.out.println("Decomm Execution Data Retrieve  Json Array---->"+jsonArray);
            return jsonArray;
    }
    public static void DecommManageServiceCategoriesAddService(String projectname,String applicationname,String label_name,String column_name,String mandatory,String type,int NumberofInputfields,String options) {
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String select_query = "select * from decomm_manage_service_categories_checklist where prj_name='" + projectname + "' and app_name='" + applicationname + "' order by seq_num;";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(select_query);
            String name = "ServiceCategories";
            int max_seq_num = 1;
            if (rs.next()) {
                String max_seqnum = "select max(seq_num) from decomm_manage_service_categories_checklist where prj_name='" + projectname + "'and app_name='" + applicationname + "';";
                Statement st1 = connection.createStatement();
                ResultSet rs1 = st1.executeQuery(max_seqnum);

                if (rs1.next()) {
                    max_seq_num = Integer.parseInt(rs1.getString(1));
                    max_seq_num++;
                }
            }
            if (!type.equals("Text box") && !type.equals("Datepicker")) {
               // options = options.substring(0, options.length() - 1);
            }
            String insert_query = "insert into decomm_manage_service_categories_checklist (seq_num,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?,?,?,?,?,?,?,?,?);";
            PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
            preparedStatement1.setInt(1, max_seq_num);
            preparedStatement1.setString(2, projectname);
            preparedStatement1.setString(3, applicationname);
            preparedStatement1.setString(4, options);
            preparedStatement1.setString(5, label_name);
            preparedStatement1.setString(6, (name+max_seq_num));
            preparedStatement1.setString(7, type);
            preparedStatement1.setString(8, mandatory);
            preparedStatement1.setString(9, "");
            preparedStatement1.execute();
        }
        catch(Exception e)
        {
            System.out.println("Exception---[info]------"+e);
        }
    }
    public static void DecommManagerServiceCategoriesDeleteService(String projectname,String applicationname, int  delete_seqnum)
    {
        try{
            int seqmax = 0;
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            ArrayList<Integer> arr_seqmax = new ArrayList<Integer>();
            ArrayList<String> arr_prj = new ArrayList<String>();
            ArrayList<String> arr_app = new ArrayList<String>();
            ArrayList<String> arr_options = new ArrayList<String>();
            ArrayList<String> arr_label_name = new ArrayList<String>();
            ArrayList<String> arr_column_name = new ArrayList<String>();
            ArrayList<String> arr_type = new ArrayList<String>();
            ArrayList<String> arr_mandatory = new ArrayList<String>();
            ArrayList<String> arr_value = new ArrayList<String>();

            ArrayList<Integer> arr_seqmax_split = new ArrayList<Integer>();
            ArrayList<String> arr_prj_split = new ArrayList<String>();
            ArrayList<String> arr_app_split = new ArrayList<String>();
            ArrayList<String> arr_options_split = new ArrayList<String>();
            ArrayList<String> arr_label_name_split = new ArrayList<String>();
            ArrayList<String> arr_column_name_split = new ArrayList<String>();
            ArrayList<String> arr_type_split = new ArrayList<String>();
            ArrayList<String> arr_mandatory_split = new ArrayList<String>();
            ArrayList<String> arr_value_split = new ArrayList<String>();


            String select_query="select max(seq_num) from decomm_manage_service_categories_checklist where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by seq_num;";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(select_query);
            if(rs.next()) {
                seqmax = Integer.parseInt(rs.getString(1));
            }

            String query = "select * from decomm_manage_service_categories_checklist where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by seq_num;";
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query);
            while(rs1.next()){
                arr_seqmax.add(rs1.getInt(1));
                arr_prj.add(rs1.getString(2));
                arr_app.add(rs1.getString(3));
                arr_options.add(rs1.getString(4));
                arr_label_name.add(rs1.getString(5));
                arr_column_name.add(rs1.getString(6));
                arr_type.add(rs1.getString(7));
                arr_mandatory.add(rs1.getString(8));
                arr_value.add(rs1.getString(9));
            }

            for (int i=0; i<seqmax; i++)
            {
                if(arr_seqmax.get(i)< delete_seqnum )
                {
                    arr_seqmax_split.add(arr_seqmax.get(i));
                    arr_prj_split.add(arr_prj.get(i));
                    arr_app_split.add(arr_app.get(i));
                    arr_options_split.add(arr_options.get(i));
                    arr_label_name_split.add(arr_label_name.get(i));
                    arr_column_name_split.add(arr_column_name.get(i));
                    arr_type_split.add(arr_type.get(i));
                    arr_mandatory_split.add(arr_mandatory.get(i));
                    arr_value_split.add(arr_value.get(i));
                }
                else if(arr_seqmax.get(i)> delete_seqnum){
                    arr_seqmax_split.add((arr_seqmax.get(i)-1));
                    arr_prj_split.add(arr_prj.get(i));
                    arr_app_split.add(arr_app.get(i));
                    arr_options_split.add(arr_options.get(i));
                    arr_label_name_split.add(arr_label_name.get(i));
                    arr_column_name_split.add("ServiceCategories"+(arr_seqmax.get(i)-1));
                    arr_type_split.add(arr_type.get(i));
                    arr_mandatory_split.add(arr_mandatory.get(i));
                    arr_value_split.add(arr_value.get(i));
                }
            }

            String delete_query = "delete from decomm_manage_service_categories_checklist where prj_name='"+projectname+"' and app_name='"+applicationname+"' ";
            Statement st2=connection.createStatement();
            st2.executeUpdate(delete_query);
            for  (int j=0; j<seqmax-1; j++){
                String insert_query = "insert into decomm_manage_service_categories_checklist (seq_num,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?,?,?,?,?,?,?,?,?);";
                PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
                preparedStatement1.setInt(1,arr_seqmax_split.get(j));
                preparedStatement1.setString(2, arr_prj_split.get(j));
                preparedStatement1.setString(3, arr_app_split.get(j));
                preparedStatement1.setString(4, arr_options_split.get(j));
                preparedStatement1.setString(5, arr_label_name_split.get(j));
                preparedStatement1.setString(6, arr_column_name_split.get(j));
                preparedStatement1.setString(7, arr_type_split.get(j));
                preparedStatement1.setString(8, arr_mandatory_split.get(j));
                preparedStatement1.setString(9, arr_value_split.get(j));
                preparedStatement1.execute();
            }

        }
        catch(Exception e){
            System.out.println("Exception---->>>"+e);
        }
    }
    public static void DecommManageServiceCategoriesOthersSaveService(String projectname, String applicationname, String others, String questions, String type, String value) {
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String select_query = "select * from decomm_manage_service_categories_checklist_others where prj_name = '" + projectname + "' and app_name = '" + applicationname + "'";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(select_query);
            if(rs.next()){
                String update_query = "update decomm_manage_service_categories_checklist_others set others =?, questions=?, type=?, value=?, where prj_name = '"+projectname+"' and app_name = '"+applicationname+"' ";
                PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
                preparedStmt1.setString(1, projectname);
                preparedStmt1.setString(2, applicationname);
                preparedStmt1.setString(3, others);
                preparedStmt1.setString(4, questions);
                preparedStmt1.setString(5, type);
                preparedStmt1.setString(6, value);
                preparedStmt1.execute();
            }
            else{
                String insert_query = "insert into decomm_manage_service_categories_checklist_others (prj_name,app_name,others,questions,type,value) values(?,?,?,?,?,?);";
                PreparedStatement preparedStmt2 = connection.prepareStatement(insert_query);
                preparedStmt2.setString(1, projectname);
                preparedStmt2.setString(2, applicationname);
                preparedStmt2.setString(3, others);
                preparedStmt2.setString(4, questions);
                preparedStmt2.setString(5, type);
                preparedStmt2.setString(6, value);
                preparedStmt2.execute();
            }
        }

        catch(Exception e){
            System.out.println("Exception---->>>"+e);
        }
    }

    public static JsonArray DecommManageKeyMileStoneDataRetrieveService(String projectname, String applicationname)
    {
        JsonArray jsonArray = new JsonArray();
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            int arr_size[] = {7,5,11,4};
            String arr_tab_size[] = {"CAPM","ETPM","APP TEAM","APP SLO"};
            for (int i=0; i<arr_tab_size.length; i++){
            String query = "select * from decomm_manage_key_mile_stone where prj_name = '"+projectname+"' and app_name = '"+applicationname+"' and tab_name ='"+arr_tab_size[i]+"' order by seq_num;";
            Statement statementforcheck=connection.createStatement();
            ResultSet Resultset=statementforcheck.executeQuery(query);
            if(Resultset.next()) {
                JsonObject jsonObject1 = new JsonObject();
                jsonObject1.addProperty("Seq_Num", Resultset.getString("seq_num"));
                jsonObject1.addProperty("Prj_Name", Resultset.getString("prj_name"));
                jsonObject1.addProperty("App_Name", Resultset.getString("app_name"));
                jsonObject1.addProperty("Tab_Name", Resultset.getString("tab_name"));
                jsonObject1.addProperty("Tab_Name_Question", Resultset.getString("tab_name_question"));
                jsonObject1.addProperty("Tab_Name_Value", Resultset.getString("tab_name_value"));
                jsonArray.add(jsonObject1);
                while(Resultset.next()) {
                    JsonObject jsonObject2 = new JsonObject();
                    jsonObject2.addProperty("Seq_Num", Resultset.getString("seq_num"));
                    jsonObject2.addProperty("Prj_Name", Resultset.getString("prj_name"));
                    jsonObject2.addProperty("App_Name", Resultset.getString("app_name"));
                    jsonObject2.addProperty("Tab_Name", Resultset.getString("tab_name"));
                    jsonObject2.addProperty("Tab_Name_Question", Resultset.getString("tab_name_question"));
                    jsonObject2.addProperty("Tab_Name_Value", Resultset.getString("tab_name_value"));
                    jsonArray.add(jsonObject2);
                }
            }
            }
        }
        catch(Exception e){
            System.out.println("Exception---->>>"+e);
        }
        return jsonArray;
    }
    public static JsonArray DecommManageSerCatCheckDtRetrieveService(String projectname, String applicationname)
    {
    JsonArray jsonArray = new JsonArray();
    try{
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        String others_value = "";
        String select_query = "select * from decomm_manage_service_categories_checklist where prj_name = '"+projectname+"' and app_name = '"+applicationname+"' and type = 'Others' ";
        Statement st=connection.createStatement();
        ResultSet rs=st.executeQuery(select_query);
        String select_query2 = "select * from decomm_manage_service_categories_checklist where prj_name = '"+projectname+"' and app_name = '"+applicationname+"' and type != 'Others' order by seq_num";
        Statement st2=connection.createStatement();
        ResultSet rs2=st.executeQuery(select_query2);
        if(rs.next()){
            others_value = rs.getString("value");
        }
        String arr_value[] = others_value.split(",");

        for(int i=0; i<arr_value.length; i++){
            JsonObject jsonObject = new JsonObject();
            jsonObject.addProperty("others",arr_value[i]);
            String query = "select * from decomm_manage_service_categories_checklist_others where prj_name = '"+projectname+"' and app_name = '"+applicationname+"' and others = '"+arr_value[i]+"' ";
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(query);
            if(rs1.next()){
                jsonObject.addProperty("Dev",rs1.getString("dev"));
                jsonObject.addProperty("Test",rs1.getString("test"));
                jsonObject.addProperty("Stage",rs1.getString("stage"));
                jsonObject.addProperty("Prod",rs1.getString("prod"));
                jsonArray.add(jsonObject);

            }
         }

    }
    catch(Exception e){
        System.out.println("Exception--->>>"+e);
    }
    return jsonArray;
    }
    public static JsonArray DecommManageServiceCategoriesCheckServerService(String projectname, String applicationname){
        JsonArray jsonArray = new JsonArray();
        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            JsonArray jsonArray1 = new JsonArray();
            String select_query = "select * from decomm_manage_service_categories_checklist where prj_name = '"+projectname+"' and app_name = '"+applicationname+"' and type != 'Radio box' and type != 'Check box' and type != 'Others'order by seq_num";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(select_query);
            while(rs.next()){
                String value = "";
                String label,type= "";
                value = rs.getString("value");
                label = rs.getString("label_name");

                type = rs.getString("type");
                String arr_value[] = value.split(",");
                for(int i =0; i<arr_value.length; i++){
                    String dev="",test="",stage="",prod="",comment = "";
                    JsonObject jsonObject = new JsonObject();
                    String valuequery="select * from Decomm_Manage_Service_Categories_Checklist_Server where prj_name='"+projectname+"' and app_name = '"+applicationname+"' and label_name = '"+label+"' and value = '"+arr_value[i]+"' ";
                    Statement st1=connection.createStatement();
                    ResultSet rs1=st1.executeQuery(valuequery);
                    if(rs1.next()){
                        dev = rs1.getString("dev");
                        test = rs1.getString("test");
                        stage = rs1.getString("stage");
                        prod = rs1.getString("prod");
                        comment = rs1.getString("comments");
                    }
                    jsonObject.addProperty("Value",arr_value[i]);
                    jsonObject.addProperty("LabelName",label);
                    jsonObject.addProperty("Type",type);
                    jsonObject.addProperty("Dev",dev);
                    jsonObject.addProperty("Test",test);
                    jsonObject.addProperty("Stage",stage);
                    jsonObject.addProperty("Prod",prod);
                    jsonObject.addProperty("Comment",comment);
                    jsonArray1.add(jsonObject);
                }
            }
            JsonArray jsonArray2 = new JsonArray();
            String select_query1 = "select * from decomm_manage_service_categories_checklist where prj_name = '"+projectname+"' and app_name = '"+applicationname+"' and type = 'Others' order by seq_num";
            Statement st1=connection.createStatement();
            ResultSet rs1=st1.executeQuery(select_query1);
            if(rs1.next()){
                String other_value = "";
                String type_other = "", value_other = "", dev = "", test = "", stage = "", prod = "", comment = "", questions = "";
                other_value = rs1.getString("value");
                String arr_other_value[] = other_value.split(",");
                for (int i=0; i<arr_other_value.length; i++){
                    JsonObject jsonObject = new JsonObject();
                    if(! arr_other_value[i].equals ("Mainframe") || ! arr_other_value[i].equals ("'Disaster Recovery'")){
                        String select_query_other = "select * from decomm_manage_service_categories_checklist_others where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and others ='" + arr_other_value[i] + "' ";
                        Statement st2 = connection.createStatement();
                        ResultSet rs2 = st2.executeQuery(select_query_other);
                        while (rs2.next()) {

                            type_other = rs2.getString("type");
                            value_other = rs2.getString("value");
                            dev = rs2.getString("dev");
                            test = rs2.getString("test");
                            stage = rs2.getString("stage");
                            prod = rs2.getString("prod");
                            comment = rs2.getString("comments");
                            questions = rs2.getString("questions");
                            jsonObject.addProperty("Others", arr_other_value[i]);
                            jsonObject.addProperty("Type", type_other);
                            jsonObject.addProperty("Value", value_other);
                            jsonObject.addProperty("Dev", dev);
                            jsonObject.addProperty("Test", test);
                            jsonObject.addProperty("Stage", stage);
                            jsonObject.addProperty("Prod", prod);
                            jsonObject.addProperty("Comment", comment);
                            jsonObject.addProperty("questions", questions);
                            jsonArray2.add(jsonObject);
                        }
                    }
                    else {
                        String query = "select * from decomm_manage_service_categories_checklist_server where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and label_name = '"+arr_other_value[i]+"'";
                        Statement st3 = connection.createStatement();
                        ResultSet rs3 = st3.executeQuery(query);
                        if(rs3.next()){
                            while(rs3.next())
                            {
                                dev = rs3.getString("dev");
                                test = rs3.getString("test");
                                stage = rs3.getString("stage");
                                prod = rs3.getString("prod");
                                comment = rs3.getString("comments");
                            }
                        }
                        else{

                        }
                    }
                }
            }
            JsonArray jsonArray3=new JsonArray();
            String selectRadioAndCheckboxQuery="select * from decomm_manage_service_categories_checklist where prj_name='"+projectname+"' and app_name='"+applicationname+"' and type!='Dropdown' and type!='Text box' and type!='Others' and type!='Datepicker';";
            Statement statement=connection.createStatement();
            ResultSet resultSet=statement.executeQuery(selectRadioAndCheckboxQuery);
            String dev="",test="",stage="",prod="",comment="";
            while(resultSet.next())
            {
                String options=resultSet.getString("options");
                String value=resultSet.getString("value");
                String type=resultSet.getString("type");
                String label=resultSet.getString("label_name");
                String query  = "select * from Decomm_Manage_Service_Categories_Checklist_Server where prj_name='"+projectname+"' and app_name='"+applicationname+"' and label_name = '"+label+"' and value = '"+value+"'";
                Statement st4=connection.createStatement();
                ResultSet rs4=st4.executeQuery(query);
                if(rs4.next()){
                    dev=rs4.getString("dev");
                    test=rs4.getString("test");
                    stage=rs4.getString("stage");
                    prod=rs4.getString("prod");
                    comment=rs4.getString("comments");
                }
                JsonObject jsonObject=new JsonObject();
                jsonObject.addProperty("Options",options);
                jsonObject.addProperty("Value",value);
                jsonObject.addProperty("type",type);
                jsonObject.addProperty("label",label);
                jsonObject.addProperty("Dev",dev);
                jsonObject.addProperty("Test",test);
                jsonObject.addProperty("Stage",stage);
                jsonObject.addProperty("Prod",prod);
                jsonObject.addProperty("Comment",comment);
                jsonArray3.add(jsonObject);
            }
            jsonArray.add(jsonArray1);
            jsonArray.add(jsonArray2);
            jsonArray.add(jsonArray3);
        }

        catch (Exception e) {
            System.out.println("Exception......" + e);
        }
        return  jsonArray;
    }
    public static JsonArray DecommManagePreviewDataRetrieveService(String projectname, String applicationname) {
        JsonArray jsonArray = new JsonArray();

        try{
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            JsonArray jsonArrayExecutionInfo = new DecommManageExecuteInfoService().DecommManageExecuteInfoDataRetrieveService(projectname,applicationname);
            JsonArray jsonArrayInfraComp = new DecommManageExecuteInfoService().DecommManageExecuteInfraCompDataRetrieveService(projectname,applicationname);
            JsonArray jsonArrayServiceCategoriesChecklist = new DecommManageExecuteInfoService().DecommManageServiceCategoriesDataRetrieveService(projectname,applicationname);
            JsonArray jsonArrayServiceCategoriesChecklistData =  new DecommManageExecuteInfoService().DecommManageServiceCategoriesCheckServerService(projectname,applicationname);
            JsonArray jsonArrayKeyMileStone = new DecommManageExecuteInfoService().DecommManageKeyMileStoneDataRetrieveService(projectname,applicationname);

            jsonArray.add(jsonArrayExecutionInfo);
            jsonArray.add(jsonArrayInfraComp);
            jsonArray.add(jsonArrayServiceCategoriesChecklist);
            jsonArray.add(jsonArrayServiceCategoriesChecklistData);
            jsonArray.add(jsonArrayKeyMileStone);
        }
        catch(Exception e){
            System.out.println("Exception--->" + e);
        }
        return jsonArray;
    }
}


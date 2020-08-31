package service;

import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;

public class DecommIntakeServices {
    public static void DecommIntakeAddOperation(String projectname,String applicationname,String label_name,String column_name,String mandatory,String type,int NumberofInputfields,String options)
    {
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String select_query = "select * from decomm_legacy_add_table where prj_name='" + projectname + "' and app_name='" + applicationname + "' order by seq_num;";
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(select_query);
            String name = "LegacyRetention";
            int max_seq_num = 1;
            if (rs.next()) {
                String max_seqnum = "select max(seq_num) from decomm_legacy_add_table where prj_name='" + projectname + "'and app_name='" + applicationname + "';";
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
            String insert_query = "insert into decomm_legacy_add_table (seq_num,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?,?,?,?,?,?,?,?,?);";
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

    public static void DecommIntakeDeleteOperation(String projectname,String applicationname, int  delete_seqnum)
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


            String select_query="select max(seq_num) from decomm_legacy_add_table where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by seq_num;";
            Statement st=connection.createStatement();
            ResultSet rs=st.executeQuery(select_query);
            if(rs.next()) {
                seqmax = Integer.parseInt(rs.getString(1));
            }

            String query = "select * from decomm_legacy_add_table where prj_name='"+projectname+"' and app_name='"+applicationname+"' order by seq_num;";
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
                    arr_column_name_split.add("LegacyRetention"+(arr_seqmax.get(i)-1));
                    arr_type_split.add(arr_type.get(i));
                    arr_mandatory_split.add(arr_mandatory.get(i));
                    arr_value_split.add(arr_value.get(i));
                }
            }

            String delete_query = "delete from decomm_legacy_add_table where prj_name='"+projectname+"' and app_name='"+applicationname+"' ";
            Statement st2=connection.createStatement();
            st2.executeUpdate(delete_query);
            for  (int j=0; j<seqmax-1; j++){
                String insert_query = "insert into decomm_legacy_add_table (seq_num,prj_name,app_name,options,label_name,column_name,type,mandatory,value) values(?,?,?,?,?,?,?,?,?);";
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


    public static void DecommIntakeEditOperation(String projectname,String applicationname, String label_name,int sequencenumber) {

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
                preparedStmt1.execute();*/
        //}

            String update_query = "update decomm_legacy_add_table set label_name =? where prj_name = '" + projectname + "' and app_name = '" + applicationname + "' and seq_num='"+sequencenumber+"'";
            PreparedStatement preparedStmt1 = connection.prepareStatement(update_query);
            preparedStmt1.setString(1, label_name);
            preparedStmt1.execute();
        }
        catch(Exception e){
                System.out.println("Exception---->>>>"+e);
        }
    }
    public JsonObject DecommIntakeLegacyRetentionTableUpdate(String projectname, String applicationname) {
    try{
        DBconnection dBconnection = new DBconnection();
        Connection connection = (Connection) dBconnection.getConnection();
        String update_query = "update decomm_legacy_add_table set label_name =?, type =?, mandatory=? where prj_name = '"+projectname+"' and app_name = '"+applicationname+"'";
    }
    catch(Exception e){
        System.out.println("Exception--->>>"+e);
    }
    return null;
    }

}

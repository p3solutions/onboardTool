package FinanceDetails.Service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
public class FinanceInputLabelDelete {

public static void FinanceLabelDelete(int delete_seqnum) {
		PreparedStatement st=null,st1=null,st2=null;
		ResultSet rs=null,rs1=null;
        try {
        	
        	
        	System.out.println("The control comes to Service"+delete_seqnum);
            int seqmax = 0;
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            ArrayList<Integer> arr_seqmax = new ArrayList<Integer>();
            ArrayList<String> arr_id = new ArrayList<String>();
            ArrayList<String> arr_prj = new ArrayList<String>();
            ArrayList<String> arr_app = new ArrayList<String>();
            ArrayList<String> arr_options = new ArrayList<String>();
            ArrayList<String> arr_label_name = new ArrayList<String>();
            ArrayList<String> arr_column_name = new ArrayList<String>();
            ArrayList<String> arr_type = new ArrayList<String>();
            ArrayList<String> arr_mandatory = new ArrayList<String>();
            ArrayList<String> arr_value = new ArrayList<String>();
            ArrayList<String> arr_umandatory = new ArrayList<String>();
            ArrayList<Integer> arr_seqmax_split = new ArrayList<Integer>();
            ArrayList<String> arr_id_split = new ArrayList<String>();
            ArrayList<String> arr_prj_split = new ArrayList<String>();
            ArrayList<String> arr_app_split = new ArrayList<String>();
            ArrayList<String> arr_options_split = new ArrayList<String>();
            ArrayList<String> arr_label_name_split = new ArrayList<String>();
            ArrayList<String> arr_column_name_split = new ArrayList<String>();
            ArrayList<String> arr_type_split = new ArrayList<String>();
            ArrayList<String> arr_mandatory_split = new ArrayList<String>();
            ArrayList<String> arr_value_split = new ArrayList<String>();
            ArrayList<String> arr_umandatory_split = new ArrayList<String>();
            String select_query = "select max(seq_no) from Finance_Informations_Details order by seq_no;";
			st = connection.prepareStatement(select_query);
			rs = st.executeQuery();
            if (rs.next()) {
                seqmax = Integer.parseInt(rs.getString(1));
            }
            String query = "select * from Finance_Informations_Details order by seq_no;";
			st1 = connection.prepareStatement(query);
			rs1 = st1.executeQuery();
            while (rs1.next()) {
                arr_seqmax.add(rs1.getInt("seq_no"));
                arr_id.add(rs1.getString("Id"));
                arr_prj.add(rs1.getString("prj_name"));
                arr_app.add(rs1.getString("app_name"));
                arr_options.add(rs1.getString("options"));
                arr_label_name.add(rs1.getString("label_name"));
                arr_column_name.add(rs1.getString("column_name"));
                arr_type.add(rs1.getString("type"));
                arr_mandatory.add(rs1.getString("mandatory"));
                arr_value.add(rs1.getString("value"));
                arr_umandatory.add(rs1.getString("usermandatoryflag"));
            }
            for (int i = 0; i < seqmax; i++) {
                if (arr_seqmax.get(i) < delete_seqnum) {
                    arr_seqmax_split.add(arr_seqmax.get(i));
                    arr_id_split.add(arr_id.get(i));
                    arr_prj_split.add(arr_prj.get(i));
                    arr_app_split.add(arr_app.get(i));
                    arr_options_split.add(arr_options.get(i));
                    arr_label_name_split.add(arr_label_name.get(i));
                    arr_column_name_split.add(arr_column_name.get(i));
                    arr_type_split.add(arr_type.get(i));
                    arr_mandatory_split.add(arr_mandatory.get(i));
                    arr_value_split.add(arr_value.get(i));
                    arr_umandatory_split.add(arr_umandatory.get(i));
                } else if (arr_seqmax.get(i) > delete_seqnum) {
                    arr_seqmax_split.add((arr_seqmax.get(i) - 1));
                    arr_id_split.add(arr_id.get(i));
                    arr_prj_split.add(arr_prj.get(i));
                    arr_app_split.add(arr_app.get(i));
                    arr_options_split.add(arr_options.get(i));
                    arr_label_name_split.add(arr_label_name.get(i));
                    arr_column_name_split.add(arr_column_name.get(i));
                    arr_type_split.add(arr_type.get(i));
                    arr_mandatory_split.add(arr_mandatory.get(i));
                    arr_value_split.add(arr_value.get(i));
                    arr_umandatory_split.add(arr_umandatory.get(i));
                }
            }
            String delete_query = "delete from Finance_Informations_Details;";
			st2 = connection.prepareStatement(delete_query);
			System.out.println("The Sequence  Number");
			st2.executeUpdate();
            for (int j = 0; j < seqmax - 1; j++) {
                String insert_query = "insert into Finance_Informations_Details (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value,usermandatoryflag) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
                PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
                preparedStatement1.setInt(1, arr_seqmax_split.get(j));
                preparedStatement1.setString(2, arr_id_split.get(j));
                preparedStatement1.setString(3, arr_prj_split.get(j));
                preparedStatement1.setString(4, arr_app_split.get(j));
                preparedStatement1.setString(5, arr_options_split.get(j));
                preparedStatement1.setString(6, arr_label_name_split.get(j));
                preparedStatement1.setString(7, arr_column_name_split.get(j));
                preparedStatement1.setString(8, arr_type_split.get(j));
                preparedStatement1.setString(9, arr_mandatory_split.get(j));
                preparedStatement1.setString(10, arr_value_split.get(j));
                preparedStatement1.setString(11, arr_umandatory_split.get(j));
                preparedStatement1.execute();
            }
            st2.close();
            OrderingColumnNameBySeq();
			st.close();
			rs.close();
			st1.close();
			rs1.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Exception---->>>" + e);
        }
    }
    public static void OrderingColumnNameBySeq()
    {
		PreparedStatement st=null;
		ResultSet rs=null;
        try {  
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection(); 
            String SelectQuery ="Select * from Finance_Informations_Details order by seq_no";
			st = connection.prepareStatement(SelectQuery);
			rs = st.executeQuery();
            String startStr = "UpdateDetails";
            while(rs.next())
            {
                if(rs.getString("column_name").startsWith("UpdateDetails"))
                {
                    String seqnum = rs.getString("seq_no");
                    String column_name = rs.getString("column_name");
                    String append_seq_num=column_name.substring(startStr.length(),column_name.length());
                    if(!seqnum.equals(append_seq_num))
                    {
                      String updateColumnName = startStr+seqnum;
                      String UpdateQuery = "Update Finance_Informations_Details set column_name =? where seq_no=?;";  
                      PreparedStatement st1 = connection.prepareStatement(UpdateQuery);
                      st1.setString(1,updateColumnName);
                      st1.setString(2,seqnum);
                      st1.executeUpdate();
                    }
                }
            }
          rs.close();
          st.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("Exception-----------[info]-------"+e);
        }
    }}
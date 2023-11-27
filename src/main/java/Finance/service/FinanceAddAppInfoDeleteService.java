package Finance.service;

import com.google.gson.JsonObject;
import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

public class FinanceAddAppInfoDeleteService {
    DBconnection dBconnection;
    Connection con;
    public String Id = null;
    public int seqNum ;
    JsonObject jsonObj = null;
    public FinanceAddAppInfoDeleteService(String Id, int seqNum) throws ClassNotFoundException, SQLException {
        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
        this.Id = Id;
        this.seqNum = seqNum;
        this.jsonObj = new JsonObject();
    }

    public JsonObject Delete()
    {
        boolean statusFlag = false;
        try {
            int seqmax = 0;
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

            String select_query = "select max(seq_no) from decom3sixtytool.finance_info where Id = ? order by seq_no;";
            PreparedStatement st = con.prepareStatement(select_query);
            st.setString(1, Id);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                seqmax = Integer.parseInt(rs.getString(1));
            }
            st.close();
            rs.close();
            String query = "select * from decom3sixtytool.finance_info where Id = ? order by seq_no;";
            PreparedStatement st1 = con.prepareStatement(query);
            st1.setString(1, Id);
            ResultSet rs1 = st1.executeQuery();

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
            st1.close();
            rs1.close();
            String column = getColumnName();
            jsonObj.addProperty("columnName", column);
            for (int i = 0; i < seqmax; i++) {
                if (arr_seqmax.get(i) < seqNum) {
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
                } else if (arr_seqmax.get(i) > seqNum) {
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

            String delete_query = "delete from decom3sixtytool.finance_info where id=?;";
            PreparedStatement st2 = con.prepareStatement(delete_query);
            st2.setString(1,Id);
            st2.executeUpdate();
            st2.close();

            for (int j = 0; j < seqmax - 1; j++) {
                String insert_query = "insert into decom3sixtytool.finance_info (seq_no,id,prj_name,app_name,options,label_name,column_name,type,mandatory,value,usermandatoryflag) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
                PreparedStatement preparedStatement1 = con.prepareStatement(insert_query);
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
                preparedStatement1.close();
            }
            deleteDependencyField(column);
            statusFlag=true;
            OrderingColumnNameBySeq();

        }
        catch(Exception e)
        {
            statusFlag=false;
            e.printStackTrace();
        }

        jsonObj.addProperty("statusFlag", statusFlag);

        return jsonObj;
    }
    private void deleteDependencyField(String column)
    {
        try
        {
            if(getDependentColumns().containsKey(column))
                Delete();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

    private String getColumnName() {
        String column = "";

        try {
            String selectQuery ="select * from decom3sixtytool.finance_info where id=? and seq_no =?;";
            PreparedStatement st1 = con.prepareStatement(selectQuery);
            st1.setString(1, Id);
            st1.setInt(2, seqNum);
            ResultSet rs = st1.executeQuery();

            if(rs.next())
            {
                column=rs.getString("column_name");
            }
            rs.close();
            st1.close();
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return column;
    }

    private LinkedHashMap<String, String> getDependentColumns()
    {
        LinkedHashMap<String, String> dependentColumns = new LinkedHashMap<String, String>();
        dependentColumns.put("thirdpartyvendor","locationcenter");
        dependentColumns.put("dataloclaw","listcountry");
        return dependentColumns;
    }

    public void OrderingColumnNameBySeq()
    {

        try {

            String SelectQuery ="Select * from decom3sixtytool.finance_info where id=? order by seq_no";
            PreparedStatement st = con.prepareStatement(SelectQuery);
            st.setString(1, Id);
            ResultSet rs = st.executeQuery();

            String startStr = "LegacyAddInfo";
            while(rs.next())
            {
                if(rs.getString("column_name").startsWith("LegacyAddInfo"))
                {
                    String seqnum = rs.getString("seq_no");
                    String column_name = rs.getString("column_name");
                    String append_seq_num=column_name.substring(startStr.length(),column_name.length());
                    if(!seqnum.equals(append_seq_num))
                    {
                        String updateColumnName = startStr+seqnum;
                        String UpdateQuery = "Update decom3sixtytool.finance_info set column_name =? where id = ? and seq_no=?;";
                        PreparedStatement st1 = con.prepareStatement(UpdateQuery);
                        st1.setString(1, updateColumnName);
                        st1.setString(2, Id);
                        st1.setString(3, seqnum);
                        st1.execute();
                        st1.close();
                    }
                }
            }
            st.close();
            rs.close();

        }
        catch(Exception e)
        {
            e.printStackTrace();
            System.out.println("Exception-----------[info]-------"+e);
        }
    }

    protected void finalize() throws Throwable {
        con.close();
        System.out.println("dbconnection closed");
    }
}

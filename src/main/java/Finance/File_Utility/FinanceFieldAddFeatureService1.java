package Finance.File_Utility;

import onboard.DBconnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class FinanceFieldAddFeatureService1 {
    DBconnection dBconnection;
    Connection con;
    public String Id = null;

    public FinanceFieldAddFeatureService1(String Id) throws ClassNotFoundException, SQLException {

        dBconnection = new DBconnection();
        con = (Connection) dBconnection.getConnection();
        this.Id = Id;
    }
    public static int FinanceAddOperationService(String Id,String label_name, String mandatory,String umandatory, String type, int NumberofInputfields, String options )
    {
        int max_seq_num = 1;
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String select_query = "select * from decom3sixtytool.finance_info where Id = ? order by seq_no;";
            PreparedStatement st = connection.prepareStatement(select_query);
            st.setString(1, Id);
            ResultSet rs = st.executeQuery();
            String name = "LegacyAddInfo";

            if (rs.next()) {
                String max_seqnum = "select max(seq_no) from decom3sixtytool.finance_info where Id = ? order by seq_no;";
                PreparedStatement st1 = connection.prepareStatement(max_seqnum);
                st1.setString(1, Id);
                ResultSet rs1 = st1.executeQuery();

                if (rs1.next()) {
                    max_seq_num = Integer.parseInt(rs1.getString(1));
                    max_seq_num++;
                }
            }
            if (!type.equals("Text box") && !type.equals("Datepicker")) {
                options = options.substring(0, options.length() - 1);
            }
            String insert_query = "insert into decom3sixtytool.finance_info (seq_no,Id,prj_name,app_name,options,label_name,column_name,type,mandatory,value,usermandatoryflag) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
            PreparedStatement preparedStatement1 = connection.prepareStatement(insert_query);
            preparedStatement1.setInt(1, max_seq_num);
            preparedStatement1.setString(2, Id);
            preparedStatement1.setString(3, "");
            preparedStatement1.setString(4, "");
            preparedStatement1.setString(5, options);
            preparedStatement1.setString(6, label_name);
            preparedStatement1.setString(7, (name + max_seq_num));
            preparedStatement1.setString(8, type);
            preparedStatement1.setString(9, mandatory);
            preparedStatement1.setString(10, "");
            preparedStatement1.setString(11, umandatory);
            preparedStatement1.execute();
        } catch (Exception e) {
            System.out.println("Exception---[info]------" + e);
        }
        return max_seq_num;
    }
    protected void finalize() throws Throwable {
        con.close();
        System.out.println("Db connection Closed");
    }
}

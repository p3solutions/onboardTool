package ArchiveExecution.Service;

import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

public class Archive_Service {
    final static Logger logger = Logger.getLogger(Archive_Service.class);

    public static void Update_Archive_Details(String seqnum[], String name[], String mem_as[], String act_srt_dat[], String act_end_dat[], String pln_srt_dat[], String pln_end_dat[], String progres[], String hr[]) {
        try {
            // create a mysql database connections
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            Statement statement = connection.createStatement();
            for (int a = 0; a < 10; a++) {
                String seq_num = seqnum[a];
                String nam = name[a];
                String mem_ass = mem_as[a];
                String act_srt_date = act_srt_dat[a];
                String act_end_date = act_end_dat[a];
                String pln_srt_date = pln_srt_dat[a];
                String pln_end_date = pln_end_dat[a];
                String hrs = hr[a];
                statement.executeUpdate("update ArchiveExecution_Details set name='" + nam + "',mem_ass='" + mem_ass + "',act_srt_date='" + act_srt_date + "',act_end_date='" + act_end_date + "',pln_srt_date='" + pln_srt_date + "',pln_end_date='" + pln_end_date + "',hours='" + hrs + "' where seq_num='" + seq_num + "'");
            }
            connection.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void Submit_Archivel(String seq_nu, String leve, int seq_num, int level, String id, String rid, int q, String x, String namee, String mem_ass, String hrs) {
        try {
            // create a mysql database connection
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            if (level > 1) {
                String query = "update ArchiveExecution_Details  set seq_num=seq_num+1 where seq_num>" + seq_num;
                PreparedStatement preparedStmt = connection.prepareStatement(query);
                preparedStmt.execute();
                String query1 = " insert into ArchiveExecution_Details (seq_num,level,name,mem_ass,id,ref_id)"
                        + " values (?,?,?,?,?,?)";
                PreparedStatement preparedStmt1 = connection.prepareStatement(query1);
                preparedStmt1.setInt(1, seq_num + 1);
                preparedStmt1.setInt(2, level);
                preparedStmt1.setString(3, namee);
                preparedStmt1.setString(4, mem_ass);
                preparedStmt1.setString(5, id);
                preparedStmt1.setString(6, rid);
                preparedStmt1.execute();

                String query2 = "select * from ArchiveExecution_Details order by seq_num";
                PreparedStatement preparedStmt2 = connection.prepareStatement(query2);
                preparedStmt2.execute();
                String query3 = "update dummy set value='" + x + "'";
                PreparedStatement preparedStmt3 = connection.prepareStatement(query3);
                preparedStmt3.execute();


            } else {
                String query = " insert into ArchiveExecution_Details (seq_num,level,name,mem_ass,id,ref_id)"
                        + " values (?,?,?,?,?,?)";
                PreparedStatement preparedStmt = connection.prepareStatement(query);
                preparedStmt.setInt(1, seq_num);
                preparedStmt.setInt(2, level);
                preparedStmt.setString(3, namee);
                preparedStmt.setString(4, mem_ass);
                preparedStmt.setString(5, id);
                preparedStmt.setString(6, rid);
                preparedStmt.execute();

                String query2 = "update dummy set value='" + x + "'";
                PreparedStatement preparedStmt1 = connection.prepareStatement(query2);
                preparedStmt1.execute();
            }
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

package ArchiveExecution.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Login_Time_Archive_Exceution_Service {
    final static Logger logger = Logger.getLogger(Login_Time_Archive_Exceution_Service.class);

    public static void login_time_archive(String det,String username,String Project_Name) {
        try {
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            String visit_query = "select * from visits";
            Statement visit_st = connection.createStatement();
            ResultSet visit_rs = visit_st.executeQuery(visit_query);
            boolean flag =true;

            Date date = new Date();
            SimpleDateFormat ft, ft1;
            ft = new SimpleDateFormat("yyyy-MM-dd");
            ft1 = new SimpleDateFormat("hh:mm:ss");
            String strDate = ft.format(date);
            String strTime = ft1.format(date);

            while (visit_rs.next()) {
                if (visit_rs.getString(6) != null || visit_rs.getString(1) != null) {
                    if (visit_rs.getString(1).equals(username) && visit_rs.getString(2).equals(strDate) && visit_rs.getString(3).equals("Archive Execution Module") && visit_rs.getString(6).equals(Project_Name)) {
                        Statement stmtt = connection.createStatement();
                        String queryy = "update visits set count=count+1,time='" + strTime + "' where uname='" + username + "' and module='Archive Execution Module' and Projects='" + Project_Name + "'";
                        int count = stmtt.executeUpdate(queryy);
                        flag = false;
                        break;
                    }
                }
            }
            if (flag) {
                String ins_query = " insert into visits (uname, date, module, count, time, Projects)"
                        + " values (?, ?, ?, ?, ?, ?)";
                PreparedStatement preparedStmt = connection.prepareStatement(ins_query);
                preparedStmt.setString(1, username);
                preparedStmt.setString(2, strDate);
                preparedStmt.setString(3, "Archive Execution Module");
                preparedStmt.setString(4, "1");
                preparedStmt.setString(5, strTime);
                preparedStmt.setString(6, Project_Name);

                // execute the preparedstatement
                preparedStmt.execute();
            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}




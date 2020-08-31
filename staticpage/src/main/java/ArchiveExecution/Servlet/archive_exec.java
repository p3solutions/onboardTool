package ArchiveExecution.Servlet;

import ArchiveExecution.Service.Archive_Service;
import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Logger;
import org.apache.log4j.MDC;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class archive_exec
 */
@WebServlet("/archive_exec")
public class archive_exec extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Logger logger = null;

    public void init(ServletConfig config) throws ServletException {

        logger = Logger.getRootLogger();

        BasicConfigurator.configure();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.getWriter().append("Served at: ").append(request.getContextPath());
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        HttpSession details = request.getSession();
        String u_name = (String) details.getAttribute("username");
        String u_role = (String) details.getAttribute("role");
        MDC.put("USERROLE", u_role);
        String userid = u_name;
        MDC.put("USERID", userid);
        String projectname = request.getParameter("project_name");
        logger.info("modified project " + projectname);
        String seqnum[] = new String[10];
        String name[] = new String[10];
        String mem_as[] = new String[10];
        String act_srt_dat[] = new String[10];
        String act_end_dat[] = new String[10];
        String pln_srt_dat[] = new String[10];
        String pln_end_dat[] = new String[10];
        String progres[] = new String[10];
        String hr[] = new String[10];

        //System.out.println("In servlet");

        for (int i = 0; i < 10; i++) {
            seqnum[i] = request.getParameter("seqnum" + i);
            name[i] = request.getParameter("name" + i);
            mem_as[i] = request.getParameter("mem_ass" + i);
            act_srt_dat[i] = request.getParameter("act_srt_date" + i);
            act_end_dat[i] = request.getParameter("act_end_date" + i);
            pln_srt_dat[i] = request.getParameter("pln_srt_date" + i);
            pln_end_dat[i] = request.getParameter("pln_end_date" + i);
            hr[i] = request.getParameter("hrs" + i);
        }


        PrintWriter writer = response.getWriter();

        Archive_Service.Update_Archive_Details(seqnum, name, mem_as, act_srt_dat, act_end_dat, pln_srt_dat, pln_end_dat, progres, hr);
       /* try {
            // create a mysql database connection
            DBconnection dBconnection = new DBconnection();`
            Connection connection = (Connection) dBconnection.getConnection();


            Statement st = connection.createStatement();
            for (int a = 0; a < 10; a++) {
                String seq_num = seqnum[a];
                String nam = name[a];
                String mem_ass = mem_as[a];
                String act_srt_date = act_srt_dat[a];
                String act_end_date = act_end_dat[a];
                String pln_srt_date = pln_srt_dat[a];
                String pln_end_date = pln_end_dat[a];
                String hrs = hr[a];

                st.executeUpdate("update ArchiveExecution_Details set name='" + nam + "',mem_ass='" + mem_ass + "',act_srt_date='" + act_srt_date + "',act_end_date='" + act_end_date + "',pln_srt_date='" + pln_srt_date + "',pln_end_date='" + pln_end_date + "',hours='" + hrs + "' where seq_num='" + seq_num + "'");

            }

            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println("[ERROR]-----Got an exception!" + formatter.format(date) + "-----" + e.getMessage() + "----[ERROR]");
            // System.err.println("gfghfhgfhgg"+e.getMessage());
        }*/
        String seq_nu = request.getParameter("s");
        String leve = request.getParameter("l");
        int seq_num = Integer.parseInt(seq_nu);
        int level = Integer.parseInt(leve);
        String id = request.getParameter("r");
        String rid = request.getParameter("m");
        int q = Integer.parseInt(id) + 1;
        String x = Integer.toString(q);
        String namee = "";
        String mem_ass = "";
        String hrs = "";
        Archive_Service.Submit_Archivel(seq_nu, leve, seq_num, level, id, rid, q, x, namee, mem_ass, hrs);
        /*try {
            // create a mysql database connection
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();


            String seq_nu = request.getParameter("s");
            String leve = request.getParameter("l");
            int seq_num = Integer.parseInt(seq_nu);
            int level = Integer.parseInt(leve);
            String id = request.getParameter("r");
            String rid = request.getParameter("m");
            int q = Integer.parseInt(id) + 1;
            String x = Integer.toString(q);

            String namee = "";
            String mem_ass = "";
            String hrs = "";

            if (level > 1) {
                //  System.out.println("subtask");
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
                // System.out.println("task");
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

            System.err.println("[ERROR]-----Got an exception!" + formatter.format(date) + "-----" + e.getMessage() + "----[ERROR]");
            // System.err.println("egdsggfhg"+e.getMessage());
            //e.printStackTrace(System.out);
        }*/

        // return response
        response.sendRedirect("Archive_Execution.jsp");
    }
}

package ArchiveExecution.Servlet;

import ArchiveExecution.Service.Archive_execution_db_update;
import onboard.DBconnection;
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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

/**
 * Servlet implementation class date_update
 */

@WebServlet("/date_update")

public class date_update extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private Logger logger = null;

    public void init(ServletConfig config) throws ServletException {

        logger = Logger.getRootLogger();

        BasicConfigurator.configure();
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.getWriter().append("Served at: ").append(request.getContextPath());

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        HttpSession session = request.getSession();
        String prjname = request.getParameter("ProjectName");
        HttpSession details = request.getSession();
        String u_name = (String) details.getAttribute("username");
        String userid = u_name;
        MDC.put("USERID", userid);
        String u_role = (String) details.getAttribute("role");
        MDC.put("USERROLE", u_role);
        String projectname = request.getParameter("ProjectName");
        logger.info("modified project " + projectname);
        int count = 0;
        String stages = "";
        int level1 = 0, level = 0, seq = 0;
        int prog = 0;
        int sno = 0, cnt = 0, cnt1 = 0;
        Date d1, d2, d3, d4, d5, d6;
        SimpleDateFormat fmt = new SimpleDateFormat("MM/dd/yyyy");
        // DateFormat d3 = new SimpleDateFormat("mm/dd/yyyy");
        ArrayList<Integer> seq_num = new ArrayList<Integer>();

        ArrayList<Integer> level_num = new ArrayList<Integer>();

        ArrayList<String> task_name = new ArrayList<String>();

        ArrayList<String> member_ass = new ArrayList<String>();

        ArrayList<String> plan_startdate = new ArrayList<String>();

        ArrayList<String> plan_enddate = new ArrayList<String>();

        ArrayList<String> actual_startdate = new ArrayList<String>();

        ArrayList<String> actual_enddate = new ArrayList<String>();

        ArrayList<String> planned_hours = new ArrayList<String>();

        ArrayList<String> actual_hours = new ArrayList<String>();

        ArrayList<String> progressbar = new ArrayList<String>();

        ArrayList<String> cmnts = new ArrayList<String>();

        ArrayList<Date> pln_st = new ArrayList<Date>();

        ArrayList<Date> pln_ed = new ArrayList<Date>();

        ArrayList<Date> act_st = new ArrayList<Date>();

        ArrayList<Date> act_ed = new ArrayList<Date>();

        String temp;

        int i = 0, index = 0;
        int db_count = 0;

        String tasks_name = request.getParameter("name");
        String mem_ass = request.getParameter("mem_ass");
        String sequence_no = request.getParameter("sequence_no");
        String plan_start = request.getParameter("plan_start");
        String plan_end = request.getParameter("plan_end");
        String actual_start = request.getParameter("actual_start");
        String actual_end = request.getParameter("actual_end");
        String planned_hrs = request.getParameter("plan_hrs");
        String actual_hrs = request.getParameter("actual_hrs");
        String comments = request.getParameter("cmnts");

        try {

            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();

            String query1 = "select count(*) from ArchiveExecution_Details where projects='" + prjname + "' order by seq_num";

            String query = "select * from ArchiveExecution_Details where projects='" + prjname + "' order by seq_num";

            Statement st = connection.createStatement();

            Statement st1 = connection.createStatement();

            ResultSet rs = st.executeQuery(query);

            ResultSet rs1 = st1.executeQuery(query1);

            while (rs1.next()) {

                db_count = Integer.parseInt(rs1.getString(1));

            }

            while (rs.next()) {

                seq_num.add(rs.getInt(1));

                level_num.add(rs.getInt(2));

                task_name.add(rs.getString(3));

                member_ass.add(rs.getString(4));

                plan_startdate.add(rs.getString(7));

                plan_enddate.add(rs.getString(8));

                actual_startdate.add(rs.getString(5));

                actual_enddate.add(rs.getString(6));

                planned_hours.add(rs.getString(13));

                actual_hours.add(rs.getString(9));

                progressbar.add(rs.getString(15));
                cmnts.add(rs.getString(17));

                i++;

            }
             for (int j = 0; j < i; j++) {
                 if (seq_num.get(j) == Integer.parseInt(sequence_no)) {

                    level = level_num.get(j);

                    seq = seq_num.get(j);

                    index = j;

                    level1 = level;
                    member_ass.set(index, mem_ass);

                    plan_startdate.set(index, plan_start);

                    plan_enddate.set(index, plan_end);

                    actual_startdate.set(index, actual_start);

                    actual_enddate.set(index, actual_end);
                    int progbar = Integer.parseInt(progressbar.get(index));
                    planned_hours.set(index, planned_hrs);
                    actual_hours.set(index, actual_hrs);
                    cmnts.set(index, comments);
                    boolean check = true;
                }
            }
            int selected_index = index;
            int selected_level = level_num.get(selected_index);
             Archive_execution_db_update.Date_Fields_And_Hours_Update(seq_num, level_num, member_ass, plan_startdate, plan_enddate, actual_startdate, actual_enddate, planned_hours, actual_hours, progressbar, cmnts, projectname, selected_index, selected_level, db_count);
             connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect("Archive_Execution.jsp");

    }

}

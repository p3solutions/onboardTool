package ArchiveExecution.Service;

import ArchiveExecution.consturctor.Add;
import onboard.DBconnection;
import org.apache.log4j.Logger;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;

import static org.apache.commons.collections.CollectionUtils.isEmpty;

public class Archive_Execution_Pop_Up_Operation {
    final static Logger logger = Logger.getLogger(Archive_Execution_Pop_Up_Operation.class);

    public static void Adding_Task_Name(int seqno, String taskname, String selected_project, boolean typeofnode) {

        try {
            logger.info("task name" + taskname);
            //db connection
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            //Collections for storing the existing table for selected project//
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
            ArrayList<Integer> id = new ArrayList<Integer>();
            ArrayList<Integer> Ref_Id = new ArrayList<Integer>();
            ArrayList<String> stats_date = new ArrayList<String>();
            ArrayList<String> comments = new ArrayList<String>();

            //collections for storing the results (with added node)
            ArrayList<Integer> res_seq_num = new ArrayList<Integer>();
            ArrayList<Integer> res_level_num = new ArrayList<Integer>();
            ArrayList<String> res_task_name = new ArrayList<String>();
            ArrayList<String> res_member_ass = new ArrayList<String>();
            ArrayList<String> res_plan_startdate = new ArrayList<String>();
            ArrayList<String> res_plan_enddate = new ArrayList<String>();
            ArrayList<String> res_actual_startdate = new ArrayList<String>();
            ArrayList<String> res_actual_enddate = new ArrayList<String>();
            ArrayList<String> res_planned_hours = new ArrayList<String>();
            ArrayList<String> res_actual_hours = new ArrayList<String>();
            ArrayList<String> res_progressbar = new ArrayList<String>();
            ArrayList<Integer> res_id = new ArrayList<Integer>();
            ArrayList<Integer> res_Ref_Id = new ArrayList<Integer>();
            ArrayList<String> res_stats_date = new ArrayList<String>();
            ArrayList<String> res_comments = new ArrayList<String>();
            ArrayList<String> res_stats = new ArrayList<String>();
            //total_db_index
            int db_count = 0;

            //query for getting a selected project table
            String selected_project_table = "select * from archiveexecution_details where projects='" + selected_project + "' order by seq_num;";
            Statement st1 = connection.createStatement();
            ResultSet rs1 = st1.executeQuery(selected_project_table);
            while (rs1.next()) {
                seq_num.add(rs1.getInt(1));

                level_num.add(rs1.getInt(2));

                task_name.add(rs1.getString(3));

                member_ass.add(rs1.getString(4));

                plan_startdate.add(rs1.getString(7));

                plan_enddate.add(rs1.getString(8));

                actual_startdate.add(rs1.getString(5));

                actual_enddate.add(rs1.getString(6));

                planned_hours.add(rs1.getString(13));

                actual_hours.add(rs1.getString(9));

                progressbar.add(rs1.getString(15));

                id.add(rs1.getInt(10));

                Ref_Id.add(rs1.getInt(11));

                stats_date.add(rs1.getString(16));

                comments.add(rs1.getString(17));
                db_count++;
            }
            //index for the selected seq_num
            int index_seq_num = CalculatingSequenceNumber(seqno, seq_num, level_num);

            //Table get Stored in and before the index number
            for (int i = 0; i <= index_seq_num; i++) {
                res_seq_num.add(seq_num.get(i));

                res_level_num.add(level_num.get(i));

                res_task_name.add(task_name.get(i));

                res_member_ass.add(member_ass.get(i));

                res_plan_startdate.add(plan_startdate.get(i));

                res_plan_enddate.add(plan_enddate.get(i));

                res_actual_startdate.add(actual_startdate.get(i));

                res_actual_enddate.add(actual_enddate.get(i));

                res_planned_hours.add(planned_hours.get(i));

                res_actual_hours.add(actual_hours.get(i));

                res_progressbar.add(progressbar.get(i));

                res_id.add(id.get(i));

                res_Ref_Id.add(Ref_Id.get(i));

                res_stats_date.add(stats_date.get(i));

                res_comments.add(comments.get(i));
            }
            //id for new node
            int new_id = 0;
            String query2 = "select max(id) from archiveexecution_details where projects='" + selected_project + "';";
            Statement st2 = connection.createStatement();
            ResultSet rs2 = st2.executeQuery(query2);
            if (rs2.next())
                new_id = rs2.getInt(1) + 1;
            //Ref_Id for new node
            int new_ref_id;
            //level for new node
            int new_level;
            //for creating children if part get execute
            if (typeofnode) {
                new_ref_id = id.get(seqno);
                new_level = level_num.get(seqno) + 1;
            }
            //for creating the similar node else part get execute
            else {
                new_ref_id = Ref_Id.get(seqno);
                new_level = level_num.get(seqno);
            }
            //seq_num for new node
            int new_seq_no = index_seq_num + 2;

            //new node details get stored in collections (below code)
            res_seq_num.add(new_seq_no);
            res_level_num.add(new_level);
            logger.info("task name at current seq" + taskname);
            res_task_name.add(taskname);
            res_member_ass.add("");
            res_plan_startdate.add("");
            res_plan_enddate.add("");
            res_actual_startdate.add("");
            res_actual_enddate.add("");
            res_planned_hours.add("");
            res_actual_hours.add("");
            res_progressbar.add("0");
            res_id.add(new_id);
            res_Ref_Id.add(new_ref_id);
            res_stats_date.add(null);
            res_comments.add("");
            //Table get stored after the index_seq_num after adding the new node
            for (int j = index_seq_num + 1; j < db_count; j++) {
                res_seq_num.add(seq_num.get(j) + 1);

                res_level_num.add(level_num.get(j));

                res_task_name.add(task_name.get(j));

                res_member_ass.add(member_ass.get(j));

                res_plan_startdate.add(plan_startdate.get(j));

                res_plan_enddate.add(plan_enddate.get(j));

                res_actual_startdate.add(actual_startdate.get(j));

                res_actual_enddate.add(actual_enddate.get(j));

                res_planned_hours.add(planned_hours.get(j));

                res_actual_hours.add(actual_hours.get(j));

                res_progressbar.add(progressbar.get(j));

                res_id.add(id.get(j));

                res_Ref_Id.add(Ref_Id.get(j));

                res_stats_date.add(stats_date.get(j));

                res_comments.add(comments.get(j));

            }
            //deleting the rows for the selected project

            String query3 = "delete from archiveexecution_details where projects='" + selected_project + "';";
            Statement st3 = connection.createStatement();
            st3.executeUpdate(query3);

            //Inserting the new table(old table added with new node)
            Add add1[] = new Add[res_seq_num.size()];
            for (int k = 0; k < res_seq_num.size(); k++) {
                add1[k] = new Add(res_seq_num.get(k), res_level_num.get(k), res_task_name.get(k), res_member_ass.get(k), res_actual_startdate.get(k), res_actual_enddate.get(k), res_plan_startdate.get(k), res_plan_enddate.get(k), res_actual_hours.get(k), res_id.get(k), res_Ref_Id.get(k), null, res_planned_hours.get(k), selected_project, res_progressbar.get(k), res_stats_date.get(k), res_comments.get(k));
            }
            for (int l = 0; l < res_seq_num.size(); l++) {
                String query4 = "INSERT INTO archiveexecution_details(seq_num, level, name, mem_ass, act_srt_date, act_end_date, pln_srt_date, pln_end_date, hours, id, ref_id, stats, planned_hrs, projects, progressbar, stats_date, comments)"
                        + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
                PreparedStatement prepare = connection.prepareStatement(query4);
                prepare.setInt(1, add1[l].seq_num);
                prepare.setInt(2, add1[l].level);
                prepare.setString(3, add1[l].name);
                prepare.setString(4, add1[l].mem_ass);
                prepare.setString(5, add1[l].act_srt_date);
                prepare.setString(6, add1[l].act_end_date);
                prepare.setString(7, add1[l].pln_srt_date);
                prepare.setString(8, add1[l].pln_end_date);
                prepare.setString(9, add1[l].hours);
                prepare.setInt(10, add1[l].id);
                prepare.setInt(11, add1[l].ref_id);
                prepare.setString(12, add1[l].stats);
                prepare.setString(13, add1[l].planned_hrs);
                prepare.setString(14, add1[l].projects);
                prepare.setString(15, add1[l].progressbar);
                prepare.setString(16, add1[l].stats_date);
                prepare.setString(17, add1[l].comments);

                prepare.execute();
            }
            int index = new_seq_no - 1;
            int currentlevel = res_level_num.get(index);
            Date_Update_AddTask(res_seq_num, res_level_num, res_plan_startdate, res_plan_enddate, res_actual_startdate, res_actual_enddate, res_progressbar, selected_project, index, currentlevel);
            connection.close();
            st1.close();
            st2.close();
            st3.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static int CalculatingSequenceNumber(int seq, ArrayList<Integer> seq_num, ArrayList<Integer> level_num) {
        int current_level = level_num.get(seq);
        int seqno = 0;
        int seqnum = 0;
        boolean check = false;
        //to check the node is not the last node of table
        if (seq_num.get(seq) != seq_num.size()) {
            //if it is not the last node then we have to check the node whether it has children
            if (level_num.get(seq + 1) == current_level + 1) {
                int identification_level = current_level + 1;
                //traversing from the current node the current node
                for (int i = seq + 1; i < seq_num.size(); i++) {
                    seqnum = i;
                    if (level_num.get(i) <= current_level) {
                        seqno = i;
                        check = true;
                        break;
                    }
                }
                if (check) {
                    return seqno - 1;
                } else {
                    return seqnum;
                }
            }
            //the node has no children
            else {
                return seq;
            }
        }
        //'else' the node is last node
        else {
            return seq;
        }

    }

    public static void Delete_Task_Name(int seq, String selected_project) {
        try {
            //db connection
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            //Collections for storing the existing table for selected project
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

            ArrayList<Integer> id = new ArrayList<Integer>();

            ArrayList<Integer> Ref_Id = new ArrayList<Integer>();

            ArrayList<String> stats_date = new ArrayList<String>();

            ArrayList<String> comments = new ArrayList<String>();

            //collections for storing the results (with added node)

            ArrayList<Integer> res_seq_num = new ArrayList<Integer>();

            ArrayList<Integer> res_level_num = new ArrayList<Integer>();

            ArrayList<String> res_task_name = new ArrayList<String>();

            ArrayList<String> res_member_ass = new ArrayList<String>();

            ArrayList<String> res_plan_startdate = new ArrayList<String>();

            ArrayList<String> res_plan_enddate = new ArrayList<String>();

            ArrayList<String> res_actual_startdate = new ArrayList<String>();

            ArrayList<String> res_actual_enddate = new ArrayList<String>();

            ArrayList<String> res_planned_hours = new ArrayList<String>();

            ArrayList<String> res_actual_hours = new ArrayList<String>();

            ArrayList<String> res_progressbar = new ArrayList<String>();

            ArrayList<Integer> res_id = new ArrayList<Integer>();

            ArrayList<Integer> res_Ref_Id = new ArrayList<Integer>();

            ArrayList<String> res_stats_date = new ArrayList<String>();

            ArrayList<String> res_comments = new ArrayList<String>();

            ArrayList<String> res_stats = new ArrayList<String>();
            //total_db_index
            int db_count = 0;

            //query for getting a selected project table
            String selected_project_table = "select * from archiveexecution_details where projects='" + selected_project + "' order by seq_num;";
            Statement st1 = connection.createStatement();
            ResultSet rs1 = st1.executeQuery(selected_project_table);
            while (rs1.next()) {
                seq_num.add(rs1.getInt(1));

                level_num.add(rs1.getInt(2));

                task_name.add(rs1.getString(3));

                member_ass.add(rs1.getString(4));

                plan_startdate.add(rs1.getString(7));

                plan_enddate.add(rs1.getString(8));

                actual_startdate.add(rs1.getString(5));

                actual_enddate.add(rs1.getString(6));

                planned_hours.add(rs1.getString(13));

                actual_hours.add(rs1.getString(9));

                progressbar.add(rs1.getString(15));

                id.add(rs1.getInt(10));

                Ref_Id.add(rs1.getInt(11));

                stats_date.add(rs1.getString(16));

                comments.add(rs1.getString(17));
                db_count++;
            }
            String[] fromandtoseq = FromAndToDeleteSequenceNumber(seq, db_count, seq_num, level_num).split(",");
            //from_seq and to_seq are not actually seq_num they are index of seq_num
            int from_seq = Integer.parseInt(fromandtoseq[0]);
            int to_seq = Integer.parseInt(fromandtoseq[1]);


            //Table get Stored in and before the index number
            for (int i = 0; i < from_seq - 1; i++) {
                res_seq_num.add(seq_num.get(i));

                res_level_num.add(level_num.get(i));

                res_task_name.add(task_name.get(i));

                res_member_ass.add(member_ass.get(i));

                res_plan_startdate.add(plan_startdate.get(i));

                res_plan_enddate.add(plan_enddate.get(i));

                res_actual_startdate.add(actual_startdate.get(i));

                res_actual_enddate.add(actual_enddate.get(i));

                res_planned_hours.add(planned_hours.get(i));

                res_actual_hours.add(actual_hours.get(i));

                res_progressbar.add(progressbar.get(i));

                res_id.add(id.get(i));

                res_Ref_Id.add(Ref_Id.get(i));

                res_stats_date.add(stats_date.get(i));

                res_comments.add(comments.get(i));
            }

            String delete_query = "delete from archiveexecution_details where projects='" + selected_project + "' and seq_num>='" + from_seq + "' and seq_num<'" + to_seq + "'";
            Statement st = connection.createStatement();
            st.executeUpdate(delete_query);
            int new_sequence = from_seq;

            for (int j = to_seq - 1; j < db_count; j++) {
                res_seq_num.add(new_sequence++);

                res_level_num.add(level_num.get(j));

                res_task_name.add(task_name.get(j));

                res_member_ass.add(member_ass.get(j));

                res_plan_startdate.add(plan_startdate.get(j));

                res_plan_enddate.add(plan_enddate.get(j));

                res_actual_startdate.add(actual_startdate.get(j));

                res_actual_enddate.add(actual_enddate.get(j));

                res_planned_hours.add(planned_hours.get(j));

                res_actual_hours.add(actual_hours.get(j));

                res_progressbar.add(progressbar.get(j));

                res_id.add(id.get(j));

                res_Ref_Id.add(Ref_Id.get(j));

                res_stats_date.add(stats_date.get(j));

                res_comments.add(comments.get(j));
            }
            //deleting the rows for the selected project
            String query3 = "delete from archiveexecution_details where projects='" + selected_project + "';";
            Statement st3 = connection.createStatement();
            st3.executeUpdate(query3);
            //Inserting the new table(old table added with new node)
            Add add1[] = new Add[res_seq_num.size()];
            for (int k = 0; k < res_seq_num.size(); k++) {
                add1[k] = new Add(res_seq_num.get(k), res_level_num.get(k), res_task_name.get(k), res_member_ass.get(k), res_actual_startdate.get(k), res_actual_enddate.get(k), res_plan_startdate.get(k), res_plan_enddate.get(k), res_actual_hours.get(k), res_id.get(k), res_Ref_Id.get(k), null, res_planned_hours.get(k), selected_project, res_progressbar.get(k), res_stats_date.get(k), res_comments.get(k));
            }
            for (int l = 0; l < res_seq_num.size(); l++) {
                String query4 = "INSERT INTO archiveexecution_details(seq_num, level, name, mem_ass, act_srt_date, act_end_date, pln_srt_date, pln_end_date, hours, id, ref_id, stats, planned_hrs, projects, progressbar, stats_date, comments)"
                        + "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);";
                PreparedStatement prepare = connection.prepareStatement(query4);
                prepare.setInt(1, add1[l].seq_num);
                prepare.setInt(2, add1[l].level);
                prepare.setString(3, add1[l].name);
                prepare.setString(4, add1[l].mem_ass);
                prepare.setString(5, add1[l].act_srt_date);
                prepare.setString(6, add1[l].act_end_date);
                prepare.setString(7, add1[l].pln_srt_date);
                prepare.setString(8, add1[l].pln_end_date);
                prepare.setString(9, add1[l].hours);
                prepare.setInt(10, add1[l].id);
                prepare.setInt(11, add1[l].ref_id);
                prepare.setString(12, add1[l].stats);
                prepare.setString(13, add1[l].planned_hrs);
                prepare.setString(14, add1[l].projects);
                prepare.setString(15, add1[l].progressbar);
                prepare.setString(16, add1[l].stats_date);
                prepare.setString(17, add1[l].comments);

                prepare.execute();
            }
            int index = seq;
            int currentlevel = level_num.get(index);
            //Archive_execution_db_update.progress_bar_delete_task(level_num,actual_enddate,progressbar,selected_project,index,currentlevel);
            Date_Update_DeleteTask(seq_num, level_num, plan_startdate, plan_enddate, actual_startdate, actual_enddate, progressbar, selected_project, index, currentlevel);
            connection.close();
            st1.close();
            st.close();
            st3.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String FromAndToDeleteSequenceNumber(int seq, int db_count, ArrayList<Integer> seq_num, ArrayList<Integer> level_num) {
        int fromsequence = seq_num.get(seq);
        int current_level = level_num.get(seq);
        int tosequence = 0;
        if (db_count != fromsequence) {
            for (int i = seq + 1; i < db_count; i++) {
                if (level_num.get(i) <= current_level) {
                    tosequence = seq_num.get(i);
                    break;
                } else if (i == db_count - 1) {
                    tosequence = seq_num.get(i) + 1;
                    break;
                }
            }
        } else {
            tosequence = db_count + 1;
        }
        String result = fromsequence + "," + tosequence;
       logger.info("result from and to sequence number:" + result);
        return result;
    }

    public static void Edit_Task_Name(int seq, String projectname, String taskname) {
        try {
            //DB Connection//
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            int seqno = seq + 1;

            String query1 = "update archiveexecution_details set name='" + taskname + "' where projects='" + projectname + "' and seq_num='" + seqno + "'";

            Statement statement = connection.createStatement();

            statement.executeUpdate(query1);
            connection.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void Date_Update_AddTask(ArrayList<Integer> seq_num, ArrayList<Integer> level_num, ArrayList<String> plan_startdate, ArrayList<String> plan_enddate, ArrayList<String> actual_startdate, ArrayList<String> actual_enddate, ArrayList<String> progressbar, String projectname, int selectedindex, int currentlevel) {
        int selected_level = currentlevel;
        int selected_index = selectedindex;
        try {
            ArrayList<Integer> checkindex = new ArrayList<Integer>();
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            Statement statement = connection.createStatement();
            SimpleDateFormat fmt = new SimpleDateFormat("MM/dd/yyyy");
            while (currentlevel != 0) {
                int totalcount = 0;
                int node_count = 0;
                ArrayList<Date> plan_start = new ArrayList<Date>();
                ArrayList<Date> plan_end = new ArrayList<Date>();
                ArrayList<Date> act_start = new ArrayList<Date>();
                ArrayList<Date> act_end = new ArrayList<Date>();

                logger.info("current level " + currentlevel);
                boolean check = true;
                boolean check_planstart = true;
                boolean check_planend = true;
                boolean check_actstart = true;
                boolean check_actend = true;
                ArrayList<Integer> date = new ArrayList<Integer>();
                //checking plan start,plan end,actual start,actual end date before the current index
                for (int l = selectedindex - 1; l >= 0; l--) {
                    if (level_num.get(l) == 1 || level_num.get(l) == currentlevel - 1) {
                        break;
                    } else if (currentlevel == level_num.get(l)) {
                        if (!plan_startdate.get(l).equals("")) {
                            plan_start.add(fmt.parse(plan_startdate.get(l)));
                        }
                        if (!plan_enddate.get(l).equals("")) {
                            plan_end.add(fmt.parse(plan_enddate.get(l)));
                        }
                        if (!actual_startdate.get(l).equals("")) {
                            act_start.add(fmt.parse(actual_startdate.get(l)));
                        }
                        if (actual_enddate.get(l).equals("")) {
                            check_actend = false;
                        } else {
                            act_end.add(fmt.parse(actual_enddate.get(l)));
                        }
                    }
                }
                //checking the plan start,plan end,actual start and actual end date in and after the current index
                for (int m = selectedindex; m < actual_enddate.size(); m++) {
                    if (level_num.get(m) == 1 || level_num.get(m) == currentlevel - 1) {
                        break;
                    } else if (currentlevel == level_num.get(m)) {
                        if (!plan_startdate.get(m).equals("")) {
                            plan_start.add(fmt.parse(plan_startdate.get(m)));
                        }
                        if (!plan_enddate.get(m).equals("")) {
                            plan_end.add(fmt.parse(plan_enddate.get(m)));
                        }
                        if (!actual_startdate.get(m).equals("")) {
                            act_start.add(fmt.parse(actual_startdate.get(m)));
                        }
                        if (actual_enddate.get(m).equals("")) {
                            check_actend = false;
                        } else {
                            act_end.add(fmt.parse(actual_enddate.get(m)));
                        }
                    }
                }
                for (int n = selectedindex; n >= 0; n--) {
                    if (currentlevel - 1 == level_num.get(n)) {
                        String plnsrt = "", plnend = "", actsrt = "", actend = "";
                        int pln_hrs = 0, act_hrs = 0;
                        if (isEmpty(plan_start) == false) {
                            Date Plan_Start_Min_Date = Collections.min(plan_start);
                            plnsrt = fmt.format(Plan_Start_Min_Date);
                        }
                        if (isEmpty(plan_end) == false) {
                            Date Plan_End_Max_Date = Collections.max(plan_end);
                            plnend = fmt.format(Plan_End_Max_Date);
                        }
                        if (isEmpty(act_start) == false) {
                            Date Actual_Start_Min_Date = Collections.min(act_start);
                            actsrt = fmt.format(Actual_Start_Min_Date);
                        }
                        if (isEmpty(act_end) == false) {
                            Date Actual_End_Max_Date = Collections.max(act_end);
                            actend = fmt.format(Actual_End_Max_Date);
                        }
                        if (!plnsrt.equals("") && !plnend.equals("")) {
                            pln_hrs = Weekday.splittingoperation(plnsrt, plnend) * 8;
                        }
                        if (!actsrt.equals("") && !actend.equals("")) {
                            act_hrs = Weekday.splittingoperation(actsrt, actend) * 8;
                        }
                        statement.executeUpdate("update archiveexecution_details set pln_srt_date ='" + plnsrt + "',pln_end_date='" + plnend + "',act_srt_date='" + actsrt + "',hours='" + act_hrs + "',planned_hrs='" + pln_hrs + "' where projects='" + projectname + "' and seq_num='" + seq_num.get(n) + "';");
                        plan_startdate.set(n, plnsrt);
                        plan_enddate.set(n, plnend);
                        actual_startdate.set(n, actsrt);
                        if (check_actend == true) {
                            statement.executeUpdate("update archiveexecution_details set act_end_date='" + actend + "' where projects='" + projectname + "' and seq_num='" + seq_num.get(n) + "';");
                            actual_enddate.set(n, actend);
                            int index = n;
                            selectedindex = index;
                            break;
                        } else {
                            statement.executeUpdate("update archiveexecution_details set act_end_date='',hours=0 where projects='" + projectname + "' and seq_num='" + seq_num.get(n) + "';");
                            actual_enddate.set(n, "");
                            int index = n;
                            selectedindex = index;
                            break;
                        }

                    }
                }

                currentlevel--;
            }
            /*int fromseq=0;
            for(int i=selectedindex;i>=0;i--)
            {
                if(level_num.get(i)==1)
                {
                    fromseq=seq_num.get(i);
                    break;
                }
            }
            int toseq=0;
            for(int  j=selectedindex;j<seq_num.size();j++)
            {
                if(j==seq_num.size()-1)
                {
                    toseq=seq_num.get(j)+1;
                    break;
                }
                if(level_num.get(j)==1)
                {
                  toseq= seq_num.get(j);
                  break;
                }
            }
            for(int k=fromseq-1;k<toseq;k++)
            {
                int seq=k+1;
                float percentage=Archive_execution_db_update.percent(seq,projectname);
                int percentage1=(int)percentage;
                String query="update archiveexecution_details set progressbar='"+percentage1+"' where projects='"+projectname+"' and seq_num='"+seq+"' ";
                Statement st=conn.createStatement();
                st.executeUpdate(query);
            }
            */
            /*for(Object o:actual_enddate)
            {
                System.out.println("atual end date:"+o);
            }*/
            Archive_execution_db_update.progress_bar_current_stage(level_num, actual_enddate, progressbar, projectname, selected_index, selected_level);
            connection.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public static void Date_Update_DeleteTask(ArrayList<Integer> seq_num, ArrayList<Integer> level_num, ArrayList<String> plan_startdate, ArrayList<String> plan_enddate, ArrayList<String> actual_startdate, ArrayList<String> actual_enddate, ArrayList<String> progressbar, String projectname, int selectedindex, int currentlevel) {
        int selected_index = selectedindex;
        int selected_level = currentlevel;
        try {
            ArrayList<Integer> checkindex = new ArrayList<Integer>();
            int deleteindex = selectedindex;
            DBconnection dBconnection = new DBconnection();
            Connection connection = (Connection) dBconnection.getConnection();
            Statement statement = connection.createStatement();

            SimpleDateFormat fmt = new SimpleDateFormat("MM/dd/yyyy");
            while (currentlevel != 0) {
                int totalcount = 0;
                int node_count = 0;
                ArrayList<Date> plan_start = new ArrayList<Date>();
                ArrayList<Date> plan_end = new ArrayList<Date>();
                ArrayList<Date> act_start = new ArrayList<Date>();
                ArrayList<Date> act_end = new ArrayList<Date>();

                logger.info("current level " + currentlevel);
                boolean check = true;
                boolean check_planstart = true;
                boolean check_planend = true;
                boolean check_actstart = true;
                boolean check_actend = true;
                ArrayList<Integer> date = new ArrayList<Integer>();
                //checking plan start,plan end,actual start,actual end date before the current index
                for (int l = selectedindex - 1; l >= 0; l--) {
                    if (level_num.get(l) == 1 || level_num.get(l) == currentlevel - 1) {
                        break;
                    } else if (currentlevel == level_num.get(l)) {
                        if (!plan_startdate.get(l).equals("")) {
                            plan_start.add(fmt.parse(plan_startdate.get(l)));
                        }
                        if (!plan_enddate.get(l).equals("")) {
                            plan_end.add(fmt.parse(plan_enddate.get(l)));
                        }
                        if (!actual_startdate.get(l).equals("")) {
                            act_start.add(fmt.parse(actual_startdate.get(l)));
                        }
                        if (actual_enddate.get(l).equals("")) {
                            check_actend = false;
                        } else {
                            act_end.add(fmt.parse(actual_enddate.get(l)));
                        }
                    }
                }
                //checking the plan start,plan end,actual start and actual end date after the current index
                for (int m = selectedindex; m < seq_num.size(); m++) {
                    if (m != deleteindex) {
                        if (level_num.get(m) == 1 || level_num.get(m) == currentlevel - 1) {
                            break;
                        } else if (currentlevel == level_num.get(m)) {
                            if (!plan_startdate.get(m).equals("")) {
                                plan_start.add(fmt.parse(plan_startdate.get(m)));
                            }
                            if (!plan_enddate.get(m).equals("")) {
                                plan_end.add(fmt.parse(plan_enddate.get(m)));
                            }
                            if (!actual_startdate.get(m).equals("")) {
                                act_start.add(fmt.parse(actual_startdate.get(m)));
                            }
                            if (actual_enddate.get(m).equals("")) {
                                check_actend = false;
                            } else {
                                act_end.add(fmt.parse(actual_enddate.get(m)));
                            }
                        }
                    }
                }
                for (int n = selectedindex; n >= 0; n--) {
                    if (deleteindex != n) {
                        if (currentlevel - 1 == level_num.get(n)) {
                            int pln_hrs = 0, act_hrs = 0;
                            String plnsrt = "", plnend = "", actsrt = "", actend = "";
                            if (isEmpty(plan_start) == false) {
                                Date Plan_Start_Min_Date = Collections.min(plan_start);
                                plnsrt = fmt.format(Plan_Start_Min_Date);
                            }
                            if (isEmpty(plan_end) == false) {
                                Date Plan_End_Max_Date = Collections.max(plan_end);
                                plnend = fmt.format(Plan_End_Max_Date);
                            }
                            if (isEmpty(act_start) == false) {
                                Date Actual_Start_Min_Date = Collections.min(act_start);
                                actsrt = fmt.format(Actual_Start_Min_Date);
                            }
                            if (isEmpty(act_end) == false) {
                                Date Actual_End_Max_Date = Collections.max(act_end);
                                actend = fmt.format(Actual_End_Max_Date);
                            }
                            if (!plnsrt.equals("") && !plnend.equals("")) {
                                pln_hrs = Weekday.splittingoperation(plnsrt, plnend) * 8;
                            }
                            if (!actsrt.equals("") && !actend.equals("")) {
                                act_hrs = Weekday.splittingoperation(actsrt, actend) * 8;
                            }
                            statement.executeUpdate("update archiveexecution_details set pln_srt_date ='" + plnsrt + "',pln_end_date='" + plnend + "',act_srt_date='" + actsrt + "',hours='" + act_hrs + "',planned_hrs='" + pln_hrs + "' where projects='" + projectname + "' and seq_num='" + seq_num.get(n) + "';");
                            plan_startdate.set(n, plnsrt);
                            plan_enddate.set(n, plnend);
                            actual_startdate.set(n, actsrt);
                            actual_enddate.set(n, actend);
                            if (check_actend == true) {
                                statement.executeUpdate("update archiveexecution_details set act_end_date='" + actend + "' where projects='" + projectname + "' and seq_num='" + seq_num.get(n) + "';");
                                actual_enddate.set(n, actend);
                                int index = n;
                                selectedindex = index;
                                break;
                            } else {
                                statement.executeUpdate("update archiveexecution_details set act_end_date='',hours='0' where projects='" + projectname + "' and seq_num='" + seq_num.get(n) + "';");
                                actual_enddate.set(n, "");
                                int index = n;
                                selectedindex = index;
                                break;
                            }

                        }
                    }
                }
                currentlevel--;
            }
            Archive_execution_db_update.progress_bar_delete_task(level_num, actual_enddate, progressbar, projectname, selected_index, selected_level);
            connection.close();
            statement.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
